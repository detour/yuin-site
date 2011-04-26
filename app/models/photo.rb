class Photo < ActiveRecord::Base
  include ValidatesAsImage
  
  acts_as_list
  default_scope :order => 'position'
  
  belongs_to :imageable, :polymorphic => true
  
  has_attached_file :data, :styles => { :display => "620x620>", 
                                        :thumb => "170x110#" }
  
  validates_attachment_presence :data
  validates_attachment_size :data, :less_than => 2.megabytes
  validates_as_image :data
end