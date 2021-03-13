class InterestedIndustriesController < ApplicationController
  def index
    matching_interested_industries = InterestedIndustry.where({:user_id => @current_user.id})

    @list_of_interested_industries = matching_interested_industries.order({ :created_at => :desc })
    @map_to_industries = @list_of_interested_industries.map_relation_to_array(:industry_id)
    @listed_and_liked = Industry.where({ :id => @map_to_industries})

    @liked_inds = InterestedIndustry.where({ :user_id => @current_user.id})
    @ind_ids = @liked_inds.map_relation_to_array(:industry_id)
    @left_industries = Industry.where.not({:id => @ind_ids})
    
    render({ :template => "interested_industries/index.html.erb" })
  end

  def show
    the_id = params.fetch("path_id")

    matching_interested_industries = InterestedIndustry.where({ :id => the_id })

    @the_interested_industry = matching_interested_industries.at(0)

    render({ :template => "interested_industries/show.html.erb" })
  end

  def create
    the_interested_industry = InterestedIndustry.new
    the_interested_industry.industry_id = params.fetch("query_interest_id")
    the_interested_industry.user_id = @current_user.id

    if the_interested_industry.valid?
      the_interested_industry.save
      redirect_to("/interested_industries", { :notice => "Interested industry created successfully." })
    else
      redirect_to("/interested_industries", { :notice => "Interested industry failed to create successfully." })
    end
  end

  def follow 

    the_interested_industry = InterestedIndustry.new
    the_interested_industry.industry_id = params.fetch("show_interest_id")
    the_interested_industry.user_id = @current_user.id
    if the_interested_industry.valid?
      the_interested_industry.save
      redirect_to("/interested_industries", { :notice => "Interested industry created successfully." })
    else
      redirect_to("/interested_industries", { :notice => "Interested industry failed to create successfully." })
    end
  end 

  def update
    the_id = params.fetch("path_id")
    the_interested_industry = InterestedIndustry.where({ :id => the_id }).at(0)

    the_interested_industry.industry_id = params.fetch("query_industry_id")
    the_interested_industry.user_id = params.fetch("query_user_id")

    if the_interested_industry.valid?
      the_interested_industry.save
      redirect_to("/interested_industries/#{the_interested_industry.id}", { :notice => "Interested industry updated successfully."} )
    else
      redirect_to("/interested_industries/#{the_interested_industry.id}", { :alert => "Interested industry failed to update successfully." })
    end
  end

  def destroy
    the_id = params.fetch("path_id")
    the_interested_industry = InterestedIndustry.where({ :id => the_id }).at(0)

    the_interested_industry.destroy

    redirect_to("/interested_industries", { :notice => "Interested industry deleted successfully."} )
  end
end
