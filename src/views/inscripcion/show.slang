h1 Show Inscripcion
p
  == link_to("Back", "/inscripcions", class: "btn btn-light btn-sm")
  == link_to("Edit", "/inscripcions/#{inscripcion.id}/edit", class: "btn btn-success btn-sm")
  == link_to("Delete", "/inscripcions/#{inscripcion.id}?_csrf=#{csrf_token}", "data-method": "delete", "data-confirm": "Are you sure?", class: "btn btn-danger btn-sm")
