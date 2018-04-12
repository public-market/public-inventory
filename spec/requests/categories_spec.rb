require 'rails_helper'

RSpec.describe 'Categories API', type: :request do
  describe 'GET /categories' do
    subject { json.dig('data', 0) }

    before { get v1_categories_path }

    it { expect(response).to have_http_status(200) }
    it { expect(json.dig('meta', 'record_count')).to be > 0 }
    it { expect(json.dig('links', 'first')).to be_truthy }
    it { expect(json.dig('links', 'next')).to be_truthy }
    it { expect(json.dig('data').count).to eq(10) }
    it { is_expected.to include('type' => 'categories') }
    it { is_expected.to include('id' => be_truthy) }
    it { is_expected.to include('links' => { 'self' => be_truthy }) }

    it do
      is_expected.to include('relationships' => hash_including(
        'parent' => be_truthy,
        'children' => be_truthy,
        'items' => be_truthy
      ))
    end

    it do
      is_expected.to include('attributes' => hash_including(
        'name' => be_truthy,
        'full_name' => be_truthy
      ))
    end
  end

  describe 'GET /category/:id' do
    before { get v1_category_path(id) }

    context 'when unknown uid' do
      let(:id) { 'computers' }

      it { expect(response).to have_http_status(404) }
      it { expect(json).to include('errors' => include(hash_including('detail' => match(id)))) }
    end

    context 'with existing category' do
      let(:id) { Category.last.permalink }

      it { expect(response).to have_http_status(200) }
      it { expect(json.dig('data', 'id')).to eq(Category.last.escaped_id) }
    end
  end

  describe 'GET /categories/:category_id/relationships/parent' do
    let(:category) { Category.second }

    before { get v1_category_relationships_parent_path(category.permalink) }

    it { expect(response).to have_http_status(200) }
    it { expect(json).to include('links' => hash_including('self', 'related')) }
    it { expect(json).to include('data' => { 'type' => 'categories', 'id' => category.parent.escaped_id }) }
  end

  describe 'GET /categories/:category_id/parent' do
    let(:category) { Category.second }

    before { get v1_category_parent_path(category.permalink) }

    it { expect(response).to have_http_status(200) }
    it { expect(json.dig('data', 'id')).to eq(category.parent.escaped_id) }
  end

  describe 'GET /categories/:category_id/relationships/children' do
    let(:category) { Category.second }

    before { get v1_category_relationships_children_path(category.permalink) }

    it { expect(response).to have_http_status(200) }
    it { expect(json).to include('links' => hash_including('self', 'related')) }
    it { expect(json.dig('data').count).to be > 0 }
  end

  describe 'GET /categories/:category_id/children' do
    let(:category) { Category.second }

    before { get v1_category_children_path(category.permalink) }

    it { expect(response).to have_http_status(200) }
    it { expect(json.dig('data').count).to be > 0 }
    it { expect(json.dig('meta', 'record_count')).to be > 0 }
    it { expect(json.dig('links', 'first')).to be_truthy }
    it { expect(json.dig('links', 'last')).to be_truthy }
  end

  describe 'GET /categories/:category_id/relationships/items' do
    let(:category) { Category.last }

    before { get v1_category_relationships_items_path(category.permalink) }

    it { expect(response).to have_http_status(200) }
    it { expect(json).to include('links' => hash_including('self', 'related')) }
    it { expect(json.dig('data').count).to eq(category.items.count) }
  end

  describe 'GET /categories/:category_id/items' do
    let(:category) { Category.last }

    before { get v1_category_items_path(category.permalink) }

    it { expect(response).to have_http_status(200) }
    it { expect(json.dig('data').count).to be > 0 }
    it { expect(json.dig('meta', 'record_count')).to eq(category.items.count) }
    it { expect(json.dig('links', 'first')).to be_truthy }
    it { expect(json.dig('links', 'last')).to be_truthy }
  end
end
