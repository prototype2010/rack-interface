class TimeService
  ALLOWED_TIME_PARAMS = %i[year month day hour minute second].freeze

  def initialize(request)
    @request = request
  end

  def call
    return invalid_query_param_error unless valid_query_param?
    return format_elements_error unless valid_format_elements?

    Rack::Response.new(format_time, 200).finish
  end

  private

  def valid_query_param?
    @request.params.key?('format')
  end

  def valid_format_elements?
    format_parts.all? { |param| ALLOWED_TIME_PARAMS.include?(param.to_sym) }
  end

  def invalid_query_param_error
    Rack::Response.new('"format" param was not provided', 400).finish
  end

  def format_elements_error
    Rack::Response.new("Unknown time format [#{forbidden_params.join(',')}]", 400).finish
  end

  def forbidden_params
    format_parts.reject { |element| ALLOWED_TIME_PARAMS.include?(element.to_sym) }
  end

  def format_time
    time = Time.new
    format_parts
      .map { |part| time.public_send(part.to_sym) }
      .join('-')
  end

  def format_parts
    @request.params['format'].split(',')
  end
end
