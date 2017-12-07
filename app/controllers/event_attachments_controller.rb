class EventAttachmentsController < ApplicationController
  before_action :set_event_attachment, only: [:show, :edit, :update, :destroy]

  # GET /event_attachments
  # GET /event_attachments.json
  def index
    @event_attachments = EventAttachment.all
  end

  # GET /event_attachments/1
  # GET /event_attachments/1.json
  def show
  end

  # GET /event_attachments/new
  def new
    @event_attachment = EventAttachment.new
  end

  # GET /event_attachments/1/edit
  def edit
  end

  # POST /event_attachments
  # POST /event_attachments.json
  def create
    @event_attachment = EventAttachment.new(event_attachment_params)

    respond_to do |format|
      if @event_attachment.save
        format.html { redirect_to @event_attachment, notice: 'Event attachment was successfully created.' }
        format.json { render :show, status: :created, location: @event_attachment }
      else
        format.html { render :new }
        format.json { render json: @event_attachment.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /event_attachments/1
  # PATCH/PUT /event_attachments/1.json
  def update
    respond_to do |format|
      if @event_attachment.update(event_attachment_params)
        format.html { redirect_to @event_attachment, notice: 'Event attachment was successfully updated.' }
        format.json { render :show, status: :ok, location: @event_attachment }
      else
        format.html { render :edit }
        format.json { render json: @event_attachment.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /event_attachments/1
  # DELETE /event_attachments/1.json
  def destroy
    @event_attachment.destroy
    respond_to do |format|
      format.html { redirect_to event_attachments_url, notice: 'Event attachment was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_event_attachment
      @event_attachment = EventAttachment.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def event_attachment_params
      params.require(:event_attachment).permit(:event_id, :image)
    end
end
