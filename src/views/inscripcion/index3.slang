.row
  .col-sm-11
    h2 Finales
.table-responsive
  table.table.table-striped
    thead
      tr
        th Final
        th acciones
    tbody
      - materia.finals.each do |final|
        tr
          td = "#{final.dia}/#{final.mes}/#{final.ano}"
          td
            span
              == link_to("Inscribirse", "/inscripcions/#{params[:dep_id]}/#{params[:materia_id]}/#{final.id}", class: "btn btn-info btn-sm")

