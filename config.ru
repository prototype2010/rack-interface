require_relative 'initializer'

use Rack::Reloader, 0
use Rack::ContentType, 'text/plain'

run Rack::URLMap.new(ROUTES)
