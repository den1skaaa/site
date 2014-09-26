class NewsController < ApplicationController

	before_filter :find_news, only: [:edit, :update, :destroy, :show]
	before_filter :check_if_admin, only: [:create, :new, :destroy, :update, :edit]
	
	def index
		@newss = News.all
	end

	def show
	end

	def new
		@news = News.new
	end

	def edit
	end

	def create
		@news = News.create(news_attr)
		if @news.errors.empty?
			redirect_to news_path(@news)
		else
			render "edit"
		end
	end

	def destroy
		@news.destroy
		redirect_to action: "index"
	end

	def update
		@news.update_attributes(news_attr)
		if @news.errors.empty?
			redirect_to news_path(@news)
		else
			render "edit"
		end
	end

private
	
	def news_attr
		params.require(:news).permit(:title, :hedline, :content, :description)		
	end

	def find_news
		@news = News.where(id: params[:id]).first
	end

	def check_if_admin
		render_403 unless params[:admin]
	end
end