class Project < ActiveRecord::Base
  #include ValidatesAsImage
  
  default_scope :order => 'project_date DESC'
  
  has_and_belongs_to_many :categories
  belongs_to :course
  
  has_many :photos, :as => :imageable, :dependent => :destroy
  accepts_nested_attributes_for :photos
  
  #has_attached_file :project_image, 
  #                  :styles => { :thumb => "60x60>",
  #                               :display => "620x620>" }
  #                  
  #validates_attachment_size :project_image, :less_than => 1.megabytes
  #validates_as_image        :project_image
  
  def toggle_published
    self.published ? self.published = false : self.published = true
  end
  
  def category_id
    categories.blank? ? 0 : categories.first.id
  end
  
  def first_category_without_work
    work = Category.find_by_name('Work')
    cates = categories.clone
    cates.delete(work)
    if cates.blank?
      return work
    else
      return cates.first
    end
  end
  
  def suitable_category(category_id)
    if selected_category = Category.find_by_id(category_id)
      return selected_category
    else
      return first_category_without_work
    end
  end
  
  def home_title
    title.split(' ').join("<br>")
  end
end