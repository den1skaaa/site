class NewsController < ApplicationController

	before_filter :find_news, only: [:edit, :update, :destroy]

	def index
		@newss = News.all
	end

	def show
		if @news = News.where(id: params[:id]).first
			render "news/show"
		else
			render "public/404", status: 404 
		end
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
end