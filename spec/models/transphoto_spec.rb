require 'rails_helper'

RSpec.describe Transphoto, type: :model do
  before do
    @transphoto = FactoryBot.build(:transphoto)
  end

  describe '投稿' do
    context '投稿できる場合' do
      it 'title、from_to、messageとimageが存在していれば保存できる' do
        expect(@transphoto).to be_valid
      end
    end
    context '投稿できない場合' do
      it 'titleが空では保存できない' do
        @transphoto.title = ''
        @transphoto.valid?
        expect(@transphoto.errors.full_messages).to include("Title can't be blank")
      end
      it 'from_toが空では保存できない' do
        @transphoto.from_to = ''
        @transphoto.valid?
        expect(@transphoto.errors.full_messages).to include("From to can't be blank")
      end
      it 'messageが空では保存できない' do
        @transphoto.message = ''
        @transphoto.valid?
        expect(@transphoto.errors.full_messages).to include("Message can't be blank")
      end
      it 'imageが空では保存できない' do
        @transphoto.image = nil
        @transphoto.valid?
        expect(@transphoto.errors.full_messages).to include("Image can't be blank")
      end
      it 'userが紐付いていないと保存できない' do
        @transphoto.user = nil
        @transphoto.valid?
        expect(@transphoto.errors.full_messages).to include('User must exist')
      end
    end
  end
end