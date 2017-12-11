class ProvidersController < ApplicationController
  before_action :set_provider, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, except: [:show, :index]

  # GET /providers
  # GET /providers.json
  def index
    @q= Provider.ransack(params[:q])
    @providers = @q.result.uniq
  end

  # GET /providers/1
  # GET /providers/1.json
  def show
    @provider_comment = ProviderComment.new
    @provider_comments = @provider.provider_comments.paginate(:page => params[:page], :per_page => 6)
    @provider_attachments = @provider.provider_attachments.all


if @provider.provider_attachments.present?
prepare_meta_tags(title: @provider.nombre,
  description: @provider.productos, 
  keywords: @provider.tags
)
end


  end

  # GET /providers/new
  def new
    @provider = Provider.new
    @provider_attachment = @provider.provider_attachments.build
  end

  # GET /providers/1/edit
  def edit
  end

  # POST /providers
  # POST /providers.json
  def create
    @provider = Provider.new(provider_params)
    @provider.user_id = current_user.id

   respond_to do |format|
     if @provider.save
       params[:provider_attachments]['image2'].each do |a|
          @provider_attachment = @provider.provider_attachments.create!(:image2 => a,     :provider_id => @provider.id)
       end
       format.html { redirect_to @provider, notice: 'provider was successfully     created.' }
     else
       format.html { render action: 'new' }
     end
   end
  end

  # PATCH/PUT /providers/1
  # PATCH/PUT /providers/1.json
  def update
    respond_to do |format|
      if @provider.update(provider_params)
        format.html { redirect_to @provider, notice: 'Provider was successfully updated.' }
        format.json { render :show, status: :ok, location: @provider }
      else
        format.html { render :edit }
        format.json { render json: @provider.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /providers/1
  # DELETE /providers/1.json
  def destroy
    @provider.destroy
    respond_to do |format|
      format.html { redirect_to providers_url, notice: 'Provider was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_provider
      @provider = Provider.friendly.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def provider_params
      params.require(:provider).permit(:user_id, :nombre, :foto, :productos, :anticipacion, :telefono, :correo, :info_general, :servicios, :domicilio, :tags, provider_attachments_attributes: [:id, :provider_id, :image2])
    end
end
