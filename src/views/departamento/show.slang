h1 Show Departamento
p = departamento.nombre
p
  == link_to("Back", "/departamentos", class: "btn btn-light btn-sm")
  == link_to("Edit", "/departamentos/#{departamento.id}/edit", class: "btn btn-success btn-sm")
  == link_to("Delete", "/departamentos/#{departamento.id}?_csrf=#{csrf_token}", "data-method": "delete", "data-confirm": "Are you sure?", class: "btn btn-danger btn-sm")
