class EventsController < ApplicationController
	def index
		@time = Time.now
		@events = Event.all
		#@events = Event.where("starts_at >= ?", Time.now).order("starts_at")
		#@events = Event.upcoming		
	end

	def show

		@event = Event.find(params[:id])
	end

	def edit
		@event = Event.find(params[:id])
	end

	def update
		@event = Event.find(params[:id])
		if @event.update(event_params)
			flash[:notice] = "Event successfully updated!"
			redirect_to event_path(@event)
		else
			render :edit
		end
	end

	def new
		@event = Event.new
	end

	def create
		
		@event = Event.new(event_params)
		if @event.save
			redirect_to @event
		else
			render :new
		end
	end

	def destroy
		@event = Event.find(params[:id])
		@event.destroy
		redirect_to events_url
	end

	private
		def event_params
			event_params = params.require(:event).permit(:name, :description, :location, :price,:starts_at, :image_file_name, :capacity)
		end

end
