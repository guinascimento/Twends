ActionController::Routing::Routes.draw do |map|
  map.trend '/tweets/:trend', :controller => 'trends', :action => 'tweets'
  map.search '/tweets', :controller => 'trends', :action => 'search'

  map.root :controller => "trends", :action => "minute"

  map.connect ':controller/:action'
end