class NewManufacturer
  def call(params = ActionController::Parameters.new)
    @params = params
    Manufacturer.transaction do
      new_mfr = Manufacturer.create!(manufacturer_params)
      if address_params
        address_params.merge(
          {
            addressable_type: new_mfr.class.name,
            addressable_id: new_mfr.id
          }
        )
        new_mfr.addresses.create!(address_params)
      end
      new_mfr.reload
    end
  end

  def manufacturer_params
    @params
      .require(:manufacturer)
      .permit(
        Manufacturer
          .column_names
          .map(&:to_sym)
          .reject { |n| %i[id active created_at updated_at].include?(n) }
      )
  end

  def address_params
    @params
      .require(:manufacturer)
      .require(:address_attributes)
      .permit(
        Address
          .column_names
          .map(&:to_sym)
          .reject { |n| %i[id active addressable_type addressable_id created_at updated_at].include?(n) }
      )
  rescue
    nil
  end
end
