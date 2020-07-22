class Inscripcion < Granite::Base
  connection pg
  table inscripcions

  belongs_to user : User
  belongs_to final : Final
  column id : Int64, primary: true
  timestamps
end
