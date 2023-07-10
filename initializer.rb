require 'rack'
require 'time'

require_relative 'utils'

require_relative 'controllers/time_controller'

require_relative 'middleware/base_middleware'
require_relative 'middleware/route_check'
require_relative 'middleware/time_params_validator'

require_relative 'routes'
require_relative 'app'
