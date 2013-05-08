# Landing Page Template
Right now include mixpanel library, facebook sdk and mailchimp smtp configuartion.

## Facebook
To enable the facebook skd define the variable in `config/initializers/variables.rb`. The sdk will be automatically loaded.

## Mixpanel
Define the variables in `config/initializers/variables.rb`. If you don't want to use mixpanel remove from **application.js**.

## Mandrill
To use in production define the ENV variables:

    MANDRILL_USERNAME
    MANDRILL_PASSWORD

Also edit the smtp settings in **production.rb** and **app/mailers/user_mail.rb**.

