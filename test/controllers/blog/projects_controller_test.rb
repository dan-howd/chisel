require 'test_helper'

module Blog
  class ProjectsControllerTest < ActionController::TestCase
    setup do
      @project = blog_projects(:one)
    end

    test "get index success" do
      get :index
      assert_response :success
    end

    test "get show success" do
      get :show, params: {id: @project}
      assert_response :success
    end

    test "get new success" do
      get :new
      assert_response :success
    end

    test "post create success" do
      project_attributes = @project.attributes
      project_attributes[:name] = "Test Name FASDF2345"
      assert_difference('Article.count') do
        post :create, params: {admin_project: project_attributes}
      end
    end

    test "get edit success" do
      get :edit, params: {id: @project}
      assert_response :success
    end

    test "patch update success" do
      patch :update, params: {id: @project, admin_project: {  }}
    end

    test "delete destroy success" do
      assert_difference('Article.count', -1) do
        delete :destroy, params: {id: @project}
      end

      assert_redirected_to admin_projects_path
    end
  end
end
