module Dhh
  # Prepare NameController to look like name_controller
  # First step before autoloading
  def self.to_underscore(string)
    string.gsub(/::/, '/').
      gsub(/([A-Z][a-z]+)([A-Z][a-z])/,'\1_\2').
      gsub(/([a-z\d])(A-Z)/, '\1_\2').
      tr("-", "_").
      downcase
  end
end
