class RegistrationsController < Devise::RegistrationsController

  skip_before_action :require_no_authentication, only: [:new, :create]


  def new
    super
  end

  def create
      super
  end

end