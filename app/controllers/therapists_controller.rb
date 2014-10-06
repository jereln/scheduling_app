class TherapistsController < ApplicationController
  before_action :set_therapist, only: [:show, :edit, :update, :destroy]

  # GET /therapists
  def index
    @therapists = Therapist.all
  end

  # GET /therapists/1
  def show
  end

  # GET /therapists/new
  def new
    @therapist = Therapist.new
  end

  # GET /therapists/1/edit
  def edit
  end

  # POST /therapists
  def create
    @therapist = Therapist.new(therapist_params)

    if @therapist.save
      redirect_to @therapist, notice: 'Therapist was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /therapists/1
  def update
    if @therapist.update(therapist_params)
      redirect_to @therapist, notice: 'Therapist was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /therapists/1
  def destroy
    @therapist.destroy
    redirect_to therapists_url, notice: 'Therapist was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_therapist
      @therapist = Therapist.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def therapist_params
      params[:therapist]
    end
end
