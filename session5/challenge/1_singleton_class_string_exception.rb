# This is the same as 4:6 but now we want to make this more comprehensive
#
# There are a few nuances, though.
# The String you return must be retained during the object's entire life
# The method must be able to be called multiple times
# The String you return should know how to add new CSS classes: each class is separated by a space
# If someone tries to use + or []= or * on the String, you should raise a RuntimeError 
# with a message of "use << method instead"
# If they try to add the same String more than once, you should simply do nothing
#
# 0------------------------------
#
# EXAMPLE:
#   controller = ApplicationController.new
#   controller.body_class                 # => ""
#   controller.body_class << 'admin'
#   controller.body_class                 # => "admin"
#   controller.body_class << 'category'
#   controller.body_class                 # => "admin category"
#   controller.body_class << 'page' << 'order'
#   controller.body_class                 # => "admin category page order"
#   controller.body_class << 'category'
#   controller.body_class                 # => "admin category page order"
#   controller.body_class + 'landing'     # => #<RuntimeError: use << method instead>
#

class ApplicationController
  def body_class     
    return @body_class if @body_class
    @body_class ||= ""
    class << @body_class  ### needed to get the same id numbers I think
      def << str 
        puts "<< #{str}"
        repeat = 0
        self.split(" ").each{ |x| repeat = 1 if x == str}
        return self if repeat == 1
        concat(' ') unless length.zero?
        concat(str)
      end
      
      def +(str)
        raise RuntimeError, "use << method instead"
      end
      def *(str)
        raise RuntimeError, "use << method instead"
      end
      def []=(a,b) 
        raise RuntimeError, "use << method instead"
      end
    end 
    @body_class
  end 
end 


