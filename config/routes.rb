ActionController::Routing::Routes.draw do |map|
  map.public_profile '/tweets/:trend', :controller => 'trends', :action => 'tweets'

  map.root :controller => "trends", :action => "minute"

  map.connect ':controller/:action'
end
