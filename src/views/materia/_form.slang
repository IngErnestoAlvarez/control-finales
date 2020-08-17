- if materia.errors
  ul.errors
    - materia.errors.each do |error|
      li = error.to_s

== form(action: "/materia/#{materia.id.to_s}", method: materia.id ? :patch : :post) do
  == csrf_tag
  .form-group
    == text_field(name: "nombre", value: materia.nombre, placeholder: "Nombre", class: "form-control")
  .form-group
    == text_field(name: "codigo", value: materia.codigo, placeholder: "Codigo", class: "form-control")
  .form-group
    select name="departamento_id"
      -Departamento.all.each do |departamento|
        option value="#{departamento.id}" = departamento.nombre
  == submit("Aceptar", class: "btn btn-success btn-sm")
  == link_to("Atras", "/materia", class: "btn btn-light btn-sm")
