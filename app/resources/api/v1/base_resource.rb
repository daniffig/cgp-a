class Api::V1::BaseResource < JSONAPI::Resource
  abstract

  # include JSONAPI::Resource::Ransackable
end