require "test_helper"

class TlanslationsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @tlanslation = tlanslations(:one)
  end

  test "should get index" do
    get tlanslations_url, as: :json
    assert_response :success
  end

  test "should create tlanslation" do
    assert_difference("Tlanslation.count") do
      post tlanslations_url, params: { tlanslation: { japanese: @tlanslation.japanese, word_id: @tlanslation.word_id } }, as: :json
    end

    assert_response :created
  end

  test "should show tlanslation" do
    get tlanslation_url(@tlanslation), as: :json
    assert_response :success
  end

  test "should update tlanslation" do
    patch tlanslation_url(@tlanslation), params: { tlanslation: { japanese: @tlanslation.japanese, word_id: @tlanslation.word_id } }, as: :json
    assert_response :success
  end

  test "should destroy tlanslation" do
    assert_difference("Tlanslation.count", -1) do
      delete tlanslation_url(@tlanslation), as: :json
    end

    assert_response :no_content
  end
end
