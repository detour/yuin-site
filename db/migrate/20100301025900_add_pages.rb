class AddPages < ActiveRecord::Migration
  def self.up
    create_table :pages do |t|
      t.string :unique_name
      t.string :name
      t.text :content
    end
    
    add_column :projects, :project_date, :date, :default => Date.today
  end

  def self.down
    drop_table :pages
    
    remove_column :projects, :project_date
  end
end
