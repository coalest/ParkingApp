class ApplicationRecord < ActiveRecord::Base
  primary_abstract_class

  protected

  def after_sign_in_path_for(resource)
    bookings_url
  end

  def after_sign_out_path_for(resource)
    root_path
  end
end
