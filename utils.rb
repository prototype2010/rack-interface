module Utils
  def method
    @env['REQUEST_METHOD'].downcase.to_sym
  end

  def path
    @env['REQUEST_PATH'].to_sym
  end
end
