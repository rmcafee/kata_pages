class KataPagesRoutes
  def self.draw(map)
    map.connect '*path', :controller => 'pages', :action => 'display_page'
  end
end