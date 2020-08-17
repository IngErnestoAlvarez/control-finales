.row
  .col-sm-11
    h2 Materias
.table-responsive
  table.table.table-striped
    thead
      tr
        th Materia
        th Opciones
    tbody
      - departamento.materias.each do |materia|
        tr
          td = materia.nombre
          td
            span
              == link_to("Entrar", "/inscripcions/#{params[:dep_id]}/#{materia.id}", class: "btn btn-info btn-sm")
