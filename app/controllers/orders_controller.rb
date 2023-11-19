class OrdersController < ApplicationController
  before_action :set_order, only: %i[ show edit update destroy ]

  # GET /orders or /orders.json
  def index
    @orders = Order.all
  end

  # GET /orders/1 or /orders/1.json
  def show
  end

  # GET /orders/new
  def new
    @order = Order.new
    @items = Item.all
    5.times { @order.order_lines.build }
  end

  # GET /orders/1/edit
  def edit
    @order = Order.find(params[:id])
    @items = Item.all
  end

  # POST /orders or /orders.json
  # POST /orders or /orders.json
def create
  @order = Order.new(order_params)
  if @order.save
    # @order.update_total_amount  # Call the update_total_amount method here
    # Handle successful save
    redirect_to order_url(@order), notice: "Order was successfully created."
  else
    # Log or handle errors
    flash.now[:alert] = @order.errors.full_messages.to_sentence
    render :new
  end
end



  # PATCH/PUT /orders/1 or /orders/1.json
  def update
    respond_to do |format|
      if @order.update(order_params)
        format.html { redirect_to order_path(@order), notice: "Order was successfully updated." }
        format.json { render :show, status: :ok, location: @order }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @order.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /orders/1 or /orders/1.json
  def destroy
    @order.destroy

    respond_to do |format|
      format.html { redirect_to orders_url, notice: "Order was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_order
      @order = Order.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def order_params
      params.require(:order).permit(
        :transaction_date, 
        order_lines_attributes: [:id, :item_id, :quantity, :tax_amount, :_destroy]
      )
    end    
end
