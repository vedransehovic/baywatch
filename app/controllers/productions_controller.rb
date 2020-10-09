class ProductionsController < ApplicationController

    def index
        if params[:query]
            @productions = Production.search(params[:query])
        else
            @productions = Production.all
        end
    end

    def show
        set_production
    end

    def new
        @production = Production.new
        @production.clients.new
    end

    def create
        @production = Production.new(production_params)
        if @production.save
            redirect_to productions_path
        else
            @errors = @production.errors.full_messages
            render :new
        end
    end

    def edit 
        set_production
        @clients = @production.clients
    end

    def update
        set_production
        if @production.update(production_params)
            redirect_to production_path
        else
            @errors = @production.errors.full_messages
            render :edit
        end
    end

    def destroy
        set_production
        if @production.destroy
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
        params.require(:production).permit(:name, :address, :phone, clients_attributes: [:first_name, :last_name, :address, :phone, :email ])
    end

end
