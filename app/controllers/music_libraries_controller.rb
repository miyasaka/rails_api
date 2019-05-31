class MusicLibrariesController < ApplicationController
  before_action :set_music_library, only: [:show, :update, :destroy]

  # GET /music_libraries
  def index
    @music_libraries = MusicLibrary.all

    render json: @music_libraries
  end

  # GET /music_libraries/1
  def show
    render json: @music_library
  end

  # POST /music_libraries
  def create
    json_request = JSON.parse(request.body.read)
    #@music_library = MusicLibrary.new(music_library_params)
    @music_library = MusicLibrary.new(json_request)

    if @music_library.save
      render json: @music_library, status: :created, location: @music_library
    else
      render json: @music_library.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /music_libraries/1
  def update
Rails.logger.debug("request:#{request.inspect}")
    json_request = JSON.parse(request.body.read)
    #if @music_library.update(music_library_params)
    if @music_library.update(json_request)
      render json: @music_library
    else
      render json: @music_library.errors, status: :unprocessable_entity
    end
  end

  # DELETE /music_libraries/1
  def destroy
    @music_library.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_music_library
      @music_library = MusicLibrary.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def music_library_params
      params.require(:music_library).permit(:user_id, :title, :words_by, :music_by, :released, :album)
    end
end
