" https://github.com/rhysd/dotfiles
augroup MyVimrc
  autocmd!
augroup END

command! -nargs=* AutoCmd autocmd MyVimrc <args>

" encoding
set encoding=utf-8
scriptencoding utf-8
set fileencodings=utf-8,cp932,sjis,euc-jp
set fileencoding=utf-8
set termencoding=utf-8

" bundleで管理するディレクトリを指定
set runtimepath+=~/.vim/bundle/neobundle.vim/

if has('vim_starting')
  set runtimepath+=~/.vim/bundle/neobundle.vim/
endif

call neobundle#begin(expand('~/.vim/bundle/'))

NeoBundleFetch 'Shougo/neobundle.vim'

NeoBundle     'Shougo/neocomplete'
NeoBundleLazy 'osyo-manga/vim-marching'
NeoBundle     'Shougo/neosnippet'
NeoBundle     'Shougo/neosnippet-snippets'
NeoBundleFetch 'tekkoc/PHPSnippetsCreator'
NeoBundle 'Flake8-vim'

NeoBundleLazy 'kana/vim-smartinput', {
\   'autoload': {
\     'insert': '1'
\   }
\ }
NeoBundleLazy 'mattn/emmet-vim', {
\   'autoload': {
\     'filetypes': [
\       'html',
\       'slim',
\       'xhtml',
\       'css',
\       'sass',
\       'styl',
\       'xml',
\       'xls',
\       'markdown'
\     ]
\   }
\ }
NeoBundleLazy 'LeafCage/yankround.vim'
NeoBundleLazy 'osyo-manga/vim-trip'

" text object {{{
NeoBundleLazy 'terryma/vim-expand-region'
NeoBundleLazy 'kana/vim-textobj-user'
NeoBundleLazy 'rhysd/vim-textobj-ruby'
NeoBundleLazy 'sgur/vim-textobj-parameter'
NeoBundleLazy 'kana/vim-textobj-entire'
NeoBundleLazy 'whatyouhide/vim-textobj-xmlattr'
" }}}

" operator {{{
NeoBundleLazy 'kana/vim-operator-user'
NeoBundleLazy 'rhysd/vim-operator-surround'
NeoBundleLazy 'emonkak/vim-operator-comment'
NeoBundleLazy 'tyru/operator-camelize.vim'
NeoBundleLazy 'kana/vim-operator-replace'
" }}}

" 表示系プラグイン {{{
" NeoBundle     'thinca/vim-splash'
NeoBundleLazy 'vim-scripts/AnsiEsc.vim'
NeoBundle     'itchyny/lightline.vim'
NeoBundleLazy 'haya14busa/incsearch.vim'
" NeoBundleLazy 'todesking/ruby_hl_lvar.vim'
" }}}

NeoBundleLazy 'yonchu/accelerated-smooth-scroll'
NeoBundleLazy 'easymotion/vim-easymotion'
NeoBundleLazy 'rhysd/clever-f.vim'

" syntax and filetype plugins {{{
function! FiletypeConfig(ft)
  return {
  \   'autoload': {
  \     'filetypes': a:ft,
  \   },
  \ }
endfunction

" JavaScript {{{
NeoBundleLazy 'jelera/vim-javascript-syntax',
\   FiletypeConfig("javascript")
NeoBundle     'jason0x43/vim-js-indent'
" NeoBundleLazy 'marijnh/tern_for_vim', {
" \   'build': {
" \     'others': 'npm install'
" \   },
" \   'autoload': {
" \     'functions': ['tern#Complete', 'tern#Enable'],
" \     'filetypes': ['javascript']
" \   },
" \   'commands': [
" \     'TernDef', 'TernDoc', 'TernType', 'TernRefs', 'TernRename'
" \   ]
" \ }
" AltJS {{{
NeoBundleLazy 'kchmck/vim-coffee-script',
\   FiletypeConfig("coffee")
NeoBundleLazy 'leafgarland/typescript-vim',
\   FiletypeConfig("typescript")
NeoBundleLazy 'Quramy/tsuquyomi',
\   FiletypeConfig("typescript")
" }}}
" }}}

NeoBundleLazy 'hail2u/vim-css3-syntax',
\   FiletypeConfig("css")
NeoBundleLazy 'groenewege/vim-less',
\   FiletypeConfig("less")
NeoBundleLazy 'wavded/vim-stylus',
\   FiletypeConfig("stylus")
NeoBundleLazy 'slim-template/vim-slim',
\   FiletypeConfig("slim")

" scala {{{
NeoBundleLazy 'derekwyatt/vim-scala',
\   FiletypeConfig("scala")
NeoBundleLazy 'derekwyatt/vim-sbt',
\   FiletypeConfig("sbt")
" }}}


NeoBundleLazy 'fatih/vim-go',
\   FiletypeConfig("go")
NeoBundleLazy 'yosssi/vim-ace',
\   FiletypeConfig("ace")
NeoBundleLazy 'cespare/vim-toml',
\   FiletypeConfig("toml")
NeoBundleLazy 'stephpy/vim-yaml',
\   FiletypeConfig("yaml")
" If lazy, compound filetype is wrong...
NeoBundle     'JuliaLang/julia-vim',
NeoBundle     'elixir-lang/vim-elixir',
NeoBundle     'rust-lang/rust.vim',
NeoBundle     'vim-ruby/vim-ruby'
NeoBundle     'gre/play2vim'
NeoBundleLazy 'PProvost/vim-ps1',
\   FiletypeConfig("ps1")

NeoBundleLazy 'OrangeT/vim-csharp',
\   FiletypeConfig(['cs', 'csi', 'csx'])

" asterisk
NeoBundleLazy 'haya14busa/vim-asterisk', {
\   'autoload': {
\     'mappings': [
\       '<Plug>(incsearch-nohl)<Plug>(asterisk-',
\     ]
\   },
\   'depends': ['haya14busa/incsearch.vim']
\ }

" git
NeoBundleLazy 'tpope/vim-fugitive', {
\   'autoload': {
\     'commands': ['Gblame']
\   }
\ }

let OSTYPE = system('uname')
if OSTYPE == "Linux\n"
  " for linux
  NeoBundle 'rhysd/committia.vim'
endif
NeoBundle 'scrooloose/nerdtree'
" NeoBundle 'altercation/vim-colors-solarized' 
NeoBundle 'tomtom/tcomment_vim'
NeoBundleLazy 'Shougo/vimfiler'

" Unite {{{
NeoBundleLazy 'Shougo/unite.vim', {
\   'autoload' : {
\     'commands' : [ "Unite", "UniteWithBufferDir" ]
\   },
\   'depends': ['Shougo/neomru.vim'],
\ }
" }}}

NeoBundleLazy 'sjl/gundo.vim', {
\   'autoload': {
\     'commands': [
\       'GundoToggle',
\     ]
\   }
\ }
NeoBundleLazy 'thinca/vim-ref', {
\   'autoload': {
\     'commands': ['Ref'],
\     'mappings': ['<Plug>(ref-keyword)']
\   },
\ }


" jedi-vim http://lambdalisue.hatenablog.com/entry/2013/06/23/071344 {{{
NeoBundleLazy "davidhalter/jedi-vim", {
\   'autoload': {
\     'filetypes': ["python", "python3", "djangohtml"]
\   }
\ }
" }}}

NeoBundle     'sudo.vim'
NeoBundleLazy 'editorconfig/editorconfig-vim'
NeoBundleLazy 'tyru/open-browser.vim'
NeoBundleLazy 'mattn/webapi-vim'


" colorscheme {{{
NeoBundle     'w0ng/vim-hybrid'
" }}}

NeoBundleLazy 'thinca/vim-quickrun', {
\   'autoload': {
\     'mappings': [['nxo', '<Plug>(quickrun)']],
\     'commands': 'QuickRun'
\   }
\ }
" markdown quickrun
NeoBundleLazy 'superbrothers/vim-quickrun-markdown-gfm', {
\   'autoload': {
\     'filetypes': 'markdown'
\   },
\   'depends': [
\     'mattn/webapi-vim',
\     'thinca/vim-quickrun',
\     'tyru/open-browser.vim'
\   ]
\ }

" vim-gista {{{
NeoBundleLazy 'lambdalisue/vim-gista', {
\   'autoload': {
\     'commands': ['Gista'],
\     'mappings': '<Plug>(gista-',
\     'unite_sources': 'gista'
\   },
\   'depends': ['unite.vim']
\ }
" }}}

" NeoBundle     'Shougo/vimproc.vim', {
" \ 'build' : {
" \     'windows' : 'make -f make_mingw32.mak',
" \     'cygwin' : 'make -f make_cygwin.mak',
" \     'mac' : 'make -f make_mac.mak',
" \     'unix' : 'make -f make_unix.mak'
" \   }
" \ }

" keybind {{{
NeoBundle     'kana/vim-submode'
NeoBundle     'kana/vim-arpeggio'
" }}}




" unite.vim {{{
if neobundle#tap('unite.vim')
  function! neobundle#tapped.hooks.on_source(bundle)
    let g:unite_enable_start_insert=1
    let g:unite_source_history_yank_enable=1
    let g:unite_source_file_mru_limit=200
  endfunction

  nnoremap <SID>(unite) <Nop>
  nmap <Space>u <SID>(unite)
  nnoremap <silent> <SID>(unite)t :<C-u>Unite file file_mru buffer -buffer-name='file-buffer' -tab<CR>
  nnoremap <silent> <SID>(unite)u :<C-u>Unite file file_mru buffer -buffer-name='file-buffer'<CR>
  nnoremap <silent> <SID>(unite)v :<C-u>vs<CR>:Unite file file_mru buffer -buffer-name='file-buffer'<CR>
  nnoremap <silent> <SID>(unite)s :<C-u>sp<CR>:Unite file file_mru buffer -buffer-name='file-buffer'<CR>
  nnoremap <silent> <SID>(unite)b :<C-u>Unite buffer<CR>
  nnoremap <silent> <SID>(unite)r :<C-u>Unite -buffer-name=register register<CR>
  nnoremap <silent> <SID>(unite)c :<C-u>Unite bookmark<CR>
  nnoremap <silent> <SID>(unite)a :<C-u>UniteBookmarkAdd<CR>
  nnoremap <silent> <SID>(unite)f :<C-u>UniteWithBufferDir -buffer-name=files file<CR>
  nnoremap <silent> <SID>(unite)y :<C-u>Unite yankround<CR>
  nnoremap <silent> <SID>(unite)f :<C-u>Unite file file/new -buffer-name=file<CR>

  AutoCmd FileType unite call s:unite_fix_key()
  function! s:unite_fix_key() abort
    if bufname('%') =~# "file-buffer"
      inoremap <buffer> / */
      inoremap <buffer> * **/
    endif
  endfunction

  call neobundle#untap()
endif
" }}}

" vimfiler {{{
if neobundle#tap('vimfiler')
  call neobundle#config({
        \   'autoload': {
        \     'commands': [
        \       'VimFiler',
        \       'VimFilerTab',
        \       'VimFilerBufferDir',
        \       'VimFilerExplorer',
        \       'Edit',
        \       'Write',
        \       'Read',
        \       'Source'
        \     ],
        \     'mappings' : '<Plug>(vimfiler_',
        \     'explorer': 1
        \   },
        \   'depends': 'Shougo/unite.vim'
        \ })

  let g:vimfiler_as_default_explorer = 1
  let g:vimfiler_ignore_pattern = '^.git'

  nnoremap <Space>ff :<C-u>VimFiler<CR>
  nnoremap <Space>ft :<C-u>VimFilerTab<CR>
  nnoremap <Space>fe :<C-u>VimFilerBufferDir -quit<CR>
  nnoremap <Space>fi :<C-u>VimFilerBufferDir -split -simple -winwidth=35 -no-quit<CR>

  call neobundle#untap()
endif
" }}}

" neocomplete {{{
if neobundle#tap('neocomplete')
  call neobundle#config({
        \   'depends': ['Shougo/context_filetype.vim', 'ujihisa/neco-look', 'pocke/neco-gh-issues', 'Shougo/neco-syntax'],
        \ })

  let g:neocomplete#enable_at_startup = 1
  " 大文字が入力されるまで大文字小文字の区別を無視する
  let g:neocomplete#enable_smart_case = 1
  " _(アンダースコア)区切りの補完を有効化
  let g:neocomplete#enable_underbar_completion = 1
  let g:neocomplete#enable_camel_case_completion  =  1
  " ポップアップメニューで表示される候補の数
  let g:neocomplete#max_list = 20
  " シンタックスをキャッシュするときの最小文字長
  let g:neocomplete#sources#syntax#min_keyword_length = 3
  " 補完を表示する最小文字数
  let g:neocomplete#auto_completion_start_length = 2
  " preview window を閉じない
  let g:neocomplete#enable_auto_close_preview = 0
  " AutoCmd InsertLeave * silent! pclose!

  let g:neocomplete#max_keyword_width = 10000


  if !exists('g:neocomplete#delimiter_patterns')
    let g:neocomplete#delimiter_patterns= {}
  endif
  let g:neocomplete#delimiter_patterns.ruby = ['::']

  if !exists('g:neocomplete#same_filetypes')
    let g:neocomplete#same_filetypes = {}
  endif
  let g:neocomplete#same_filetypes.ruby = 'eruby'


  if !exists('g:neocomplete#force_omni_input_patterns')
    let g:neocomplete#force_omni_input_patterns = {}
  endif

  let g:neocomplete#force_omni_input_patterns.cpp = '[^.[:digit:] *\t]\%(\.\|->\)\w*\|\h\w*::\w*'
  let g:neocomplete#force_omni_input_patterns.typescript = '[^. \t]\.\%(\h\w*\)\?' " Same as JavaScript
  let g:neocomplete#force_omni_input_patterns.go = '[^. \t]\.\%(\h\w*\)\?'         " Same as JavaScript

  let s:neco_dicts_dir = $HOME . '/dicts'
  if isdirectory(s:neco_dicts_dir)
    let g:neocomplete#sources#dictionary#dictionaries = {
          \   'ruby': s:neco_dicts_dir . '/ruby.dict',
          \   'javascript': s:neco_dicts_dir . '/jquery.dict',
          \ }
  endif
  let g:neocomplete#data_directory = $HOME . '/.vim/cache/neocomplete'

  " call neocomplete#custom#source('look', 'min_pattern_length', 1)

  call neobundle#untap()
endif
"}}}

" neosnippet {{{
if neobundle#tap('neosnippet')
  "http://kazuph.hateblo.jp/entry/2013/01/19/193745

  " <TAB>: completion.
  inoremap <expr><S-TAB>  pumvisible() ? "\<C-p>" : "\<S-TAB>"

  " Plugin key-mappings.
  imap <silent><C-k> <Esc>:let g:neosnippet_expanding_or_jumpping = 1<CR>a<Plug>(neosnippet_expand_or_jump)
  smap <C-k> <Plug>(neosnippet_expand_or_jump)

  " SuperTab like snippets behavior.
  imap <expr><TAB> pumvisible() ? "\<C-n>" : neosnippet#jumpable() ? "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"
  smap <expr><TAB> neosnippet#jumpable() ? "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"

  " For snippet_complete marker.
  if has('conceal')
    set conceallevel=2 concealcursor=i
  endif

  " Enable snipMate compatibility feature.
  let g:neosnippet#enable_snipmate_compatibility = 1
  let g:neosnippet#snippets_directory='~/dotfiles/snippets'

  " AutoCmd InsertLeave * syntax clear neosnippetConcealExpandSnippets
  " AutoCmd FileType php NeoSnippetSource ~/.vim/bundle/PHPSnippetsCreator/dist/php_functions.snip

  call neobundle#untap()
endif
"}}}

" vim-Flake8 {{{
"保存時に自動でチェック
let g:PyFlakeOnWrite = 1

"解析種別を設定
let g:PyFlakeCheckers = 'pep8,mccabe,pyflakes'

"McCabe複雑度の最大値
let g:PyFlakeDefaultComplexity=10

"visualモードでQを押すと自動で修正
let g:PyFlakeRangeCommand = 'Q'
" }}}

" vim-smartinput {{{
if neobundle#tap('vim-smartinput')
  function! neobundle#tapped.hooks.on_source(bundle)
    call smartinput#define_rule({
          \   'at':    '\s\+\%#',
          \   'char':  '<CR>',
          \   'input': "<C-o>:call setline('.', substitute(getline('.'), '\\s\\+$', '', ''))<CR><CR>",
          \ })
    call smartinput#map_to_trigger('i', '#', '#', '#')
    call smartinput#define_rule({
          \   'at':       '\v(''[^"]*)@<!\V\%#',
          \   'char':     '#',
          \   'input':    '#{}<Left>',
          \   'filetype': ['ruby', 'ruby.rspec'],
          \   'syntax':   ['Constant', 'Special'],
          \ })

    call smartinput#map_to_trigger('i', '<Bar>', '<Bar>', '<Bar>')
    call smartinput#define_rule({
          \   'at':       '\({\|\<do\>\)\s*\%#',
          \   'char':     '<Bar>',
          \   'input':    '<Bar><Bar><Left>',
          \   'filetype': ['ruby', 'ruby.rspec'],
          \ })

    call smartinput#map_to_trigger('i', ':', ':', ':')
    call smartinput#define_rule({
          \   'at':       '\w\%#',
          \   'char':     ':',
          \   'input':    ': <Esc>bbi"<Esc>wwi"<Right><Right>',
          \   'filetype': ['json'],
          \   'syntax':   ['jsonFold']
          \ })

    call smartinput#map_to_trigger('i', '<Plug>(smartinput_CR)', '<Enter>', '<Enter>')
  endfunction

  call neobundle#untap()
endif
" }}}

" yankround.vim {{{
if neobundle#tap('yankround.vim')
  call neobundle#config({
        \   'autoload': {
        \     'mappings': ['<Plug>(yankround-'],
        \     'functions': 'yankround#is_active', 
        \     'unite_sources': ['yankround'],
        \   }
        \ })

  function! neobundle#tapped.hooks.on_source(bundle)
    let g:yankround_dir         = '~/.vim/cache/yankround'
    let g:yankround_max_history = 50
  endfunction

  nmap p <Plug>(yankround-p)
  xmap p <Plug>(yankround-p)
  nmap P <Plug>(yankround-P)

  nmap gp <Plug>(yankround-gp)
  xmap gp <Plug>(yankround-gp)
  nmap gP <Plug>(yankround-gP)

  call neobundle#untap()
endif
" }}}

" text-object {{{
" vim-expand-region {{{
if neobundle#tap('vim-expand-region')
  call neobundle#config({
        \   'autoload': {
        \     'mappings': ['<Plug>(expand_region_']
        \   }
        \ })

  map <CR> <Plug>(expand_region_expand)
  map <BS> <Plug>(expand_region_shrink)

  function! neobundle#tapped.hooks.on_source(bundle)
    let g:expand_region_text_objects = {
          \   "i'": 0,
          \   'i"': 0,
          \   'i)': 0,
          \   'i}': 0,
          \   'i]': 0,
          \   'ae': 1,
          \ }
    let g:expand_region_text_objects_ruby = copy(g:expand_region_text_objects)
    let g:expand_region_text_objects_ruby.ir = 1
    let g:expand_region_text_objects_ruby.ar = 1
    let g:expand_region_text_objects_html = copy(g:expand_region_text_objects)
    let g:expand_region_text_objects_html.it = 1
    let g:expand_region_text_objects_html.ax = 1
  endfunction

  call neobundle#untap()
endif
" }}}

function! s:textobj_tap(name, mappings)
  if neobundle#tap(a:name)
    call neobundle#config({
          \   'depends': 'kana/vim-textobj-user',
          \   'autoload': {
          \     'mappings': map(a:mappings, '["xo", v:val]')
          \   }
          \ })

    call neobundle#untap()
  endif
endfunction

call s:textobj_tap("vim-textobj-ruby", ['ar', 'ir'])
call s:textobj_tap('vim-textobj-parameter', ['a,', 'i,'])
call s:textobj_tap('vim-textobj-entire', ['ae', 'ie'])
call s:textobj_tap('vim-textobj-xmlattr', ['ix', 'ax'])
" }}}

" AnsiEsc.vim {{{
if neobundle#tap('AnsiEsc.vim')
  call neobundle#config({
        \   'autoload' : {
        \     'commands' : ['AnsiEsc']
        \   }
        \ })

  call neobundle#untap()
endif
" }}}

" lightline.vim {{{
if neobundle#tap('lightline.vim')
  let g:lightline = {
        \   'colorscheme': 'solarized',
        \   'active': {
        \     'left': [
        \       ['mode'],
        \       ['readonly', 'filename', 'modified'],
        \     ]
        \   },
        \   'component': {},
        \   'component_visible_condition': {},
        \ }

  call neobundle#untap()
endif
" }}}

" incsearch.vim {{{
if neobundle#tap('incsearch.vim')
  call neobundle#config({
        \   'autoload': {
        \     'mappings': ['<Plug>(incsearch-']
        \   }
        \ })

  map / <Plug>(incsearch-forward)
  map ? <Plug>(incsearch-backward)
  map g/ <Plug>(incsearch-stay)

  function neobundle#tapped.hooks.on_post_source(bundle)
    let g:incsearch#magic = '\v'
    let g:incsearch#auto_nohlsearch = 1

    map n  <Plug>(incsearch-nohl-n)zz
    map N  <Plug>(incsearch-nohl-N)zz

    IncSearchNoreMap <CR> <CR>zz
    IncSearchNoreMap <C-h> <BS>
  endfunction

  call neobundle#untap()
endif
" }}}

" ruby_hl_lvar.vim {{{
if neobundle#tap('ruby_hl_lvar.vim')
  call neobundle#config({
        \   'autoload': {
        \     'filetypes': ['ruby']
        \   }
        \ })

  let g:ruby_hl_lvar_show_warnings = 1
  function! neobundle#tapped.hooks.on_post_source(bundle)
    let g:ruby_hl_lvar_hl_group = 'PreProc'

    silent! execute 'doautocmd FileType' &filetype

    let g:neosnippet_expanding_or_jumpping = 0
    function! s:ruby_hl_lvar_on_textchanged() abort
      if g:neosnippet_expanding_or_jumpping
        let g:neosnippet_expanding_or_jumpping = 0
      else
        call ruby_hl_lvar#refresh(0)
      endif
    endfunction

    " override
    function! Ruby_hl_lvar_filetype()
      let groupname = 'vim_hl_lvar_'.bufnr('%')
      execute 'augroup '.groupname
      autocmd!
      if &filetype =~# '\<ruby\>'
        if g:ruby_hl_lvar_auto_enable
          call ruby_hl_lvar#refresh(1)
          autocmd TextChanged  <buffer> call s:ruby_hl_lvar_on_textchanged()
          autocmd InsertLeave  <buffer> call ruby_hl_lvar#refresh(0)
          autocmd TextChangedI <buffer> call ruby_hl_lvar#refresh(0)
        else
          call ruby_hl_lvar#disable(1)
        endif
      endif
    augroup END
  endfunction
endfunction

call neobundle#untap()
endif
" }}}

" accelerated-smooth-scroll {{{
" http://yonchu.hatenablog.com/entry/2013/05/16/204727
if neobundle#tap('accelerated-smooth-scroll')
  call neobundle#config({
        \   'autoload': {
        \     'mappings': ['<Plug>(ac-smooth-scroll-c-']
        \   }
        \ })

  let g:ac_smooth_scroll_no_default_key_mappings = 1
  let g:ac_smooth_scroll_du_sleep_time_msec = 8
  let g:ac_smooth_scroll_fb_sleep_time_msec = 8

  nmap <silent> <C-d> <Plug>(ac-smooth-scroll-c-d)
  nmap <silent> <C-u> <Plug>(ac-smooth-scroll-c-u)
  nmap <silent> <C-f> <Plug>(ac-smooth-scroll-c-f)
  nmap <silent> <C-b> <Plug>(ac-smooth-scroll-c-b)

  call neobundle#untap()
endif
" }}}

" vim-easymotion {{{
if neobundle#tap('vim-easymotion')
  call neobundle#config({
        \   'autoload': {
        \     'mappings': ['<Plug>(easymotion-']
        \   }
        \ })

  let g:EasyMotion_smartcase   = 1
  let g:EasyMotion_use_migemo  = 1

  nmap e <Plug>(easymotion-s2)

  call neobundle#untap()
endif
" }}}

" clever-f {{{
if neobundle#tap('clever-f.vim')
  call neobundle#config({
        \   'autoload': {
        \     'mappings': ['f', 'F']
        \   }
        \ })

  function! neobundle#tapped.hooks.on_source(bundle)
    let g:clever_f_ignore_case           = 1
    let g:clever_f_fix_key_direction     = 1
    let g:clever_f_chars_match_any_signs = "\<C-f>"
  endfunction

  call neobundle#untap()
endif
" }}}

" vim-go {{{
if neobundle#tap('vim-go')
  call neobundle#config({
        \   'autoload': {
        \     'filetypes': 'go'
        \   }
        \ })

  function! neobundle#tapped.hooks.on_source(bundle)
    if executable("goimports")
      let g:go_fmt_command = "goimports"
    endif

    function! s:go_cmd_alias() abort
      command! -nargs=1 -buffer -complete=customlist,go#package#Complete Import GoImport <args>
      command! -nargs=? -buffer                                          Rename GoRename <args>
    endfunction

    AutoCmd FileType go call s:go_cmd_alias()
  endfunction

  call neobundle#untap()
endif
" }}}

" vim-gista {{{
if neobundle#tap('vim-gista')
  let g:gista#directory = $HOME . '/.vim/cache/gista/'
  let g:gista#update_on_write = 1
  let g:gista#github_user = 's7o'
  let g:gista#post_private = 1

  call neobundle#untap()
endif
" }}}

" editorconfig-vim {{{
if neobundle#tap('editorconfig-vim')
  function! s:load_editorconfig()
    if findfile('.editorconfig', '.;') != ''
      NeoBundleSource editorconfig-vim
      EditorConfigReload
    endif
  endfunction

  AutoCmd VimEnter * call s:load_editorconfig()

  call neobundle#untap()
endif
" }}}

" open-browser.vim {{{
if neobundle#tap('open-browser.vim')
  let g:openbrowser_browser_commands = [{
  \   "name": "xdg-open",
  \   "args": ["{browser}", "{uri}"]
  \ }]

  call neobundle#untap()
endif
" }}}

" vim-quickrun {{{
if neobundle#tap('vim-quickrun')
  let g:quickrun_config = {
  \   '_': {
  \     'runner': 'vimproc',
  \     'runner/vimproc/updatetime': 60,
  \     'tempfile': '%{expand("%:p:h") . "/" . system("echo -n $(uuidgen)")}'
  \   },
  \   'markdown': {
  \     'type':      'markdown/gfm',
  \     'outputter': 'browser'
  \   },
  \   'ruby.rspec': {
  \     'command': 'rspec',
  \     'exec': 'bundle exec %c --color --tty %s',
  \     'outputter/buffer/name': '[quickrun output rspec]'
  \   },
  \ }

  AutoCmd FileType quickrun AnsiEsc

  nnoremap <silent><Leader>r :QuickRun<CR>

  call neobundle#untap()
endif
" }}}

" vim-asterisk {{{
if neobundle#tap('vim-asterisk')
  map * <Plug>(incsearch-nohl)<Plug>(asterisk-*)
  map # <Plug>(incsearch-nohl)<Plug>(asterisk-#)
  map z* <Plug>(incsearch-nohl)<Plug>(asterisk-z*)
  map z# <Plug>(incsearch-nohl)<Plug>(asterisk-z#)

  call neobundle#untap()
endif
" }}}

" vim-fugitive {{{
if neobundle#tap('vim-fugitive')
  function! neobundle#tapped.hooks.on_post_source(bundle)
    doautoall fugitive BufNewFile
  endfunction

  call neobundle#untap()
endif
" }}}

" vim-automatic {{{
if neobundle#tap('vim-automatic')
  function! s:my_temp_win_init(config, context)
    nnoremap <buffer> q :<C-u>q<CR>
  endfunction

  let g:automatic_default_set_config = {
  \   'apply':  function('s:my_temp_win_init'),
  \   'height': '60%',
  \   'move':   'bottom'
  \ }

  let g:automatic_config = [
  \   {
  \     'match': {
  \       'filetype': 'help',
  \       'buftype':  'help'
  \     },
  \     'set': {
  \       'width': 80,
  \       'move': 'right',
  \       'height': '100%'
  \     }
  \   },
  \   {
  \     'match': {
  \       'bufname': '\V[quickrun output]'
  \     },
  \     'set': {
  \       'height': 8,
  \     }
  \   },
  \   {
  \     'match': {
  \       'bufname': '^\[quickrun output rspec\]'
  \     },
  \     'set': {
  \       'height': '20%'
  \     }
  \   }
  \ ]

  call neobundle#untap()
endif
" }}}

let OSTYPE = system('uname')
if OSTYPE == "Linux\n"
  " for linux
  if neobundle#tap('committia.vim')
    let g:committia_hooks = {}
    function! g:committia_hooks.edit_open(info)
      setlocal spell
  
      imap <buffer><C-d> <Plug>(committia-scroll-diff-down-half)
      imap <buffer><C-u> <Plug>(committia-scroll-diff-up-half)
      nmap <buffer><C-d> <Plug>(committia-scroll-diff-down-half)
      nmap <buffer><C-u> <Plug>(committia-scroll-diff-up-half)
    endfunction
  
    call neobundle#untap()
  endif
endif

" vim-submode {{{
if neobundle#tap('vim-submode')
  let g:submode_keep_leaving_key = 1
  function! s:my_x()
    undojoin
    normal! "_x
  endfunction

  nnoremap <silent> <Plug>(my-x) :<C-u>call <SID>my_x()<CR>

  call neobundle#untap()
endif
" }}}

call neobundle#end()

" Required:
filetype plugin indent on

NeoBundleCheck

" nnoremap ; :
" vnoremap ; :

function! s:hier_clear()
  if exists(':HierClear')
    HierClear
  endif
endfunction
nnoremap <silent> <Esc><Esc> :<C-u>nohlsearch<CR>:<C-u>call <SID>hier_clear()<CR>
nnoremap <silent> <C-l> :<C-u>tabnext<CR>
nnoremap <silent> <C-h> :<C-u>tabprevious<CR>
nnoremap <Space>w :<C-u>w<CR>
nnoremap <Space>q :<C-u>q<CR>
nnoremap <Space>wq :<C-u>wq<CR>
noremap <Space>h ^
noremap <Space>l $
nnoremap Q <Nop>
nnoremap Y y$
nnoremap <silent><C-s> :<C-u>set spell!<CR>
nnoremap <silent><Tab> :<C-u>set cursorcolumn!<CR>:<C-u>set cursorline!<CR>
vnoremap <silent><Tab> :<C-u>set cursorcolumn!<CR>:<C-u>set cursorline!<CR>

nnoremap <Left>  <C-w>h
nnoremap <Down>  <C-w>j
nnoremap <Up>    <C-w>k
nnoremap <Right> <C-w>l

let g:acp_enableAtStartup = 0
" Use neocomplete.
let g:neocomplete#enable_at_startup = 1
" Use smartcase.
let g:neocomplete#enable_smart_case = 1
" Set minimum syntax keyword length.
let g:neocomplete#sources#syntax#min_keyword_length = 3
let g:neocomplete#lock_buffer_name_pattern = '\*ku\*'

set nocompatible
syntax enable

" 256色
if $TERM == 'xterm' || $TERM == 'screen-256color'
  set t_Co=256
endif
colorscheme hybrid
set background=dark
set number
set ruler
set autoindent
autocmd VimEnter * highlight LineNr ctermfg=134
set cursorline
hi clear CursorLine
set wrap

set backspace=indent,eol,start
" search
set ignorecase
set smartcase
set incsearch
" http://haya14busa.com/vim_highlight_search/
set hlsearch | nohlsearch

set nobackup
set writebackup

set title
set showcmd
set scrolloff=4

" コマンドラインでの補完を強くする
set wildmenu
set wildmode=longest:full,full
set wildignorecase
set history=1000

" K で:help
set keywordprg=""

" 折りたたみ-展開
set foldmethod=manual
set foldlevel=99
set conceallevel=0

if expand("%:t") =~ ".*\.py"
  set tabstop=4
  set shiftwidth=4
endif
set expandtab
set tabstop=2
set softtabstop=2
set shiftwidth=2
set list
set listchars=tab:>-
" set breakindent

if OSTYPE == "Darwin\n"
  " for mac
  set clipboard+=unnamed
elseif OSTYPE == "Linux\n"
  " for linux
  set clipboard& clipboard^=unnamedplus
endif

" ファイルを閉じてもundo
if has('persistent_undo')
  set undodir=~/.vim/undo
  if ! isdirectory(&undodir)
    call mkdir(&undodir, 'p')
  endif
  set undofile
endif

" statuslineを表示
set laststatus=2
set noshowmode

set display& display+=lastline

" ビープ音を鳴らさない
set visualbell t_vb=
set noerrorbells

set updatetime=1000
set tabpagemax=100

" set mouse=a
set spelllang+=cjk

" for Shift-o
set ttimeoutlen=10

set hidden
set noswapfile
set helplang=ja,en

" grep検索の実行後にQuickFix Listを表示する
autocmd QuickFixCmdPost *grep* cwindow

" 前回終了したカーソル行に移動
AutoCmd BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$") | exe "normal g`\"" | endif

" http://hail2u.net/blog/software/vim-auto-close-quickfix-window.html
function! s:auto_close_quickfix()
  if winnr('$') == 1 && getbufvar(winbufnr(0), '&buftype') == 'quickfix'
    quit
  endif
endfunction
AutoCmd WinEnter * call s:auto_close_quickfix()
" }}}

function! s:operator_google(mosion_wize)
  NeoBundleSource open-browser.vim
  if line("'[") != line("']")
    return
  endif
  let start = col("'[") - 1
  let end   = col("']")
  let sel = strpart(getline('.'), start, end - start)
  call openbrowser#search(sel)
endfunction

" http://hail2u.net/blog/software/vim-auto-close-quickfix-window.html
function! s:auto_close_quickfix()
  if winnr('$') == 1 && getbufvar(winbufnr(0), '&buftype') == 'quickfix'
    quit
  endif
endfunction
AutoCmd WinEnter * call s:auto_close_quickfix()
" }}}
