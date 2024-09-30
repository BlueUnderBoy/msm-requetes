class DirectorsController < ApplicationController
  def index
    render({ :template => "director_templates/list"})
  end

  def show
    the_id = params.fetch("the_id")

    matching_records = Director.where({ :id => the_id })

    @the_director = matching_records.at(0)

    render({ :template => "director_templates/details"})
  end

  def junior 
    @ages = Director.where.not({:dob => nil}).order({:dob => :desc})
    @person = @ages.at(0).name
    @id = @ages.at(0).id
    @dob = @ages.at(0).dob
    @date = @dob.strftime("%B %d, %Y")
    render({ :template => "director_templates/youngest"})
  end

  def senior
    @ages = Director.where.not({:dob => nil}).order({:dob => :asc})
    @person = @ages.at(0).name
    @id = @ages.at(0).id
    @dob = @ages.at(0).dob
    @date = @dob.strftime("%B %d, %Y")
    render({ :template => "director_templates/eldest"})
  end

end
