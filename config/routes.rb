Rails.application.routes.draw do
  get("/photos", :controller => "photos", :action => "index")
  get("/photos/:id", :controller => "photos", :action => "show")
  post("/add_comment/:id", :controller => "photos", :action => "add_comment")
  post("photos_update/:id", :controller => "photos", :action => "update")
  get("/photos_delete/:id", :controller => "photos", :action => "destroy")
  post("/insert_photo", :controller => "photos", :action => "create")



  get("/", :controller => "users", :action => "index")
  post("/user_add", :controller => "users", :action => "create")
  get("/users/:username", :controller => "users", :action => "show")
  get("/users", :controller => "users", :action => "index")
  post("/user_update/:id", :controller => "users", :action => "update")

end
