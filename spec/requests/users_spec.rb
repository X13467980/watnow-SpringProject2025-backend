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

    post 'ユーザー登録' do
      tags 'Users'
      consumes 'application/json'
      parameter name: :user, in: :body, schema: {
        type: :object,
        properties: {
          name: { type: :string },
          email: { type: :string },
          password: { type: :string }
        },
        required: [ 'name', 'email', 'password' ]
      }

      response '201', '作成成功' do
        let(:user) { { name: 'John', email: 'john@example.com', password: 'password' } }
        run_test!
      end
    end
  end

  path '/users/{id}' do
    delete 'ユーザー削除' do
      tags 'Users'
      parameter name: :id, in: :path, type: :integer

      response '204', '削除成功' do
        let(:id) { User.create(name: 'Jane', email: 'jane@example.com', password: 'password').id }
        run_test!
      end
    end
  end
end