# spec/requests/menus_spec.rb
require 'swagger_helper'

RSpec.describe 'Menus API', type: :request do
  path '/menus' do
    get 'メニュー一覧を取得' do
      tags 'Menus'
      produces 'application/json'

      response '200', 'ok' do
        run_test!
      end
    end
  end
end