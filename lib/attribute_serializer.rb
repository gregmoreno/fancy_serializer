module AttributeSerializer

  module ClassMethods
    # class User
    #   serializeable :preferences, { :show_email => false }
    # end
    #
    # u = User.new :show_email => true
    # u.show_email
    # => true
    #
    # u = User.new
    # u.show_email
    # => false
    # u.show_email = true
    # => true
    #
    # u = User.find(1)
    # u.show_email
    # => true or false

    def serializeable(serialized, serialized_accessors={})  
      serialize serialized, serialized_accessors.class

      serialized_attr_accessor serialized, serialized_accessors
      serialized_attr_sanitizer serialized
    end

    # Creates the accessors
    def serialized_attr_accessor(serialized, accessors)
      define_method("memoized_#{serialized}") do
        if self[serialized].blank?
          self[serialized] = accessors.clone
        else
          self[serialized]
        end
      end

      after_initialize "memoized_#{serialized}"

      accessors.keys.each do |k|
        define_method("#{k}") do
          self.send("memoized_#{serialized}")[k]
        end

        define_method("#{k}=") do |value|
          self.send("memoized_#{serialized}")[k] = value
        end
      end
    end

    # Helper for removing the serialized field in your queries
    # You have to call +sanitize_serialize_attributes+ explicitly
    def serialized_attr_sanitizer(serialized)
      sanitizer = lambda { |attributes|
        sanitized = attributes.clone
        sanitized.delete(serialized)
        sanitized
      }

      self.class.send(:define_method, "sanitize_serialized_attributes", sanitizer) 
    end

  end # ClassMethods

end

class ActiveRecord::Base
  extend AttributeSerializer::ClassMethods
end

