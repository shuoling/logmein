require File.dirname(__FILE__) + '/../test_helper'

class TestScaffoldsControllerTest < ActionController::TestCase
  def test_should_get_index
    get :index
    assert_response :success
    assert_not_nil assigns(:test_scaffolds)
  end

  def test_should_get_new
    get :new
    assert_response :success
  end

  def test_should_create_test_scaffold
    assert_difference('TestScaffold.count') do
      post :create, :test_scaffold => { }
    end

    assert_redirected_to test_scaffold_path(assigns(:test_scaffold))
  end

  def test_should_show_test_scaffold
    get :show, :id => test_scaffolds(:one).id
    assert_response :success
  end

  def test_should_get_edit
    get :edit, :id => test_scaffolds(:one).id
    assert_response :success
  end

  def test_should_update_test_scaffold
    put :update, :id => test_scaffolds(:one).id, :test_scaffold => { }
    assert_redirected_to test_scaffold_path(assigns(:test_scaffold))
  end

  def test_should_destroy_test_scaffold
    assert_difference('TestScaffold.count', -1) do
      delete :destroy, :id => test_scaffolds(:one).id
    end

    assert_redirected_to test_scaffolds_path
  end
end
