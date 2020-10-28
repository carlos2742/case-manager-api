class Case < ApplicationRecord
  include GraphQL::Interface

  belongs_to :client
  belongs_to :user

  enum stages: [ :discovery, :in_trial, :on_hold]
  enum practice_areas: [ :injuries, :immigration, :family, :wills, :foreclosure]
  enum billing_methods: [ :hourly, :contingency, :flat_fee, :pro_bono, :flat_fee_hourly]

end
