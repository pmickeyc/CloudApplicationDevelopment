class SalesHeadersController < ApplicationController
  before_action :set_sales_header, only: %i[ show edit update destroy ]

  # GET /sales_headers or /sales_headers.json
  def index
    @sales_headers = SalesHeader.all
  end

  # GET /sales_headers/1 or /sales_headers/1.json
  def show
  end

  # GET /sales_headers/new
  def new
    @sales_header = SalesHeader.new
  end

  # GET /sales_headers/1/edit
  def edit
  end

  # POST /sales_headers or /sales_headers.json
  def create
    @sales_header = SalesHeader.new(sales_header_params)

    respond_to do |format|
      if @sales_header.save
        format.html { redirect_to sales_header_url(@sales_header), notice: "Sales header was successfully created." }
        format.json { render :show, status: :created, location: @sales_header }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @sales_header.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /sales_headers/1 or /sales_headers/1.json
  def update
    respond_to do |format|
      if @sales_header.update(sales_header_params)
        format.html { redirect_to sales_header_url(@sales_header), notice: "Sales header was successfully updated." }
        format.json { render :show, status: :ok, location: @sales_header }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @sales_header.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /sales_headers/1 or /sales_headers/1.json
  def destroy
    @sales_header.destroy

    respond_to do |format|
      format.html { redirect_to sales_headers_url, notice: "Sales header was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_sales_header
      @sales_header = SalesHeader.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def sales_header_params
      params.require(:sales_header).permit(:transaction_date, :total_amount, :total_tax)
    end
end
