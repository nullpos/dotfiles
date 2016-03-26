filetype off

let g:syntastic_python_python_exec = expand('~/.anyenv/envs/pyenv/shims/python')
let g:python_host_prog = expand('~/.anyenv/envs/pyenv/versions/2.7.11/bin/python')
let g:python3_host_prog = expand('~/.anyenv/envs/pyenv/versions/3.5.1/bin/python')

set number          " 行番号の表示
set cmdheight=2     " メッセージ表示欄を２行確保
set list            " 不可視文字の表示とそのリスト
set pastetoggle=<C-v>

set whichwrap=b,s,h,l,<,>,[,]  " 行頭行末の左右移動で行をまたぐ
set scrolloff=8                " 上下8行の視界を確保
set sidescrolloff=16           " 左右スクロール時の視界を確保

set confirm    " 保存されていないファイルがあるときは終了前に保存確認
set hidden     " 保存されていないファイルがあるときでも別のファイルを開くことが出来る
set nobackup   " ファイル保存時にバックアップファイルを作らない
set noswapfile " ファイル編集中にスワップファイルを作らない
set fileencodings=utf-8,iso-2022-jp,cp932,sjis,euc-jp

set smartcase  " 大文字と小文字が混在した言葉で検索を行った場合に限り、大文字と小文字を区別する
set wrapscan   " 最後尾まで検索を終えたら次の検索で先頭に移る
set gdefault   " 置換の時 g オプションをデフォルトで有効にする

set expandtab     " タブ入力を複数の空白入力に置き換える
set tabstop=2     " 画面上でタブ文字が占める幅
set shiftwidth=2  " 自動インデントでずれる幅
set softtabstop=2 " 連続した空白に対してタブキーやバックスペースキーでカーソルが動く幅
set smartindent   " 改行時に入力された行の末尾に合わせて次の行のインデントを増減する

set clipboard=unnamed,unnamedplus " OSのクリップボードをレジスタ指定無しで Yank, Put 出来るようにする
set shellslash " Windows でもパスの区切り文字を / にする

set visualbell t_vb= "ビープ音すべてを無効にする
set noerrorbells "エラーメッセージの表示時にビープを鳴らさない

" dein.vim {{{
let s:dein_dir = expand('~/.vim/dein')
let s:dein_repo_dir = s:dein_dir . '/repos/github.com/Shougo/dein.vim'
if !isdirectory(s:dein_repo_dir)
  execute '!git clone https://github.com/Shougo/dein.vim' s:dein_repo_dir
endif

execute 'set runtimepath^=' . s:dein_repo_dir

if dein#load_state(s:dein_dir)
  call dein#begin(s:dein_dir)

  let s:toml      = '~/.vim/dein/config/plugins.toml'
  let s:lazy_toml = '~/.vim/dein/config/plugins_lazy.toml'
  call dein#load_toml(s:toml, {'lazy': 0})
  call dein#load_toml(s:lazy_toml, {'lazy': 1})

  call dein#end()
  call dein#save_state()
endif

if dein#check_install()
  call dein#install()
endif
" }}}

colorscheme molokai
syntax enable
filetype plugin indent on
