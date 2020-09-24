class ClientsController < ApplicationController
    def index
        if params[:production_id]
          @posts = Production.find(params[:production_id]).posts
        else
          @posts = Post.all
        end
    end
   
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
            if params[:client][:production_id]
                redirect_to production_path(params[:client][:production_id])
            else
                redirect_to client_path 
            end
        else
            render :edit
        end
    end

    def destroy
        set_client
        @client.delete
        if params[:production_id]
            redirect_to production_path(params[:production_id])
        else
            redirect_to clients_path
        end
    end

    private

    def set_client
        @client = Client.find_by_id(params[:id])
    end

    def client_params
        params.require(:client).permit(:first_name, :last_name, :address, :phone, :email)
    end
end
