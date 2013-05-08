if Rails.env == 'development' || Rails.env == 'test'
  MIXPANEL_TOKEN = '#development'
else 
  MIXPANEL_TOKEN = '#production'
end
