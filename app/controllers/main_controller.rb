class MainController < ApplicationController
    skip_before_action :require_login
    
    def index
        if @current_user = session[:current_user]
            if @current_user["group"] != "Administration"
                @timetable = Timetable.find_by(group: @current_user["group"])
                if @timetable.present?
                    @timetable
                end
            end
        end
    end
end
