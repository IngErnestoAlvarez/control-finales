class MateriaController < ApplicationController
  getter materia = Materia.new

  before_action do
    only [:show, :edit, :update, :destroy] { set_materia }
  end

  def index
    materia = Materia.all
    render "index.slang"
  end

  def show
    finales = materia.finales
    render "show.slang"
  end

  def new
    render "new.slang"
  end

  def edit
    render "edit.slang"
  end

  def create
    materia = Materia.new materia_params.validate!
    if materia.save
      redirect_to action: :index, flash: {"success" => "Materia has been created."}
    else
      flash[:danger] = "Could not create Materia!"
      render "new.slang"
    end
  end

  def update
    materia.set_attributes materia_params.validate!
    if materia.save
      redirect_to action: :index, flash: {"success" => "Materia has been updated."}
    else
      flash[:danger] = "Could not update Materia!"
      render "edit.slang"
    end
  end

  def destroy
    materia.destroy
    redirect_to action: :index, flash: {"success" => "Materia has been deleted."}
  end

  private def materia_params
    params.validation do
      required :nombre
      required :codigo
      required :departamento_id
    end
  end

  private def set_materia
    @materia = Materia.find! params[:id]
  end
end
