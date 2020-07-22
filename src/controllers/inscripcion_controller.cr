class InscripcionController < ApplicationController
  getter inscripcion = Inscripcion.new

  before_action do
    only [:show, :edit, :update, :destroy] { set_inscripcion }
  end

  def index
    render "index.slang"
  end

  def dep
    departamento = Departamento.find(params[:dep_id])
    render "index2.slang" if departamento
  end

  def mat
    materia = Materia.find(params[:materia_id])
    render "index3.slang" if materia
  end

  def show
    render "show.slang"
  end

  def new
    render "new.slang"
  end

  def edit
    render "edit.slang"
  end

  def create
    inscripcion = Inscripcion.new inscripcion_params.validate!
    if inscripcion.save
      redirect_to action: :index, flash: {"success" => "Inscripcion has been created."}
    else
      flash[:danger] = "Could not create Inscripcion!"
      render "new.slang"
    end
  end

  def update
    inscripcion.set_attributes inscripcion_params.validate!
    if inscripcion.save
      redirect_to action: :index, flash: {"success" => "Inscripcion has been updated."}
    else
      flash[:danger] = "Could not update Inscripcion!"
      render "edit.slang"
    end
  end

  def destroy
    inscripcion.destroy
    redirect_to action: :index, flash: {"success" => "Inscripcion has been deleted."}
  end

  private def inscripcion_params
    params.validation do
    end
  end

  private def set_inscripcion
    @inscripcion = Inscripcion.find! params[:id]
  end
end
