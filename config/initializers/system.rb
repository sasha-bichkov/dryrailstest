# frozen_string_literal: true

Dry::Rails.container do
  auto_register!('app/operations')
  auto_register!('app/contracts')
end
