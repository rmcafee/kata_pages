ActionController::Routing::Routes.draw do |map|
  map.connect '*path', :controller => 'pages', :action => 'display_page'
end