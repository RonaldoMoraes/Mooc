class Tutorial < ActiveRecord::Base
  belongs_to :user
  
  belongs_to :category

  has_many :steps

  has_many :students
  has_many :followers, through: :students, source: :user


  has_many :likes
  has_many :groupies, through: :likes, source: :user

	def self.search(search)
	  where("title LIKE ?", "%#{search}%") 
	  where("description  LIKE ?", "%#{search}%")
	end

end
