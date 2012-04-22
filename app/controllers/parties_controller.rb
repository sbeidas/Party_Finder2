class PartiesController < ApplicationController
  # GET /parties
  # GET /parties.json
  def index
    @parties = Party.all

    respond_to do |format|
      format.html # index.html.erb
      format.json  { render :json => @parties }
    end
  end

  # GET /parties/1
  # GET /parties/1.json
  def show
    @party = Party.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json  { render :json => @party }
    end
  end
  
  
  def check_time(party)
  	if((Time.now<=>party.start_time)==1)
  	if((party.end_time<=>Time.now)==1)
  			return true 
  	end
  	end
else
	return false
  	end
    # GET /find_party/long/lat
  # GET/find_party/long/lat
  def show_close_parties
    
   	@l=Location.new
    #@l.longitude=params[:long]
    #@l.latitude=params[:lat]
    #   41834134600 -87628202400
   # @l.longitude="41.8341346+-87.62820239999999"

#1000000000
    
   
   @long=params[:long].to_f/1000000000
      @lat=params[:lat].to_f/1000000000
    
      @str=@long.to_s+" "+@lat.to_s
    @parties=Array.new

	@timestamp
     @locations =  Location.near(@str,25,:order => :distance)
    	
    		for location in @locations
   	 unless location.parties.nil?	
   	 	 for party in location.parties
   	if(check_time(party))
   	 	@parties.push(party)
   	 end	
   	 end
   	 end
   	 end


    respond_to do |format|
      format.html # show_close_parties.html.erb
      format.json  { render :json => @parties }
    end
  end
  
  

  # GET /parties/new
  # GET /parties/new.json
  def new
    @party = Party.new
  

    respond_to do |format|
      format.html # new.html.erb
      format.json  { render :json => @party }
    end
  end

  # GET /parties/1/edit
  def edit
    @party = Party.find(params[:id])
  end

  # POST /parties
  # POST /parties.json
  def create
    @party = Party.new(params[:party])

    respond_to do |format|
      if @party.save
        format.html { redirect_to(@party, :notice => 'Party was successfully created.') }
        format.json  { render :json => @party, :status => :created, :location => @party }
      else
        format.html { render :action => "new" }
        format.json  { render :json => @party.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /parties/1
  # PUT /parties/1.json
  def update
    @party = Party.find(params[:id])

    respond_to do |format|
      if @party.update_attributes(params[:party])
        format.html { redirect_to(@party, :notice => 'Party was successfully updated.') }
        format.json  { head :ok }
      else
        format.html { render :action => "edit" }
        format.json  { render :json => @party.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /parties/1
  # DELETE /parties/1.json
  def destroy
    @party = Party.find(params[:id])
    @party.destroy

    respond_to do |format|
      format.html { redirect_to(parties_url) }
      format.json  { head :ok }
    end
  end
end
