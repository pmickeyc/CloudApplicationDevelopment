class SalesLinesController < ApplicationController
  before_action :set_sales_line, only: %i[ show edit update destroy ]

  # GET /sales_lines or /sales_lines.json
  def index
    @sales_lines = SalesLine.all
  end

  # GET /sales_lines/1 or /sales_lines/1.json
  def show
  end

  # GET /sales_lines/new
  def new
    @sales_line = SalesLine.new
  end

  # GET /sales_lines/1/edit
  def edit
  end

  # POST /sales_lines or /sales_lines.json
  def create
    @sales_line = SalesLine.new(sales_line_params)

    respond_to do |format|
      if @sales_line.save
        format.html { redirect_to sales_line_url(@sales_line), notice: "Sales line was successfully created." }
        format.json { render :show, status: :created, location: @sales_line }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @sales_line.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /sales_lines/1 or /sales_lines/1.json
  def update
    respond_to do |format|
      if @sales_line.update(sales_line_params)
        format.html { redirect_to sales_line_url(@sales_line), notice: "Sales line was successfully updated." }
        format.json { render :show, status: :ok, location: @sales_line }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @sales_line.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /sales_lines/1 or /sales_lines/1.json
  def destroy
    @sales_line.destroy

    respond_to do |format|
      format.html { redirect_to sales_lines_url, notice: "Sales line was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_sales_line
      @sales_line = SalesLine.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def sales_line_params
      params.require(:sales_line).permit(:item_name, :quantity, :discount_percentage, :tax_amount, :price_after_discount)
    end
end
