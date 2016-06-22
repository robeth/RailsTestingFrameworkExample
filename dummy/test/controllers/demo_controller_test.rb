require 'test_helper'

class DemoControllerTest < ActionController::TestCase
  # default generated test

  test "should get store" do
    get :store
    assert_response :success
  end

  test "should get pay" do
    get :pay
    assert_response :success
  end

  test "should get index" do
    get :index
    assert_response :success
  end

  # custom generated test by Luthfi Kurnia Putra

  # "Should get to payment pages"
  #   Performing test whenever links selected, it will redirected 
  #   to payment pages or not 
  test "should get to payment pages" do
    get :pay_transaction
    assert_response :success
  end


  # "Payments details should not nil"
  #   Performing test to check if the payment details
  #   is nil or not
  test "payment details should not nil" do
    get :pay_transaction
    @payments.should != nil
  end

end
