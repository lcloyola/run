class TeamsController < ApplicationController
  # GET /teams
  # GET /teams.json
  def index
    @teams = Team.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @teams }
    end
  end

  # GET /teams/1
  # GET /teams/1.json
  def show
    @title = 'Athlete'
    @team = Team.find(params[:id])
    @athletes = User.where('coach_id = ?', current_user.id)
    
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @team }
    end
  end

  # GET /teams/new
  # GET /teams/new.json
  def new
    @title = 'Athlete'
    @teams = Team.all
    @team = Team.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @team }
    end
  end

  # GET /teams/1/edit
  def edit
    @team = Team.find(params[:id])
  end

  # POST /teams
  # POST /teams.json
  def create
    @team = Team.new(params[:team])
    @team[:user_id] = current_user.id
    
    respond_to do |format|
      if @team.save
        format.html { redirect_to '/teams/new', notice: 'Team was successfully created.' }
        format.json { render json: @team, status: :created, location: @team }
      else
        format.html { render action: "new" }
        format.json { render json: @team.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /teams/1
  # PUT /teams/1.json
  def update
    @team = Team.find(params[:id])

    respond_to do |format|
      if @team.update_attributes(params[:team])
        format.html { redirect_to @team, notice: 'Team was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @team.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /teams/1
  # DELETE /teams/1.json
  def destroy
    @team = Team.find(params[:id])
    @team.destroy

    respond_to do |format|
      format.html { redirect_to teams_url }
      format.json { head :ok }
    end
  end
  def join
    @team = Team.find(params[:id])
    params[:athletes].each do |id|
       @athlete = User.find(id)
       #TODO: validate existence
       join_individual_athlete()
    end
    respond_to do |format|
      format.html {redirect_to Team.find(@team.id) }
    end
  end
  def remove_athlete
    @team = Team.find(params[:id])
    @athlete = User.find(params[:user_id])
    #TODO: validate course, student existence?
    if @athlete.member?(@team.id)
      @member = Member.where('team_id = ? and user_id = ?', @team.id, @athlete.id).first
      unless @member.nil?
        @member.destroy
      end
    end
    respond_to do |format|
      format.html {redirect_to @team}
    end
  end
private
  def join_individual_athlete
    unless @athlete.member?(@team.id)
      @membership = Member.new("team_id" => @team.id, "user_id" => @athlete.id)
      @membership.save
    end
  end
end
