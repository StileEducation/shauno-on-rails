class ReasonsController < ApplicationController
    def index
        @reasons = Reason.all
    end

    def show
        @reason = Reason.find(params["id"])
    end

    def new
        @reason = Reason.new
    end

    def create
        @reason = Reason.new(reasons_params)
        
        begin
            if @reason.save
                redirect_to @reason
            else
                render :new
            end
        rescue ActiveRecord::RecordNotUnique
            @reason.errors.add(:reason, message: "already exists!")
            render :new
        end
    end

    private
    def reasons_params
        params.require(:reason).permit(:reason)
    end
end
