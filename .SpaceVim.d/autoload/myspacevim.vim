"func! s:transparent_background()
"  highlight Normal guibg=NONE ctermbg=NONE
"  highlight NonText guibg=NONE ctermbg=NONE
"endf
"autocmd ColorScheme * call s:transparent_background()

func! myspacevim#before() abort
  "other configs
  let g:github_dashboard = { 'username': 'CrimsonCrow', 'password': $GITHUB_TOKEN }
  let g:gista#client#default_username = 'CrimsonCrow'
endf
