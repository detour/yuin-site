class AddAlternativeTitleToProjects < ActiveRecord::Migration
  def self.up
    add_column :projects, :alternative_title, :boolean, :default => false
  end

  def self.down
    remove_column :projects, :alternative_title
  end
end
