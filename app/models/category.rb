class Category < ActiveRecord::Base
  acts_as_category
  
  has_and_belongs_to_many :projects
  
  def public_projects
    projects.find_all {|p| p.published == true }
  end
  
  def other_available_categories
    all = Category.all
    self.descendants.each { |d| all.delete(d) }
    all.delete(self)
    all
  end
  
  def toggle_published
    self.published ? self.published = false : self.published = true
  end
  
  def self.public_roots
    return self.roots.find_all {|c| c.published == true }
  end
end