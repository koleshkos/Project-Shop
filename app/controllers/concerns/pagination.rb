# frozen_string_literal: true

module Pagination
  def max_page(products_count)
    (products_count.to_f / ApplicationController::PER_PAGE).ceil
  end

  def correct_page(page, products_count)
    max_page = max_page(products_count)

    if page > max_page
      max_page
    elsif page < 1
      1
    else
      page
    end
  end
end
