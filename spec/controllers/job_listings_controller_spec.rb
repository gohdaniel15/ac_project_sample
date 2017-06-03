require 'rails_helper'

RSpec.describe JobListingsController, type: :controller do

  describe 'GET #index' do

    let(:user) { create(:user) }
    let!(:job_listings) { create_list(:job_listing, 3, user: user) }

    before { get :index }

    it { expect(assigns(:job_listings)).to eq(job_listings) }

  end

  describe 'GET #show' do

    let(:job_listing) { create(:job_listing) }

    before { get :show, params: { id: job_listing } }

    it { expect(assigns(:job_listing)).to eq(job_listing)}

  end

  describe 'GET #new' do

    before { get :new }

    it { expect(assigns(:job_listing)).to be_a_new_record }

  end

  describe 'POST #create' do

    let(:user) { create(:user) }

    before do
      sign_in user
      post :create, params: { job_listing: params }
    end

    context 'when user#save passes' do

      let(:params) { attributes_for(:job_listing) }

      it { expect(response).to redirect_to job_listings_path }

    end

    context 'when user#save fails' do

      let(:params) { attributes_for(:job_listing, :invalid) }

      it { expect(response).to render_template(:new) }

    end

  end

  describe 'GET #edit' do

    let(:job_listing) { create(:job_listing) }

    before { get :edit, params: { id: job_listing } }

    it { expect(assigns(:job_listing)).to eq(job_listing)}

  end

  describe 'PUT/PATCH #update' do

    let(:job_listing) { create(:job_listing) }

    before { patch :update, params: params }

    context 'when job_listing#update succeeds' do

      let(:params) { { id: job_listing, job_listing: attributes_for(:job_listing, description: 'new description') } }

      it { expect(assigns(:job_listing).reload).to have_attributes(description: 'new description') }
      it { expect(response).to redirect_to job_listings_path }

    end

    context 'when job_listing#update fails' do

      let(:params) { { id: job_listing, job_listing: attributes_for(:job_listing, description: '') } }

      it { expect(assigns(:job_listing).reload).not_to have_attributes(description: '') }
      it { expect(response).to render_template(:edit) }

    end

  end

  describe 'DELETE #destroy' do

    let(:user) { User.create!(email: 'example@example.com', first_name: 'john', last_name: 'doe', username: 'john_doe', password: '123123123') }
    let!(:job_listing) { JobListing.create!(user: user, position: 'text', salary: 1000, description: 'text') }

    before { delete :destroy, params: { id: job_listing } }

    it { expect(assigns(:job_listing)).to be_destroyed }
    it { expect(response).to redirect_to(job_listings_path) }

  end

end
