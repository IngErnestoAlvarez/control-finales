h1 Editar perfil

- if user.errors
  ul.errors
  - user.errors.each do |error|
    li = error.to_s

== form(action: "/profile", method: :patch) do
  == csrf_tag
  .form-group
    input.form-control type="email" name="email" placeholder="Email" value="#{user.email}"
  == submit("Actualizar", class: "btn btn-success btn-sm")
  == link_to("Perfil", "/profile", class: "btn btn-light btn-sm")
