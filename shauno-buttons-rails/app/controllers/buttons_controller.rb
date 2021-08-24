class ButtonsController < ApplicationController
    def index
        @buttons = Button.all
    end

    def show
        @button = Button.find(params[:id])
        @reason = @button.reason.where(button_reasons: { current: true }).first

        developer_row = ButtonDeveloper.find_by(button_id: params[:id], current: true)
        @developer = @button.developer.where(button_developers: { current: true }).first
    end
end
