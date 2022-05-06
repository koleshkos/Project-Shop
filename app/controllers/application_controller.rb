# frozen_string_literal: true

class ApplicationController < ActionController::Base
  include Pagination
  PER_PAGE = 12
end
