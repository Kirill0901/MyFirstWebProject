# frozen_string_literal: true

# categories_controller
class CategoriesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_category, only: %i[show edit update destroy]

  def index
    @categories = Category.all
  end

  def new
    @category = Category.new
  end

  def show
    @posts = Post.where(category_id: @category.id).order('created_at DESC').paginate(page: params[:page], per_page: 10)
  end

  def edit
    render :edit
  end

  def create
    @category = Category.new(category_params)

    if @category.save
      redirect_to categories_path(locale: I18n.locale)
    else
      render :new
    end
  end

  def update
    if @category.update(category_params)
      redirect_to categories_path(locale: I18n.locale)
    else
      render :edit
    end
  end

  def destroy
    @category.destroy
    redirect_to categories_path(locale: I18n.locale)
  end

  private

  def set_category
    @category = Category.find(params[:id])
  end

  def categories_params
    params.require(:categories).permit(:name)
  end

  def category_params
    params.require(:category).permit(:name)
  end
end
