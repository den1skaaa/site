class UsersController < ApplicationController
	
	before_filter :finde_user, only: [ :update, :edit, :destroy ]
	before_filter :check_if_login, only: [:index, :create, :new, :destroy, :update, :edit, :show]

	def index
		@users = User.all	
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
		current_user.update_attributes(user_attributes)
		render 'persons/profile'
	end

	def destroy
		@user.destroy
		redirect_to action: "index"
	end

private

	def user_attributes
		params.require(:user).permit(:login, :email, :password, :admin, :username, :userinfo, :avatar)	
	end

	def finde_user
		@user = User.where(id: params[:id]).first	
	end


end


