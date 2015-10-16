if exists('g:loaded_man') && g:loaded_man
  finish
endif
let g:loaded_man = 1

let s:save_cpo = &cpo
set cpo&vim

command! -nargs=* -bar -complete=customlist,man#completion#run Man  call man#get_page('only', <f-args>)
command! -nargs=* -bar -complete=customlist,man#completion#run Sman call man#get_page('horizontal', <f-args>)
command! -nargs=* -bar -complete=customlist,man#completion#run Vman call man#get_page('vertical',   <f-args>)
command! -nargs=* -bar -complete=customlist,man#completion#run Tman call man#get_page('tab',   <f-args>)

command! -nargs=+ -bang Mangrep call man#grep#run(<bang>0, <f-args>)

" map a key to open a manpage for word under cursor, example: map ,k <Plug>(Man)
nnoremap <silent> <Plug>(Man)  :<C-U>call man#get_page_from_cword('horizontal', v:count)<CR>
nnoremap <silent> <Plug>(Sman) :<C-U>call man#get_page_from_cword('horizontal', v:count)<CR>
nnoremap <silent> <Plug>(Vman) :<C-U>call man#get_page_from_cword('vertical',   v:count)<CR>

let &cpo = s:save_cpo
unlet s:save_cpo

" vim:set ft=vim et sw=2:
