map <buffer> <F4> :call PsqlPW()<cr>
map <buffer> <cr> :call PsqlLine()<cr>
"setlocal foldmethod=marker
iabbr <buffer> f --{{{
    \<CR>--}}}<esc>O
iabbr <buffer> sl SELECT * FROM
iabbr <buffer> wh WHERE
iabbr <buffer> jn JOIN
      \<CR>ON<esc>$kA
iabbr <buffer> lm LIMIT 100
iabbr <buffer> or ORDER BY
iabbr <buffer> gr GRUP BY
iabbr <buffer> up UPDATE table SET attr=value
iabbr <buffer> ins INSERT
