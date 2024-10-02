Rails.application.routes.draw do
  get("/", :controller => "users", :action => "index")
  get("/users", :controller => "users", :action => "index")
  get("/users/:the_id", :controller => "users", :action => "show")
end
