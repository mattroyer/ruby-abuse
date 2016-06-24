config_doc = """names: Jim, John, Jack
stuff: You see this?
message: This is your robot overlord speaking
"""

acceptable_options = ["names", "stuff"]

key_separator = -> (str) { str.split(":").map(&:strip) }
split_commas = -> (str) { str[1].include?(",") ? [str[0], str[1].split(",").map(&:strip)] : str }
filter_results = -> (str) { str[0].match(acceptable_options.join("|")) ? str : nil }

puts config_doc.split("\n").map(&key_separator).map(&filter_results).compact.map(&split_commas).to_h

#=> {"names"=>["Jim", "John", "Jack"], "stuff"=>"You see this?"}
