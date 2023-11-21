class AnalyticsController < ApplicationController
  def index
    @orders = Order.all
    
    @item_names = OrderLine.joins(:item).distinct.pluck('items.name')

    # Filter by item
    if params[:item].present?
      @orders = @orders.joins(:order_lines).where('order_lines.item.name LIKE ?', "%#{params[:item]}%")
    end

    # Filter by date
    if params[:date].present?
      @orders = @orders.where('transaction_date = ?', Date.parse(params[:date]))
    end
  end
end
