require 'rails_helper'

RSpec.describe Category, type: :model do
  let(:category) { Category.last }

  it { expect(category.permalink).to be_truthy }
  it { expect(category.name).to be_truthy }
  it { expect(category.escaped_id).to be_truthy }
  it { expect(category.parent).to be_truthy }
  it { expect(category.items).not_to be_empty }
end
