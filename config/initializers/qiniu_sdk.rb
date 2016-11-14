require 'qiniu'

Qiniu.establish_connection! access_key: '88V2_MGRZFEgLwZ2a56BJ-zz8afmNdWMRR2WEZK9',
                            secret_key: 'c5sNzFapYp0UzOzKkHDwn-2T9avbH3Cr6Umcd3il'

bucket = 'pricelist'

path = './app/assets/images'

if File.directory?(path)
  dir = Dir.open(path)
  while name = dir.read
    put_policy = Qiniu::Auth::PutPolicy.new(
      bucket,
      name,
      3600
    )

    uptoken = Qiniu::Auth::generate_uptoken(put_policy)

    filePath = path + '/' + name

    code, result, response_headers = Qiniu::Storage.upload_with_token_2(
      uptoken,
      filePath,
      name,
      nil,
      bucket: bucket
    )

    puts code
    puts result
  end
end
