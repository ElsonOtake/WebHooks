class Webhooks::BaseController < ApplicationController
  # Skip CSRF checks on webhooks because they do not originate from the browser
  skip_forgery_protection
  
  def create
    InboundWebhook.create!(body: payload)
    head :ok
  end

  private

  def payload
    @payload ||= request.body.read
  end
end
