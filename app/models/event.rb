class Event < ActiveRecord::Base
  belongs_to :org

  scope :last_n, -> (org, n) { where(org_id: org.id).order("ts DESC").limit(n) }
  scope :last_n_for_host, -> (org, n, host) { where(org_id: org.id).where(hostname: host).order("ts DESC").limit(n) }
end
