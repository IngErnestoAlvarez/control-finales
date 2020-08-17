.row
  .col-sm-11
    h2 Finales
  .col-sm-1
    a.btn.btn-success.btn-sm href="/materia/#{params[:materia_id]}/final/new" Agregar
.table-responsive
  table.table.table-striped
    thead
      tr
        th Dia
        th Mes
        th Ano
        th Materia
        th Opciones
    tbody
      - finals.each do |final|
        tr
          td = final.dia
          td = final.mes
          td = final.ano
          td = final.materia.nombre
          td
            span
              == link_to("Entrar", "/materia/#{params[:materia_id]}/final/#{final.id}", class: "btn btn-info btn-sm")
              == link_to("Editar", "/materia/#{params[:materia_id]}/final/#{final.id}/edit", class: "btn btn-success btn-sm")
              == link_to("Borrar", "/materia/#{params[:materia_id]}/final/#{ final.id }?_csrf=#{csrf_token}", "data-method": "delete", "data-confirm": "Are you sure?", class: "btn btn-danger btn-sm")
