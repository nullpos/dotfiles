set completeopt+=noinsert

" <TAB>: completion
imap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ deoplete#mappings#manual_complete()
function! s:check_back_space() abort "{{{
  let col = col('.') - 1
  return !col || getline('.')[col - 1] =~ '\s'
endfunction "}}}

inoremap <expr><S-TAB>  pumvisible() ? "\<C-p>" : "\<C-h>"

