# frozen_string_literal: true

module State
  # Abstract class for all payment states
  class Interface
    # @abstract
    def init_payment
      raise NotImplementedError, "#{self.class} has not implemented method '#{__method__}'"
    end
  end
end
