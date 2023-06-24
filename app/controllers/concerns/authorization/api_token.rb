module Authorization
  module ApiToken
    extend ActiveSupport::Concern

  included do
    before_action :authenticate!
  end

    def authenticate!
      authenticate_or_request_with_http_token do |token, options|
        return true if find_token(token)

        render json: { error: I18n.t('api.token.invalid')}
      end
    end

    private

    def find_token(authorization_token)
      token = Token.all.select { |token| token.key == authorization_token }

      token.present? ? token : nil
    end
  end
end
