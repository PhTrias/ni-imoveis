class ApplicationController < ActionController::Base

  def pagination_meta(objects)
    {
      count: 1
    }
  end
end
