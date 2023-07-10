require_relative 'initializer'

ROUTES = {
  '/time': {
    controller: TimeController,
    methods: [:get]
  }
}.freeze
