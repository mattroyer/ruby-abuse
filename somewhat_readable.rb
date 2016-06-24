config_doc = """names: Jim, John, Jack
stuff: You see this?
message: This is your robot overlord speaking
"""

def parse_doc(doc)
  lines = doc.split("\n").map do |line|
    line = line.split(":").map(&:strip)
    if line[1].include? ","
      line[1] = line[1].split(",").map(&:strip)
      line
    else
      line
    end
  end
  Hash[*lines.flatten(1)]
end

def load_config(options)
  possible_options = ["names", "stuff"].join("|")

  choices = options.select { |key, value| key.to_s.match possible_options }

  choices
end

p load_config parse_doc(config_doc)

#=> {"names"=>["Jim", "John", "Jack"], "stuff"=>"You see this?"}
