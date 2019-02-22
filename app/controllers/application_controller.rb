class ApplicationController < ActionController::Base
    private
        # Check if user is admin
        def is_admin?
            # if not admin then redirect to where ever you want 
            redirect_to root_path, notice: 'You are not admin :(' unless current_user.admin? 
        end

        def custom_link(text, href)
            "<a href='#{href}'>#{text}</a>".html_safe
        end

        def user_subscribed
            redirect_to new_subscriber_path, notice: 'You must pay first' unless current_user.admin? || current_user.subscribed? 
        end
end
