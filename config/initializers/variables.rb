# define custom variables for mixpanel and mailchimp


# mixpanel variables
MIXPANEL_SIGNUP_EVENT = 'signup'
if Rails.env == 'development' || Rails.env == 'test'
  MIXPANEL_TOKEN = '#development'
else 
  MIXPANEL_TOKEN = '#production'
end
