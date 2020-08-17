h1 Ver inscripcion
p
  == link_to("Atras", "/inscripcions", class: "btn btn-light btn-sm")
  == link_to("Editar", "/inscripcions/#{inscripcion.id}/edit", class: "btn btn-success btn-sm")
  == link_to("Borrar", "/inscripcions/#{inscripcion.id}?_csrf=#{csrf_token}", "data-method": "delete", "data-confirm": "Are you sure?", class: "btn btn-danger btn-sm")
