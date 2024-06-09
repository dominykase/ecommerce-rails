# frozen_string_literal: true

require 'rails_helper'

RSpec.describe SessionController, type: :controller do
  describe '#login' do
    subject { post :login, params: { login: user.login, password: password } }

    let(:user) { User.create!(login: 'test', password: password) }
    let(:password) { 'labas1234!' }

    # before do
    #   allow(ActionController::Parameters).to receive(:new)
    #     .and_return(ActionController::Parameters.new(user, password))
    # end

    context 'when calling the endpoint' do
      it 'hits the domain class' do
        domain = Session::Login.new(user.login, password)
        allow(Session::Login).to receive(:new).and_return(domain)
        expect(domain).to receive(:handle).once

        expect(subject).to have_http_status(:ok)
      end
    end

    context 'when user is not found' do
      it 'returns 404' do
      end
    end
  end
end
