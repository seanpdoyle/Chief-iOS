class AppDelegate < PM::Delegate
  include PM::Styling
  status_bar true, animation: :true

  def on_load(app, options)
    open SpotsScreen.new(nav_bar:true)
  end
end
