class DeliverableAttachment < ActiveRecord::Base
  set_table_name "deliverable_attachment_versions"

  belongs_to :submitter, :class_name => "User", :foreign_key => "submitter_id"
  belongs_to :deliverable

  has_attached_file :attachment,
                    :storage => :s3,
                    :s3_credentials => "#{Rails.root}/config/amazon_s3.yml",
                    :path => "deliverables/:deliverable_course_year/:deliverable_course_name/:deliverable_random_hash/submissions/:id/:filename"
#                    :path => "deliverables/:deliverable_course_year/:deliverable_course_semester/:deliverable_course_name/:deliverable_assignment_name/:deliverable_owner_name/:deliverable_random_hash/:id/:deliverable_owner_name_:filename"

#
#  before_create :store_filename

  validates_presence_of :submitter, :submission_date

  before_validation(:on => :create) do
    update_submission_date
  end

  protected
  def update_submission_date
    self.submission_date = DateTime.now
  end

  def store_filename
    self.stored_filename = self.attachment
  end


end
