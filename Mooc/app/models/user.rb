class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

   has_many :categorizations
   has_many :categories, through: :categorizations
   
   has_many :students
   has_many :tutorials, through: :students
end
