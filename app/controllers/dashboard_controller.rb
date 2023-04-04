class DashboardController < ApplicationController
    before_action :authenticate_user!
    def index
    end
    def news
    end
    def project
    end

    def myprofile
        @infor = Info.find_by(user_id: current_user.id)
        if @infor.nil?
            redirect_to editprofile_path   
        end
    end
    def editprofile
        if current_user.info.nil?
            @info  = Info.new
        else
            @info = current_user.info
        end
    end

    def update_profile
        @info = current_user.info 
        if @info
            if @info.update(update_params)
                redirect_to myprofile_path
            end
        else
            @info = Info.create(update_params)
            if @info.save
                redirect_to myprofile_path
            end
        end
    end
    private
    def update_params
        params.require(:info).permit(:fname,:lname,:gender,:age,:address).merge(user_id: current_user.id)
    end

end
