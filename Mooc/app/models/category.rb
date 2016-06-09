class Category < ActiveRecord::Base
  has_many :categorizations
  has_many :users, through: :categorizations
  has_many :tutorials
end
