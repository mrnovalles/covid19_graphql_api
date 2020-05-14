require './app'
run Sinatra::Application

require 'rack-graphiql'
map '/graphiql' do
  run Rack::GraphiQL.new(endpoint: '/graphql')
end
