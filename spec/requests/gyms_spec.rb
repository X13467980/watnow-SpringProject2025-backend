require 'swagger_helper'

RSpec.describe 'Gyms API', type: :request do
  path '/gyms' do
    get 'ジム一覧を取得' do
      tags 'Gyms'
      produces 'application/json'

      response '200', '成功' do
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

      response '201', '作成成功' do
        let(:gym) do
          {
            gym: {
              name: 'ゴールドジム',
              location: '渋谷',
              url: 'https://goldsgym.example.com'
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

      response '204', '削除成功' do
        let(:id) { Gym.create(name: 'エニタイム', location: '梅田').id }
        run_test!
      end
    end
  end
end
