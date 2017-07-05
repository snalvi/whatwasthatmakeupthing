class ApplicationController < ActionController::Base
  def root
  	render html: "hola muchachas"
  end
end
