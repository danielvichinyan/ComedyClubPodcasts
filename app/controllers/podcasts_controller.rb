class PodcastsController < ApplicationController
  load_and_authorize_resource
  before_action :set_podcast, only: [:show, :edit, :update, :destroy]

  # GET /podcasts
  # GET /podcasts.json
  def index
    # Order in ascending order
    @podcasts = Podcast.all.order("created_at DESC").paginate(:page => params[:page], :per_page => 4)
  end

  # GET /podcasts/1
  # GET /podcasts/1.json
  def show
  end

  def search
    if params[:search].blank?
      @podcasts = Podcast.all.order("created_at DESC").paginate(:page => params[:page], :per_page => 4)
    else
      @podcasts = Podcast.search(params)
    end
  end

  # GET /podcasts/new
  def new
    @podcast = Podcast.new
  end

  # GET /podcasts/1/edit
  def edit
  end

  # POST /podcasts
  # POST /podcasts.json
  def create
    @podcast = Podcast.new(podcast_params)
    @podcast.user_id = current_user.id
    respond_to do |format|
      if @podcast.save
        format.html { redirect_to @podcast, notice: I18n.t('podcasts.new.create_success') }
        format.json { render :show, status: :created, location: @podcast }
      else
        format.html { render :new }
        format.json { render json: @podcast.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /podcasts/1
  # PATCH/PUT /podcasts/1.json
  def update
    respond_to do |format|
      if @podcast.update(podcast_params)
        format.html { redirect_to @podcast, notice: I18n.t('podcasts.edit.update_success') }
        format.json { render :show, status: :ok, location: @podcast }
      else
        format.html { render :edit }
        format.json { render json: @podcast.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /podcasts/1
  # DELETE /podcasts/1.json
  def destroy
    @podcast.destroy
    respond_to do |format|
      format.html { redirect_to podcasts_url, notice: I18n.t('podcasts.edit.delete_success') }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_podcast
      @podcast = Podcast.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def podcast_params
      params.require(:podcast).permit(:title, :description, :banner, :audio, :video, :user_id)
    end
end
