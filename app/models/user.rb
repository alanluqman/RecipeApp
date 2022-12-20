class User < ApplicationRecord
  has_many :foods, class_name: 'Food', foreign_key: 'author_id'
  has_many :recipes, class_name: 'Recipe', foreign_key: 'author_id'
end
