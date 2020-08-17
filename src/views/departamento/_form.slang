- if departamento.errors
  ul.errors
    - departamento.errors.each do |error|
      li = error.to_s

== form(action: "/departamentos/#{departamento.id.to_s}", method: departamento.id ? :patch : :post) do
  == csrf_tag
  .form-group
    == text_field(name: "nombre", value: departamento.nombre, placeholder: "Nombre", class: "form-control")
  == submit("Aceptar", class: "btn btn-success btn-sm")
  == link_to("Atras", "/departamentos", class: "btn btn-light btn-sm")
