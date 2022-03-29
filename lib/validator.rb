#!/usr/bin/env ruby
# frozen_string_literal: true

# simple validator
class Validitor
  attr_writer :token

  @instance = new
  private_class_method :new

  def self.take(token)
    @instance.token = token
    @instance
  end

  def webpage_path?
    !!@token.match(%r{^(/[a-zA-Z1-9]+)+$})
  end

  def ip?
    !!@token.match(/^(?:(?:25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)\.){3}(?:25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)$/)
  end
end
