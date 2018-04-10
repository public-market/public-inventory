require 'rails_helper'

RSpec.describe V1::ItemResource, type: :resource do
  describe 'configuration' do
    subject { described_class }

    it { expect(subject._model_name).to eq('Item') }
    it { expect(subject._primary_key).to eq(:sku) }
    it { expect(subject._attributes).to include(:product_uid) }
  end
end
