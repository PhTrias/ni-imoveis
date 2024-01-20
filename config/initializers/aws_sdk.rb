if ENV["USE_AWS_INTEGRATION"].present?
  return unless ENV["USE_AWS_INTEGRATION"] == true
  Aws.config.update(
    {
      region: ENV["AWS_REGION"],
      credentials: Aws::Credentials.new(ENV["AWS_KEY"], ENV["AWS_SECRET"])
    }
  )
end
