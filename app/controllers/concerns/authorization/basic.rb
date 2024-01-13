module Authorization
  module Basic
    extend ActiveSupport::Concern

    def authenticate!
      authenticate_or_request_with_http_basic do |username, password|
        valid_credentials?(username, password)
      end
    end

    private

    def valid_credentials?(username, password)
      return unless username.present? && password.present?

      username == ENV["BASIC_AUTH_USERNAME"] && password == ENV["BASIC_AUTH_PASSWORD"]
    end
  end
end
