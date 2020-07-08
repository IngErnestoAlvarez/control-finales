class Final < Granite::Base
  connection pg
  table finals

  column id : Int64, primary: true
  column dia : String?
  column mes : String?
  column ano : String?
  timestamps
end
