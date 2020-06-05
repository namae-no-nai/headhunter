# frozen_string_literal: true

class Heads::SessionsController < Devise::SessionsController
  include Accessible
  skip_before_action :check_user, only: :destroy
end
