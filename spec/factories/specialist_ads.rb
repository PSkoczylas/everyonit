FactoryBot.define do
  factory :specialist_ad do
    title { Faker::Job.title }
    description { Faker::Lorem.paragraph }
    desired_salary { Faker::Number.number(digits: 5) }
    portfolio_url { Faker::Internet.url }
    user
  end
end

class MessagesController < ApplicationController
  def create
    @message = Message.new(message_params)
    if @message.save
      turbo_stream.prepend 'messages', partial: 'messages/message', locals: { message: @message }
    end
  end

  private

  def message_params
    params.require(:message).permit(:content, :user_id)
  end
end

