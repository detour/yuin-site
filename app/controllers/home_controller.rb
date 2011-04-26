class HomeController < ApplicationController
  def index
    @projects = PortfolioProject.all
  end
  
  def resume
    @page = Page.resume
  end
  
  def contact
    @page = Page.contact
  end
  
  def save_selected_category
    session[:selected_category] = params['selected_category']
    render :text => 'ok'
  end
end