module CoursesHelper
  def render_course_html(course)
    render :partial => 'admin/courses/course', :locals => { :course => course }
  end
end