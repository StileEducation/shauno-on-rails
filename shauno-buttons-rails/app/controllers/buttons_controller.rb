class ButtonsController < ApplicationController
    def index
        @buttons = Button.all
    end

    def show
        @button = Button.find(params[:id])
        reason_row = ButtonReason.find_by(button_id: params[:id], current: true)
        @reason = Reason.find(reason_row["reason_id"])

        developer_row = ButtonDeveloper.find_by(button_id: params[:id], current: true)
        @developer = Developer.find(developer_row["developer_id"])
    end
end
