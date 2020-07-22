class Final < Granite::Base
  connection pg
  table finals

  belongs_to materia : Materia

  has_many inscripcions : Inscripcion

  column id : Int64, primary: true
  column dia : String?
  column mes : String?
  column ano : String?
  timestamps
end
