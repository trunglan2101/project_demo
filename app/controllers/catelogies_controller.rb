class CatelogiesController < ApplicationController
  PER_PAGE = 2
  def index
    @page = params[:page].to_i
    @paginate = (@page - 1)*PER_PAGE
    @catelogies = Catelogy.paginate(page: params[:page], per_page: PER_PAGE)
  end

  def show
    @catelogy = Catelogy.find(params[:id])
  end

  def new
    @catelogy = Catelogy.new
  end

  def create
    @catelogy = Catelogy.new(catelogy_params)
    if @catelogy.save
      redirect_to catelogies_index_path
    else
      render "new"
    end
  end

  def edit
    @catelogy = Catelogy.find(params[:id])
  end

  def update
    @catelogy = Catelogy.find(params[:id])
    if @catelogy.update(catelogy_params)
      redirect_to catelofies_index_path
    else
      render "edit"
    end
  end

  def destroy
    @catelogy = Catelogy.find(params[:id])
    @catelogy.destroy
    redirect_to catelogies_index_path
  end

  private
  def catelogy_params
    params.require(:catelogy).permit(:name, :description)
  end
end
