require 'test_helper'


module Blog
  class Admin::ProjectsControllerTest < ActionController::TestCase

    setup do
      @project = blog_projects(:one)
      @routes = Engine.routes
    end

    test "get index success" do
      get :index
      assert_response :success
    end
  end
end
