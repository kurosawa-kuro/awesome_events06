require 'rails_helper'

RSpec.describe SessionsController, type: :request do
  let(:user) { create(:user) }

  describe 'Sessions' do
    context 'when logging in via GET /auth/:provider/callback' do
      before { sign_in_as(user) }

      it 'logs in a user' do
        follow_redirect!
        expect(request.session[:user_id]).to eq user.id
        expect(flash[:notice]).to eq 'ログインしました'
      end
    end

    context 'when logging out via DELETE /logout' do
      before { sign_in_as(user) }

      it 'logs out the user' do
        expect(request.session[:user_id]).to eq(user.id)
        delete "/logout"
        expect(request.session[:user_id]).to be_nil
        expect(response).to redirect_to(root_path)
        expect(flash[:notice]).to eq 'ログアウトしました'
      end
    end
  end
end
