class ApplicationController < ActionController::Base
    protect_from_forgery with: :exception
    helper_method :check_subscription_days, :up_to_date_user?

    def check_subscription_days(test_id)
        user = User.find(test_id)
        customer = Stripe::Customer.retrieve(user.stripeid)
        subscription = customer.subscriptions.first

        
        start_day = Time.at(subscription.current_period_start).to_date
        end_day = Time.at(subscription.current_period_end).to_date
        days = (end_day - start_day).to_i
        return days
    end

    def up_to_date_user?(test_id)
        check_subscription_days(test_id) > 0 ? true : false
    end

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
