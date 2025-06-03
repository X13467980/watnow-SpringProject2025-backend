# spec/requests/users_spec.rb
require 'swagger_helper'

RSpec.describe 'Users API', type: :request do
  path '/users' do
    get 'ユーザー一覧を取得' do
      tags 'Users'
      produces 'application/json'

      response '200', '成功' do
        schema type: :array, items: { type: :object }

        run_test!
      end
    end
  end
end