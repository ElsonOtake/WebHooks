require "test_helper"

class Webhooks::MoviesControllerTest < ActionDispatch::IntegrationTest
  include ActiveJob::TestHelper

  def setup
    file_path = Rails.root.join("test", "fixtures", "webhooks", "movie.json")
    @webhook = JSON.parse(File.read(file_path))
  end

  test "should consume webhook" do
    assert_difference "InboundWebhook.count" do
      post webhooks_movies_url, params: @webhook
    end
    assert_enqueued_jobs 1
    assert_response :ok
  end
end
