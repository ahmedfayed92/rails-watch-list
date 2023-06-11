class ListsController < ApplicationController
  before_action :set_list, only: %i[show update edit destroy]

  def index
    @lists = List.all
  end

  def new
    @list = List.new
  end

  def show
    @bookmark = Bookmark.new
  end

  def create
   
    @list = List.new(list_params)
    if @list.save
      redirect_to lists_path, notice: 'you have succesfully created a List Hurrrrrrrrrrrra!!!!!'
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @list
  end

  def update
    if @list.update(list_params)
      redirect_to @list, notice: 'list was successfully updated.'
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @list.destroy
    redirect_to lists_url, notice: 'list was successfully destroyed.'
  end

  private

  def list_params
    params.require(:list).permit(:name)
  end

  def set_list
    @list = List.find(params[:id])
  end
end
