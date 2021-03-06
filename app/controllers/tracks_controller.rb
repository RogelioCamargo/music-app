class TracksController < ApplicationController
	before_action :require_user!
	
	def create 
		@track = Track.new(track_params)
		if @track.save
			redirect_to track_url(@track)
		else 
			flash.now[:errors] = @track.errors.full_messages
			render :new, status: :unprocessable_entity
		end
	end 

	def destroy 
		track = Track.find(params[:id])
		track.destroy 
		redirect_to album_url(track.album_id)
	end 

	def edit 
		@track = Track.find(params[:id])
		render :edit
	end
	
	def new 
		@track = Track.new(album_id: params[:album_id])
		render :new
	end

	def update 
		@track = Track.find(params[:id])
		if @track.update(track_params)
			redirect_to track_url(@track)
		else 
			flash.now[:errors] = @track.errors.full_messages
			render :edit, status: :unprocessable_entity
		end
	end 

	def show 
		@track = Track.find(params[:id])
		render :show
	end

	private 

	def track_params
		params.require(:track).permit(:title, :ord, :bonus, :album_id, :lyrics)
	end
end
