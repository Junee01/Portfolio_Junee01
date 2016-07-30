class PostsController < ApplicationController
	before_action :find_post, only: [:show, :edit, :update, :destroy]
	#index, show 페이지는 볼 수 있다.
	before_action :authenticate_user!, except: [:index, :show]

	def index
		#현재 두페이지만 하려면 per_page: 2 로 설정하면 된다.
		@posts = Post.all.order("created_at desc").paginate(page: params[:page], per_page: 4)
	end

	def new
		@post = Post.new
	end

	def create
		@post = Post.new post_params

		if @post.save
			redirect_to @post, notice: "정상적으로 저장되었습니다."
		else
			render 'new', notice: "비정상 저장 오류입니다."
		end
	end

	def show

	end

	def edit
	end

	def update
		if @post.update post_params
			redirect_to @post, notice: "정상적으로 저장되었습니다."
		else
			render 'edit'
		end
	end

	def destroy
		@post.destroy
		redirect_to posts_path
	end

	private

	def post_params
		params.require(:post).permit(:title, :content, :slug, :image)
	end

	def find_post
		@post = Post.friendly.find(params[:id])
	end
end
