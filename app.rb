#!/usr/bin/env ruby
# frozen_string_literal: true

require 'sinatra'

set :bind, '0.0.0.0'
set :port, 4567

get '/hi' do
  'Hey there! from my cluster'
end

get '/healthz' do
  'Sinatra Ok'
end
