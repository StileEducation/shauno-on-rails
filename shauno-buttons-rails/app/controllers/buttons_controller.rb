class ButtonsController < ApplicationController
    def index
        @buttons = Button.all
    end

    def show
        @button = Button.find(params[:id])
        @reason = @button.reason.where(button_reasons: { current: true }).first
        @developer = @button.developer.where(button_developers: { current: true }).first
    end

    def new
        @button = Button.new

        reasons = Reason.all
        @reasons = []
        reasons.each do |reason|
            @reasons.push(reason.reason)
        end

        developers = Developer.all
        @developers = []
        developers.each do |developer|
            @developers.push(developer.name)
        end
    end

    def create
        @button = Button.new(button_params)
        
        if @button.save
            # need to set up the associations before redirecting

            new_reason_id = Reason.find_by(reason: params["button"]["reason"]).id
            join1 = ButtonReason.new(button_id: @button.id, reason_id: new_reason_id)
            join1.save

            new_developer_id = Developer.find_by(name: params["button"]["developer"]).id
            join2 = ButtonDeveloper.new(button_id: @button.id, developer_id: new_developer_id)
            join2.save

            redirect_to @button
        else
            render :new
        end
    end

    private
    def button_params
        params.require(:button).permit(:uuid, :is_active)
    end
end
