class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  before_action :configure_permitted_parameters, if: :devise_controller?

  def configure_permitted_parameters
    # For additional fields in app/views/devise/registrations/new.html.erb
    devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name, :last_name, :photo, :date_of_birth, :bio,
                                                        :motivation, :facebook_link, :twitter_link,
                                                        :instagram_link, :linkedin_link,
                                                        address_attributes: [:address_line_1, :address_line_2, :city, :postcode]])

    # For additional in app/views/devise/registrations/edit.html.erb
    devise_parameter_sanitizer.permit(:account_update, keys: [:first_name, :last_name, :photo, :date_of_birth, :address, :bio,
                                                        :motivation, :facebook_link, :twitter_link,
                                                        :instagram_link, :linkedin_link])
  end
end
