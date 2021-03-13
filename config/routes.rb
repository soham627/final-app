Rails.application.routes.draw do


  get("/", { :controller => "jobs", :action => "home"})
  # Routes for the Rating resource:

  # CREATE
  post("/insert_rating", { :controller => "ratings", :action => "create" })
          
  # READ
  get("/ratings", { :controller => "ratings", :action => "index" })
  
  get("/ratings/:path_id", { :controller => "ratings", :action => "show" })
  
  # UPDATE
  
  post("/modify_rating/:path_id", { :controller => "ratings", :action => "update" })
  
  # DELETE
  get("/delete_rating/:path_id", { :controller => "ratings", :action => "destroy" })

  #------------------------------

  # Routes for the Organization resource:

  # CREATE
  post("/insert_organization", { :controller => "organizations", :action => "create" })
          
  # READ
  get("/organizations", { :controller => "organizations", :action => "index" })
  
  get("/organizations/:path_id", { :controller => "organizations", :action => "show" })
  
  # UPDATE
  
  post("/modify_organization/:path_id", { :controller => "organizations", :action => "update" })
  
  # DELETE
  get("/delete_organization/:path_id", { :controller => "organizations", :action => "destroy" })

  #------------------------------

  # Routes for the Interested industry resource:

  # CREATE
  post("/insert_interested_industry", { :controller => "interested_industries", :action => "create" })
  post("/follow_from_show", { :controller => "interested_industries", :action => "follow" })
          
  # READ
  get("/interested_industries", { :controller => "interested_industries", :action => "index" })
  
  get("/interested_industries/:path_id", { :controller => "interested_industries", :action => "show" })
  
  # UPDATE
  
  post("/modify_interested_industry/:path_id", { :controller => "interested_industries", :action => "update" })
  
  # DELETE
  get("/delete_interested_industry/:path_id", { :controller => "interested_industries", :action => "destroy" })
  get("/delete_from_show/:path_id", { :controller => "interested_industries", :action => "destroy_show" })

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
  get("/delete_fave/:path_id", { :controller => "favorites", :action => "delete_show" })

  #------------------------------

  # Routes for the Job resource:
  get("/jobs/creator", { :controller => "jobs", :action => "job_form" })

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
