class ApplicationController < ActionController::Base
  protect_from_forgery
  layout :choose_layout

private
  def choose_layout
    user_signed_in? ? "application" : "landing"
  end
end
