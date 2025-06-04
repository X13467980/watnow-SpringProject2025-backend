require 'swagger_helper'

RSpec.describe 'Gyms API', type: :request do
  path '/gyms' do
    get 'ジム一覧を取得' do
      tags 'Gyms'
      produces 'application/json'

      response '200', 'ok' do
        schema type: :array, items: { type: :object }
        run_test!
      end
    end

    post 'ジムを登録' do
      tags 'Gyms'
      consumes 'application/json'
      parameter name: :gym, in: :body, schema: {
        type: :object,
        properties: {
          gym: {
            type: :object,
            properties: {
              name: { type: :string },
              location: { type: :string },
              url: { type: :string }
            },
            required: [ 'name' ]
          }
        },
        required: [ 'gym' ]
      }

      response '201', 'ok' do
        let(:gym) do
          {
            gym: {
              name: 'example gym',
              location: 'tokyo',
              url: 'https://examplegym.com'
            }
          }
        end
        run_test!
      end
    end
  end

  path '/gyms/{id}' do
    delete 'ジムを削除' do
      tags 'Gyms'
      parameter name: :id, in: :path, type: :integer

      response '204', 'ok' do
        let(:id) { Gym.create(name: 'example gym', location: 'tokyo').id }
        run_test!
      end
    end
  end
end
