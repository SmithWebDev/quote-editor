class ApplicationController < ActionController::Base
  before_action -> { sleep 1.5 }
end
