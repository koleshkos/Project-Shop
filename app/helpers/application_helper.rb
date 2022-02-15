# frozen_string_literal: true

module ApplicationHelper
  def admin?
    request.path.include?('admin')
  end
end
