class ProductionsController < ApplicationController
    def index
        @productions = Production.all
    end

    def show
        set_production
    end

    def new
        @production = Production.new
    end

    def create
        @production = Production.new(production_params)
        if @production.save
            redirect_to productions_path
        else
            render :new
        end
    end

    def edit 
        set_production
    end

    def update
        set_production
        if @production.update(production_params)
            redirect_to production_path
        else
            render :edit
        end
    end

    def delete
        set_production
        if @production.delete
            redirect_to productions_path
        else
            @error = "production could not be deleted!"
        end
    end

    private

    def set_production
        @production = Production.find_by_id(params[:id])
    end

    def production_params
        params.require(:production).permit(:name, :address, :phone)
    end
end
