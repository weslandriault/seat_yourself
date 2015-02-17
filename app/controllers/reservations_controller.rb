class ReservationsController < ApplicationController
  before_action :find_restaurant

  def find_reservation
  	@reservation = Reservation.find(params[:id])
  end


  def new
  	@reservation = @restaurant.reservations.new
  end

  def create
  	@reservation = @restaurant.reservations.new(reservation_params)  
  	# @reservation = Reservation.new(reservation_params)
  	@reservation.user = current_user
  	if @reservation.save
  		redirect_to restaurant_path(@restaurant)
  	else
      flash.now[:alert] = @reservation.errors.full_messages.to_sentence
      render :new
      
      
    end
  end

  def show
  	@reservation = find_reservation
  end

  def edit
    @reservation = find_reservation
  end

  def update
    reservation = find_reservation
    if reservation.update_attributes(reservation_params)
      redirect_to restaurant_url(@restaurant)
    else
      flash.now[:alert] = @reservation.errors.full_messages.to_sentence
      render :edit
    end
  end

  def destroy
    @reservation = find_reservation
    @reservation.destroy
    redirect_to restaurant_url(@restaurant)
  end

  private
  def find_restaurant
  	@restaurant = Restaurant.find(params[:restaurant_id])
  end

  private
  def reservation_params
  	params.require(:reservation).permit(:party_size, :date, :time, :user_id, :restaurant_id)
  end
end
