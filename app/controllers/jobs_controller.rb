class JobsController < ApplicationController
  def index
    matching_jobs = Job.all

    @list_of_jobs = matching_jobs.order({ :created_at => :desc })

    render({ :template => "jobs/index.html.erb" })
  end

  def show
    the_id = params.fetch("path_id")

    matching_jobs = Job.where({ :id => the_id })

    @the_job = matching_jobs.at(0)

    render({ :template => "jobs/show.html.erb" })
  end

  def create
    the_job = Job.new
    the_job.link = params.fetch("query_link")
    the_job.description = params.fetch("query_description")
    the_job.int_students = params.fetch("query_int_students", false)
    the_job.deadline = params.fetch("query_deadline")
    the_job.industry_id = params.fetch("query_industry_id")
    the_job.role = params.fetch("query_role")

    the_job.org_id = params.fetch("query_org_id")

    if the_job.valid?
      the_job.save
      redirect_to("/jobs", { :notice => "Job created successfully." })
    else
      redirect_to("/jobs", { :notice => "Job failed to create successfully." })
    end
  end

  def update
    the_id = params.fetch("path_id")
    the_job = Job.where({ :id => the_id }).at(0)

    the_job.link = params.fetch("query_link")
    the_job.description = params.fetch("query_description")
    the_job.int_students = params.fetch("query_int_students", false)
    the_job.deadline = params.fetch("query_deadline")
    the_job.industry_id = params.fetch("query_industry_id")
    the_job.org_id = params.fetch("query_org_id")
    the_job.role = params.fetch("query_role")

    if the_job.valid?
      the_job.save
      redirect_to("/jobs/#{the_job.id}", { :notice => "Job updated successfully."} )
    else
      redirect_to("/jobs/#{the_job.id}", { :alert => "Job failed to update successfully." })
    end
  end

  def destroy
    the_id = params.fetch("path_id")
    the_job = Job.where({ :id => the_id }).at(0)

    the_job.destroy

    redirect_to("/jobs", { :notice => "Job deleted successfully."} )
  end
end
