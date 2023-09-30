((comment) @injection.content
 (#set! injection.language "bash"))

(call
  function: (identifier) @_name (#any-of? @_name "system" "system2")
  arguments: 
    (arguments 
      ((string) @injection.content
      (#set! injection.language "bash"))))

(call
  function: (identifier) @_name (#any-of? @_name "db_execute" "db_query")
  arguments: 
    (arguments 
      ((string) @injection.content
      (#set! injection.language "sql"))))
