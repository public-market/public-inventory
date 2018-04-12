require 'rails_helper'

RSpec.describe 'Items API', type: :request do
  describe 'GET /items' do
    subject { json.dig('data', 0) }

    before { get v1_items_path }

    it { expect(response).to have_http_status(200) }
    it { expect(json.dig('meta', 'record_count')).to be > 0 }
    it { expect(json.dig('links', 'first')).to be_truthy }
    it { expect(json.dig('links', 'next')).to be_truthy }
    it { expect(json.dig('data').count).to eq(10) }
    it { is_expected.to include('type' => 'items') }
    it { is_expected.to include('id' => be_truthy) }
    it { is_expected.to include('links' => { 'self' => be_truthy }) }

    it do
      is_expected.to include('attributes' => hash_including(
        'product_uid' => be_truthy,
        'title' => be_truthy,
        'quantity' => be > 0,
        'price' => be_truthy,
        'details' => match('Condition'),
        'seller' => be_truthy
      ))
    end

    it do
      is_expected.to include('relationships' => hash_including(
        'categories' => be_truthy
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

  describe 'GET /items with unallowed filtering' do
    before { get v1_items_path(filter: { price: '50' }) }

    it { expect(response).to have_http_status(400) }
    it { expect(json.dig('errors', 0, 'title')).to eq('Filter not allowed') }
  end

  describe 'GET /items with title filtering' do
    before { get v1_items_path(filter: { title: 'a' }) }

    it { expect(response).to have_http_status(200) }
    it { expect(json.dig('data').count).to be > 0 }
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

  describe 'GET /items/:item_id/relationships/categories' do
    let(:item) { Item.last }

    before { get v1_item_relationships_categories_path(item.sku) }

    it { expect(response).to have_http_status(200) }
    it { expect(json).to include('links' => hash_including('self', 'related')) }
    it { expect(json.dig('data').count).to eq(item.categories.count) }
  end

  describe 'GET /items/:item_id/categories' do
    let(:item) { Item.last }

    before { get v1_item_categories_path(item.sku) }

    it { expect(response).to have_http_status(200) }
    it { expect(json.dig('data').count).to be > 0 }
    it { expect(json.dig('meta', 'record_count')).to eq(item.categories.count) }
    it { expect(json.dig('links', 'first')).to be_truthy }
    it { expect(json.dig('links', 'last')).to be_truthy }
  end
end
