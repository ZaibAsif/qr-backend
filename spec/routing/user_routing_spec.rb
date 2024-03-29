# frozen_string_literal: true

describe API::V1::UsersController do
  describe 'routing' do
    it 'routes to #update' do
      expect(put: '/api/v1/user').to route_to('api/v1/users#update', format: :json)
    end

    it 'routes to #show' do
      expect(get: '/api/v1/user').to route_to('api/v1/users#show', format: :json)
    end
  end
end
