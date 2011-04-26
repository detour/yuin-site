class CategoriesController < ApplicationController
  def show
    @category = Category.find(params[:id])
    @projects = PortfolioProject.all
  end
end