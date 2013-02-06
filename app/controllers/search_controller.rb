require 'open-uri'

class SearchController < ApplicationController
  layout 'cmu_sv'
  before_filter :authenticate_user!

  def self.index_tank
    @api = IndexTank::Client.new(ENV['SEARCHIFY_API_URL'] || 'http://your_api_url')
    @index ||= @api.indexes(ENV['SEARCHIFY_INDEX'] || 'cmux')
    @index
  end

  # retrieve docs from IndexTank
  def self.search(query)
    index_tank.search("#{query} OR title:#{query}", :fetch => 'timestamp,url,text,title', :snippet => 'text')
  end

  def index
    query = params[:query]
    new_query = query.gsub(/[^a-zA-Z 0-9]/," ").strip
    flash[:notice] = "We've replaced your query \"#{query}\" with \"#{new_query}\"" if new_query != query

    @docs = SearchController.search(new_query)
  end
end
