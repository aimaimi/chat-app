require 'rails_helper'

RSpec.describe Message, type: :model do
  describe '#create' do
    before do
      @message = FactoryBot.build(:message)
      @message.image = fixture_file_upload('public/images/test_image.png')
    end

    it 'contentとimageが存在していれば保存できること' do
      expect(@message).to be_valid
    end
    it 'contentが存在していれば保存できること' do
      @message.image = nil
      expect(@message).to be_valid
    end
    it 'imageが存在していれば保存できること' do
      @message.content = nil
      expect(@message).to be_valid
    end
    it 'contentとimageが空では保存できないこと' do
      @message.image = nil
      @message.content = nil
      @message.valid?
      expect(@message.errors.full_messages).to include("Content can't be blank")
    end
  end
end