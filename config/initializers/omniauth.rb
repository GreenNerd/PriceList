require 'omniauth-wechat-oauth2'

# https://pacific-caverns-73747.herokuapp.com/

WECHAT_APPID = wx2c4e39d960fb0b3b
WECHAT_APPSECRET = e27e74d17311f9605879e7619d291703

Rails.application.config.middleware.use OmniAuth::Builder do
  provider :wechat, ENV["WECHAT_APPID"], ENV["WECHAT_APPSECRET"]
end
