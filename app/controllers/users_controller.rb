class UsersController < ApplicationController
  before_action :set_user, only: [:show, :update, :destroy]


  # GET /users
  def index
    @users = User.all
    render json: @users
  end

  # GET /users/1
  def show
    #@user = User.joins(:music_libraries).select('users.*,music_libraries.*').where(users: {id: @user.id})
    #Rails.logger.debug("@user:#{JSON.parse(@user.to_json)}")
    #Rails.logger.debug("@user_music:#{JSON.parse(@user.music_libraries.to_json)}")
    #@user.music_libraries.each do |xxx|
    #  Rails.logger.debug("Belong_to:#{xxx.title}")
    #end
    user_arr = []
    if @user.present?
      user_arr = [@user]
      music_arr = @user.music_libraries
      #Rails.logger.debug("Merge-x:#{user_arr.push(music_arr).to_json}")
      #render json: user_arr.push(music_arr).to_json
      user_arr.push(music_arr).to_json
    end
    render json: user_arr.to_json
    #render json: @user
  end

  # POST /users
  def create
    json_request = JSON.parse(request.body.read)
Rails.logger.debug("POST-1:#{json_request[0].inspect}")

     @user = User.new(json_request[0])
     if json_request[1].present?
Rails.logger.debug("POST-2:#{json_request[1].inspect}")
       json_request[1].each do |m_list|
Rails.logger.debug("POST-3:#{m_list}")
         @user.music_libraries.build(m_list)
       end
     end

    if @user.save
      render json: @user, status: :created, location: @user
    else
      render json: @user.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /users/1
  def update
    json_request = JSON.parse(request.body.read)

    #if @user.update(user_params)
    if @user.update(json_request)
      render json: @user
    else
      render json: @user.errors, status: :unprocessable_entity
    end
  end

  # DELETE /users/1
  def destroy
    @user.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find_by_id(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def user_params
      #params.fetch(:user, {}).permit(:name,:age,:birthday,:gender)
      params.fetch(:user, {}).permit(:name,:age,:birthday,:gender, music_libraries_attributes: [:title,:words_by,:music_by,:released,:album])
    end
end
