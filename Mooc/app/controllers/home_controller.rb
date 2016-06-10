class HomeController < ApplicationController
	before_action :authenticate_user!
	
	def index
	end

	def shuffle_tutorial
		@tutorial = Tutorial.all.sample
	end

	def about
	end

end
