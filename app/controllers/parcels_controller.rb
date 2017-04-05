require 'sendcloud'
class ParcelsController < ApplicationController
  def index
  	@shipping_methods = Sendcloud::ShippingMethod.new(ENV['API_KEY'], ENV['SECRET_KEY']).list
  end

  def create
    begin
      shipment_address = Sendcloud::ShipmentAddress.new(params[:address], params[:city], params[:postal_code], params[:country])
      shipment = {id: params[:shipping_methods], options: []}
      method_params = {telephone: params[:telephone], email: params[:email], house_number: params[:house_number], weight: params[:weight]}

      puts shipment_address.inspect
      puts shipment
      puts method_params

      response = Sendcloud::ParcelResource.new(ENV['API_KEY'], ENV['SECRET_KEY']).create_parcel(params[:name], shipment_address, shipment, method_params)
    rescue Exception => ex
      puts ex
    end

    redirect_to parcels_path
  end
end
