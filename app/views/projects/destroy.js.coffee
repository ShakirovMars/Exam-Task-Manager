$("a.delete").on( "ajax:success", (event) -> 
    $("[data-project-id=<%= @project.id %>]").remove()
    ).on "ajax:error", (event) ->
       alert("Error!")