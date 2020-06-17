module Users
  class New < Dryrailstest::ApplicationContract

    params do
      required(:age).value(:integer)
      required(:name).value(:string)
    end

    rule(:age) do
      key.failure('must more than zero') unless value.positive?
    end

  end
end
