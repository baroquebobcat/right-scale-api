module RightScaleAPI
# currently this resource has no index method
  class Status <  Account::SubResource
    attributes %w(
      description
      started_at
      ended_at
      state
    )
#show only
#account.get '/statuses/-id-'
  end
end
