class IdentitySerializer < ActiveModel::Serializer
  attributes :info, :provider, :uid
end