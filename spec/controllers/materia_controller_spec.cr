require "./spec_helper"

def materia_hash
  {"nombre" => "Fake", "codigo" => "Fake"}
end

def materia_params
  params = [] of String
  params << "nombre=#{materia_hash["nombre"]}"
  params << "codigo=#{materia_hash["codigo"]}"
  params.join("&")
end

def create_materia
  model = Materia.new(materia_hash)
  model.save
  model
end

class MateriaControllerTest < GarnetSpec::Controller::Test
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

describe MateriaControllerTest do
  subject = MateriaControllerTest.new

  it "renders materia index template" do
    Materia.clear
    response = subject.get "/materia"

    response.status_code.should eq(200)
    response.body.should contain("materia")
  end

  it "renders materia show template" do
    Materia.clear
    model = create_materia
    location = "/materia/#{model.id}"

    response = subject.get location

    response.status_code.should eq(200)
    response.body.should contain("Show Materia")
  end

  it "renders materia new template" do
    Materia.clear
    location = "/materia/new"

    response = subject.get location

    response.status_code.should eq(200)
    response.body.should contain("New Materia")
  end

  it "renders materia edit template" do
    Materia.clear
    model = create_materia
    location = "/materia/#{model.id}/edit"

    response = subject.get location

    response.status_code.should eq(200)
    response.body.should contain("Edit Materia")
  end

  it "creates a materia" do
    Materia.clear
    response = subject.post "/materia", body: materia_params

    response.headers["Location"].should eq "/materia"
    response.status_code.should eq(302)
    response.body.should eq "302"
  end

  it "updates a materia" do
    Materia.clear
    model = create_materia
    response = subject.patch "/materia/#{model.id}", body: materia_params

    response.headers["Location"].should eq "/materia"
    response.status_code.should eq(302)
    response.body.should eq "302"
  end

  it "deletes a materia" do
    Materia.clear
    model = create_materia
    response = subject.delete "/materia/#{model.id}"

    response.headers["Location"].should eq "/materia"
    response.status_code.should eq(302)
    response.body.should eq "302"
  end
end
