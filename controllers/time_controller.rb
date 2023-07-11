class TimeController
  def initialize(env)
    @request = Rack::Request.new(env)
  end

  def get
    Rack::Response.new(format_time, 200, {'Content-Type': 'text/plain' }).finish
  end

  private

  def format_time
    time = Time.new
    format_parts
      .map { |part| time.public_send(part) }
      .join('-')
  end

  def format_parts
    @request.params['format'].split(',').map(&:to_sym)
  end
end
