module ApplicationHelper
  def qiniu_image_url(product, format = :raw)
    url = "http://ogf4uc3pg.bkt.clouddn.com/#{product.image_url}"

    case format
    when :index
      url << '?imageMogr2/thumbnail/173x170!'
    when :raw
      url << "?attname=#{product.image_url}"
    end
  end
end
