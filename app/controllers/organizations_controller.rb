class OrganizationsController < ApplicationController
  skip_before_action(:force_user_sign_in, { :only => [:index, :show]})
  def index
    matching_organizations = Organization.all

    @list_of_organizations = matching_organizations.order({ :created_at => :desc })

    render({ :template => "organizations/index.html.erb" })
  end

  def show
    the_id = params.fetch("path_id")

    matching_organizations = Organization.where({ :id => the_id })

    @the_organization = matching_organizations.at(0)

    render({ :template => "organizations/show.html.erb" })
  end

  def create
    the_organization = Organization.new
    the_organization.website = params.fetch("query_website")
    the_organization.name = params.fetch("query_name")

    if the_organization.valid?
      the_organization.save
      redirect_to("/organizations", { :notice => "Organization created successfully." })
    else
      redirect_to("/organizations", { :notice => "Organization failed to create successfully." })
    end
  end

  def update
    the_id = params.fetch("path_id")
    the_organization = Organization.where({ :id => the_id }).at(0)

    the_organization.website = params.fetch("query_website")
    the_organization.name = params.fetch("query_name")

    if the_organization.valid?
      the_organization.save
      redirect_to("/organizations/#{the_organization.id}", { :notice => "Organization updated successfully."} )
    else
      redirect_to("/organizations/#{the_organization.id}", { :alert => "Organization failed to update successfully." })
    end
  end

  def destroy
    the_id = params.fetch("path_id")
    the_organization = Organization.where({ :id => the_id }).at(0)

    the_organization.destroy

    redirect_to("/organizations", { :notice => "Organization deleted successfully."} )
  end
end
