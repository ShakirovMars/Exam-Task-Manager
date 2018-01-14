module Api
    module V1
      class ApplicationController < ActionController::Base
        before_action :auth_user
  
        def auth_user
          if params[:token].present? && user.present?
            @current_user = user
          end
        end
  
        private
  
          def user
            User.find_by(token: params[:token])
          end
      end
    end
  end
  