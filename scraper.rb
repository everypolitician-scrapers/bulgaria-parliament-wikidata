#!/bin/env ruby
# encoding: utf-8

require 'wikidata/fetcher'

@pages = [
  'Категория:Народни представители в 44 Народно събрание',
  'Категория:Народни представители в 43 Народно събрание',
  'Категория:Народни представители в 42 Народно събрание',
  'Категория:Народни представители в 41 Народно събрание',
  'Категория:Народни представители в 40 Народно събрание',
  'Категория:Народни представители в 39 Народно събрание'
]
names = @pages.map { |c| WikiData::Category.new(c, 'bg').member_titles }.flatten.uniq

sparq = 'SELECT DISTINCT ?item WHERE { ?item p:P39/ps:P39 wd:Q18924508 }'
ids = EveryPolitician::Wikidata.sparql(sparq)

EveryPolitician::Wikidata.scrape_wikidata(ids: ids, names: { bg: names })
