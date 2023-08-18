class ListsController < ApplicationController

  def index
    @lists = List.all
  end

  def show
    @list = List.find(params[:id])
  end

  def new
    @list = List.new # Needed to instantiate the simple_form
  end

  def create
    @list = List.new(list_params)
    if @list.save # Will raise ActiveModel::ForbiddenAttributesError
      redirect_to list_path(@list)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @list = List.find(params[:id])
  end

  def update
    @list = List.find(params[:id])
    @list.update(list_params) # Will raise ActiveModel::ForbiddenAttributesError
    redirect_to list_path(@list)
  end

  private

  def list_params
    params.require(:list).permit(:name)
  end
end
