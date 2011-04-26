class ProjectsController < ApplicationController
  def index
    @projects = PortfolioProject.all
  end
  
  def show
    @project = Project.find(params[:id])
    @selected_category = @project.suitable_category(session[:selected_category])
    
    if request.xhr?
      render :template => 'projects/ajax_show', :layout => false
    end
  end
end