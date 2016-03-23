require "multi_json"

module Dhh
  module Model
    class FileModel
      def initialize(filename)
        @filename = filename

        # If filename is "fir/37.json", @id is 37
        basename = File.split(filename)[-1]
        @id = File.basename(basename, ".json").to_i

        obj = File.read(filename)
        @hash = MultiJson.load(obj)
      end

      def [](name)
        @hash[name.to_s]
      end
      
      def []=(name, value)
        @hash[name.to_s] = value
      end

      # oh my! Framework know the *exact* directory
      # where to put and search for files!!! 
      def self.find(id)
       begin
        FileModel.new("db/quotes/#{id}.json") 
       rescue
         return nil
       end
      end

      def self.find_all
        begin
         Dir["db/quotes/*.json"].map do |f|
           FileModel.new f
         end
        rescue
          return nil
        end
      end

      def self.create(attrs)
        hash = {}
        hash["submitter"] = attrs["submitter"] || ""
        hash["quote"] = attrs["quote"] || ""
        hash["attribution"] = attrs["attribution"] || ""
        
        files = Dir["db/quotes/*.json"]
        names = files.map { |f| f.split("/")[-1] }
        highest = names.map { |b| b.to_i }.max
        id = highest + 1

        File.open("db/quotes/#{id}.json", "w") do |f|
          f.write <<TEMPLATE
          {
            "submitter":"#{hash["submitter"]}",
            "quote":"#{hash["quote"]}",
            "attribution":"#{hash["attribution"]}"
          }
TEMPLATE
         end

        FileModel.new "db/quotes/#{id}.json"
      end

      def self.method_missing(name, *args, &block)
        /^find_all_by_(?<property>.*)/ =~ name.to_s
        super unless property
        models = Array.new
        Dir["db/quotes/*.json"].map do |f|
          model = FileModel.new f
          models << model if model[property] == args[0]
        end
        models 
      end

      def self.respond_to_missing?(name, include_private = false)
        /^find_all_by_(?<property>.*)/ =~ name.to_s
        !!property || super
      end

    end
  end
end
