class Api::ApplicationController < ActionController::Base

  def pagination_meta(objects)
    {
      count: objects.length,
      current_page: objects.current_page,
      previous_page: objects.prev_page,
      next_page: objects.next_page,
      total_pages: objects.total_pages,
      properties_count: objects.total_count
    }
  end
end
