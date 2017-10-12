require "administrate/base_dashboard"

class SwapcardAutonomyDashboard < Administrate::BaseDashboard
  # ATTRIBUTE_TYPES
  # a hash that describes the type of each of the model's fields.
  #
  # Each different type represents an Administrate::Field object,
  # which determines how the attribute is displayed
  # on pages throughout the dashboard.
  ATTRIBUTE_TYPES = {
    id: Field::Number,
    sc_id: Field::String,
    first_name: Field::String,
    last_name: Field::String,
    job_title: Field::String,
    second_job_title: Field::String,
    photo_thumbnail: Field::Image,
    biography: Field::Text,
    organization: Field::String,
    email: Field::String,
    website_url: Field::String,
    company_name: Field::String,
    swapcard_json: Field::Text,
    created_at: Field::DateTime,
    updated_at: Field::DateTime,
  }.freeze

  # COLLECTION_ATTRIBUTES
  # an array of attributes that will be displayed on the model's index page.
  #
  # By default, it's limited to four items to reduce clutter on index pages.
  # Feel free to add, remove, or rearrange items.
  COLLECTION_ATTRIBUTES = [
    :id,
    :sc_id,
    :first_name,
    :last_name,
    :job_title,
    :second_job_title,
    # :photo_thumbnail,
    :biography,
    :organization,
    :email,
    :website_url,
    :company_name,
  ].freeze

  # SHOW_PAGE_ATTRIBUTES
  # an array of attributes that will be displayed on the model's show page.
  SHOW_PAGE_ATTRIBUTES = [
    :id,
    :sc_id,
    :first_name,
    :last_name,
    :job_title,
    :second_job_title,
    :photo_thumbnail,
    :biography,
    :organization,
    :email,
    :website_url,
    :company_name,
    :swapcard_json,
    :created_at,
    :updated_at,
  ].freeze

  # FORM_ATTRIBUTES
  # an array of attributes that will be displayed
  # on the model's form (`new` and `edit`) pages.
  FORM_ATTRIBUTES = [
    :sc_id,
    :first_name,
    :last_name,
    :job_title,
    :second_job_title,
    :photo_thumbnail,
    :biography,
    :organization,
    :email,
    :website_url,
    :company_name,
    :swapcard_json,
  ].freeze

  # Overwrite this method to customize how swapcard autonomies are displayed
  # across all pages of the admin dashboard.
  #
  # def display_resource(swapcard_autonomy)
  #   "SwapcardAutonomy ##{swapcard_autonomy.id}"
  # end
end
