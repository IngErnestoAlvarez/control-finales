h1 Materia
p = materia.codigo
p = materia.nombre
p = materia.departamento.nombre
p
  == link_to("Atras", "/materia", class: "btn btn-light btn-sm")
  == link_to("Editar", "/materia/#{materia.id}/edit", class: "btn btn-success btn-sm")
  == link_to("Borrar", "/materia/#{materia.id}?_csrf=#{csrf_token}", "data-method": "delete", "data-confirm": "Are you sure?", class: "btn btn-danger btn-sm")

.row
	.col-sm-11
		h2 Finales
	.col-sm-1
		a.btn.btn-success.btn-sm href="/materia/#{materia.id}/final/new" Agregar
.table-responsive
  table.table.table-striped
    thead
      tr
        th Dia
        th Mes
        th Ano
    tbody
      - materia.finals.each do |final|
        tr
          td = final.dia
          td = final.mes
          td = final.ano
          td
            span
              == link_to("Entrar", "/materia/#{materia.id}/final/#{final.id}", class: "btn btn-info btn-sm")
              == link_to("Editar", "/materia/#{materia.id}/final/#{final.id}/edit", class: "btn btn-success btn-sm")
              == link_to("Borrar", "/materia/#{materia.id}/final/#{final.id}?_csrf=#{csrf_token}", "data-method": "delete", "data-confirm": "Are you sure?", class: "btn btn-danger btn-sm")
