class TimeController
  def call(env)
    @request = Rack::Request.new(env)

    return no_method_error unless respond_to?(method_name)

    send(method_name)
  end

  def get
    format_validator = TimeFormatValidator.new(@request.params['format'])

    if format_validator.valid?
      formatted_time = TimeService.new.call(@request.params['format'])
      Rack::Response.new(formatted_time, 200).finish
    else
      Rack::Response.new(format_validator.validation_error, 400).finish
    end
  end

  private

  def no_method_error
    Rack::Response.new("No method #{method_name}", 400).finish
  end

  def method_name
    @request.env['REQUEST_METHOD'].downcase
  end
end
