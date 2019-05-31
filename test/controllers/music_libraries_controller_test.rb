require 'test_helper'

class MusicLibrariesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @music_library = music_libraries(:one)
  end

  test "should get index" do
    get music_libraries_url, as: :json
    assert_response :success
  end

  test "should create music_library" do
    assert_difference('MusicLibrary.count') do
      post music_libraries_url, params: { music_library: { music_by: @music_library.music_by, released: @music_library.released, title: @music_library.title, user_id: @music_library.user_id, words_by: @music_library.words_by } }, as: :json
    end

    assert_response 201
  end

  test "should show music_library" do
    get music_library_url(@music_library), as: :json
    assert_response :success
  end

  test "should update music_library" do
    patch music_library_url(@music_library), params: { music_library: { music_by: @music_library.music_by, released: @music_library.released, title: @music_library.title, user_id: @music_library.user_id, words_by: @music_library.words_by } }, as: :json
    assert_response 200
  end

  test "should destroy music_library" do
    assert_difference('MusicLibrary.count', -1) do
      delete music_library_url(@music_library), as: :json
    end

    assert_response 204
  end
end
