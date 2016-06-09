class HomeController < ApplicationController
	before_action :authenticate_user!
	
	def index
	end
	
	def shuffle_tutorial
		tutorials_ids = Tutorial.all.map(&:id)
		@tutorial = Tutorial.find(tutorials_ids.sample)
		#puts @tutorial
	end

	def about
	end

end
