require_relative 'app'

module Pickaxe
  class AppSpec
    it_is_initialized_successfully
      app = Pickaxe::App.new

      raise 'App is not initialized successfully' unless app.is_a? Pickaxe::App
    end
  end
end
