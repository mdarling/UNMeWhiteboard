class PatientsController < ApplicationController
  # GET /patients
  # GET /patients.json
  def index
    @patients = Patient.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @patients }
    end
  end

  # GET /patients/1
  # GET /patients/1.json
  def show
    @patient = Patient.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @patient }
    end
  end

  # GET /patients/new
  # GET /patients/new.json
  def new
    @patient = Patient.new
		@patient.comment = Comment.new
		@room = Room.find(params[:room_id])
		@current_room_id = @room.id
    
    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @patient }
    end
  end

  # GET /patients/1/edit
  def edit
    @patient = Patient.find(params[:id])
    @room = Room.find(params[:room_id])
    @current_room_id = @room.id
    
  end

  # POST /patients
  # POST /patients.json
  def create
    @patient = Patient.new(params[:patient])
    @room = Room.where(["id = ?", @patient.room_id])
    @current_room = @room[0]
    
    respond_to do |format|
      if @patient.save
        format.html { redirect_to "/whiteboard/index", notice: 'Patient was successfully created.' }
        format.json { render json: @patient, status: :created, location: @patient }
      else
        format.html { redirect_to _room_patient(@room) }
        format.json { render json: @patient.errors, status: :unprocessable_entity }
      end
    end 
  end

  # PUT /patients/1
  # PUT /patients/1.json
  def update
    @patient = Patient.find(params[:id])
		@room_id = @patient.room_id
    respond_to do |format|
      if @patient.update_attributes(params[:patient])
        format.html { redirect_to "/whiteboard/index", notice: 'Patient was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: edit_room_patient_path(@room_id) }
        format.json { render json: @patient.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /patients/1
  # DELETE /patients/1.json
  def destroy
    @patient = Patient.find(params[:id])
    @patient.destroy

    respond_to do |format|
      format.html { redirect_to "/whiteboard/index" }
      format.json { head :no_content }
    end
  end
end
