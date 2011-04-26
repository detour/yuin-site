class Mdp::CoursesController < ApplicationController
  layout 'mdp'
  
  def index
    @courses = Course.all
  end
end