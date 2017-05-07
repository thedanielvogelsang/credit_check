require 'pry'
def credit_check?(creditnum)
  y = []
  x = creditnum.to_s.chars
  x.each_with_index do |num, i|
    unless i % 2 == 0
      y << num.to_i
    else
      l = num.to_i * 2
      y << l
    end
  end
  z = y.map do |num|
    if num >= 10
      r = num.to_s.split('')
      rr = r.map {|x| x.to_i}
      t = rr.reduce(:+)
      num = t
    else
      num
    end
  end
  print z
  final = z.reduce(:+)
  puts final
  if final % 10 == 0
    puts "VALID!"
  else
    puts "INVALID!"
  end
end
credit_check?(1847750539)
credit_check?(6011797668867828)
credit_check?(4024007136512380)
