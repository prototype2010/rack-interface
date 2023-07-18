class TimeService
  def call(time_format)
    format_time(time_format)
  end

  private

  def format_time(time_format)
    time = Time.new
    time_format
      .split(',')
      .map { |element| time.public_send(element.to_sym) }
      .join('-')
  end
end
