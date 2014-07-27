require 'test_helper'

class ProjectsControllerTest < ActionController::TestCase
  setup do
    @projects = projects(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:activity)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create project" do
    assert_difference('Activity.count') do
      post :create, activity: { description: @projects.description, name: @projects.name, proposer: @projects.proposer }
    end

    assert_redirected_to project_path(assigns(:project))
  end

  test "should show project" do
    get :show, id: @projects
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @projects
    assert_response :success
  end

  test "should update project" do
    patch :update, id: @projects, project: { description: @projects.description, name: @projects.name, proposer: @projects.proposer }
    assert_redirected_to project_path(assigns(:project))
  end

  test "should destroy project" do
    assert_difference('Activity.count', -1) do
      delete :destroy, id: @projects
    end

    assert_redirected_to projects_path
  end
end
