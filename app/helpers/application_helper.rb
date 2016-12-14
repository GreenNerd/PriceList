module ApplicationHelper
  def qiniu_image_url(name, format = :raw)
    url = "http://ogf4uc3pg.bkt.clouddn.com/#{name}"

    case format
    when :index
      url << '?imageMogr2/thumbnail/173x170!'
    when :cart
      url << '?imageMogr2/thumbnail/152x119!'
    when :sel
      url << '?imageMogr2/thumbnail/x200'
    when :carousel
      url << '?imageMogr2/thumbnail/x300'
    when :raw
      url << "?attname=#{name}"
    end
  end

  def qiniu_carousel(images)
    a = []
    if images.count >= 1
      images.each do |img|
        a << qiniu_image_url(img, :carousel)
      end
    end
    return a
  end

  private

    def uptoken
      put_policy = Qiniu::Auth::PutPolicy.new(
        "pricelist",                  # 存储空间
        nil,                          # 最终资源名，可省略，即缺省为“创建”语义
        1800,                         # 相对有效期，可省略，缺省为3600秒后uptoken过期
        (Time.now + 30.minutes).to_i  # 绝对有效期，可省略，指明uptoken过期期限(绝对值)
      )
      uptoken = Qiniu::Auth.generate_uptoken(put_policy)  # 生产凭证
    end

end
