require File.expand_path('../../config/environment', __FILE__)
require "fastladder/crawler"

module Fastladder
  class Crawler
    def run_once
      @interval = 0
      run_loop
    end
  end
end

Fastladder::Crawler.new(Rails.logger).run_once
