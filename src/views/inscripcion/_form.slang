- if inscripcion.errors
  ul.errors
    - inscripcion.errors.each do |error|
      li = error.to_s

== form(action: "/inscripcions/#{inscripcion.id.to_s}", method: inscripcion.id ? :patch : :post) do
  == csrf_tag
  == submit("Aceptar", class: "btn btn-success btn-sm")
  == link_to("Atras", "/inscripcions", class: "btn btn-light btn-sm")
