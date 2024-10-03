Rails.application.routes.draw do
  get("/photos", :controller => "photos", :action => "index")
  get("/photos/:id", :controller => "photos", :action => "show")
  post("/add_comment/:id", :controller => "photos", :action => "add_comment")

  get("/", :controller => "users", :action => "index")
  get("/users", :controller => "users", :action => "index")
  get("/users/:the_id", :controller => "users", :action => "show")
end
