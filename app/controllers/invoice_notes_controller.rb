class InvoiceNotesController < ApplicationController
  before_action :set_invoice_note, only: [:show, :edit, :update, :destroy]

  # GET /invoice_notes
  # GET /invoice_notes.json
  def index
    @invoice_notes = InvoiceNote.all
  end

  # GET /invoice_notes/1
  # GET /invoice_notes/1.json
  def show
  end

  # GET /invoice_notes/new
  def new
    @invoice_note = InvoiceNote.new
  end

  def new_ajax
    @invoice_item = InvoiceItem.new

    respond_to do |format|
      format.js
    end
  end

  # GET /invoice_notes/1/edit
  def edit
  end

  # POST /invoice_notes
  # POST /invoice_notes.json
  def create
    @invoice_note = InvoiceNote.new(invoice_note_params)

    respond_to do |format|
      if @invoice_note.save
        format.html { redirect_to @invoice_note, notice: 'Invoice note was successfully created.' }
        format.json { render action: 'show', status: :created, location: @invoice_note }
      else
        format.html { render action: 'new' }
        format.json { render json: @invoice_note.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /invoice_notes/1
  # PATCH/PUT /invoice_notes/1.json
  def update
    respond_to do |format|
      if @invoice_note.update(invoice_note_params)
        format.html { redirect_to @invoice_note, notice: 'Invoice note was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @invoice_note.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /invoice_notes/1
  # DELETE /invoice_notes/1.json
  def destroy
    @invoice_note.destroy
    respond_to do |format|
      format.html { redirect_to invoice_notes_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_invoice_note
      @invoice_note = InvoiceNote.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def invoice_note_params
      params.require(:invoice_note).permit(:content, :user_id, :invoice_id)
    end
end
