" Author: notomo <notomo.motono@gmail.com>
" Description: Fixing files with pg_format.

call ale#Set('sql_pg_format_standard', '')
call ale#Set('sql_pg_format_executable', 'pg_format')
call ale#Set('sql_pg_format_use_global', get(g:, 'ale_use_global_executables', 0))

function! ale#fixers#pg_format#GetExecutable(buffer) abort
    return ale#node#FindExecutable(a:buffer, 'sql_pg_format', [
    \   'pg_format'
    \])
endfunction

function! ale#fixers#pg_format#Fix(buffer) abort
    let l:executable = ale#fixers#pg_format#GetExecutable(a:buffer)
    let l:options = " -bs2u1f1"
    return {
    \   'command': ale#Escape(l:executable) . l:options,
    \}
endfunction
