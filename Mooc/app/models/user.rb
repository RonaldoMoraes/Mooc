class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :categorizations
  has_many :categories, through: :categorizations
  has_many :tutorials, through: :categories

  has_many :students
  #has_many :tutorials, through: :students

  has_many :likes
  #has_many :tutorials, through: :likes

end
