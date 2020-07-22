.row
  .col-sm-11
    h2 Departamentos
.table-responsive
  table.table.table-striped
    thead
      tr
        th Departamento
        th acciones
    tbody
      - Departamento.all.each do |depar|
        tr
          td = depar.nombre
          td
            span
              == link_to("Entrar", "/inscripcions/#{depar.id}", class: "btn btn-info btn-sm")
