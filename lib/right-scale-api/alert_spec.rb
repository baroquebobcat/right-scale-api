module RightScaleAPI
  class AlertSpec < Account::SubResource
    attributes %w(
      name
      file
      variable
      condition
      threshold
      escalation_name
      duration
      description
    )

    #params
    # subject -- either a Server or a ServerTemplate
    def attach_to subject
      account.post '/alert_specs_subject', :query => {
        :alert_specs_subject =>{
          :alert_spec_href => uri,
          :subject_href => subject.uri,
          :subject_type => subject.type
        }
      }
    end
  end
end
