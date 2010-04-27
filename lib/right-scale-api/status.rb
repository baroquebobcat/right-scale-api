module RightScaleAPI
  class Status < Base
    attributes %w(
      account
      description
      started_at
      ended_at
      state
    )
#show only
#account.get '/statuses/-id-'
  end
end
