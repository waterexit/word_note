require "test_helper"

class TranslationsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @translation = translations(:one)
  end

  test "should get index" do
    get translations_url, as: :json
    assert_response :success
  end

  test "should create translation" do
    assert_difference("Translation.count") do
      post translations_url, params: { translation: { japanese: @translation.japanese, word_id: @translation.word_id } }, as: :json
    end

    assert_response :created
  end

  test "should show translation" do
    get translation_url(@translation), as: :json
    assert_response :success
  end

  test "should update translation" do
    patch translation_url(@translation), params: { translation: { japanese: @translation.japanese, word_id: @translation.word_id } }, as: :json
    assert_response :success
  end

  test "should destroy translation" do
    assert_difference("Translation.count", -1) do
      delete translation_url(@translation), as: :json
    end

    assert_response :no_content
  end
end
