class ButtonsController < ApplicationController
    def index
        @buttons = Button.all
    end

    def show
        @button = Button.find(params[:id])
    end
end
