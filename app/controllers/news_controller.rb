class NewsController < ApplicationController


	before_filter :find_news, only: [ :update, :edit, :destroy, :show ]
	before_filter :check_if_login, only: [:create, :new, :destroy, :update, :edit]
	
	def index
		@newss = News.all
	end

	def show
		@news = News.where(id: params[:id]).first
	end

  	def new
		@news = News.new
	end

	def edit
	end

	def create
		@news = News.create(news_attr)
		redirect_to root_path
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
		params.require(:news).permit(:title, :hedline, :content, :description, :views)		
	end

	def find_news
		@news = News.where(id: params[:id]).first
	end
	
end