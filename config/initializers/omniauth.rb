require 'omniauth-wechat-oauth2'

Rails.application.config.middleware.use OmniAuth::Builder do
  provider :wechat, ENV["wx8577705baf868c75"], ENV["cef912824fedecb71f1019fb1d8c4e7e"]
end
