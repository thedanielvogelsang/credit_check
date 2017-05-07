require 'pry'
def credit_check?(creditnum, type)
  if type == "American Express"
    y = []
    x = creditnum.to_s.chars

    x.each_with_index do |num, index|
      if index % 2 == 0
        y << (num.to_i)
      else
        l = (num.to_i * 2)
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
  elsif type != "American Express"
    y = []
    x = creditnum.to_s.chars
    x.each_with_index do |num, index|
      unless index % 2 == 0
        y << (num.to_i)
      else
        l = (num.to_i * 2)
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

credit_check?(342804633855673, "American Express")
credit_check?(4024007136512380, "Master Card")
credit_check?(6011797668867828, "Discover")
