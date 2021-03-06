" Primitives
syn region  Identifier start="\"" end="\"" skip="\v\\."
syn region  String start="\'" end="\'" skip="\v\\."
syn region  String start="E\'" end="\'" skip="\v\\."
syn match   postgresqlNumber "-\?\d\+\(\.\d*\)\?"
syn match   postgresqlType   "::\w\+"
syn match   postgresqlUUID "\v[0-9a-f]{8}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{12}"

syn match   NonText   "\W_\w\+_\W"
syn match   Define   ":\'\w\+\'"
syn match   Define   "\w\+:"
syn match   Define   "=>"
syn keyword Define   expect func proc
syn keyword Define   this

syn keyword Define "\\set"
syn keyword postgresqlType TIMESTAMP "TIMESTAMP WITH TIME ZONE"
syn match   postgresqlKeyword "FOREIGN KEY"
syn match   postgresqlKeyword "PRIMARY KEY"
syn keyword postgresqlKeyword BEFORE AFTER INSERT OR UPDATE ON FOR EACH ROW EXECUTE PROCEDURE
syn keyword postgresqlKeyword CONSTRAINT
syn keyword postgresqlKeyword btree REFERENCES
syn keyword Operator BEGIN GROUP ROLLBACK COMMIT
syn keyword Define DECLARE EXISTS DROP CREATE INDEX VIEW TABLE REPLACE LEFT JOIN OUTER
syn keyword Operator FROM WHERE ORDER BY LIMIT RETURN RAISE EXCEPTION
syn keyword Operator LOOP IF ELSE WHEN THEN CASE COALESCE END
syn keyword Define LANGUAGE VOLATILE IMMUTABLE CREATE OR REPLACE RETURNS LANGUAGE FUNCTION UNIQUE INHERITS INTO
syn keyword WarningMsg DROP
syn match   postgresqlKeyword "not null"
syn match   postgresqlKeyword "default"
syn match   Operator "->>" "->" "\|\|"
syn match   Comment ";"
syn match   Define "\$\$"
syn keyword postgresqlKeyword table sequence view
syn keyword postgresqlType boolean anyelement anyarray integer text varchar jsonb timestamp uuid
" syn keyword Type _rest _last array_length jsonb_array_elements jsonb_typeof json_build_object

" DML (roughly)
syn keyword postgresqlHeading Sequence
syn keyword postgresqlHeading Table
syn keyword postgresqlHeading Index
syn keyword postgresqlHeading View
syn keyword postgresqlHeading Column Type Modifiers Schema Name Owner Value Definition
syn match   postgresqlHeading "Foreign-key constraints:"
syn match   postgresqlHeading "Indexes:"
syn match   postgresqlHeading "Referenced by:"
syn match   postgresqlHeading "List of relations"
syn match   postgresqlHeading "Triggers:"
syn match   postgresqlTabular " | "
syn match   postgresqlTabular "^[-+]\+$"

" EXPLAIN
syn match   postgresqlHeading "QUERY PLAN"

syn match   postgresqlPlanner "Seq Scan"
syn match   postgresqlPlanner "\v(Hash)?Aggregate"
syn match   postgresqlPlanner "Hash \v(Join|Cond)?"
syn match   postgresqlPlanner "Filter"

syn match   postgresqlKeyword "cost=\@="
syn match   postgresqlKeyword "rows=\@="
syn match   postgresqlKeyword "width=\@="
syn match   postgresqlKeyword "loops=\@="
syn match   postgresqlKeyword "actual time=\@="
syn match   postgresqlResult  "Buckets:"
syn match   postgresqlResult  "Batches:"
syn match   postgresqlResult  "Memory Usage:"
syn match   postgresqlHeading "Output"
syn match   postgresqlKeyword "->"
syn match   postgresqlResult "Total runtime: .* ms" contains=postgresqlNumber

" Postgres chatter.
syn match   postgresqlResult "^(.* rows)$" contains=postgresqlNumber
syn match   postgresqlResult "^Timing is on."
syn match   postgresqlResult "^Time: .* ms" contains=postgresqlNumber
syn match   postgresqlError  "^ERROR:\@="
syn match   postgresqlResult "^LINE \d\+:" contains=postgresqlNumber
syn match   postgresqlError  "\v(^\s+)@<=\^$"

hi link postgresqlResult  Comment
hi link postgresqlTabular Delimiter
hi link postgresqlError   Error
hi link postgresqlHeading Identifier
hi link postgresqlPlanner Identifier
hi link postgresqlType    Identifier
hi link postgresqlBraces  Identifier
hi link postgresqlKeyword Keyword
hi link postgresqlNumber  Number
hi link postgresqlString  String
hi link postgresqlUUID  Number
