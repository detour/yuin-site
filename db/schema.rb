# This file is auto-generated from the current state of the database. Instead of editing this file, 
# please use the migrations feature of Active Record to incrementally modify your database, and
# then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your database schema. If you need
# to create the application database on another system, you should be using db:schema:load, not running
# all the migrations from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20100420044326) do

  create_table "categories", :force => true do |t|
    t.integer "parent_id"
    t.integer "children_count"
    t.integer "ancestors_count"
    t.integer "descendants_count"
    t.boolean "hidden"
    t.string  "name"
    t.string  "short_name"
    t.boolean "published"
    t.integer "position"
  end

  create_table "categories_projects", :id => false, :force => true do |t|
    t.integer "category_id"
    t.integer "project_id"
  end

  create_table "courses", :force => true do |t|
    t.string   "name"
    t.string   "term"
    t.integer  "position"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "pages", :force => true do |t|
    t.string "unique_name"
    t.string "name"
    t.text   "content"
  end

  create_table "photos", :force => true do |t|
    t.integer  "imageable_id"
    t.string   "imageable_type"
    t.string   "name"
    t.text     "description"
    t.string   "data_file_name"
    t.string   "data_content_type"
    t.string   "data_file_size"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "position"
  end

  create_table "projects", :force => true do |t|
    t.string   "title"
    t.text     "sub_text"
    t.text     "description"
    t.text     "chinese_description"
    t.string   "location"
    t.boolean  "published"
    t.string   "video_file_url"
    t.string   "project_image_file_name"
    t.string   "project_image_content_type"
    t.integer  "project_image_file_size"
    t.datetime "project_image_updated_at"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.date     "project_date",               :default => '2011-04-26'
    t.boolean  "alternative_title",          :default => false
    t.boolean  "is_portfolio",               :default => false
    t.integer  "course_id"
  end

# Could not dump table "users" because of following ArgumentError
#   struct size differs

end
