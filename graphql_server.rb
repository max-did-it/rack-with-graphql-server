class GraphqlServer  
  def initialize(schema: nil, context: {})
    @schema = schema
    @context = context
  end

  def response(body)
    [
      200, {
        "Contnet-Type" => "application/json"
      },
      [body]
    ]
  end

  def call(env)
    request = Rack::Request.new(env)
    req = JSON.parse(request.body.read)
    body = @schema.execute(
      req['query'],
      variables: req["variables"],
      operation_name: req["operationName"],
      context: @context
    )
    # request.logger.info("hwllo")
    response(body.to_h.to_json)
  end
end


