class FinalController < ApplicationController
  getter final = Final.new

  before_action do
    only [:show, :edit, :update, :destroy] { set_final }
  end

  def index
    finals = Final.all
    render "index.slang"
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
    final = Final.new final_params.validate!
    if final.save
      redirect_to action: :index, flash: {"success" => "Final has been created."}
    else
      flash[:danger] = "Could not create Final!"
      render "new.slang"
    end
  end

  def update
    final.set_attributes final_params.validate!
    if final.save
      redirect_to action: :index, flash: {"success" => "Final has been updated."}
    else
      flash[:danger] = "Could not update Final!"
      render "edit.slang"
    end
  end

  def destroy
    final.destroy
    redirect_to action: :index, flash: {"success" => "Final has been deleted."}
  end

  private def final_params
    params.validation do
      required :dia
      required :mes
      required :ano
    end
  end

  private def set_final
    @final = Final.find! params[:id]
  end
end
