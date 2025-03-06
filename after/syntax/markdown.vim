" UPSTREAM: Enable YAML front matter support
" https://github.com/tpope/vim-markdown/issues/112#issuecomment-285945848
unlet b:current_syntax
syntax include @Yaml syntax/yaml.vim
syntax region yamlFrontmatter start=/\%^---$/ end=/^---$/ keepend contains=@Yaml
