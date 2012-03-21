class TsessionsController < ApplicationController
  # GET /sessions
  # GET /sessions.json
  def index
    @title = "Session"
    @templates = Template.where('user_id = ?', current_user.id)
    @pending = Tsession.where('user_id = ?  AND is_done = ?', current_user, false)
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @sessions }
    end
  end

  # GET /sessions/1
  # GET /sessions/1.json
  def show
    @title = "Session"
    @session = Tsession.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @session }
    end
  end

  # GET /sessions/new
  # GET /sessions/new.json
  def new
    @title = "Session"
    @today = Tsession.where("trainingday = ?", Date.today.to_s)
    @session = Tsession.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @session }
    end
  end

  # GET /sessions/1/edit
  def edit
    @title = "Session"
    @session = Tsession.find(params[:id])
  end

  # POST /sessions
  # POST /sessions.json
  def create
    @title = "Session"
    params[:athletes].each do |athlete|
      @session = Tsession.new(params[:tsession])
      @session[:user_id] = athlete
      @session.save
      
      #create sr number of logs
      for i in 1..@session.template.sets
        for j in 1..@session.template.reps
          @log = Log.new()
          @log[:tsession_id] = @session.id
          @log[:set] = i
          @log[:repetition] = j
          @log.save
        end
      end
      
    end

    respond_to do |format|
        format.html { redirect_to @session, notice: 'Session was successfully created.' }
        format.json { render json: @session, status: :created, location: @session }
    end
  end

  # PUT /sessions/1
  # PUT /sessions/1.json
  def update
    @title = "Session"
    @session = Tsession.find(params[:id])

    respond_to do |format|
      if @session.update_attributes(params[:tsession])
        format.html { redirect_to @session, notice: 'Session was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @session.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /sessions/1
  # DELETE /sessions/1.json
  def destroy
    @title = "Session"
    @session = Tsession.find(params[:id])
    @session.destroy

    respond_to do |format|
      format.html { redirect_to tsessions_url }
      format.json { head :ok }
    end
  end
  
  def edit_log
    @tsession = Tsession.find(params[:id])
    respond_to do |format|
      format.html
    end
  end
  def update_log
    @tsession = Tsession.find(params[:id])
    params[:log][:log].each do |l|
      @log = Log.find(l[0])
      @log.update_attributes(l[1])
    end
    @tsession.update_attributes(:is_done => true)
    respond_to do |format|
      format.html {redirect_to @tsession }
    end
  end
  
end
