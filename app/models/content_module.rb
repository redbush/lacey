class ContentModule < ActiveRecord::Base
  validates_presence_of :title, :description, :project_id
  validates_inclusion_of :order, in: 1..999

  belongs_to :project, :inverse_of => :content_modules
  has_many :photos, dependent: :destroy

  default_scope { order(order: :asc) }

  def project_id_enum
    Project.pluck(:company, :id)
  end
end
