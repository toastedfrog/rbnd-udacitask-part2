module Listable
  # Listable methods go here
  def format_description(description)
    "#{description}".ljust(25)
  end
  
  def format_date(date_range)
  	if date_range.length == 1
  		dates = date_range[0] ? date_range[0].strftime("%D") : "No due date"
  	elsif date_range.length == 2
  		dates = date_range[0].strftime("%D") if date_range[0]
  		dates << " -- " + date_range[1].strftime("%D") if date_range[1]
  		dates = "N/A" if !dates
  	end
  	return dates
  end
  
  def format_priority(priority)
    value = " ⇧" if priority == "high"
    value = " ⇨" if priority == "medium"
    value = " ⇩" if priority == "low"
    value = "" if !priority
    return value
  end
end
