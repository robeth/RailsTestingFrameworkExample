require 'test_helper'

class PaysControllerTest < ActionController::TestCase
  setup do
    @pay = pays(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:pays)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create pay" do
    assert_difference('Pay.count') do
      post :create, pay: { fraud_status: @pay.fraud_status, gross_amount: @pay.gross_amount, order_id: @pay.order_id, payment_type: @pay.payment_type, transaction_status: @pay.transaction_status }
    end

    assert_redirected_to pay_path(assigns(:pay))
  end

  test "should show pay" do
    get :show, id: @pay
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @pay
    assert_response :success
  end

  test "should update pay" do
    patch :update, id: @pay, pay: { fraud_status: @pay.fraud_status, gross_amount: @pay.gross_amount, order_id: @pay.order_id, payment_type: @pay.payment_type, transaction_status: @pay.transaction_status }
    assert_redirected_to pay_path(assigns(:pay))
  end

  test "should destroy pay" do
    assert_difference('Pay.count', -1) do
      delete :destroy, id: @pay
    end

    assert_redirected_to pays_path
  end
end
