class Photo < ActiveRecord::Base
  has_attached_file :photo,
                    :styles => { :medium => "720x350#", :thumb => "100x100#" },
                    :default_url => "/images/:style/missing.png",
                    :storage => :s3,
                    :s3_credentials => Proc.new{|a| a.instance.s3_credentials }
  validates_attachment_content_type :company_image, :content_type => ["image/jpeg", "image/gif", "image/png"]
  validates_attachment_presence :photo
  validates_inclusion_of :order, in: 1..999

  scope :recent, -> { order(order: :asc) }

  def s3_credentials
    {:bucket => "laceylaughter", :access_key_id => "AKIAJKM75KXZG7DOYO4A", :secret_access_key => "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"}
  end
end
