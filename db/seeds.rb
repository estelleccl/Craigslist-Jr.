require_relative '../app/models/category'
require_relative '../app/models/post'

class CategoryImporter
  def self.import
    categories_list = ["job offered", "gig offered", "resume / job wanted", "housing offered", "housing wanted"]
    
    categories_list.each do |name|
      Category.create(category: name)
    end
  end
end

class PostImporter
  def self.import
    20.times do |x|
      Post.create(
        title: Faker::Lorem.sentence,
        description: Faker::Lorem.paragraph, 
        location: Faker::Address.street_name,
        postcode: Faker::Address.postcode,
        poster_name: Faker::Name.name,
        img_link: Faker::Internet.url,
        category_id: rand(1..Category.count),
        key: create_key
        )
    end
  end
end

def create_key(len=4)
  SecureRandom.hex(len)
end

CategoryImporter.import
PostImporter.import