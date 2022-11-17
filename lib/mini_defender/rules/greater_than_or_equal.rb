# frozen_string_literal: true

require_relative 'size'

class MiniDefender::Rules::GreaterThanOrEqual < MiniDefender::Rules::Size
  def self.signature
    'gte'
  end

  def passes?(attribute, value, validator)
    case value
    when String, Array, Hash
      value.length >= @size
    when ActionDispatch::Http::UploadedFile
      value.size >= @size
    when Numeric
      value >= @size
    else
      false
    end
  end

  def message(attribute, value, validator)
    case value
    when ActionDispatch::Http::UploadedFile
      "The file size must be greater than or equal to #{@size} bytes."
    when Numeric
      "The value must be greater than or equal to #{@size}."
    else
      "The value length must be greater than or equal to #{@size}."
    end
  end
end
