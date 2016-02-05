class WelcomeController < ApplicationController
	def index
		#최근에 작성된 3개의 글만 보여주도록 제한합니다.
		@posts = Post.all.limit(3).order("created_at desc")
	end
end
