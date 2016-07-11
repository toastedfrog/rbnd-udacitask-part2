class TodoItem
  include Listable
  attr_reader :description, :due, :priority

  def initialize(description, options={})
    @description = description
    @due = options[:due] ? Chronic.parse(options[:due]) : options[:due]
    @priority = options[:priority]
  end
  def details
    format_item_type("todo") + 
    format_description(@description) + "due: " +
    format_date([@due]) + format_priority(@priority)
  end
end
