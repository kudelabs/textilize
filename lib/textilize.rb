require 'textilize/helper'
ActiveSupport.on_load(:action_view) do
  include Textilize::Helper
end

