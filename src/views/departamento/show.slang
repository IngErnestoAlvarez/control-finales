h1 = departamento.nombre
p
  == link_to("Borrar departamento", "/departamentos/#{departamento.id}?_csrf=#{csrf_token}", "data-method": "delete", "data-confirm": "Are you sure?", class: "btn btn-danger btn-sm")
  == link_to("Nueva materia", "/materia/new", class: "btn btn-success btn-sm")
.table-responsive
  table.table.table-striped
    thead
      tr
        th Codigo
        th Nombre
        th Opciones
    tbody
      - materias.each do |materia|
        tr
          td = materia.codigo
          td = materia.nombre
          td
            span
              == link_to("Entrar", "/materia/#{materia.id}", class: "btn btn-info btn-sm")
              == link_to("Editar", "/materia/#{materia.id}/edit", class: "btn btn-success btn-sm")
              == link_to("Borrar", "/materia/#{ materia.id }?_csrf=#{csrf_token}", "data-method": "delete", "data-confirm": "Are you sure?", class: "btn btn-danger btn-sm")
