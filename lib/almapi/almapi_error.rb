# Class AlmapiError handles Alma's API call errors
class Almapi::AlmapiError < StandardError
  # Initializes a new AlmapiError object
  #
  # @param msg [String] : error message
  # @param exception_type [String] : exception type. 
  def initialize(msg="This is an AlmpiError", exception_type="AlmpiError")
    @exception_type = exception_type
    super(msg) # Calling initialize in StandardError
  end
end