class SiteProperty < ActiveRecord::Base
  validates_presence_of :key, :value
  validates_uniqueness_of :key

  BASIC_AUTH_KEY = 'BASIC_AUTH'

  def self.basic_auth_username
    username = 'lacey'
    record = find_by_key(BASIC_AUTH_KEY)
    return username unless record
    parsed_value = JSON.parse(record.value)
    username = parsed_value['username'] if parsed_value['username']
    username
  rescue => e
    Rails.logger.warn "Cannot parse username. #{e.message}"
    username
  end

  def self.basic_auth_password
    password = 'sunshine'
    record = find_by_key(BASIC_AUTH_KEY)
    return password unless record
    parsed_value = JSON.parse(record.value)
    password = parsed_value['password'] if parsed_value['password']
    password
  rescue => e
    Rails.logger.warn "Cannot parse password. #{e.message}"
    password
  end

end
