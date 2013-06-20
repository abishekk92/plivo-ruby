require 'recursive-open-struct'

def convert_to_field(hash)
	RecursiveOpenStruct.new hash,:recurse_over_arrays=>true
end


