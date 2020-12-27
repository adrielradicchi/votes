class SurveyResponseUsersController < ApplicationController
  before_action :set_survey_response_user, only: [:show, :edit, :update, :destroy]

  # GET /survey_response_users
  # GET /survey_response_users.json
  def index
    @survey_response_users = SurveyResponseUser.all
  end

  # GET /survey_response_users/1
  # GET /survey_response_users/1.json
  def show
  end

  # GET /survey_response_users/new
  def new
    @survey_response_user = SurveyResponseUser.new
  end

  # GET /survey_response_users/1/edit
  def edit
  end

  # POST /survey_response_users
  # POST /survey_response_users.json
  def create
    @survey_response_user = SurveyResponseUser.new(survey_response_user_params)

    respond_to do |format|
      if @survey_response_user.save
        format.html { redirect_to @survey_response_user, notice: 'Survey response user was successfully created.' }
        format.json { render :show, status: :created, location: @survey_response_user }
      else
        format.html { render :new }
        format.json { render json: @survey_response_user.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /survey_response_users/1
  # PATCH/PUT /survey_response_users/1.json
  def update
    respond_to do |format|
      if @survey_response_user.update(survey_response_user_params)
        format.html { redirect_to @survey_response_user, notice: 'Survey response user was successfully updated.' }
        format.json { render :show, status: :ok, location: @survey_response_user }
      else
        format.html { render :edit }
        format.json { render json: @survey_response_user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /survey_response_users/1
  # DELETE /survey_response_users/1.json
  def destroy
    @survey_response_user.destroy
    respond_to do |format|
      format.html { redirect_to survey_response_users_url, notice: 'Survey response user was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_survey_response_user
      @survey_response_user = SurveyResponseUser.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def survey_response_user_params
      params.require(:survey_response_user).permit(:session_id, :user_id, :survey_response, :survey_question)
    end
end
