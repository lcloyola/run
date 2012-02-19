class HomeController < ApplicationController
  protect_from_forgery
  before_filter :authenticate_user!
end
