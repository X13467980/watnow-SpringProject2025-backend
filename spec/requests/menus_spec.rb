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

    post 'メニューを作成' do
      tags 'Menus'
      consumes 'application/json'
      parameter name: :menu, in: :body, schema: {
        type: :object,
        properties: {
          menu: {
            type: :object,
            properties: {
              name: { type: :string },
              machine_id: { type: :integer },
              part: { type: :string },
              count: { type: :integer },
              set_count: { type: :integer },
              time: { type: :integer },
              weight: { type: :number }
            },
            required: ['name', 'machine_id', 'part']
          }
        },
        required: ['menu']
      }

      response '201', 'ok' do
        let(:menu) {{
          menu: {
            name: 'レッグプレス',
            machine_id: 1,
            part: '脚',
            count: 10,
            set_count: 3,
            time: 60,
            weight: 50.0
          }
        }}
        run_test!
      end
    end
  end

  path '/menus/{id}' do
    parameter name: :id, in: :path, type: :string

    get '特定のメニューを取得' do
      tags 'Menus'
      produces 'application/json'

      response '200', 'ok' do
        schema type: :object
        let(:id) { Menu.create(name: 'レッグプレス', machine_id: 1, part: '脚').id }
        run_test!
      end

      response '404', 'not found' do
        let(:id) { 'invalid' }
        run_test!
      end
    end

    put 'メニューを更新' do
      tags 'Menus'
      consumes 'application/json'
      parameter name: :menu, in: :body, schema: {
        type: :object,
        properties: {
          menu: {
            type: :object,
            properties: {
              name: { type: :string },
              weight: { type: :number }
            }
          }
        }
      }

      response '200', 'ok' do
        let(:id) { Menu.create(name: 'レッグプレス', machine_id: 1, part: '脚').id }
        let(:menu) {{ menu: { name: 'レッグプレス改', weight: 60.0 } }}
        run_test!
      end
    end

    delete 'メニューを削除' do
      tags 'Menus'

      response '204', 'ok' do
        let(:id) { Menu.create(name: '削除対象', machine_id: 1, part: '脚').id }
        run_test!
      end
    end
  end
end