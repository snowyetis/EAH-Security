class RegistrationsController < ApplicationController
  protect_from_forgery except: [:hook]

  before_action :set_registration, only: [:show, :edit, :update, :destroy]

  # GET /registrations
   def index
     @registrations = Registration.all
   end

   # GET /registrations/1
   def show
   end

   # GET /registrations/new
   def new
     @registration = Registration.new
     @registration.build_card
    #  @product = Product.find_by id: params[:product_id]
    @product = Product.find_by id: 1
   end


  def create
    @registration = Registration.new(registration_params)
    @registration.card.ip_address = request.remote_ip
    @product = Product.find_by id: 1
    
    if @registration.save
      case params['payment_method']
        when "paypal"
          redirect_to @registration.paypal_url(registration_path(@registration))
        when "card"
          if @registration.card.purchase
            redirect_to registration_path(@registration), notice: @registration.card.card_transaction.message
          else
            redirect_to registration_path(@registration), alert: @registration.card.card_transaction.message
          end
        end
      else
        render :new
    end
  end


  def hook
    params.permit! # Permit all Paypal input params
    status = params[:payment_status]
    if status == "Completed"
      @registration = Registration.find params[:invoice]
      @registration.update_attributes notification_params: params, status: status, transaction_id: params[:txn_id], purchased_at: Time.now
    end
    render nothing: true
  end

private
   # Use callbacks to share common setup or constraints between actions.
   def set_registration
     @registration = Registration.find(params[:id])
   end

   # Never trust parameters from the scary internet, only allow the white list through.
   def registration_params
     params.require(:registration).permit(:product_id, :full_name, :company, :email, :telephone,
                                           card_attributes: [
                                               :first_name, :last_name, :card_type, :card_number,
                                               :card_verification, :card_expires_on])
   end

end
