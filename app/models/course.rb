class Course < ActiveRecord::Base
  default_scope :order => 'position'
  has_many :projects
end