" vim:sw=2 ts=2

" Clear stuff
highlight clear 
if exists("syntax_on") 
  syntax reset 
endif

" Vars
set background=dark
let g:colors_name = "my-theme"

let colors = [
			\'#091414',
			\'#c63939',
			\'#748867',
			\'#92704b',
			\'#11443c',
			\'#c74040',
			\'#1c5a4b',
			\'#d2cbc7',
			\'#173737',
			\'#ff3939',
			\'#94c076',
			\'#cc9253',
			\'#145349',
			\'#f34d4d',
			\'#45786c',
			\'#fffdf8',
			\'#fffdf8',
			\'#091414',
			\'#f5f5f5',
			\'#2C3E50']

" Main Func
function s:HSet(type, ...) abort
	let histring = 'hi ' . a:type . ' '

	if strlen(a:1)
		let histring .= 'guifg=' . a:1 . ' '
	endif

	if a:0 >= 2 && strlen(a:2)
		let histring .= 'guibg=' . a:2 . ' '
	else
		let histring .= 'guibg=NONE '
	endif

	if a:0 >= 3 && strlen(a:3)
		let histring .= 'gui=' . a:3 . ' '
	else
		let histring .= 'gui=NONE '
	endif

	execute histring
endfunction


" Colors
" Syntax
call s:HSet('Comment', colors[14])
call s:HSet('Constant', colors[13])
call s:HSet('Identifier', colors[14], 'NONE', 'bold')
call s:HSet('Statement', colors[11])
call s:HSet('PreProc', colors[3])
call s:HSet('Type', colors[10])
call s:HSet('Special', colors[7])
call s:HSet('Underlined', colors[14], 'NONE', 'underline')
call s:HSet('Ignore', colors[7])
call s:HSet('Error', colors[15], colors[9])
call s:HSet('Todo', colors[0], colors[11])
" Ui Elements
call s:HSet('Visual', 'NONE', colors[8])
