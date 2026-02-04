class FlashMessagesComponent < ViewComponent::Base
  def initialize(flash:)
    @flash = flash
  end

  def render?
    @flash.any?
  end

  def flash_messages
    @flash.select { |_type, message| message.present? }
  end
end