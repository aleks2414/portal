class ProviderCommentsController < ApplicationController
  before_action :set_provider_comment, only: [:show, :edit, :update, :destroy]
  before_action :set_provider

  # GET /provider_comments
  # GET /provider_comments.json
  def index
    @provider_comments = ProviderComment.all
  end

  # GET /provider_comments/1
  # GET /provider_comments/1.json
  def show
  end

  # GET /provider_comments/new
  def new
    @provider_comment = ProviderComment.new
  end

  # GET /provider_comments/1/edit
  def edit
  end

  # POST /provider_comments
  # POST /provider_comments.json
  def create
    @provider_comment = ProviderComment.new(provider_comment_params)
    @provider_comment.provider_id = @provider.id

    respond_to do |format|
      if @provider_comment.save
        format.html { redirect_to @provider, notice: 'Provider comment was successfully created.' }
        format.json { render :show, status: :created, location: @provider_comment }
      else
        format.html { render :new }
        format.json { render json: @provider_comment.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /provider_comments/1
  # PATCH/PUT /provider_comments/1.json
  def update
    respond_to do |format|
      if @provider_comment.update(provider_comment_params)
        format.html { redirect_to @provider_comment, notice: 'Provider comment was successfully updated.' }
        format.json { render :show, status: :ok, location: @provider_comment }
      else
        format.html { render :edit }
        format.json { render json: @provider_comment.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /provider_comments/1
  # DELETE /provider_comments/1.json
  def destroy
    @provider_comment.destroy
    respond_to do |format|
      format.html { redirect_to provider_comments_url, notice: 'Provider comment was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_provider_comment
      @provider_comment = ProviderComment.find(params[:id])
    end

    def set_provider
      @provider = Provider.friendly.find(params[:provider_id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def provider_comment_params
      params.require(:provider_comment).permit(:nombre, :mensaje, :servicio, :atencion, :calidad, :provider_id)
    end
end
