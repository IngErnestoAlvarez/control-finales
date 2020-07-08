class Departamento < Granite::Base
  connection pg
  table departamentos

  column id : Int64, primary: true
  column nombre : String?
  timestamps
end
