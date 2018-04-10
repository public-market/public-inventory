require 'rails_helper'

RSpec.describe 'Items API', type: :request do
  describe 'GET /items' do
    subject { json.dig('data', 0) }

    let(:first_item) { Item.first }

    before { get v1_items_path }

    it { expect(response).to have_http_status(200) }
    it { expect(json.dig('meta', 'record_count')).to be > 0 }
    it { expect(json.dig('links', 'first')).to be_truthy }
    it { expect(json.dig('links', 'next')).to be_truthy }
    it { expect(json.dig('data').count).to eq(10) }
    it { is_expected.to include('type' => 'items') }
    it { is_expected.to include('id' => first_item.sku) }
    it { is_expected.to include('links' => { 'self' => match(first_item.sku) }) }
    it do
      is_expected.to include('attributes' => hash_including(
        'product_uid' => first_item.product.number,
        'title' => be_truthy,
        'quantity' => be > 0,
        'price' => be_truthy,
        'categories' => include(match('Books')),
        'details' => match('Condition'),
        'seller' => first_item.vendor.name
      ))
    end
  end

  describe 'GET /items with paging' do
    before { get v1_items_path(page: { number: 2, size: 5 }) }

    it { expect(response).to have_http_status(200) }
    it { expect(json.dig('data').count).to eq(5) }
    it { expect(json.dig('data', 0, 'id')).not_to eq(Item.first.sku) }
  end

  describe 'GET /items with fields' do
    before { get v1_items_path(fields: { items: 'product_uid' }) }

    it { expect(response).to have_http_status(200) }
    it { expect(json.dig('data', 0, 'attributes').keys).to eq(['product_uid']) }
  end

  describe 'GET /items with sorting' do
    before { get v1_items_path(sort: 'price') }

    it { expect(response).to have_http_status(400) }
    it { expect(json.dig('errors', 0, 'title')).to eq('Invalid sort criteria') }
  end

  describe 'GET /items with filtering' do
    before { get v1_items_path(filter: { price: '50' }) }

    it { expect(response).to have_http_status(400) }
    it { expect(json.dig('errors', 0, 'title')).to eq('Filter not allowed') }
  end

  describe 'GET /item/:id' do
    before { get v1_item_path(sku) }

    context 'when unknown item' do
      let(:sku) { 'X-23-100' }

      it { expect(response).to have_http_status(404) }
      it { expect(json).to include('errors' => include(hash_including('detail' => match(sku)))) }
    end

    context 'with existing item' do
      let(:sku) { Item.first.sku }

      it { expect(response).to have_http_status(200) }
      it { expect(json.dig('data', 'id')).to eq(sku) }
    end
  end
end
