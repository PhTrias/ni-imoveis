class ApplicationController < ActionController::API

  def pagination_meta(objects)
    {
      count: 1
    }
  end
end
