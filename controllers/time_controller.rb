class TimeController
  def call(env)
    @request = Rack::Request.new(env)

    return no_method_error unless respond_to?(method_name)

    send(method_name)
  end

  def get
    TimeService.new(@request).call
  end

  private

  def no_method_error
    Rack::Response.new("No method #{method_name}", 400).finish
  end

  def method_name
    @request.env['REQUEST_METHOD'].downcase
  end
end
