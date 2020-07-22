require "./spec_helper"

def inscripcion_hash
  {} of String => String
end

def inscripcion_params
  params = [] of String
  params.join("&")
end

def create_inscripcion
  model = Inscripcion.new(inscripcion_hash)
  model.save
  model
end

class InscripcionControllerTest < GarnetSpec::Controller::Test
  getter handler : Amber::Pipe::Pipeline

  def initialize
    @handler = Amber::Pipe::Pipeline.new
    @handler.build :web do
      plug Amber::Pipe::Error.new
      plug Amber::Pipe::Session.new
      plug Amber::Pipe::Flash.new
    end
    @handler.prepare_pipelines
  end
end

describe InscripcionControllerTest do
  subject = InscripcionControllerTest.new

  it "renders inscripcion index template" do
    Inscripcion.clear
    response = subject.get "/inscripcions"

    response.status_code.should eq(200)
    response.body.should contain("inscripcions")
  end

  it "renders inscripcion show template" do
    Inscripcion.clear
    model = create_inscripcion
    location = "/inscripcions/#{model.id}"

    response = subject.get location

    response.status_code.should eq(200)
    response.body.should contain("Show Inscripcion")
  end

  it "renders inscripcion new template" do
    Inscripcion.clear
    location = "/inscripcions/new"

    response = subject.get location

    response.status_code.should eq(200)
    response.body.should contain("New Inscripcion")
  end

  it "renders inscripcion edit template" do
    Inscripcion.clear
    model = create_inscripcion
    location = "/inscripcions/#{model.id}/edit"

    response = subject.get location

    response.status_code.should eq(200)
    response.body.should contain("Edit Inscripcion")
  end

  it "creates a inscripcion" do
    Inscripcion.clear
    response = subject.post "/inscripcions", body: inscripcion_params

    response.headers["Location"].should eq "/inscripcions"
    response.status_code.should eq(302)
    response.body.should eq "302"
  end

  it "updates a inscripcion" do
    Inscripcion.clear
    model = create_inscripcion
    response = subject.patch "/inscripcions/#{model.id}", body: inscripcion_params

    response.headers["Location"].should eq "/inscripcions"
    response.status_code.should eq(302)
    response.body.should eq "302"
  end

  it "deletes a inscripcion" do
    Inscripcion.clear
    model = create_inscripcion
    response = subject.delete "/inscripcions/#{model.id}"

    response.headers["Location"].should eq "/inscripcions"
    response.status_code.should eq(302)
    response.body.should eq "302"
  end
end
