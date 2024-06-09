# frozen_string_literal: true

RSpec.describe 'SessionController' do
  describe '#login' do
    subject { post :login, params: { user: user, password: password } }

    let(:user) { User.create!(login: 'test', password: 'test') }
    let(:password) { 'test' }

    # before do
    #   allow(ActionController::Parameters).to receive(:new)
    #     .and_return(ActionController::Parameters.new(user, password))
    # end

    context 'when calling the endpoint' do
      it 'hits the domain class' do
        expect('::Session::Login').to receive(:handle).with(user.login, password)

        expect(subject).to have_http_status(:ok)
      end
    end

    context 'when user is not found' do
      it 'returns 404' do
      end
    end
  end
end
