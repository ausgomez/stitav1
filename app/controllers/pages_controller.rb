class PagesController < ApplicationController
  def home
    # Check for user to be logged in and not admin but is subscribed
    #if current_user && current_user.subscribed? && !current_user.admin?
    #  if !up_to_date_user?(current_user.id)
    #    redirect_to new_subscriber_path, notice: 'Membership expired!'
    #  end
    #end
  end

  def bug
  end
end
