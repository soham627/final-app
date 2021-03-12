class IndustriesController < ApplicationController
  skip_before_action(:force_user_sign_in, { :only => [:index, :show]})
  def index
    matching_industries = Industry.all

    @list_of_industries = matching_industries.order({ :created_at => :desc })

    render({ :template => "industries/index.html.erb" })
  end

  def show
    the_id = params.fetch("path_id")

    matching_industries = Industry.where({ :id => the_id })

    @the_industry = matching_industries.at(0)

    render({ :template => "industries/show.html.erb" })
  end

  def create
    the_industry = Industry.new
    the_industry.name = params.fetch("query_name")
    the_industry.jobs_count = params.fetch("query_jobs_count")

    if the_industry.valid?
      the_industry.save
      redirect_to("/industries", { :notice => "Industry created successfully." })
    else
      redirect_to("/industries", { :notice => "Industry failed to create successfully." })
    end
  end

  def update
    the_id = params.fetch("path_id")
    the_industry = Industry.where({ :id => the_id }).at(0)

    the_industry.name = params.fetch("query_name")
    the_industry.jobs_count = params.fetch("query_jobs_count")

    if the_industry.valid?
      the_industry.save
      redirect_to("/industries/#{the_industry.id}", { :notice => "Industry updated successfully."} )
    else
      redirect_to("/industries/#{the_industry.id}", { :alert => "Industry failed to update successfully." })
    end
  end

  def destroy
    the_id = params.fetch("path_id")
    the_industry = Industry.where({ :id => the_id }).at(0)

    the_industry.destroy

    redirect_to("/industries", { :notice => "Industry deleted successfully."} )
  end
end
