class Line < ActiveRecord::Base

  has_and_belongs_to_many :stops
  has_many :stop_times
  has_many :trips
  has_many :headsigns

  scope :by_usage, lambda{ |what_usage|
    ( ( what_usage == :all ) ? scoped : where( :usage => what_usage ) ).order('short_name ASC')
  }
  def full_name
    short_name + " " + long_name
  end
  
  def is_express?
    usage == "express"
  end
  def is_suburban?
    usage == "suburban"
  end
  def is_urban?
    usage == "urban"
  end
  def is_special?
    usage == "special"
  end
end
