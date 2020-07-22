h1 Show Final
p = final.dia
p = final.mes
p = final.ano
p = final.materia.nombre

p
  == link_to("Back", "/final", class: "btn btn-light btn-sm")
  == link_to("Edit", "/final/#{final.id}/edit", class: "btn btn-success btn-sm")
  == link_to("Delete", "/final/#{final.id}?_csrf=#{csrf_token}", "data-method": "delete", "data-confirm": "Are you sure?", class: "btn btn-danger btn-sm")
