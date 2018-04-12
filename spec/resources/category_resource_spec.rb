require 'rails_helper'

RSpec.describe V1::CategoryResource, type: :resource do
  describe 'configuration' do
    subject { described_class }

    it { expect(subject._model_name).to eq('Category') }
    it { expect(subject._primary_key).to eq(:permalink) }
    it { expect(subject._attributes).to include(:name, :full_name) }
  end
end
