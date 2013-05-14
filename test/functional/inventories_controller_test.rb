require 'test_helper'
require 'declarative_authorization/maintenance'

class InventoriesControllerTest < ActionController::TestCase
    include Devise::TestHelpers
    include Authorization::TestHelper
    setup do
        @inventory = inventories(:one)

        @user = users(:one)
        sign_in @user
    end

    test "should get index" do
        get :index
        assert_response :success
        assert_not_nil assigns(:inventories)
    end

    test "should get new" do
        get :new
        assert_response :success
    end

    test "should create inventory" do
        assert_difference('Inventory.count') do
            post :create, inventory: { product_id: @inventory.product_id, quantity: @inventory.quantity }
        end

        assert_redirected_to inventory_path(assigns(:inventory))
    end

    test "should show inventory" do
        get :show, id: @inventory
        assert_response :success
    end

    test "should get edit" do
        get :edit, id: @inventory
        assert_response :success
    end

    test "should update inventory" do
        put :update, id: @inventory, inventory: { product_id: @inventory.product_id, quantity: @inventory.quantity }
        assert_redirected_to inventory_path(assigns(:inventory))
    end

    test "should destroy inventory" do
        assert_difference('Inventory.count', -1) do
            delete :destroy, id: @inventory
        end

        assert_redirected_to inventories_path
    end
end
