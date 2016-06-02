class Tutorial < ActiveRecord::Base
  belongs_to :user
  belongs_to :category
  has_many :steps
end
