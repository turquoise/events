class EventsController < ApplicationController
	before_action :require_signin, except: [:index, :show] 
	before_action :require_admin, except: [:index, :show]
	before_action :set_event, only: [:show, :edit, :update, :destroy]


	def index
		case params[:scope]
		when "past"
			@events = Event.past
		when "free"
			@events = Event.free
		when "recent"
			@events = Event.recent
		else
			@time = Time.now
			@events = Event.all
		end
		#@events = Event.where("starts_at >= ?", Time.now).order("starts_at")
		#@events = Event.upcoming		
	end

	def show
		#@event = Event.find_by!(slug: params[:id])
		@likers = @event.likers
		@categories = @event.categories
		if current_user
			@current_like = current_user.likes.find_by(event_id: @event.id )
		end
	end

	def edit
		#@event = Event.find_by!(slug: params[:id])
	end

	def update
    	#@event = Event.find_by!(slug: params[:id])
    	if @event.update(event_params)
      		redirect_to @event, notice: "Event successfully updated!"
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
			redirect_to @event, notice: "Event successfully created!"
		else
			render :new
		end
	end

	def destroy
		#@event = Event.find_by!(slug: params[:id])
		@event.destroy
		redirect_to events_url, alert: "Event successfully deleted!"
	end

	private

		def set_event
			@event = Event.find_by!(slug: params[:id])
		end
		

		def event_params
			event_params = params.require(:event).permit(:name, :description, :location, :price,:starts_at, :image_file_name, :capacity, category_ids: [])
		end

end
