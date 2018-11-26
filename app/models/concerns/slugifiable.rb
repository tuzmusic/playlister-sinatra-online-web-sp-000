module Slugifiable

  module InstanceMethods
    def slug
      self.name.downcase.gsub(' ','-')
    end
  end 

  module ClassMethods
    def find_by_slug(slug)
      self.all.each do |item|
        return item if item.slug == slug
      end
    end
  end
end