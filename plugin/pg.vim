" vim integration with psql
" read db from first line
fun! s:get_db()
  let s:db=(split(getline(1),":"))[1]
  return s:db
endfun

fun! PsqlLine()
  let s:db=s:get_db()
  normal $
  let s:start_pos = search('{{{','bcnW')
  let s:end_pos = search('}}}','cnW')
  if s:start_pos!=0 && s:end_pos!=0
    let s:cmd= ':'.s:start_pos.','.s:end_pos.'w !psql '.s:db.' &> /tmp/sqlres.sql'
    "echo cmd
    exec s:cmd
    ped /tmp/sqlres.sql
  endif
endfun

fun! PsqlExec(cmd)
  let s:db=s:get_db()
  silent exec '!echo "'.a:cmd.'" | psql '.s:db.' &2> /tmp/sqlres.sql'
  silent ped /tmp/sqlres.sql
endfun

fun! PsqlPW()
  let s:db=s:get_db()
  exec 'w !psql '.s:db.' > /tmp/sqlres.sql'
  ped /tmp/sqlres.sql
endfun

fun! Qb()
  let s:scrach = '/tmp/vim-pg-scrach.sql'
  exec 'e '.s:scrach
  if ! filereadable(s:scrach)
    normal <c-w>o
    set filetype=sql
    normal i--db:postgres
    normal o--{{{
    normal o\l
    normal o--}}}
    normal k^i
  endif
endfun

command! Qb call Qb()
imap
