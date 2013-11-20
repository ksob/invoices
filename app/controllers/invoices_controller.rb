class InvoicesController < ApplicationController
  before_action :set_invoice, only: [:show, :edit, :update, :destroy]

  # GET /invoices
  # GET /invoices.json
  def index
    @invoices = Invoice.all
  end

  # GET /invoices/1
  # GET /invoices/1.json
  def show
  end

  # GET /invoices/new
  def new
    @invoice = Invoice.new
    @client_names_with_ids = Invoice.get_client_names_with_ids
    @invoice_item = InvoiceItem.new
  end

  # GET /invoices/1/edit
  def edit
    @client_names_with_ids = Invoice.get_client_names_with_ids
  end

  # POST /invoices
  # POST /invoices.json
  def create
    params = invoice_params
    if params[:invoice_note_attributes]
      params[:invoice_note_attributes][:user_id] = User.current_user.id
    end
   
    @invoice = Invoice.new(params)

    respond_to do |format|
      if @invoice.save
        format.html { redirect_to @invoice, notice: 'Invoice was successfully created.' }
        format.json { render action: 'show', status: :created, location: @invoice }
      else
        format.html { render action: 'new' }
        format.json { render json: @invoice.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /invoices/1
  # PATCH/PUT /invoices/1.json
  def update
    params = invoice_params
    if params[:invoice_note_attributes].present?
      params[:invoice_note_attributes][:user_id] = User.current_user.id
    elsif !@invoice.invoice_note.nil?
      @invoice.invoice_note.destroy
    end
    
    respond_to do |format|
      if @invoice.update(params)
        format.html { redirect_to @invoice, notice: 'Invoice was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @invoice.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /invoices/1
  # DELETE /invoices/1.json
  def destroy
    @invoice.destroy
    respond_to do |format|
      format.html { redirect_to invoices_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_invoice
      @invoice = Invoice.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def invoice_params
      params.require(:invoice).permit(:purchase_date, :issue_date, 
        :payment_period, :invoice_number, :client_id,
        invoice_items_attributes: [:id, :_destroy, :invoice_id, :price, :name],
        invoice_note_attributes: [:id, :_destroy, :content, :invoice_id, :user_id])
    end
end
