class Post < ActiveRecord::Base
  belongs_to :category
  validates_uniqueness_of :key 
end