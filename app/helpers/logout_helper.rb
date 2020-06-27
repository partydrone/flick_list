module LogoutHelper
  def logout_url
    client_id      = Rails.application.credentials[:auth0][:client_id]
    domain         = Rails.application.credentials[:auth0][:domain]
    request_params = {
      returnTo: root_url,
      client_id: client_id
    }

    URI::HTTPS.build(host: domain, path: '/v2/logout', query: to_query(request_params))
  end

  private

  def to_query(hash)
    hash.map { |k, v| "#{k}=#{CGI.escape(v)}" unless v.nil? }.reject(&:nil?).join('&')
  end
end
