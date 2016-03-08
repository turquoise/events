class RegistrationsController < ApplicationController
	before_action :require_signin 
	before_action :set_event

	def index
		#@event = Event.find(params[:event_id])
		#@registrations = Registration.all
		@registrations = @event.registrations
	end

	def new
		#@event = Event.find(params[:event_id])
		@registration = @event.registrations.new
	end

	def create
		#@event = Event.find(params[:event_id])
		@registration = @event.registrations.new(registration_params)
		@registration.user = current_user
		if @registration.save
			redirect_to event_registrations_path(@event), notice: "Thanks, you're registered!"
		else
			render :new
		end
	end

	private

	def registration_params
		params.require(:registration).permit(:how_heard)
	end

	def set_event
		@event = Event.find_by!(slug: params[:event_id])
	end

end
