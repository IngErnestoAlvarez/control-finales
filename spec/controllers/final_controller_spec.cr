require "./spec_helper"

def final_hash
  {"dia" => "Fake", "mes" => "Fake", "ano" => "Fake"}
end

def final_params
  params = [] of String
  params << "dia=#{final_hash["dia"]}"
  params << "mes=#{final_hash["mes"]}"
  params << "ano=#{final_hash["ano"]}"
  params.join("&")
end

def create_final
  model = Final.new(final_hash)
  model.save
  model
end

class FinalControllerTest < GarnetSpec::Controller::Test
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

describe FinalControllerTest do
  subject = FinalControllerTest.new

  it "renders final index template" do
    Final.clear
    response = subject.get "/finals"

    response.status_code.should eq(200)
    response.body.should contain("finals")
  end

  it "renders final show template" do
    Final.clear
    model = create_final
    location = "/finals/#{model.id}"

    response = subject.get location

    response.status_code.should eq(200)
    response.body.should contain("Show Final")
  end

  it "renders final new template" do
    Final.clear
    location = "/finals/new"

    response = subject.get location

    response.status_code.should eq(200)
    response.body.should contain("New Final")
  end

  it "renders final edit template" do
    Final.clear
    model = create_final
    location = "/finals/#{model.id}/edit"

    response = subject.get location

    response.status_code.should eq(200)
    response.body.should contain("Edit Final")
  end

  it "creates a final" do
    Final.clear
    response = subject.post "/finals", body: final_params

    response.headers["Location"].should eq "/finals"
    response.status_code.should eq(302)
    response.body.should eq "302"
  end

  it "updates a final" do
    Final.clear
    model = create_final
    response = subject.patch "/finals/#{model.id}", body: final_params

    response.headers["Location"].should eq "/finals"
    response.status_code.should eq(302)
    response.body.should eq "302"
  end

  it "deletes a final" do
    Final.clear
    model = create_final
    response = subject.delete "/finals/#{model.id}"

    response.headers["Location"].should eq "/finals"
    response.status_code.should eq(302)
    response.body.should eq "302"
  end
end
