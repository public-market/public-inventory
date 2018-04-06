require 'rails_helper'

RSpec.describe 'Items API', type: :request do
  describe 'GET /items' do
    before { get v1_items_path }

    context 'when no items' do
      it { expect(json['data']).to be_empty }
      it { expect(response).to have_http_status(200) }
    end
  end
end
