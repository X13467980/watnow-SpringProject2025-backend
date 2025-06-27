require "test_helper"

class Api::V1::SessionsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @user = User.create!(
      name: "テストユーザー",
      email: "test@example.com",
      password: "password123",
      age: 25,
      height: 170.0,
      weight: 65.0
    )
  end

  test "should create session with valid credentials" do
    post api_v1_sessions_url, params: {
      email: @user.email,
      password: "password123"
    }
    
    assert_response :success
    json_response = JSON.parse(response.body)
    assert_equal "ログイン成功", json_response["message"]
    assert_equal @user.id, json_response["user"]["id"]
  end

  test "should not create session with invalid credentials" do
    post api_v1_sessions_url, params: {
      email: @user.email,
      password: "wrongpassword"
    }
    
    assert_response :unauthorized
    json_response = JSON.parse(response.body)
    assert_equal "メールアドレスまたはパスワードが間違っています", json_response["error"]
  end

  test "should return current user when logged in" do
    # まずログイン
    post api_v1_sessions_url, params: {
      email: @user.email,
      password: "password123"
    }
    
    # 現在のユーザー情報を取得
    get current_api_v1_sessions_url
    
    assert_response :success
    json_response = JSON.parse(response.body)
    assert_equal @user.id, json_response["user"]["id"]
  end

  test "should return null user when not logged in" do
    get current_api_v1_sessions_url
    
    assert_response :success
    json_response = JSON.parse(response.body)
    assert_nil json_response["user"]
  end

  test "should destroy session" do
    # まずログイン
    post api_v1_sessions_url, params: {
      email: @user.email,
      password: "password123"
    }
    
    # ログアウト
    delete api_v1_sessions_url
    
    assert_response :success
    json_response = JSON.parse(response.body)
    assert_equal "ログアウト成功", json_response["message"]
  end
end
