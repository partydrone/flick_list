module Admin
  class UsersController < BaseController
    def index
      @params = {
        q: "email:*auth0*",
        fields: 'email,user_id,name',
        include_fields: true,
        page: 0,
        per_page: 50
      }

      @users = auth0_client.users @params
    end

    private

    def auth0_client
      @auth0_client ||= Auth0Client.new(
        client_id: Rails.application.credentials[:auth0][:client_id],
        client_secret: Rails.application.credentials[:auth0][:client_secret],
        domain: Rails.application.credentials[:auth0][:domain],
        api_version: 2,
        timeout: 15
      )
    end
  end
end
