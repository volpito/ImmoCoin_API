class AccommodationsController < ApplicationController
  before_action :set_accommodation, only: [:show, :update, :destroy]

  before_action :authenticate_user!, except: [:show, :index]

  # GET /accommodations
  def index
    @accommodations = Accommodation.all

    render json: @accommodations
  end

  # GET /accommodations/1
  def show
    render json: @accommodation
  end

  # POST /accommodations
  def create
    @accommodation = Accommodation.new(accommodation_params)
    @accommodation.user_id = current_user.id if current_user
    @accommodation.user_email = current_user.email if current_user

    if @accommodation.save
      render json: @accommodation, status: :created, location: @accommodation
    else
      render json: @accommodation.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /accommodations/1
  def update
    if @accommodation.user_id == current_user.id
      if @accommodation.update(accommodation_params)
        render json: @accommodation
      else
        render json: @accommodation.errors, status: :unprocessable_entity
      end
    end
  end

  # DELETE /accommodations/1
  def destroy
    if @accommodation.user_id == current_user.id
      @accommodation.destroy
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_accommodation
      @accommodation = Accommodation.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def accommodation_params
      params.require(:accommodation).permit(:title, :price, :description, :user_email)
    end
end
