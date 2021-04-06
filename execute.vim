let s:compVim_dir = expand('<sfile>:p:h')
let s:main = s:compVim_dir . "/main.cpp"
let s:in = s:compVim_dir . "/in.txt"
let s:snips = s:compVim_dir . "/neosnippets"

let g:neosnippet#snippets_directory=s:snips

exec "cd " . s:compVim_dir
echo "競プロモード始動！！！"
exec "edit " . s:main
rightbelow 15sp
exec "edit " . s:in
wincmd k

augroup saveAndCompile
	autocmd!
	autocmd BufWritePost main.cpp call SaveAndCompile()
augroup END

<<<<<<< HEAD
autocmd saveAndCompile BufWritePost main.cpp call SaveAndCompile()
=======
let g:neosnippet#snippets_directory=s:snips
>>>>>>> ba5ef9c65c14810b0e15052eb814c8569dd30496

function! SaveAndCompile ()
	wincmd j
	wincmd l
	w
	wincmd k
	exec "QuickRun <" .
				\ s:in .
				\ " -outputter/buffer/split \"wincmd j | vs\"" .
				\ " -command \"g++\"" .
				\ " -cmdopt \"-std=c++14\"" .
				\ " -hook/time 1"
endfunction

syn keyword cConstant INF MOD EPS
syn keyword	cRepeat   rep range

command! Q wqall
