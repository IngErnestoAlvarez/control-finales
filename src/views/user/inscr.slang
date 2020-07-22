.row
  .col-sm-11
    h2 Mis inscripciones
.table-responsive
  table.table.table-striped
    thead
      tr
        th fecha
        th Actions
    tbody
      - user.inscripcions.each do |insc|
        - final = insc.final
        tr
          td = "#{final.dia}/#{final.mes}/#{final.ano}"
