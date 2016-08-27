class CreateBlogArticles < ActiveRecord::Migration
  def change
    create_table :blog_articles do |t|
      t.string   "title"
      t.text     "body"
      t.datetime "created_at", null: false
      t.datetime "updated_at", null: false
      t.boolean  "published"
    end
  end
end
