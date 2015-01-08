class Reading < ActiveRecord::Base
  # belongs_to associations must use the singular term, if you used pluralized form you
  # will be told "uninitialized constant",  because rails automatically infers class name
  # from assoiciation name. if association name is wrongly pluralized the inferred class will
  # also be wrongly pluralized.
  belongs_to :thermometer
  belongs_to :user



end
