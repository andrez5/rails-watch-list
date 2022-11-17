class ListsController < ApplicationController

  # GET /lists
  def index
    @lists = List.all
  end

  # GET /lists/new
  def new
    @list = List.new
  end

  # POST /lists
  def create
    @list = List.new(list_params)
    if @list.save
      redirect_to list_path(@list)
    else
      render :new, status: :unprocessable_entity
    end
  end

  # GET /lists/1
  def show
    @list = List.find(params[:id])
  end

  private

  # Only allow a list of trusted parameters through.
  def list_params
    params.require(:list).permit(:name)
  end
end
