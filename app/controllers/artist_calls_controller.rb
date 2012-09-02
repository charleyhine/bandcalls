class ArtistCallsController < ApplicationController
  # GET /artist_calls
  # GET /artist_calls.json
  def index
    @artist_calls = ArtistCall.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @artist_calls }
    end
  end

  # GET /artist_calls/1
  # GET /artist_calls/1.json
  def show
    @artist_call = ArtistCall.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @artist_call }
    end
  end

  # GET /artist_calls/new
  # GET /artist_calls/new.json
  def new
    @artist_call = ArtistCall.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @artist_call }
    end
  end

  # GET /artist_calls/1/edit
  def edit
    @artist_call = ArtistCall.find(params[:id])
  end

  # POST /artist_calls
  # POST /artist_calls.json
  def create
    @artist_call = ArtistCall.new(params[:artist_call])

    respond_to do |format|
      if @artist_call.save
        format.html { redirect_to @artist_call, notice: 'Artist call was successfully created.' }
        format.json { render json: @artist_call, status: :created, location: @artist_call }
      else
        format.html { render action: "new" }
        format.json { render json: @artist_call.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /artist_calls/1
  # PUT /artist_calls/1.json
  def update
    @artist_call = ArtistCall.find(params[:id])

    respond_to do |format|
      if @artist_call.update_attributes(params[:artist_call])
        format.html { redirect_to @artist_call, notice: 'Artist call was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @artist_call.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /artist_calls/1
  # DELETE /artist_calls/1.json
  def destroy
    @artist_call = ArtistCall.find(params[:id])
    @artist_call.destroy

    respond_to do |format|
      format.html { redirect_to artist_calls_url }
      format.json { head :no_content }
    end
  end
end
