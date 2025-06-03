require 'swagger_helper'

RSpec.describe 'Menus API', type: :request do
  path '/api/v1/menus' do
    get 'メニュー一覧を取得' do
      tags 'Menus'
      produces 'application/json'

      response '200', '成功' do
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
              machine_id: { type: :integer },
              part: { type: :string },
              count: { type: :integer },
              set_count: { type: :integer },
              time: { type: :integer }
            },
            required: ['name', 'machine_id']
          }
        },
        required: ['menu']
      }

      response '201', '作成成功' do
        let(:machine) { Machine.create(name: 'スミスマシン') } # Machineモデルが必要
        let(:menu) do
          {
            menu: {
              name: 'ベンチプレス',
              machine_id: machine.id,
              part: '胸',
              count: 10,
              set_count: 3,
              time: 60
            }
          }
        end
        run_test!
      end
    end
  end

  path '/api/v1/menus/{id}' do
    delete 'メニュー削除' do
      tags 'Menus'
      parameter name: :id, in: :path, type: :integer

      response '204', '削除成功' do
        let(:machine) { Machine.create(name: 'ラットプルダウン') }
        let(:id) do
          Menu.create(
            name: 'プルダウン',
            machine_id: machine.id,
            part: '背中',
            count: 8,
            set_count: 3,
            time: 45
          ).id
        end
        run_test!
      end
    end
  end
end