# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_bcms_polling_session',
  :secret      => '2838eb4b7054329497e569d8f5b6bff7aef5f791d7b3ddd3f0b9d608c68224bbc918575d2fbc91f1bfdc04cdb00016b51040251e0ba56363dad1ed2cdf8ec39d'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
