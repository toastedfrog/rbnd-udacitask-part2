class FileItem
	include Listable
	attr_reader :description, :file_hunk, :due
	
	def initialize(file_path, options={})
		@description = file_path
		@file_hunk = get_hunk file_path
		@due = Chronic.parse(options[:due]) if options[:due]
	end
	
	def details
		format_item_type("file") +
		format_description(@description) + 
		format_date(@due) + "\n" +
		format_hunk(@file_hunk)
	end
	
	def get_hunk(file_path)
		path = File.join(File.dirname(__FILE__), '../' + file_path)
		file = File.open(path)
		hunk_return = []
		(1..3).each {|line| hunk_return << file.gets}
		file.close
		hunk_return
	end
end