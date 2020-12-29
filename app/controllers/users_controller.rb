class UsersController < ApplicationController
    skip_before_action :require_login

    def login
        render :layout => "base-info.html.erb"
    end

    def register
        render :layout => "base-info.html.erb"
    end

    def auth
        username = params[:username]
        password = Digest::SHA1.hexdigest params[:password]

        if session[:current_user] = User.find_by(username: username, password: password)
            redirect_to "/"
        else
            @error = t:user_not_found_err
            render :login, :layout => "base-info.html.erb"
        end
    end

    def create
        username = params[:username]
        password = params[:password]
        group = params[:group]
        confirm_password = params[:confirm_password]

        unless password == confirm_password
            @error = t:user_password_not_matches_err
            render :register, :layout => "base-info.html.erb"
            return
        end

        if session[:current_user] = User.find_by(username: username)
            @error = t:user_exists_err
            render :register, :layout => "base-info.html.erb"
            return
        end

        if group == "Administration"
            @error = t:user_trying_admin_err
            render :register, :layout => "base-info.html.erb"
            return
        end

        password = Digest::SHA1.hexdigest password
        user = User.new(username: username, password: password, group: group)
        unless user.save
            @error = t:user_not_saved_err
            render :register, :layout => "base-info.html.erb"
            return
        end
        session[:current_user] = user
        redirect_to "/"
    end

    def logout
        session[:current_user] = nil
        redirect_to "/"
    end

    def set_locale
        locale = params[:locale] || I18n.default_locale
        cookies[:locale] = locale.to_s
        redirect_to "/"
    end
end
