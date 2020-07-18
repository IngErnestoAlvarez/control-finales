- if final.errors
  ul.errors
    - final.errors.each do |error|
      li = error.to_s

== form(action: "/finals/#{final.id.to_s}", method: final.id ? :patch : :post) do
  == csrf_tag
  .form-group
    == text_field(name: "dia", value: final.dia, placeholder: "Dia", class: "form-control")
  .form-group
    == text_field(name: "mes", value: final.mes, placeholder: "Mes", class: "form-control")
  .form-group
    == text_field(name: "ano", value: final.ano, placeholder: "Ano", class: "form-control")
  .form-group
    select name="materia_id"
      -Materia.all.each do |materia|
        option value="#{materia.id}" = materia.nombre
  == submit("Submit", class: "btn btn-success btn-sm")
  == link_to("Back", "/finals", class: "btn btn-light btn-sm")
