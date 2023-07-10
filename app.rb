require_relative 'initializer'

class App
  include Utils

  def call(env)
    @env = env

    ROUTES[path][:controller].new(@env).public_send(method)
  end
end
