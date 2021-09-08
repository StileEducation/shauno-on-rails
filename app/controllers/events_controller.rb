class EventsController < ApplicationController
    def index
        @events = Event.all
    end

    def show
        @event = Event.find(params[:id])
        @button = Button.find(@event.button_id)
        @reason = Reason.find(@event.reason_id)
        @developer = Developer.find(@event.developer_id)
    end

    def new
        @event = Event.new
        
        @buttons = []
        buttons = Button.all
        buttons.each do |button|
            @buttons.push(button.uuid) # [button.uuid, button.id] can be used to put the id in the actual data, could be useful for the button addition form
        end
    end

    def create
        # need to do some magic to figure out the ids
        button = Button.find_by(uuid: params["event"]["uuid"])
        # byebug
        button_id = button.id
        reason_id = button.current_reason.id
        developer_id = button.current_developer.id

        params["event"]["button_id"] = button_id
        params["event"]["reason_id"] = reason_id
        params["event"]["developer_id"] = developer_id

        @event = Event.new(event_params)

        if @event.save
            redirect_to @event
        else
            render :new
        end
    end

    def edit
        update
    end

    def update
        @event = Event.find(params["id"])

        @event.update(to_ignore: true)

        @event.save

        redirect_to events_path
    end

    private
    def event_params
        params.require(:event).permit(:button_id, :timestamp, :reason_id, :developer_id)
    end
end
