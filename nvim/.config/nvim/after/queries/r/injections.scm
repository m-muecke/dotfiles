; extends

((comment) @injection.content
 (#set! injection.language "comment"))

(call
  function: (identifier) @_name (#any-of? @_name "system" "system2")
  arguments: 
    (arguments 
      ((string) @injection.content
      (#offset! @injection.content 0 1 0 -1)
      (#set! injection.language "bash"))))

(call
  function: (identifier) @_name (#any-of? @_name "db_execute" "db_query" "glue_sql")
  arguments: 
    (arguments 
      ((string) @injection.content
      (#offset! @injection.content 0 1 0 -1)
      (#set! injection.language "sql")
      )))
