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

end
