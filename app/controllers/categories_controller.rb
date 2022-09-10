class CategoriesController < ApplicationController
  before_action :set_category

  def show
    @courses = Course.all
    @categories = Category.all
    @should_render_categories = true
  end

  private

  def set_category
    @category = Category.friendly.find(params[:id])
  end
end
