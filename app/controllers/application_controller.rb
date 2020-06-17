class ApplicationController < ActionController::Base

  include Dryrailstest::Import['users.new']

  def test
    pp new
    if new.call(age: 15, name: 'Alexander').success?
      render json: { message: 'success' }, status: :ok
    else
      render json: { message: 'error' }, status: :unproccessable_entity
    end
  end

end
