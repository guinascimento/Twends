# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_twends_session',
  :secret      => 'a5df413a443a4307abb87937b2386209aa090b45715a6701b5f05ecf15ca6bb2db76cc3b5ef78bf5f25c87b13284b41b835590d43cd08892a6d05b6ddb915cbb'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
