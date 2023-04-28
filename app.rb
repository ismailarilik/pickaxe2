# <a
#   href="https://www.flaticon.com/free-icons/pickaxe"
#   title="pickaxe icons"
# >
#   Pickaxe icons created by Smashicons - Flaticon
# </a>

require 'stringio'
require 'tk'
require_relative 'window'

module Pickaxe
  class MyStringIO < StringIO
    def initialize text_output
      @text_output = text_output
    end

    def write str
      @text_output.insert :end, str
    end
  end

  class App
    def initialize
      @window = Window.new(
        title: 'Pickaxe',
        iconphoto: ::TkPhotoImage.new(file: 'icon.png')
      )

      text_output = Tk::Text.new @window
      text_output.pack

      $stdout = MyStringIO.new text_output
    end

    def start
      @window.mainloop
    end
  end
end
