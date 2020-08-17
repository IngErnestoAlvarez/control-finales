- if final.errors
  ul.errors
    - final.errors.each do |error|
      li = error.to_s

== form(action: "/materia/#{params[:materia_id]}/final/#{final.id}", method: final.id ? :patch : :post) do
  == csrf_tag
  .form-group
    == text_field(name: "dia", value: final.dia, placeholder: "Dia", class: "form-control")
  .form-group
    == text_field(name: "mes", value: final.mes, placeholder: "Mes", class: "form-control")
  .form-group
    == text_field(name: "ano", value: final.ano, placeholder: "Ano", class: "form-control")
  == submit("Aceptar", class: "btn btn-success btn-sm")
  == link_to("Atras", "/materia/#{params[:materia_id]}", class: "btn btn-light btn-sm")
