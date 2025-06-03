require 'swagger_helper'

RSpec.describe 'Machines API', type: :request do
  path '/machines' do
    get '機械一覧を取得' do
      tags 'Machines'
      produces 'application/json'

      response '200', 'ok' do
        schema type: :array, items: { type: :object }
        run_test!
      end
    end

    post '機械を登録' do
      tags 'Machines'
      consumes 'application/json'
      parameter name: :machine, in: :body, schema: {
        type: :object,
        properties: {
          machine: {
            type: :object,
            properties: {
              name: { type: :string },
              model: { type: :string }
            },
            required: ['name', 'model']
          }
        },
        required: ['machine']
      }

      response '201', 'created' do
        let(:machine) do
          {
            machine: {
              name: '機械A',
              model: 'Model-X'
            }
          }
        end
        run_test!
      end
    end
  end

  path '/machines/{id}' do
    delete '機械を削除' do
      tags 'Machines'
      parameter name: :id, in: :path, type: :integer, required: true

      response '204', 'deleted' do
        let(:id) { Machine.create(name: '機械B', model: 'Model-Y').id }
        run_test!
      end
    end
  end
end