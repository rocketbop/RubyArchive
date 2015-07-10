
def method_use_diff_type(str, dic, *splat)
    puts "str: #{str}, dic: #{dic}, splat: #{splat}"
end

method_use_diff_type "str", {:key1 => "value1", :key2 => "value2"}, 1, 3, 4, 5

