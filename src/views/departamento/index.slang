.row
  .col-sm-11
    h2 Departamentos
  .col-sm-1
    a.btn.btn-success.btn-sm href="/departamentos/new" New
.table-responsive
  table.table.table-striped
    thead
      tr
        th Nombre
        th Actions
    tbody
      - departamentos.each do |departamento|
        tr
          td = departamento.nombre
          td
            span
              == link_to("Show", "/departamentos/#{departamento.id}", class: "btn btn-info btn-sm")
              == link_to("Edit", "/departamentos/#{departamento.id}/edit", class: "btn btn-success btn-sm")
              == link_to("Delete", "/departamentos/#{ departamento.id }?_csrf=#{csrf_token}", "data-method": "delete", "data-confirm": "Are you sure?", class: "btn btn-danger btn-sm")
