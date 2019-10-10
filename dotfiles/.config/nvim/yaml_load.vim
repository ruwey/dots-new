function! Yaml_load(filename)
  ruby << EOF
  require 'yaml'
  obj = YAML.load_file(File.expand_path(VIM::evaluate('a:filename')))
  obj_hash = obj.inspect.gsub('=>', ':').gsub('nil', '{}')
  VIM::command("let l:ret = #{obj_hash}")
EOF
  return l:ret
endfunction

