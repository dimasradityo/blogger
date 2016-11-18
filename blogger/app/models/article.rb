class Article < ApplicationRecord
    has_many :comments
    has_many :taggings
    has_many :tags, through: :taggings

        def tag_list
            self.tags.map do |tag|
                tag.name
        end.join(', ')
        end

        def tag_list=(tags_strings)
            tag_names = tags_strings.split(',').map{|x| x.strip.downcase}.uniq
            new_or_found_tags = tag_names.map{|name| Tag.find_or_create_by(name: name)}
            self.tags = new_or_found_tags
        end
end
