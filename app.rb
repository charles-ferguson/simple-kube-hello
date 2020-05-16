#!/usr/bin/env ruby
# frozen_string_literal: true

require 'sinatra'
require 'rack'
require 'prometheus/middleware/collector'
require 'prometheus/middleware/exporter'

use Rack::Deflater, if: ->(_, _, _, body) { body.any? && body[0].length > 512 }
use Prometheus::Middleware::Collector
use Prometheus::Middleware::Exporter

set :bind, '0.0.0.0'
set :port, 4567

get '/hi' do
  'Hey there! from my cluster'
end

get '/healthz' do
  'Sinatra Ok'
end
