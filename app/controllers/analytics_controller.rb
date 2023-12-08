# frozen_string_literal: true
class AnalyticsController < ApplicationController
  def index
    @orders = Order.all
    @email_logs = EmailLog.all.order(sent_at: :desc)

    @item_names = OrderLine.joins(:item).distinct.pluck('items.name')

    # Filter by date range
    if params[:start_date].present? && params[:end_date].present?
      start_date = Date.parse(params[:start_date])
      end_date = Date.parse(params[:end_date])
      @orders = @orders.where("DATE(transaction_date) BETWEEN ? AND ?", start_date, end_date)
      @email_logs = EmailLog
        .where("DATE(sent_at) BETWEEN ? AND ?", start_date, end_date)
        .order(sent_at: :desc)
    end
  end
end
