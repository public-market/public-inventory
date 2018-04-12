require 'rails_helper'

RSpec.describe Item, type: :model do
  let(:vendor) { Item.first.vendor }

  it { expect(vendor.name).to be_truthy }
end
