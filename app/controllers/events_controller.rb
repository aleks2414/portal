class EventsController < ApplicationController
  before_action :set_event, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, except: [:show, :index]

  # GET /events
  # GET /events.json
  def index

if params[:q].present?
   clear_boolean(params[:q], :is_brides_eq)
   clear_boolean(params[:q], :is_tux_eq)
   clear_boolean(params[:q], :is_pasteles_eq)
   clear_boolean(params[:q], :is_latingraf_eq)
   clear_boolean(params[:q], :is_detalles_eq)
   clear_boolean(params[:q], :is_latino_eq)
   clear_boolean(params[:q], :is_nissi_eq)
   clear_boolean(params[:q], :is_gabriella_eq)
   clear_boolean(params[:q], :is_pixen_eq)
   clear_boolean(params[:q], :is_pelo_eq)
   clear_boolean(params[:q], :is_joymas_eq)
 end

    @q= Event.ransack(params[:q])
    @events = @q.result.uniq
    @events = @events.paginate(:page => params[:page], :per_page => 20)
  end

   def clear_boolean(q, condition)
    q.delete(condition) if q[condition] == "0"
  end

  # GET /events/1
  # GET /events/1.json
  def show
    @comment = Comment.new
    @comments = @event.comments.paginate(:page => params[:page], :per_page => 4)
    @event_attachments = @event.event_attachments.all
    @providers = @event.providers.all


if @event.event_attachments.present?
prepare_meta_tags(title: @event.nombre,
  description: @event.categoria, 
  keywords: @event.tags
)
end

  end

  # GET /events/new
  def new
    @event = Event.new
    @event_attachment = @event.event_attachments.build
  end

  # GET /events/1/edit
  def edit
    @event_attachments = @event.event_attachments
  end

  # POST /events
  # POST /events.json
  def create
    @event = Event.new(event_params)
    @event.user_id = current_user.id

   respond_to do |format|
     if @event.save
       params[:event_attachments]['image'].each do |a|
          @event_attachment = @event.event_attachments.create!(:image => a,     :event_id => @event.id)
       end
       format.html { redirect_to edit_event_path(@event), notice: 'event was successfully     created.' }
     else
       format.html { render action: 'new' }
     end
   end
  end

  # PATCH/PUT /events/1
  # PATCH/PUT /events/1.json
  def update
   respond_to do |format|
     if @event.save
       params[:event_attachments]['image'].each do |a|
          @event_attachment = @event.event_attachments.create!(:image => a,     :event_id => @event.id)
       end
       format.html { redirect_to edit_event_path(@event), notice: 'event was successfully     edited.' }
     else
       format.html { render action: 'new' }
     end
   end
  end

  # DELETE /events/1
  # DELETE /events/1.json
  def destroy
    @event.destroy
    respond_to do |format|
      format.html { redirect_to events_url, notice: 'Event was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_event
      @event = Event.friendly.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def event_params
      params.require(:event).permit(:user_id, :nombre, :categoria, :video_url, :content, :fecha, :lugar, :is_brides, :brides, :is_tux, :tux, :is_pasteles, :pasteles, :is_latingraf, :latingraf, :is_detalles, :detalles, :is_latino, :latino, :is_nissi, :nissi, :is_gabriella, :gabriella, :is_pixen, :pixen, :is_pelo, :pelo, :is_joymas, :joymas, :tags, event_attachments_attributes: [:id, :event_id, :image], provider_ids:[])
    end
end
