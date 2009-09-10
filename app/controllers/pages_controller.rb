class PagesController < ApplicationController
  caches_page :display_page
  
  def display_page
    init_layout
    @layout ? render(:template => "pages#{request.path}", :layout => @layout) : render(:template => "pages#{request.path}")
  rescue ActionView::MissingTemplate
    @layout ? render(:template => "pages#{request.path}/index", :layout => @layout) : render(:template => "pages#{request.path}/index")
  end
  
  private
    def init_layout
      layout_path = File.join(Rails.root, "app/views/layouts/pages")
      if File.exist?(layout_path)
        potential_layout = request.path.split('/').reject { |x| x.blank? }.first
        Dir.chdir(layout_path) do
          matching_layout = Dir.glob("#{potential_layout}*")
          @layout = "pages#{request.path}" unless matching_layout.blank?
        end
      end
    end
end