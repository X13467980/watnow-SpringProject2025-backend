require 'swagger_helper'

RSpec.describe 'Users API', type: :request do
  path '/api/v1/users' do
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
          user: {
            type: :object,
            properties: {
              name: { type: :string },
              email: { type: :string },
              password: { type: :string }
            },
            required: ['name', 'email', 'password']
          }
        },
        required: ['user']
      }

      response '201', '作成成功' do
        let(:user) do
          {
            user: {
              name: 'John',
              email: "john_#{Time.now.to_i}@example.com",
              password: 'password'
            }
          }
        end
        run_test!
      end
    end
  end

  path '/api/v1/users/{id}' do
    delete 'ユーザー削除' do
      tags 'Users'
      parameter name: :id, in: :path, type: :integer

      response '204', '削除成功' do
        let(:id) { User.create(name: 'Jane', email: "jane_#{Time.now.to_i}@example.com", password: 'password').id }
        run_test!
      end
    end
  end
end