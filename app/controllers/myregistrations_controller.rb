class MyregistrationsController < Devise::RegistrationsController
  prepend_before_filter :require_no_authentication, :only => [ ]

  def create
    @user = params[:user]
    resource = @user
    super # do original create method
  end
  def create_athlete
    resource = build_resource({})
    respond_with resource
  end
end
