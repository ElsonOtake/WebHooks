class Webhooks::BaseController < ApplicationController
  # Skip CSRF checks on webhooks because they do not originate from the browser
  skip_forgery_protection
  
  def create
    head :ok
  end
end
