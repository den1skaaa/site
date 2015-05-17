class ComentsController < ApplicationController

	before_filter :authenticate_user!
	before_filter :current_coment, only:[:destroy, :edit, :update]


	def new
		@coment_text = Coments.new
	end


	def create
		@coment_text = Coments.create(coment_attributes)
	end


	def edit

	end


	def destroy
		@coment_text.destroy
	end


	def update
		@coment_text.update_attributes(params [:coment])
	end

private

	def current_coment
		@coment_text = Coments.where(id: params[:id]).first	
	end

	def coment_attributes
		params.require(:coments).permit(:coment, :user_id)
	end
end