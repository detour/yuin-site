class CreateCourses < ActiveRecord::Migration
  def self.up
    create_table :courses, :force => true do |t|
      t.string :name
      t.string :term
      t.integer :position
      t.timestamps
    end
    
    add_column :projects, :is_portfolio, :boolean, :default => false
    add_column :projects, :course_id, :integer 
    
    Project.transaction do
      for project in Project.all
        project.is_portfolio = true
        project.save
      end
    end
  end

  def self.down
    drop_table :courses
    
    remove_column :projects, :is_portfolio
    remove_column :projects, :course_id
  end
end