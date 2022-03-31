# frozen_string_literal: true

require_relative '../lib/visit'
require_relative '../lib/visits_list'

RSpec.describe VisitsList do
  let(:list) do
    load_fixture('fixtures/webserver.yml')['visits']
  end
  # before do
  #   data = load_fixture('fixtures/webserver.yml')
  #   @list = data['visits']
  # end

  context 'when built' do
    it 'has the attribute `list`' do
      expect(visits_list).to respond_to('list')
    end

    it 'has method `most_page_views`' do
      expect(visits_list).to respond_to('most_page_views')
    end

    it 'has method `most_unique_page_views`' do
      expect(visits_list).to respond_to('most_unique_page_views')
    end
  end

  context 'when given list of 12 visits' do
    it 'build the list' do
      expect(visits_list.list.size).to eq(12)
    end
  end

  context 'when calling `most_page_views`' do
    it 'returns list of webpages with most page views ordered from most pages views to less page views' do
      expected = [['/home', 5], ['/contact', 4], ['/about/2', 3]]
      expect(visits_list.most_page_views).to eq(expected)
    end
  end

  context 'when calling `most_unique_page_views`' do
    it 'returns ordered list of webpages with most unique page views' do
      expected = [['/about/2', 3], ['/contact', 2], ['/home', 1]]
      expect(visits_list.most_unique_page_views).to eq(expected)
    end
  end

  def visits_list
    mapped_list = list.map do |line|
      a_visit = instance_double(Visit)
      add_stubs(a_visit, line)
      a_visit
    end

    build(:visits_list, list: mapped_list)
  end

  def add_stubs(dbl, line)
    allow(dbl).to receive(:webpage) { line.gsub(/\s+/m, ' ').strip.split(/\s/)[0] }
    allow(dbl).to receive(:ip) { line.gsub(/\s+/m, ' ').strip.split(/\s/)[1] }
  end

  def load_fixture(fixture)
    YAML.safe_load(File.read(File.join(__dir__, fixture)))
  end
end
