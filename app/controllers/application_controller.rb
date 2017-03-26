class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :authenticate_tenant!   # authenticate user and sets up tenant

  rescue_from ::Milia::Control::MaxTenantExceeded,   :with => :max_tenants
  rescue_from ::Milia::Control::InvalidTenantAccess, :with => :invalid_tenant
end
