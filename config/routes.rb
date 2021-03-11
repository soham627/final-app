Rails.application.routes.draw do



  # Routes for the Interested industry resource:

  # CREATE
  post("/insert_interested_industry", { :controller => "interested_industries", :action => "create" })
          
  # READ
  get("/interested_industries", { :controller => "interested_industries", :action => "index" })
  
  get("/interested_industries/:path_id", { :controller => "interested_industries", :action => "show" })
  
  # UPDATE
  
  post("/modify_interested_industry/:path_id", { :controller => "interested_industries", :action => "update" })
  
  # DELETE
  get("/delete_interested_industry/:path_id", { :controller => "interested_industries", :action => "destroy" })

  #------------------------------

  # Routes for the Industry resource:

  # CREATE
  post("/insert_industry", { :controller => "industries", :action => "create" })
          
  # READ
  get("/industries", { :controller => "industries", :action => "index" })
  
  get("/industries/:path_id", { :controller => "industries", :action => "show" })
  
  # UPDATE
  
  post("/modify_industry/:path_id", { :controller => "industries", :action => "update" })
  
  # DELETE
  get("/delete_industry/:path_id", { :controller => "industries", :action => "destroy" })

  #------------------------------

  # Routes for the Favorite resource:

  # CREATE
  post("/insert_favorite", { :controller => "favorites", :action => "create" })
          
  # READ
  get("/favorites", { :controller => "favorites", :action => "index" })
  
  get("/favorites/:path_id", { :controller => "favorites", :action => "show" })
  
  # UPDATE
  
  post("/modify_favorite/:path_id", { :controller => "favorites", :action => "update" })
  
  # DELETE
  get("/delete_favorite/:path_id", { :controller => "favorites", :action => "destroy" })

  #------------------------------

  # Routes for the Job resource:

  # CREATE
  post("/insert_job", { :controller => "jobs", :action => "create" })
          
  # READ
  get("/jobs", { :controller => "jobs", :action => "index" })
  
  get("/jobs/:path_id", { :controller => "jobs", :action => "show" })
  
  # UPDATE
  
  post("/modify_job/:path_id", { :controller => "jobs", :action => "update" })
  
  # DELETE
  get("/delete_job/:path_id", { :controller => "jobs", :action => "destroy" })

  #------------------------------

  # Routes for the User account:

  # SIGN UP FORM
  get("/user_sign_up", { :controller => "user_authentication", :action => "sign_up_form" })        
  # CREATE RECORD
  post("/insert_user", { :controller => "user_authentication", :action => "create"  })
      
  # EDIT PROFILE FORM        
  get("/edit_user_profile", { :controller => "user_authentication", :action => "edit_profile_form" })       
  # UPDATE RECORD
  post("/modify_user", { :controller => "user_authentication", :action => "update" })
  
  # DELETE RECORD
  get("/cancel_user_account", { :controller => "user_authentication", :action => "destroy" })

  # ------------------------------

  # SIGN IN FORM
  get("/user_sign_in", { :controller => "user_authentication", :action => "sign_in_form" })
  # AUTHENTICATE AND STORE COOKIE
  post("/user_verify_credentials", { :controller => "user_authentication", :action => "create_cookie" })
  
  # SIGN OUT        
  get("/user_sign_out", { :controller => "user_authentication", :action => "destroy_cookies" })
             
  #------------------------------

end
