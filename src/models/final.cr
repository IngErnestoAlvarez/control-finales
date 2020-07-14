class Final < Granite::Base
  connection pg
  table finals

  belongs_to materia : Materia

  column id : Int64, primary: true
  column dia : String?
  column mes : String?
  column ano : String?
  timestamps
end
