class LastExamsController < ApplicationController
  # GET /last_exams
  # GET /last_exams.json
  def index
    @last_exams = LastExam.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @last_exams }
    end
  end

  # GET /last_exams/1
  # GET /last_exams/1.json
  def show
    @last_exam = LastExam.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @last_exam }
    end
  end

  # GET /last_exams/new
  # GET /last_exams/new.json
  def new
    @last_exam = LastExam.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @last_exam }
    end
  end

  # GET /last_exams/1/edit
  def edit
    @last_exam = LastExam.find(params[:id])
  end

  # POST /last_exams
  # POST /last_exams.json
  def create
    @last_exam = LastExam.new(params[:last_exam])

    respond_to do |format|
      if @last_exam.save
        format.html { redirect_to @last_exam, notice: 'Last exam was successfully created.' }
        format.json { render json: @last_exam, status: :created, location: @last_exam }
      else
        format.html { render action: "new" }
        format.json { render json: @last_exam.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /last_exams/1
  # PUT /last_exams/1.json
  def update
    @last_exam = LastExam.find(params[:id])

    respond_to do |format|
      if @last_exam.update_attributes(params[:last_exam])
        format.html { redirect_to @last_exam, notice: 'Last exam was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @last_exam.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /last_exams/1
  # DELETE /last_exams/1.json
  def destroy
    @last_exam = LastExam.find(params[:id])
    @last_exam.destroy

    respond_to do |format|
      format.html { redirect_to last_exams_url }
      format.json { head :no_content }
    end
  end
end
