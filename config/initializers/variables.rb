# application variables
HOST_WITH_PORT = 'http://localhost:3000'
YEAR = '2013'

# meta information
TITLE = "Dummy Title"
SITE_NAME = "Dummy Name"
SITE_DESCRIPTION = "Dummy Description"

# When set to false the sdk is not included. When chaning the value remove the tmp folder
FACEBOOK_APP_ID = false

# mixpanel variables
MIXPANEL_SIGNUP_EVENT = 'signup'
if Rails.env == 'development' || Rails.env == 'test'
  MIXPANEL_TOKEN = '#development'
else 
  MIXPANEL_TOKEN = '#production'
end

