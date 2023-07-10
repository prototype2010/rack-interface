require_relative 'initializer'

use Rack::Reloader, 0
use RouteCheck
use TimeParamsValidator

run App.new
