# frozen_string_literal: true

# custom validator
class ValidationError < StandardError
  def message(msg = nil)
    @message = msg || 'In Valid'
  end
end
