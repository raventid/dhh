require_relative "test_helper"

class TestController < Dhh::Controller
  def index
    "Hello!"
  end
end

class TestModel < TestController::FileModel
end

class TestApp < Dhh::Application
  # This is Ruby, let's fucking monkeypath everything
  def get_controller_and_action(env)
    [TestController, "index"]
  end
end

class DhhModelTest < Test::Unit::TestCase
  include Rack::Test::Methods

  def app
    TestApp.new
  end

  def model
  end

  def test_that_model_finds_every_unit_by_propery
    get "/example/route"

    assert last_response.ok?
    body = last_response.body
    #assert body[] 
  end
end

