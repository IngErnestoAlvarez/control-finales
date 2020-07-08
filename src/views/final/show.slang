h1 Show Final
p = final.dia
p = final.mes
p = final.ano
p
  == link_to("Back", "/finals", class: "btn btn-light btn-sm")
  == link_to("Edit", "/finals/#{final.id}/edit", class: "btn btn-success btn-sm")
  == link_to("Delete", "/finals/#{final.id}?_csrf=#{csrf_token}", "data-method": "delete", "data-confirm": "Are you sure?", class: "btn btn-danger btn-sm")
