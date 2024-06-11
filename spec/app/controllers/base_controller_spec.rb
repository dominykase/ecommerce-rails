# frozen_string_literal: true

require 'rails_helper'

class Request
  def initialize(auth_header)
    @header = auth_header
  end

  def header
    @header
  end
end

RSpec.describe BaseController, type: :controller do
  describe '#authorize_request' do
    subject { described_class.new.authorize_request }

    let(:user) { create(:user) }
    let(:header) { { 'Authorization' => "Bearer #{JWT.encode({user: user, exp: Time.current})}" } }

    context 'when calling the endpoint with correct JWT token' do
      it 'returns a user' do

      end
    end
  end
end
