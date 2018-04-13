echo "競プロモード始動！！！"
e main.cpp
rightbelow 15sp
e in.txt
wincmd k

augroup saveAndCompile
	autocmd!
	autocmd BufWritePost main.cpp call SaveAndCompile()
augroup END

autocmd saveAndCompile BufWritePost main.cpp call SaveAndCompile()

let g:neosnippet#snippets_directory='snippets'

function! SaveAndCompile ()
	wincmd j
	wincmd l
	w
	wincmd k
	QuickRun <in.txt
				\ -outputter/buffer/split ":wincmd j | vs"
				\ -command "g++"
				\ -cmdopt "-std=c++14"
				\ -hook/time 1
endfunction


syn keyword cConstant INF MOD EPS
syn keyword	cRepeat		rep range
