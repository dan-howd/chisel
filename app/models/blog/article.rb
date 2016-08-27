module Blog
  class Article < ActiveRecord::Base
    validates :title, presence: true, uniqueness: true
  end
end
