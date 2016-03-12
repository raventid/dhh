require_relative "test_helper"

class TestController < Dhh::Controller
  def index
    "Hello!"
  end
end

class TestApp < Dhh::Application
  # This is Ruby, let's fucking monkeypath everything
  def get_controller_and_action(env)
    [TestController, "index"]
  end
end

class DhhAppTest < Test::Unit::TestCase
  include Rack::Test::Methods

  def app
    TestApp.new
  end

  def test_request
    get "/example/route"

    assert last_response.ok?
    body = last_response.body
    assert body["Hello"]
  end

  # I cannot test this at the moment as I've stubbed controller invokation,
  # huh...
#  def test_wrong_path
#    post "/wrong/path"
#
#    assert !last_response.ok?
#  end
end
