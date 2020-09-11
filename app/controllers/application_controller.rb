class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  before_action :configure_permitted_parameters, if: :devise_controller?

  def configure_permitted_parameters
    # For additional fields in app/views/devise/registrations/new.html.erb
    devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name, :last_name, :photo, :date_of_birth, :bio,
                                                        :motivation, :facebook_link, :twitter_link,
                                                        :instagram_link, :linkedin_link,
                                                        address_attributes: [:address_line_1, :address_line_2, :city, :postcode],
                                                        skill_attributes: [:name, :category]])

    # For additional in app/views/devise/registrations/edit.html.erb
    devise_parameter_sanitizer.permit(:account_update, keys: [:first_name, :last_name, :photo, :date_of_birth, :address, :bio,
                                                        :motivation, :facebook_link, :twitter_link,
                                                        :instagram_link, :linkedin_link,
                                                        address_attributes: [:address_line_1, :address_line_2, :city, :postcode],
                                                        skill_attributes: [:name, :category]])
  end

  protected

  def after_sign_in_path_for(resource)
    account_path
  end

  def after_sign_out_path_for(scope)
    root_path
  end

  def after_sign_up_path_for(resource)
    account_path
  end
end
