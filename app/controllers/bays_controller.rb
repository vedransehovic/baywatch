class BaysController < ApplicationController
    def index 
        @bays = Bay.all 
    end

    def show 
        set_bay
    end

    def new
        @bay = Bay.new
    end

    def create 
        @bay = Bay.new(bay_params)
        if @bay.save
            redirect_to bays_path
        else
            render :new
        end
    end

    def edit
        set_bay
    end

    def update
        set_bay
        if @bay.update(bay_params)
            redirect_to bay_path
        else
            render :edit
        end
    end

    def delete 
        set_bay
        @bay.delete
        redirect_to bays_path
    end

    def reset 
        reset_bay
        redirect_to bay_path(@bay)
    end

    private

    def set_bay
        @bay = Bay.find_by_id(params[:id])
    end

    def bay_params
        params.require(:bay).permit(:bay_number, :date, :active)
    end

    def reset_bay
        set_bay
        @bay.update(date: nil, active: nil)
    end
end
