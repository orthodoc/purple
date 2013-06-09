class PatientsController < ApplicationController
  include ApplicationHelper
  include UsersHelper

  def new
    if secretary? || admin?
      @patient = Patient.new
    else
      not_permitted_action
    end
  end

  def create
    @patient = Patient.new(params[:patient])
    if @patient.save
      flash[:notice] = "Patient #{@patient.name} successfully added"
      redirect_to @patient
    else
      flash[:alert] = "Patient was not added!"
      render action: "new"
    end
  end

  def show
    @patient = Patient.find_by_id!(params[:id])
  end

  def index
    @patients = Patient.all
  end

end
