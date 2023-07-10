require_relative '../initializer'

class TimeParamsValidator < BaseMiddleware
  ALLOWED_TIME_PARAMS = %i[year month day hour minute second].freeze

  def proceed
    return Rack::Response.new('"format" param was not provided', 400).finish unless @request.params.key?('format')

    time_format_elements = @request.params['format'].split(',')
    forbidden_time_elements = time_format_elements.reject { |element| ALLOWED_TIME_PARAMS.include?(element.to_sym) }

    unless forbidden_time_elements.empty?
      return Rack::Response.new("Unknown time format [#{forbidden_time_elements.join(',')}]", 400).finish
    end

    call_next
  end
end
