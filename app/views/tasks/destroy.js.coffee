$("a.delete").on( "ajax:success", (event) -> 
    $("[data-task-id=<%= @task.id %>]").remove()
    ).on "ajax:error", (event) ->
       alert("Error!")