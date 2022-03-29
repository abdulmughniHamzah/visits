# frozen_string_literal: true

FactoryBot.define do
  factory :visit do
    webpage { '/home' }
    ip { '192.168.1.1' }
  end
end
