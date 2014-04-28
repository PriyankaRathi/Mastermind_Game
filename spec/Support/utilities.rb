def is_valid_number?(target_string)
  /\A\d+\Z/.match(target_string) == nil ? false : true
end

def is_duplicate?(target_string)
  target_string.chars.length == target_string.chars.uniq.length
end