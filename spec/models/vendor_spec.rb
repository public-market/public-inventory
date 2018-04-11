require 'rails_helper'

RSpec.describe Item, type: :resource do
  let(:vendor) { Item.first.vendor }

  it { expect(vendor.name).to be_truthy }
end
