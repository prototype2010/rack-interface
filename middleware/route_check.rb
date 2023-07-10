require_relative '../initializer'

class RouteCheck < BaseMiddleware
  def proceed
    return Rack::Response.new("No matched route for #{path}", 404).finish unless ROUTES.key?(path)

    unless ROUTES[path][:methods].include?(method)
      return Rack::Response.new("No matched method #{method} for #{path}", 404).finish
    end

    call_next
  end
end
