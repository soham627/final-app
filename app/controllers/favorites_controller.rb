class FavoritesController < ApplicationController
  def index
    matching_favorites = Favorite.where({ :user_id => @current_user.id})
    @list_of_faves = matching_favorites.order({ :created_at => :desc })
    @map_to_jobs = @list_of_faves.map_relation_to_array(:job_id)
    @the_jobs_i_like = Job.where({ :id => @map_to_jobs})

    @list_of_favorites = matching_favorites.order({ :created_at => :desc })

    render({ :template => "favorites/index.html.erb" })
  end


  def create
    the_favorite = Favorite.new
    the_favorite.job_id = params.fetch("liked_job_id")
    the_favorite.user_id = @current_user.id

    if the_favorite.valid?
      the_favorite.save
      redirect_to("/jobs/#{the_favorite.job_id}")
    else
      redirect_to("/jobs/#{the_favorite.job_id}", { :alert => "Bookmark failed to create." })
    end
  end

  def update
    the_id = params.fetch("path_id")
    the_favorite = Favorite.where({ :id => the_id }).at(0)

    the_favorite.job_id = params.fetch("query_job_id")
    the_favorite.user_id = params.fetch("query_user_id")

    if the_favorite.valid?
      the_favorite.save
      redirect_to("/favorites/#{the_favorite.id}", { :notice => "Bookmark updated successfully."} )
    else
      redirect_to("/favorites/#{the_favorite.id}", { :alert => "Bookmark failed to update successfully." })
    end
  end

  def destroy
    the_id = params.fetch("path_id")
    the_favorite = Favorite.where({ :id => the_id }).at(0)
    jobid = the_favorite.job_id
    the_favorite.destroy

    redirect_to("/jobs/#{jobid}")
  end

   def delete_show
    the_id = params.fetch("path_id")
    the_favorite = Favorite.where({ :id => the_id }).at(0)
    jobid = the_favorite.job_id
    the_favorite.destroy

    redirect_to("/jobs/#{jobid}")
  end
end
