require 'rails_helper'

RSpec.describe '/categories', type: :request do
  before do
    @admin = create(:user_admin)
    login_as @admin
  end
  
  describe 'POST /create' do
    context 'with valid parameters' do
      it "creates a new Category" do
        expect {
          post categories_path, params: { category: attributes_for(:doc_category) }
        }.to change(Category, :count).by(1)
      end

      it "redirects to the categories index" do
        post categories_path, params: { category: attributes_for(:doc_category) }
        expect(response).to redirect_to(categories_path)
      end
    end

    context 'with invalid parameters' do
      it "not creates a new Category" do
        expect {
          post categories_path, params: { category: attributes_for(:invalid_category) }
        }.to_not change(Category, :count)
      end

      it "redirects to the categories index" do
        post categories_path, params: { category: attributes_for(:invalid_category) }
        expect(response).to redirect_to(categories_path)
      end
    end
  end
end
