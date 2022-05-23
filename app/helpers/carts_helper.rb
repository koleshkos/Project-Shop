# frozen_string_literal: true

module CartsHelper
  def count_cart_item
    @current_cart.line_items.count
  end
end
