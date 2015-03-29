class Photo < ActiveRecord::Base
  validates_presence_of :content_module_id
  validates_inclusion_of :order, in: 1..999

  has_attached_file :photo,
                    :styles => { :medium => "930", :thumb => "100x100#" },
                    :default_url => "/images/:style/missing.png",
                    :storage => :s3,
                    :s3_credentials => Proc.new{|a| a.instance.s3_credentials }
  validates_attachment_content_type :photo, :content_type => ["image/jpeg", "image/gif", "image/png"]
  validates_attachment_presence :photo

  belongs_to :content_module

  default_scope { order(order: :asc) }

  def s3_credentials
    {:bucket => "laceylaughter", :access_key_id => "AKIAJKM75KXZG7DOYO4A", :secret_access_key => "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"}
  end

  def content_module_id_enum
    ContentModule.pluck(:title, :id)
  end
end
