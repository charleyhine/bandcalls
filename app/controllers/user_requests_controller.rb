class UserRequestsController < ApplicationController
  before_filter :authenticate_user!
  
  # GET /user_requests
  # GET /user_requests.json
  def index
    @user_requests = current_user.user_requests

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @user_requests }
    end
  end
  
  def artist_index
    @user_requests = current_artist.user_requests

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @user_requests }
    end
  end

  # GET /user_requests/1
  # GET /user_requests/1.json
  def show
    @user_request = UserRequest.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @user_request }
    end
  end

  # GET /user_requests/new
  # GET /user_requests/new.json
  def new
    @artist = Artist.find(params[:artist_id])
    @user_request = UserRequest.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @user_request }
    end
  end

  # GET /user_requests/1/edit
  def edit
    @user_request = UserRequest.find(params[:id])
  end

  # POST /user_requests
  # POST /user_requests.json
  def create
    @user_request = UserRequest.new(params[:user_request])
    @artist = Artist.find(params[:artist_id])
    @user_request.artist = @artist
    @user_request.user = current_user

    respond_to do |format|
      if @user_request.save
        format.html { redirect_to user_requests_path, notice: @user_request.artist.name + ' has been notified!' }
        format.json { render json: @user_request, status: :created, location: @user_request }
      else
        format.html { render action: "new" }
        format.json { render json: @user_request.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /user_requests/1
  # PUT /user_requests/1.json
  def update
    @user_request = UserRequest.find(params[:id])

    respond_to do |format|
      if @user_request.update_attributes(params[:user_request])
        format.html { redirect_to @user_request, notice: 'User request was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @user_request.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /user_requests/1
  # DELETE /user_requests/1.json
  def destroy
    @user_request = UserRequest.find(params[:id])
    @user_request.destroy

    respond_to do |format|
      format.html { redirect_to user_requests_url }
      format.json { head :no_content }
    end
  end
end
