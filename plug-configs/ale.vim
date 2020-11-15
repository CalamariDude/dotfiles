let g:ale_linters = {'python': ['flake8']}
let g:ale_fixers = {'*': ['remove_trailing_lines', 'trim_whitespace'], 'python': ['black', 'isort']}
let g:ale_lint_on_enter = 0
let g:ale_fix_on_save = 1
let b:ale_completion_autoimport = 1
let g:ale_sign_column_always = 1
let g:ale_sign_error = '●'
let g:ale_sign_warning = '.'