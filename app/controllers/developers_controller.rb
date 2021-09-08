class DevelopersController < ApplicationController
    def index
        @developers = Developer.all
    end

    def show
        @developer = Developer.find(params["id"])
    end

    def new
        @developer = Developer.new
    end

    def create
        @developer = Developer.new(developers_params)
        if @developer.save
            redirect_to @developer
        else
            render :new
        end
    end

    private
    def developers_params
        params.require(:developer).permit(:name)
    end
end
