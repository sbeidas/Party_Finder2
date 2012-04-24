class LocationsController < ApplicationController
  def index
  if params[:search].present?
    @locations = Location.near(params[:search], 5000000000000000000000000000000000000, :order => :distance)
    @locations=params[:search]
     respond_to do |format|
      format.html # index.html.erb
      format.json  { render :json => @locations }
    end
  else
    @locations = Location.all
     respond_to do |format|
      format.html # index.html.erb
      format.json  { render :json => @locations }
    end

  end
  
end

  def show
    @location = Location.find(params[:id])
     respond_to do |format|
      format.html # show.html.erb
      format.json  { render :json => @location  }
    end
  end

  def new
    @location = Location.new
     respond_to do |format|
      format.html # show.html.erb
      format.json  { render :json => @location  }
    end
  end

  def create
    @location = Location.new(params[:location])
    if @location.save
      format.html { redirect_to(@location, :notice => 'Party was successfully created.') }
    format.json  { render :json => @location, :status => :created, :location => @location }
    else
     format.html { render :action => "new" }
        format.json  { render :json => @location.errors, :status => :unprocessable_entity }
    end
  end

  def edit
    @location = Location.find(params[:id])
     respond_to do |format|
      format.html # show.html.erb
      format.json  { render :json => @location  }
    end
  end

  def update
    @location = Location.find(params[:id])
    if @location.update_attributes(params[:location])
     format.html { redirect_to(@location, :notice => 'Party was successfully updated.') }
        format.json  { head :ok }
    else
     format.html { render :action => "edit" }
        format.json  { render :json => @location.errors, :status => :unprocessable_entity }
    end
  end

  def destroy
    @location = Location.find(params[:id])
    @location.destroy
    redirect_to locations_url, :notice => "Successfully destroyed location."
  end
end
