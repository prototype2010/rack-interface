class TimeFormatValidator
  ALLOWED_TIME_PARAMS = %i[year month day hour minute second].freeze

  def initialize(time_format)
    @time_format = time_format
  end

  def validation_error
    return '"format" param was not provided' unless format_present?

    "Unknown time format [#{forbidden_params.join(',')}]" unless valid_format_elements?
  end

  def valid?
    format_present? && valid_format_elements?
  end

  private

  def format_present?
    !@time_format.nil? && @time_format.is_a?(String)
  end

  def valid_format_elements?
    @time_format.split(',').all? { |param| ALLOWED_TIME_PARAMS.include?(param.to_sym) }
  end

  def forbidden_params
    @time_format.split(',').reject { |element| ALLOWED_TIME_PARAMS.include?(element.to_sym) }
  end
end
