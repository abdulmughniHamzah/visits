#!/usr/bin/env ruby
# frozen_string_literal: true

require_relative './exceptions'
require_relative './validator'
# standing for visit model
class Visit
  attr_reader :webpage, :ip

  def webpage=(page)
    raise ValidationError, 'Invalid webpage path' unless page.is_a?(String) && Validitor.take(page).webpage_path?

    @webpage = page
  end

  def ip=(ip)
    raise ValidationError, 'Invalid IP' unless ip.is_a?(String) && Validitor.take(ip).ip?

    @ip = ip
  end
end
