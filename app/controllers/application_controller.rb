class ApplicationController < ActionController::Base
    before_action :find_authorized_user, :require_login

    def find_authorized_user
        @current_user = session[:current_user]
    end

    def require_login
        unless @current_user
            redirect_to "/login"
            return
        end
    end

    def require_admin
        unless @current_user["group"] == "Administration"
            redirect_to "/"
            return
        end
    end

    before_action do
        I18n.locale = cookies[:locale] || I18n.default_locale
      end
end
