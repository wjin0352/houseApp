class Thermometer < ActiveRecord::Base
  # belongs_to associations must use singular term, plural would cause error
  # This is because Rails automatically infers the class name from the association name.
  # If the association name is wrongly pluralized, then the inferred class will be wrongly
  # pluralized too.
  belongs_to :user



end
