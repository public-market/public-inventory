require 'rails_helper'

RSpec.describe Item, type: :model do
  let(:item) { Item.first }

  it { expect(item.product_uid).to be_truthy }
  it { expect(item.title).to be_truthy }
  it { expect(item.quantity).to be > 0 }
  it { expect(item.price).to be_truthy }
  it { expect(item.details).to match('Condition') }
  it { expect(item.categories).not_to be_empty }
  it { expect(item.seller).to be_truthy }
end
