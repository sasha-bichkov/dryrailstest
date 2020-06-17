# frozen_string_literal: true

require 'rails_helper'

describe ApplicationController, type: :controller do
  
  describe '#test' do
    let(:users_new_double) { instance_double(Users::New) }

    before do
      Dryrailstest::Container.stub('users.new', users_new_double)
    end

    context 'if age is negative' do
      it 'has status unprocessable entity' do
        allow(users_new_double).to receive(:call).with(age: 15, name: 'Alexander').and_return(false)

        post :test

        expect(response).to have_http_status(:unprocessable_entity)
      end
    end

    context 'if age is positive' do
      it 'has status ok' do
        allow(users_new_double).to receive(:call).with(age: 15, name: 'Alexander').and_return(true)

        post :test

        expect(response).to have_http_status(:ok)
      end
    end
  end

end
