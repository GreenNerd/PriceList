module SitesAdminHelper
  def qiniu_admin_pro_thumb(pro)
    qiniu_image_url(pro.image_url, :cart)
  end
end
