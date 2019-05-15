class Api::V1::BaseController < ApiController
  include JSONAPI::Utils
  
  rescue_from ActiveRecord::RecordNotFound, with: :jsonapi_render_not_found
end