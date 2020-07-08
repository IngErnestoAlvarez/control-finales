.row
  .col-sm-11
    h2 Finals
  .col-sm-1
    a.btn.btn-success.btn-sm href="/finals/new" New
.table-responsive
  table.table.table-striped
    thead
      tr
        th Dia
        th Mes
        th Ano
        th Actions
    tbody
      - finals.each do |final|
        tr
          td = final.dia
          td = final.mes
          td = final.ano
          td
            span
              == link_to("Show", "/finals/#{final.id}", class: "btn btn-info btn-sm")
              == link_to("Edit", "/finals/#{final.id}/edit", class: "btn btn-success btn-sm")
              == link_to("Delete", "/finals/#{ final.id }?_csrf=#{csrf_token}", "data-method": "delete", "data-confirm": "Are you sure?", class: "btn btn-danger btn-sm")
