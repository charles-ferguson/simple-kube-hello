#!/usr/bin/env ruby
# frozen_string_literal: true

require 'sinatra'

get '/hi' do
  'Hey there! from my cluster'
end

get '/healthz' do
  'Sinatra Ok'
end
