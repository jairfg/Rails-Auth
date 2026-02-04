# Toast notification component that displays flash messages with different styles based on type
class ToastComponent < ViewComponent::Base
  # Configuration hash for different toast types including colors, icons, and styling
  TOAST_CONFIGS = {
    notice: {
      bg_color: "bg-green-50",
      border_color: "border-green-400",
      icon: "fa-check-circle",
      icon_bg: "bg-green-400",
      icon_color: "text-white",
      title: "Success",
      close_color: "text-green-500",
      close_hover: "hover:text-green-700"
    },
    alert: {
      bg_color: "bg-red-50",
      border_color: "border-red-400",
      icon: "fa-exclamation-circle",
      icon_bg: "bg-red-400",
      icon_color: "text-white",
      title: "Error",
      close_color: "text-red-500",
      close_hover: "hover:text-red-700"
    }
  }.freeze

  attr_reader :type, :message

  def initialize(type:, message:)
    @type = type.to_sym
    @message = message
  end

  def render? = message.present?

  def toast_config = TOAST_CONFIGS[type]
end