require 'tk'

module Pickaxe
  module Editor
    class TextComp < Tk::Text
      attr_accessor :file_name

      def initialize parent, file_name=nil
        super parent

        @file_name = file_name

        bind 'Control-s' do |event|
          text = event.widget
          if text.file_name
            File.write text.file_name, text.get('1.0', :end)[...-1]
          else
            raise 'Editor does not have a file name.'
          end
        end
        bind 'Control-Shift-S' do |event|
          text = event.widget
          file_name = Tk::getSaveFile
          unless file_name.empty?
            text.file_name = file_name
            File.write text.file_name, text.get('1.0', :end)[...-1]
          end
        end
      end
    end
  end
end
