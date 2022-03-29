# frozen_string_literal: true

FactoryBot.define do
  factory :visits_list do
    list { build_list(:visit, 2) }
  end
end
