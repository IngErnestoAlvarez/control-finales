class Materia < Granite::Base
  connection pg
  table materias

  belongs_to departamento : Departamento

  has_many finals : Final

  column id : Int64, primary: true
  column nombre : String?
  column codigo : String?
  timestamps
end
