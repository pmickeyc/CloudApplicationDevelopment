# frozen_string_literal: true

json.array! @order_lines, partial: 'order_lines/order_line', as: :order_line
