class AddressController < ApplicationController
  def index
    # addresses for users
    @addresses = Address.where(addressable_type: "User")
    # the `geocoded` scope filters only flats with coordinates (latitude & longitude)
    @markers = @addresses.geocoded.map do |address|
      {
        lat: address.latitude,
        lng: address.longitude,
        infoWindow: render_to_string(partial: "info_window", locals: { address: address })

      }
    end
  end
end
