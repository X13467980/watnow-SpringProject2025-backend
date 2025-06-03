require 'swagger_helper'

RSpec.describe 'Menus API', type: :request do
  path '/menus' do
    get 'メニュー一覧を取得' do
      tags 'Menus'
      produces 'application/json'

      response '200', 'ok' do
        schema type: :array, items: { type: :object }
        run_test!
      end
    end

    post 'メニュー登録' do
      tags 'Menus'
      consumes 'application/json'
      parameter name: :menu, in: :body, schema: {
        type: :object,
        properties: {
          menu: {
            type: :object,
            properties: {
              name: { type: :string },
              description: { type: :string, nullable: true }
            },
            required: ['name']
          }
        },
        required: ['menu']
      }

      response '201', 'ok' do
        let(:menu) do
          {
            menu: {
              name: 'ベンチプレス',
              description: '胸のトレーニング'
            }
          }
        end
        run_test!
      end
    end
  end

  path '/menus/{id}' do
    delete 'メニュー削除' do
      tags 'Menus'
      parameter name: :id, in: :path, type: :integer

      response '204', 'ok' do
        let(:id) { Menu.create(name: 'スクワット', description: '脚のトレーニング').id }
        run_test!
      end
    end
  end
end