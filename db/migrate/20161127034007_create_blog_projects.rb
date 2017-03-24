class CreateBlogProjects < ActiveRecord::Migration
  def change
    create_table :blog_projects do |t|
      t.string   "name"
      t.text     "description"
      t.boolean  "published"
      t.datetime "created_at",  null: false
      t.datetime "updated_at",  null: false
      t.string   "url"
    end
  end
end
