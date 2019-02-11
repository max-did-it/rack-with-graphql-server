require 'rack'
require 'mongoid'
require 'json'
require 'graphql'
require_relative 'graphql_server'
require_relative 'graphql/resolvers'
# require models
Dir[File.join(File.dirname(__FILE__), 'db/models', '**', '*.rb')].sort.each {|file| require file }
# Mongo init
# Configurate mongoid & mongo driver
p Mongoid.load!(File.expand_path("./db/database.yml"), :development)
# GraphQL init
schemaFile = File.read("schema.graphql")
resolver = Resolver.new()
graphQL = GraphQL::Schema.from_definition(schemaFile, default_resolve: resolver.resolvers)

# Run server
context = {}#:users => users}
run GraphqlServer.new(schema: graphQL, context: context )


