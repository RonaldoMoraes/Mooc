class TutorialsController < ApplicationController
  before_action :set_tutorial, only: [:show, :follow, :unfollow, :edit, :update, :destroy]

  # GET /tutorials
  # GET /tutorials.json
  def index
    @tutorials = Tutorial.all
  end

  def my
    @tutorials = Tutorial.where(user_id: current_user.id)
  end

  # GET /tutorials/1
  # GET /tutorials/1.json
  def show
    @is_student = 0
    # Like Step controller actions 'show' and 'new', respectively
    @steps = @tutorial.steps
    @step = Step.new(tutorial_id: @tutorial.id)
    @is_student = (@tutorial.students.map(&:user_id).include? current_user.id) ? true : false
  end

  def follow
    respond_to do |format|
      if !@tutorial.students.map(&:user_id).include? current_user.id
        @student = @tutorial.students.build(:user => current_user)
        if @student.save
          format.html {redirect_to @tutorial, notice: 'Following Tutorial from now on!'} 
        else
          format.html {redirect_to @tutorial, alert: 'Not following yet, maybe a hotfix is needed here'}
        end
      else
        format.html {redirect_to @tutorial, alert: 'You are already being following this Tutorial'}
      end
    end
  end

  def unfollow
    respond_to do |format|
      if @tutorial.students.map(&:user_id).include? current_user.id
        if @tutorial.users.delete(current_user)
          format.html {redirect_to @tutorial, notice: 'Not following this Tutorial anymore!'} 
        else
          format.html {redirect_to @tutorial, alert: 'Still following, maybe a hotfix is needed here'}
        end
      else
        format.html {redirect_to @tutorial, alert: 'You are already not following this Tutorial, dude..'}
      end
    end
  end

  # GET /tutorials/new
  def new
    @tutorial = Tutorial.new
  end

  # GET /tutorials/1/edit
  def edit
  end

  # POST /tutorials
  # POST /tutorials.json
  def create
    @tutorial = Tutorial.new(tutorial_params)

    respond_to do |format|
      if @tutorial.save
        format.html { redirect_to @tutorial, notice: 'Tutorial was successfully created.' }
        format.json { render :show, status: :created, location: @tutorial }
      else
        format.html { render :new }
        format.json { render json: @tutorial.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /tutorials/1
  # PATCH/PUT /tutorials/1.json
  def update
    respond_to do |format|
      if @tutorial.update(tutorial_params)
        format.html { redirect_to @tutorial, notice: 'Tutorial was successfully updated.' }
        format.json { render :show, status: :ok, location: @tutorial }
      else
        format.html { render :edit }
        format.json { render json: @tutorial.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tutorials/1
  # DELETE /tutorials/1.json
  def destroy
    @tutorial.destroy
    respond_to do |format|
      format.html { redirect_to tutorials_url, notice: 'Tutorial was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_tutorial
      @tutorial = Tutorial.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def tutorial_params
      params.require(:tutorial).permit(:title, :user_id, :category_id, :description)
    end
end
