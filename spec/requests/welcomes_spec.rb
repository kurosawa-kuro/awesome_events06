require 'rails_helper'

RSpec.describe "Welcomes", type: :request do
  describe "GET /index" do
    let!(:past_event) { create(:event, start_at: 2.days.ago) }
    let!(:upcoming_event) { create(:event, start_at: 2.days.from_now) }

    before { get root_path }

    describe "response status" do
      it "returns http success" do
        expect(response).to have_http_status(:success)
      end
    end

    describe "response body" do
      subject { response.body }

      it { is_expected.to include('<h1>イベント一覧</h1>') }
      it { is_expected.to include("<h5 class='list-group-item-heading'>Sample Event</h5>") }
    end

    describe "assigns events" do
      it "assigns upcoming events to @events" do
        expect(assigns(:events)).to match_array([upcoming_event])
      end
    end
  end
end
