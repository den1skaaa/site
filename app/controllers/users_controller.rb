class UsersController < ApplicationController

	before_filter :finde_user, only: [ :update, :edit, :destroy ]

	def index
		@users = User.all	
	end

	def new
		@user = User.new
	end

	def show
		if @user = User.where(id: params[:id]).first
			render "users/show"
		else
			render "public/404", status: 404 
		end
	end

	def edit
	# before_filter
	end

	def update
		@user.update_attributes(user_attributes)
		if @user.errors.empty?
			redirect_to user_path(@user)
		else
			render 'edit'
		end
	end

	def create
		@user = User.create(user_attributes)
		if @user.errors.empty?
			redirect_to user_path(@user)
		else
			render "edit"
		end
	end

	def destroy
		@user.destroy
		redirect_to action: "index"
	end

private

	def user_attributes
		params.require(:user).permit(:login, :email, :password, :password_confirmation)	
	end

	def finde_user
		@user = User.where(id: params[:id]).first
		#render_404 unless @item	
	end

end


