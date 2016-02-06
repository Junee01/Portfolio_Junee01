class WelcomeController < ApplicationController
	def index
		#최근에 작성된 5개의 글만 보여주도록 제한합니다.
		@posts = Post.all.limit(5).order("created_at desc")
		@projects = Project.all.limit(5).order("created_at desc")
	end
end
