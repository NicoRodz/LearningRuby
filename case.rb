print "Dame tu calificacion (1-10): "
calificacion = gets.chomp.to_i

case calificacion
when 10
  puts "muy bien ! "
when 9
  puts "bieen"
when 8
  puts "esoo"
when 6
  puts "casi wmo"
else
  puts "defect case"
end
