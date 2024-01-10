# frozen_string_literal: true

class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
  protect_from_forgery unless: -> { request.format.json? }
  include Pundit::Authorization
  include ActiveStorage::SetCurrent

  after_action :verify_authorized,
               except: :index,
               unless: -> { devise_controller? || active_admin_controller? }
  after_action :verify_policy_scoped,
               only: :index,
               unless: -> { devise_controller? || active_admin_controller? }
  # Prevent CSRF attacks by raising an exception.
  protect_from_forgery with: :exception

  def active_admin_controller?
    is_a?(ActiveAdmin::BaseController)
  end
end
