class Departamento < Granite::Base
  connection pg
  table departamentos

  has_many materias : Materia

  column id : Int64, primary: true
  column nombre : String?
  timestamps
end
