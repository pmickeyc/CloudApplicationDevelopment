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

def send_order_details
  @order = Order.find(params[:id])
  recipient_email = params[:recipient_email]
  html_content = render_to_string(partial: "orders/order_details", locals: { order: @order })
  HtmlMailer.send_html_email(html_content, recipient_email, "Order Details")

  redirect_to order_path(@order), notice: 'Order details sent successfully.'
rescue => e
  redirect_to order_path(@order), alert: "Failed to send order details: #{e.message}"
end


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


  def destroy
    @order.destroy

    respond_to do |format|
      format.html { redirect_to orders_url, notice: "Order was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    def set_order
      @order = Order.find(params[:id])
    end

    def order_params
      params.require(:order).permit(
        :transaction_date, 
        order_lines_attributes: [:id, :item_id, :quantity, :tax_amount, :_destroy]
      )
    end    
end
