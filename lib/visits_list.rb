#!/usr/bin/env ruby
# frozen_string_literal: true

require_relative './exceptions'
require_relative './validator'

# standing for visits list and contain ordering logic
class VisitsList
  attr_accessor :list

  def most_page_views
    map = {}
    @list.each do |visit|
      map[visit.webpage.strip.to_s] ||= []
      map[visit.webpage.strip.to_s] << visit.ip.strip
    end
    map = map.sort_by { |_k, v| -v.size }
    map.map { |k, v| [k, v.size] }
  end

  def most_unique_page_views
    map = {}
    @list.each do |visit|
      map[visit.webpage.strip.to_s] ||= []
      map[visit.webpage.strip.to_s] << visit.ip.strip
    end
    map = map.sort_by { |_k, v| -v.uniq.size }
    map.map { |k, v| [k, v.uniq.size] }
  end
end
