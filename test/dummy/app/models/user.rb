class User < ActiveRecord::Base
  serializeable :preferences, send_email: true, send_sms: false
end
