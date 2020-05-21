# require modules here
require 'yaml'
require 'pry'

def load_library(infile)
  inhash = YAML.load_file(infile)
  inhash.each_with_object({}) { | (ik1_name, iv1_emoticon_arr), main_hash |
    main_hash[ik1_name] = {
      english: iv1_emoticon_arr[0],
      japanese: iv1_emoticon_arr[1]
    }
  }
end

def get_japanese_emoticon(infile,emoticon)
  hash = load_library(infile)
  hash.each { | name, val |
    #binding.pry
    if val[:english] == emoticon
      return val[:japanese]
    end
  }
  "Sorry, that emoticon was not found"
end

def get_english_meaning(infile,emoticon)
  hash = load_library(infile)
  hash.each { | name, val |
    if val[:japanese] == emoticon
      return name
    end
  }
  "Sorry, that emoticon was not found"
end

=begin
inhash
ik1_name string
iv1_emoticon_arr
iv2_emoticon

mainhash
k1_name (string)
v1_langhash
k2_langval (symbol)
v2_emoticon (string)
=end