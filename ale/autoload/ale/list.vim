" Author: Bjorn Neergaard <bjorn@neersighted.com>, modified by Yann fery <yann@fery.me>
" Description: Manages the loclist and quickfix lists

if !exists('s:timer_args')
    let s:timer_args = {}
endif

" Return 1 if there is a buffer with buftype == 'quickfix' in bufffer list
function! ale#list#IsQuickfixOpen() abort
    for l:buf in range(1, bufnr('$'))
        if getbufvar(l:buf, '&buftype') is# 'quickfix'
            return 1
        endif
    endfor
    return 0
endfunction

" Check if we should open the list, based on the save event being fired, and
" that setting being on, or the setting just being set to `1`.
function! s:ShouldOpen(buffer) abort
    let l:val = ale#Var(a:buffer, 'open_list')
    let l:saved = getbufvar(a:buffer, 'ale_save_event_fired', 0)

    return l:val is 1 || (l:val is# 'on_save' && l:saved)
endfunction

function! ale#list#GetCombinedList() abort
    let l:list = []

    for l:info in values(g:ale_buffer_info)
        call extend(l:list, l:info.loclist)
    endfor

    call sort(l:list, function('ale#util#LocItemCompareWithText'))
    call uniq(l:list, function('ale#util#LocItemCompareWithText'))

    return l:list
endfunction

function! s:FixList(list) abort
    let l:new_list = []

    for l:item in a:list
        if l:item.bufnr == -1
            " If the buffer number is invalid, remove it.
            let l:fixed_item = copy(l:item)
            call remove(l:fixed_item, 'bufnr')
        else
            " Don't copy the Dictionary if we do not need to.
            let l:fixed_item = l:item
        endif

        call add(l:new_list, l:fixed_item)
    endfor

    return l:new_list
endfunction

function! s:BufWinId(buffer) abort
    return exists('*bufwinid') ? bufwinid(str2nr(a:buffer)) : 0
endfunction

function! s:SetListsImpl(timer_id, buffer, loclist) abort
    let l:title = expand('#' . a:buffer . ':p')

    if g:ale_set_quickfix
        let l:quickfix_list = ale#list#GetCombinedList()

        if has('nvim')
            call setqflist(s:FixList(l:quickfix_list), ' ', l:title)
        else
            call setqflist(s:FixList(l:quickfix_list))
            call setqflist([], 'r', {'title': l:title})
        endif
    elseif g:ale_set_loclist
        " If windows support is off, bufwinid() may not exist.
        " We'll set result in the current window, which might not be correct,
        " but is better than nothing.
        let l:win_id = s:BufWinId(a:buffer)

        if has('nvim')
            call setloclist(l:win_id, s:FixList(a:loclist), ' ', l:title)
        else
            call setloclist(l:win_id, s:FixList(a:loclist))
            call setloclist(l:win_id, [], 'r', {'title': l:title})
        endif
    endif

    " Open a window to show the problems if we need to.
    "
    " We'll check if the current buffer's List is not empty here, so the
    " window will only be opened if the current buffer has problems.
    if s:ShouldOpen(a:buffer) && !empty(a:loclist)
        let l:winnr = winnr()
        let l:mode = mode()
        let l:reset_visual_selection = l:mode is? 'v' || l:mode is# "\<c-v>"
        let l:reset_character_selection = l:mode is? 's' || l:mode is# "\<c-s>"

        if g:ale_set_quickfix
            if !ale#list#IsQuickfixOpen()
                execute 'copen ' . str2nr(ale#Var(a:buffer, 'list_window_size'))
            endif
        elseif g:ale_set_loclist
            execute 'lopen ' . str2nr(ale#Var(a:buffer, 'list_window_size'))
        endif

        " If focus changed, restore it (jump to the last window).
        if l:winnr isnot# winnr()
            wincmd p
        endif

        if l:reset_visual_selection || l:reset_character_selection
            " If we were in a selection mode before, select the last selection.
            normal! gv

            if l:reset_character_selection
                " Switch back to Select mode, if we were in that.
                normal! "\<c-g>"
            endif
        endif
    endif

    " If ALE isn't currently checking for more problems, close the window if
    " needed now. This check happens inside of this timer function, so
    " the window can be closed reliably.
    if !ale#engine#IsCheckingBuffer(a:buffer)
        call s:CloseWindowIfNeeded(a:buffer)
    endif
endfunction

function! ale#list#SetLists(buffer, loclist) abort
    if get(g:, 'ale_set_lists_synchronously') == 1
    \|| getbufvar(a:buffer, 'ale_save_event_fired', 0)
        " Update lists immediately if running a test synchronously, or if the
        " buffer was saved.
        "
        " The lists need to be updated immediately when saving a buffer so
        " that we can reliably close window automatically, if so configured.
        call s:SetListsImpl(-1, a:buffer, a:loclist)
    else
        call ale#util#StartPartialTimer(
        \   0,
        \   function('s:SetListsImpl'),
        \   [a:buffer, a:loclist],
        \)
    endif
endfunction

function! s:CloseWindowIfNeeded(buffer) abort
    if ale#Var(a:buffer, 'keep_list_window_open') || !s:ShouldOpen(a:buffer)
        return
    endif

    try
        " Only close windows if the quickfix list or loclist is completely empty,
        " including errors set through other means.
        if g:ale_set_quickfix
            if empty(getqflist())
                cclose
            endif
        else
            let l:win_id = s:BufWinId(a:buffer)

            if g:ale_set_loclist && empty(getloclist(l:win_id))
                lclose
            endif
        endif
    " Ignore 'Cannot close last window' errors.
    catch /E444/
    endtry
endfunction
