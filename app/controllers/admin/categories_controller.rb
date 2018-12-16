class Admin::CategoriesController < ApplicationController
  before_action :authenticate_admin
  before_action :set_category, only: [:update, :destroy]
  def index
    @categories = Category.all
    if params[:id]
      set_category
    else
      @category = Category.new
    end
  end

  def create
    @category = Category.new(category_params)
    if @category.save
      flash[:notice] = "category was successfully created."
      redirect_to admin_categories_path
    else
      @categories = Category.all
      render :index
    end
  end

  def update
    if @category.update(category_params)
      flash[:notice] = "category was successfully updated."
      redirect_to admin_categories_path
    else
      @categories = Category.all
      render :index
    end
  end

  def destroy
    @category.destroy
    flash[:alert] = "category and restaurants belong to it were successfully deleted"
    redirect_to admin_categories_path
  end

  private

  def set_category
    @category = Category.find(params[:id])
  end

  def category_params
    params.require(:category).permit(:name)
  end
end
