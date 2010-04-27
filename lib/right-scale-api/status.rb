module RightScaleAPI
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
