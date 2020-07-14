.row
  .col-sm-11
    h2 Materia
  .col-sm-1
    a.btn.btn-success.btn-sm href="/materia/new" New
.table-responsive
  table.table.table-striped
    thead
      tr
        th Codigo
        th Nombre
        th Actions
    tbody
      - materia.each do |materia|
        tr
          td = materia.codigo
          td = materia.nombre
          td
            span
              == link_to("Show", "/materia/#{materia.id}", class: "btn btn-info btn-sm")
              == link_to("Edit", "/materia/#{materia.id}/edit", class: "btn btn-success btn-sm")
              == link_to("Delete", "/materia/#{ materia.id }?_csrf=#{csrf_token}", "data-method": "delete", "data-confirm": "Are you sure?", class: "btn btn-danger btn-sm")
