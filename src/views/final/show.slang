h1 Final
p = final.dia
p = final.mes
p = final.ano
p = final.materia.nombre

p
  == link_to("Atras", "/materia/#{params[:materia_id]}", class: "btn btn-light btn-sm")
  == link_to("Editar", "/materia/#{params[:materia_id]}/final/#{final.id}/edit", class: "btn btn-success btn-sm")
  == link_to("Borrar", "/materia/#{params[:materia_id]}/final/#{final.id}?_csrf=#{csrf_token}", "data-method": "delete", "data-confirm": "Are you sure?", class: "btn btn-danger btn-sm")
