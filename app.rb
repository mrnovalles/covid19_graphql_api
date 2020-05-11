require "sinatra"
require "sinatra/json"
require "sinatra/reloader"
require 'rack/contrib'

require "graphql"



Dir.glob("graphql/types/*.rb").each do |f|
  require_relative f
end
require_relative "graphql/schema.rb"
require_relative "graphql/query_type.rb"

use Rack::PostBodyContentTypeParser

post '/graphql' do
  result  = Schema.execute(
    query: params[:query],
    variables: params[:variables],
    context: { current_user: nil },
  )
  json result
end