require 'rails_helper'

RSpec.describe EventsController, type: :request do
  include ActionDispatch::TestProcess::FixtureFile

  let(:user) { create(:user) }
  let(:image) { fixture_file_upload(Rails.root.join('spec/fixtures/sample_image.png'), 'image/png') }

  before { sign_in_as(user) }

  describe "POST /events" do
    subject { post events_path, params: event_params }

    context "with valid parameters including an image" do
      let(:event_params) do
        {
          event: attributes_for(:event,
                                name: "Sample Event",
                                place: "Sample Place",
                                start_at: Time.now + 1.day,
                                end_at: Time.now + 2.days,
                                content: "Sample Content",
                                image: image) # PNG画像データを含める
        }
      end

      it "creates a new event with an image" do
        expect { subject }.to change(Event, :count).by(1)
        expect(Event.last.image).to be_attached # 画像が添付されているか確認
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
                                content: "",
                                image: nil) # 画像は無効なパラメーターとしてnilを設定
        }
      end

      it "does not create a new event" do
        expect { subject }.not_to change(Event, :count)
      end

      it "renders the 'new' template" do
        subject
        expect(response).to render_template(:new)
      end
    end
  end
end
