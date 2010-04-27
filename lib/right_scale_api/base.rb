  class RightScaleAPI::Base
    
    attr_accessor :id, :href
    
    #attributes that directly correspond to the api's
    def self.attributes attrs=nil
      if attrs
        @attributes ||= []
        @attributes += attrs
        attr_accessor *attrs
      end
      @attributes
    end
    
    attributes [:tags, :created_at, :updated_at]

    def self.get id
      new :id => id
    end
   
    def initialize attributes
      attributes.each do |attr,value|
        send "#{attr}=", value
      end
      
      unless id
        self.id = id_from_href href
      end
    end
    
    def update attrs
      put '',:query => {self.class.to_s.tableize => attrs}
    end
    
    def destroy
      delete ''
    end

    def method_missing method,*args
      if %w(get head post put delete).include? method.to_s
        args[0] = "#{path}#{args[0]}"
        RightScaleAPI::Client.send method, *args
      else
        super method, *args
      end
    end
    
    def uri
      self.class.base_uri + path
    end
    protected
    
    def self.collection_uri uri=nil
      if uri
        @collection_uri= uri
      end
      @collection_uri
    end
    
    def collection_uri
      self.class.collection_uri
    end
    
    def path
      collection_uri + "/" + id
    end
    
    def id_from_href href
      href.split('/').last
    end
    
    def path_from_href href
      URI.parse(href).path
    end
  end
