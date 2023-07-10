require_relative '../initializer'

class BaseMiddleware
  include Utils

  def initialize(app)
    @app = app
  end

  def init_request_params(env)
    @env = env
    @request = Rack::Request.new(@env)
    @path = @request.path
  end

  def call(env)
    init_request_params(env)

    response = proceed
    return call_next if response.nil?

    response
  end

  def call_next
    @app.call(@env)
  end

  protected

  def proceed
    raise NotImplementedError("#{__method__} should be overridden by child class")
  end
end
