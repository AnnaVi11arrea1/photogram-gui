Rails.application.routes.draw do
  get("/photos", :controller => "photos", :action => "index")
  get("/photos/:path_id", :controller => "photos", :action => "show")

  get("/", :controller => "users", :action => "index")
  get("/users", :controller => "users", :action => "index")
  get("/users/:the_id", :controller => "users", :action => "show")
end
