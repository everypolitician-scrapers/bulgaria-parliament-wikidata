#!/bin/env ruby
# encoding: utf-8

require 'scraperwiki'
require 'wikidata/fetcher'
require 'pry'
require 'rest-client'

@pages = [
  'Категория:Народни представители в 43 Народно събрание',
  'Категория:Народни представители в 42 Народно събрание',
  'Категория:Народни представители в 41 Народно събрание'
  'Категория:Народни представители в 40 Народно събрание',
  'Категория:Народни представители в 39 Народно събрание',
]

ids = @pages.map { |c| WikiData::Category.new(c, 'bg').wikidata_ids }.flatten.uniq
ids.each_with_index do |id, i|
  puts i if (i % 50).zero?
  data = WikiData::Fetcher.new(id: id).data('bg') or next
  ScraperWiki.save_sqlite([:id], data) rescue binding.pry
end
warn RestClient.post ENV['MORPH_REBUILDER_URL'], {} if ENV['MORPH_REBUILDER_URL']
