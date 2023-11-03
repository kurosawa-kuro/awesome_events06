require 'rails_helper'

RSpec.describe EventsController, type: :request do
  let(:user) { create(:user) }

  before { sign_in_as(user) }

  describe "POST /events" do
    subject { post events_path, params: event_params }

    context "with valid parameters" do
      let(:event_params) do
        {
          event: attributes_for(:event, 
                                name: "Sample Event", 
                                place: "Sample Place", 
                                start_at: Time.now + 1.day, 
                                end_at: Time.now + 2.days, 
                                content: "Sample Content")
        }
      end

      it "creates a new event" do
        expect { subject }.to change(Event, :count).by(1)
      end

      it "redirects to the created event with a success notice" do
        subject
        expect(response).to redirect_to(event_path(Event.last))
        expect(flash[:notice]).to eq "作成しました"
      end
    end

    context "with invalid parameters" do
      let(:event_params) do
        {
          event: attributes_for(:event, 
                                name: "", 
                                place: "", 
                                start_at: nil, 
                                end_at: nil, 
                                content: "")
        }
      end

      it "does not create a new event" do
        expect { subject }.to_not change(Event, :count)
      end

      it "renders the 'new' template" do
        subject
        expect(response).to render_template(:new)
      end
    end
  end
end
