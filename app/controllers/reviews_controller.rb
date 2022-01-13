class ReviewsController < ApplicationController
  rescue_from ActiveRecord::RecordNotFound, with: :render_not_found_response

  # GET /dog_houses/:dog_house_id/reviews
  # GET /reviews
  # def index 
  #   if params[:dog_house_id]
  #     # if params contains a :dog_house_id, the user wants reviews for one dog house
  #     dog_house = DogHouse.find(params[:dog_house_id])
  #     reviews = dog_house.reviews
  #   else 
  #     # else give all reviews
  #     reviews = Review.all
  #   end

  #   render json: reviews, include: :dog_house
  # end

  # GET /dog_houses/:dog_house_id/reviews/:id
  def show
    review = Review.find(params[:id])
    render json: review, include: :dog_house
  end

  # POST /reviews
  def create
    review = Review.create(review_params)
    render json: review, status: :created
  end

  private

  def render_not_found_response
    render json: { error: "Review not found" }, status: :not_found
  end

  def review_params
    params.permit(:username, :comment, :rating)
  end

end
