require 'test_helper'

module ProfitAndLoss
  class CostEntriesControllerTest < ActionController::TestCase
    setup do
      @cost_entry = profit_and_loss_cost_entries(:one)
      @routes = Engine.routes
    end

    test "should get index" do
      get :index
      assert_response :success
      assert_not_nil assigns(:cost_entries)
    end

    test "should get new" do
      get :new
      assert_response :success
    end

    test "should create cost_entry" do
      assert_difference('CostEntry.count') do
        post :create, cost_entry: { information: @cost_entry.information, name: @cost_entry.name }
      end

      assert_redirected_to cost_entry_path(assigns(:cost_entry))
    end

    test "should show cost_entry" do
      get :show, id: @cost_entry
      assert_response :success
    end

    test "should get edit" do
      get :edit, id: @cost_entry
      assert_response :success
    end

    test "should update cost_entry" do
      patch :update, id: @cost_entry, cost_entry: { information: @cost_entry.information, name: @cost_entry.name }
      assert_redirected_to cost_entry_path(assigns(:cost_entry))
    end

    test "should destroy cost_entry" do
      assert_difference('CostEntry.count', -1) do
        delete :destroy, id: @cost_entry
      end

      assert_redirected_to cost_and_profit_entries_path
    end
  end
end
