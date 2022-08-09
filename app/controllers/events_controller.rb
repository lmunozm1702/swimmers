class EventsController < ApplicationController
    before_action :set_proof, only: %i[new edit]

    def index
        @events =  Event.all.order(:event_date)
    end

    def new 
        @event = Event.new
    end

    def create
        @event = Event.new(event_params) 

        if @event.save
            flash[:notice] = "Event successfully created"
            redirect_to events_path
        else
            message_str = "Event can't be created: "
            @event.errors.full_messages.each do |message|
                message_str += message + ". "
            end
            flash[:alert] =  message_str
            redirect_to new_event_path(@event)
        end      
    end



    private
        def set_proof
            @proof = Proof.all.map {|proof| [proof.description.humanize, proof.abbreviation]}
        end

        def event_params
            params.require(:event).permit(:id, :event_proof, :event_date, :event_gender, :event_type, :seed_time, :event_time)
        end


end
