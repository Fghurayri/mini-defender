# frozen_string_literal: true

require_relative 'accepted'

class MiniDefender::Rules::AcceptedIf < MiniDefender::Rules::Accepted
  def initialize(target, value)
    raise ArgumentError, 'Target must be a string' unless target.is_a?(String)

    @target = target
    @value = value
  end

  def self.signature
    'accepted_if'
  end

  def self.make(args)
    raise ArgumentError, 'Target and expected value are required.' unless args.length == 2

    self.new(args[0], args[1])
  end

  def active?(validator)
    validator.dig(@target) === @value
  end
end
