# frozen_string_literal: true

module Pagination
  def max_page(products_count)
    (products_count.to_f / ApplicationController::PER_PAGE).ceil
  end

  def correct_page(page)
    if page < 1
      1
    elsif page > max_page(Product.count)
      max_page(Product.count)
    else
      page
    end
  end
end
