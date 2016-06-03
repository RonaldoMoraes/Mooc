class Tutorial < ActiveRecord::Base
  belongs_to :user
  
  belongs_to :category

  has_many :steps

  has_many :students
  has_many :users, through: :students

end
