require 'test_helper'

module ProfitAndLoss
  class ProfitEntriesControllerTest < ActionController::TestCase
    setup do
      @profit_entry = profit_and_loss_profit_entries(:one)
      @routes = Engine.routes
    end

    test "should get index" do
      get :index
      assert_response :success
      assert_not_nil assigns(:profit_entries)
    end

    test "should get new" do
      get :new
      assert_response :success
    end

    test "should create profit_entry" do
      assert_difference('ProfitEntry.count') do
        post :create, profit_entry: { information: @profit_entry.information, name: @profit_entry.name, ttc_price_in_cents: @profit_entry.ttc_price_in_cents }
      end

      assert_redirected_to profit_entry_path(assigns(:profit_entry))
    end

    test "should show profit_entry" do
      get :show, id: @profit_entry
      assert_response :success
    end

    test "should get edit" do
      get :edit, id: @profit_entry
      assert_response :success
    end

    test "should update profit_entry" do
      patch :update, id: @profit_entry, profit_entry: { information: @profit_entry.information, name: @profit_entry.name, ttc_price_in_cents: @profit_entry.ttc_price_in_cents }
      assert_redirected_to profit_entry_path(assigns(:profit_entry))
    end

    test "should destroy profit_entry" do
      assert_difference('ProfitEntry.count', -1) do
        delete :destroy, id: @profit_entry
      end

      assert_redirected_to cost_and_profit_entries_path
    end
  end
end
