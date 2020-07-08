class Materia < Granite::Base
  connection pg
  table materia

  column id : Int64, primary: true
  column nombre : String?
  column codigo : String?
  timestamps
end
