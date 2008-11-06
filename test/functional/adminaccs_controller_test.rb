require File.dirname(__FILE__) + '/../test_helper'

class AdminaccsControllerTest < ActionController::TestCase
  def test_should_get_index
    get :index
    assert_response :success
    assert_not_nil assigns(:adminaccs)
  end

  def test_should_get_new
    get :new
    assert_response :success
  end

  def test_should_create_adminacc
    assert_difference('Adminacc.count') do
      post :create, :adminacc => { }
    end

    assert_redirected_to adminacc_path(assigns(:adminacc))
  end

  def test_should_show_adminacc
    get :show, :id => adminaccs(:one).id
    assert_response :success
  end

  def test_should_get_edit
    get :edit, :id => adminaccs(:one).id
    assert_response :success
  end

  def test_should_update_adminacc
    put :update, :id => adminaccs(:one).id, :adminacc => { }
    assert_redirected_to adminacc_path(assigns(:adminacc))
  end

  def test_should_destroy_adminacc
    assert_difference('Adminacc.count', -1) do
      delete :destroy, :id => adminaccs(:one).id
    end

    assert_redirected_to adminaccs_path
  end
end
