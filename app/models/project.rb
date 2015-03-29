class Project < ActiveRecord::Base
  validates_presence_of :company, :brief_description, :website_type, :role, :challenge
  validates_inclusion_of :order, in: 1..999

  has_attached_file :company_image,
                    :styles => { :medium => "720x350#", :thumb => "100x100#" },
                    :default_url => "/images/:style/missing.png",
                    :storage => :s3,
                    :s3_credentials => Proc.new{|a| a.instance.s3_credentials }
  validates_attachment_content_type :company_image, :content_type => ["image/jpeg", "image/gif", "image/png"]
  validates_attachment_presence :company_image

  has_many :content_modules, dependent: :destroy, inverse_of: :project

  scope :recent, -> { order(order: :asc).limit(6) }

  def s3_credentials
    {:bucket => "laceylaughter", :access_key_id => "AKIAJKM75KXZG7DOYO4A", :secret_access_key => "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"}
  end

end
