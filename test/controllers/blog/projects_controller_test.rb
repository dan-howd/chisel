require 'test_helper'

class ProjectsControllerTest < ActionController::TestCase
  setup do
    @project = create(:project)
  end

  test "controller actions succeed with regular usage" do
    get :index
    assert_response :success

    get :show, {id: @project.id}
    assert_response :success

    sign_in @user
    get :new
    assert_response :success

    get :edit, {id: @project.id}
    assert_response :success

    post :create, project: attributes_for(:project)
    assert_redirected_to controller: 'projects', action: 'show', id: Project.last.id

    patch :update, {id: @project.id, project: attributes_for(:project)}
    assert_redirected_to controller: 'projects', action: 'show'

    delete :destroy, {id: @project.id}
    assert_redirected_to controller: 'projects', action: 'index'
    sign_out @user
  end
end
