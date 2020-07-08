require "./spec_helper"

def departamento_hash
  {"nombre" => "Fake"}
end

def departamento_params
  params = [] of String
  params << "nombre=#{departamento_hash["nombre"]}"
  params.join("&")
end

def create_departamento
  model = Departamento.new(departamento_hash)
  model.save
  model
end

class DepartamentoControllerTest < GarnetSpec::Controller::Test
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

describe DepartamentoControllerTest do
  subject = DepartamentoControllerTest.new

  it "renders departamento index template" do
    Departamento.clear
    response = subject.get "/departamentos"

    response.status_code.should eq(200)
    response.body.should contain("departamentos")
  end

  it "renders departamento show template" do
    Departamento.clear
    model = create_departamento
    location = "/departamentos/#{model.id}"

    response = subject.get location

    response.status_code.should eq(200)
    response.body.should contain("Show Departamento")
  end

  it "renders departamento new template" do
    Departamento.clear
    location = "/departamentos/new"

    response = subject.get location

    response.status_code.should eq(200)
    response.body.should contain("New Departamento")
  end

  it "renders departamento edit template" do
    Departamento.clear
    model = create_departamento
    location = "/departamentos/#{model.id}/edit"

    response = subject.get location

    response.status_code.should eq(200)
    response.body.should contain("Edit Departamento")
  end

  it "creates a departamento" do
    Departamento.clear
    response = subject.post "/departamentos", body: departamento_params

    response.headers["Location"].should eq "/departamentos"
    response.status_code.should eq(302)
    response.body.should eq "302"
  end

  it "updates a departamento" do
    Departamento.clear
    model = create_departamento
    response = subject.patch "/departamentos/#{model.id}", body: departamento_params

    response.headers["Location"].should eq "/departamentos"
    response.status_code.should eq(302)
    response.body.should eq "302"
  end

  it "deletes a departamento" do
    Departamento.clear
    model = create_departamento
    response = subject.delete "/departamentos/#{model.id}"

    response.headers["Location"].should eq "/departamentos"
    response.status_code.should eq(302)
    response.body.should eq "302"
  end
end
