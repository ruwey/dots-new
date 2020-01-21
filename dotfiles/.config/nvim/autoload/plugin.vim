" Functions that have to do with loading plugins

" Take YAML plugin file and turn it to JSON
function! plugin#load_yaml(filename) abort
	" Set python command to read the yaml file
	let l:cmd = "python -c 'import sys,yaml,json; y=yaml.safe_load(sys.stdin.read()); print(json.dumps(y))'"

	let l:raw = readfile(a:filename) 

	return json_decode(system(l:cmd, l:raw))
endfunction

" Return JSON plugins as vim list
function! plugin#_parse_config_files(config_paths) abort
	let l:merged = []
	
	let l:merged = plugin#load_yaml(a:config_paths)

	return l:merged
endfunction

" Substitute items from list into the dein plugin load script
function! plugin#dein_init(config_path) abort
	if &compatible
	  set nocompatible               " Be iMproved
	endif
	
	" Required:
	set runtimepath+=/home/ruwey/.config/nvim/dein/repos/github.com/Shougo/dein.vim
	
	" Required:
	if dein#load_state('/home/ruwey/.config/nvim/dein')
	  let l:rc = plugin#_parse_config_files(a:config_path)
	  call dein#begin('/home/ruwey/.config/nvim/dein')
	
	  " Let dein manage dein
	  " Required:
	  call dein#add('/home/ruwey/.config/nvim/dein/repos/github.com/Shougo/dein.vim')

	  for plugin in l:rc
		  call dein#add(plugin['repo'], extend(plugin, {}, 'keep'))
	  endfor

	  " Required:
	  call dein#end()
	  call dein#save_state()
	endif
	
	" Required:
	filetype plugin indent on
	syntax enable
	
	" If you want to install not installed plugins on startup.
	"if dein#check_install()
	"  call dein#install()
	"endif
	
endfunction

" Refresh vim and delete old unused plugins
function plugin#refresh()
	source $MYVIMRC
	call map(dein#check_clean(), "delete(v:val, 'rf')")
	call dein#recache_runtimepath()
endfunction

function plugin#center(lines)
	let longest_line = max(map(copy(a:lines), 'strwidth(v:val)'))
	return map(copy(a:lines),
	      \ 'repeat(" ", (&columns / 2) - (longest_line / 2) - 1) . v:val')
endfunction
