class MyregistrationsController < Devise::RegistrationsController
  def create
    super # do original create method
  end
end
