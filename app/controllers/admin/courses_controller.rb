class Admin::CoursesController < ApplicationController
  layout 'admin'
  before_filter :login_required
    
  def index
    @courses = Course.all
  end
  
  def show
    @course = Course.find(params[:id])
  end
  
  def new
    @course = Course.new
    @course.parent_id = params[:parent_id] if params[:parent_id]
  end
  
  def create
    @course = Course.new(params[:course])
    if @course.save
      flash[:notice] = "Successfully created course."
      redirect_to [:admin, @course]
    else
      render :action => 'new'
    end
  end
  
  def edit
    @course = Course.find(params[:id])
  end
  
  def update
    @course = Course.find(params[:id])
    if @course.update_attributes(params[:course])
      flash[:notice] = "Successfully updated course."
      redirect_to [:admin, @course]
    else
      render :action => 'edit'
    end
  end
  
  def destroy
    @course = Course.find(params[:id])
    begin
      if @course.destroy
        flash[:notice] = "Successfully destroyed course."
      else
        flash[:notice] = "Not able to remove the course with subcategories."
      end
    rescue
      flash[:notice] = "Not able to remove the course with subcategories."
    end
    redirect_to admin_categories_url
  end
  
  def sort
    params["courses"].each_with_index do |id, index|
      Course.update_all(['position=?', index+1], ['id=?', id])
    end
    render :nothing => true
  end
  
end
