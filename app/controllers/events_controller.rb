class EventsController < ApplicationController
    before_action :set_proof, only: %i[new edit]
    before_action :set_event, only: %i[destroy]

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

    def destroy
        if @event.destroy
            flash[:notice] = "Event successfully destroyed"
            redirect_to events_path
        else
            message_str = "Event can't be destroyed: "
            @event.errors.full_messages.each do |message|
                message_str += message + ". "
            end
            flash[:alert] =  message_str
            redirect_to events_path
        end      
    end

    def edit
        @event = Event.find params[:id]
    end

    def update
        @event = Event.find params[:id]
        if @event.update(event_params)
            flash[:notice] = "Event successfully updated" 
            redirect_to events_path
        else
            flash[:alert] = "Event can't be updated"
            redirect_to edit_event_path(@event)
        end
    end

    def show
        @event = Event.find(params[:id])
    end
    
    private
        def set_proof
            @proof = Proof.all.map {|proof| [proof.description.humanize, proof.abbreviation]}
        end

        def set_event
            @event = Event.find params[:id]
        end

        def event_params
            params.require(:event).permit(:id, :event_proof, :event_date, :event_gender, :event_type, :seed_time, :event_time)
        end


end
