function! plugin#refresh()
	call map(dein#check_clean(), "delete(v:val, 'rf')")
	call dein#recache_runtimepath()
	source $MYVIMRC
endfunction
