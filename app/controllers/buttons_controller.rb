class ButtonsController < ApplicationController
    def index
        @buttons = Button.all
    end

    def show
        @button = Button.find(params[:id])
        @reason = @button.current_reason
        @developer = @button.current_developer
    end

    def new
        @button = Button.new

        create_instance_variables
    end

    def create
        @button = Button.new(button_params)
        
        begin
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
                create_instance_variables
                render :new
            end
        rescue ActiveRecord::RecordNotUnique
            @button.errors.add(:uuid, message: "already exists!")

            create_instance_variables
            render :new
        end
    end

    def edit
        @button = Button.find(params[:id])
        @reason = @button.current_reason
        @developer = @button.current_developer

        create_instance_variables
    end

    def update
        @button = Button.find(params[:id])
        
        if @button.update(button_params)
            if @button.current_reason.reason != params["button"]["reason"] #if reason thats been given is not the one alr assigned to it
                ButtonReason.where(button_id: @button.id).update(current: false)
            
                new_reason_id = Reason.find_by(reason: params["button"]["reason"]).id
                reason = ButtonReason.new(button_id: @button.id, reason_id: new_reason_id)
                reason.save
            end

            if @button.current_developer.name != params["button"]["developer"]
                ButtonDeveloper.where(button_id: @button.id).update(current: false) 

                new_developer_id = Developer.find_by(name: params["button"]["developer"]).id
                developer = ButtonDeveloper.new(button_id: @button.id, developer_id: new_developer_id)
                developer.save
            end

            redirect_to @button
        else
            create_instance_variables
            @reason = @button.current_reason
            @developer = @button.current_developer

            render :edit
        end
    end

    private
    def button_params
        params.require(:button).permit(:uuid, :is_active)
    end

    def create_instance_variables
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
end
