h1 Show Materia
p = materia.codigo
p = materia.nombre
p = materia.departamento.nombre
p
  == link_to("Back", "/materia", class: "btn btn-light btn-sm")
  == link_to("Edit", "/materia/#{materia.id}/edit", class: "btn btn-success btn-sm")
  == link_to("Delete", "/materia/#{materia.id}?_csrf=#{csrf_token}", "data-method": "delete", "data-confirm": "Are you sure?", class: "btn btn-danger btn-sm")

.row
	.col-sm-11
		h2 Finales
	.col-sm-1
		a.btn.btn-success.btn-sm href="/materia/#{materia.id}/final/new" New
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
              == link_to("Show", "/materia/#{materia.id}/final/#{final.id}", class: "btn btn-info btn-sm")
              == link_to("Edit", "/final/#{final.id}/edit", class: "btn btn-success btn-sm")
              == link_to("Delete", "/final/#{ final.id }?_csrf=#{csrf_token}", "data-method": "delete", "data-confirm": "Are you sure?", class: "btn btn-danger btn-sm")