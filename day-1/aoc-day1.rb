def HistorianHysteria(arr1, arr2)

  arr1.sort!
  arr2.sort!

  diff = 0

  for i in 0..arr1.length()-1 do
    if arr1[i].to_i > arr2[i].to_i
      diff += (arr1[i].to_i - arr2[i].to_i)
    else
      diff += (arr2[i].to_i - arr1[i].to_i)
    end
  end
  puts arr2
  puts diff

  return diff

end

input1 = File.read("arr1.txt").split
input2 = File.read("arr2.txt").split

HistorianHysteria(input1, input2)
