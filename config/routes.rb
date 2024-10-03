Rails.application.routes.draw do
  get("/photos", :controller => "photos", :action => "index")
  get("/photos/:id", :controller => "photos", :action => "show")
  post("/add_comment/:id", :controller => "photos", :action => "add_comment")
  post("photos_update/:id", :controller => "photos", :action => "update")

  get("/", :controller => "users", :action => "index")
  get("/users", :controller => "users", :action => "index")
  get("/users/:the_id", :controller => "users", :action => "show")
  post("/user_add", :controller => "users", :action => "create")
  post("/user_update/:the_id", :controller => "users", :action => "update")
end
