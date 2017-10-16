#!/bin/env ruby
# encoding: utf-8

require 'wikidata/fetcher'

@pages = [
  'Категория:Народни представители в 44 Народно събрание',
  'Категория:Народни представители в 43 Народно събрание',
  'Категория:Народни представители в 42 Народно събрание',
  'Категория:Народни представители в 41 Народно събрание',
  'Категория:Народни представители в 40 Народно събрание',
  'Категория:Народни представители в 39 Народно събрание',
]

names = @pages.map { |c| WikiData::Category.new(c, 'bg').member_titles }.flatten.uniq
EveryPolitician::Wikidata.scrape_wikidata(names: { bg: names })

