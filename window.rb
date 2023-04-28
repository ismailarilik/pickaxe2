require 'tk'
require_relative 'editor/text_comp'

module Pickaxe
  class Window < Tk::Root
    def initialize ...
      super

      notebook = Ttk::Notebook.new self
      notebook.pack

      bind 'Control-n' do
        text = Editor::TextComp.new notebook
        notebook.add text
      end

      bind 'Control-o' do
        file_name = Tk::getOpenFile
        unless file_name.empty?
          text = Editor::TextComp.new notebook, file_name
          notebook.add text

          text.insert :end, File.read(text.file_name)
        end
      end

      bind 'Control-r' do
        `ruby pickaxe.rb`
      end
    end
  end
end
