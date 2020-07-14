class DepartamentoController < ApplicationController
  getter departamento = Departamento.new

  before_action do
    only [:show, :edit, :update, :destroy] { set_departamento }
  end

  def index
    departamentos = Departamento.all
    render "index.slang"
  end

  def show
    materias = departamento.materias
    render "show.slang"
  end

  def new
    render "new.slang"
  end

  def edit
    render "edit.slang"
  end

  def create
    departamento = Departamento.new departamento_params.validate!
    if departamento.save
      redirect_to action: :index, flash: {"success" => "Departamento has been created."}
    else
      flash[:danger] = "Could not create Departamento!"
      render "new.slang"
    end
  end

  def update
    departamento.set_attributes departamento_params.validate!
    if departamento.save
      redirect_to action: :index, flash: {"success" => "Departamento has been updated."}
    else
      flash[:danger] = "Could not update Departamento!"
      render "edit.slang"
    end
  end

  def destroy
    departamento.destroy
    redirect_to action: :index, flash: {"success" => "Departamento has been deleted."}
  end

  private def departamento_params
    params.validation do
      required :nombre
    end
  end

  private def set_departamento
    @departamento = Departamento.find! params[:id]
  end
end
