class ClientsController < ApplicationController
    def index
        @clients = Client.all
    end

    def show
        set_client
    end

    def new
        @client = Client.new
    end

    def create
        @client = Client.new(client_params)
        if @client.save
            redirect_to clients_path
        else
            render :new
        end
    end

    def edit
        set_client
    end

    def update
        set_client
        if @client.update(client_params)
            redirect_to client_path 
        else
            render :edit
        end
    end

    def destroy
        set_client
        @client.delete
        redirect_to clients_path
    end

    private

    def set_client
        @client = Client.find_by_id(params[:id])
    end

    def client_params
        params.require(:client).permit(:first_name, :last_name, :address, :phone, :email)
    end
end
