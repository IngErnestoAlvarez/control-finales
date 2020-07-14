h1 Show Materia
p = materia.codigo
p = materia.nombre
p
  == link_to("Back", "/materia", class: "btn btn-light btn-sm")
  == link_to("Edit", "/materia/#{materia.id}/edit", class: "btn btn-success btn-sm")
  == link_to("Delete", "/materia/#{materia.id}?_csrf=#{csrf_token}", "data-method": "delete", "data-confirm": "Are you sure?", class: "btn btn-danger btn-sm")
