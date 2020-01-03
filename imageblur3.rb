class Image
  def initialize image_arr
    @ordinal_arr = []
    @image_arr = image_arr
  end
   def distance(x1,x2,y1,y2)
    xdistance = (x2-x1).abs
    ydistance = (y2-y1).abs
    distance = ydistance + xdistance
    return distance
   end
  # should return 
  # 0000
  # 0100
  # 0001
  # 0000
  def discover_points # step 1
    x = 0
    y = 0
    @image_arr.each do |row|
      x = 0
      row.each do |cell|
        if cell == 1 # discovered the cell is 1
          @ordinal_arr.push([y,x]) # this is where i push the ordinals.
          puts "#{y},#{x}"
        end
        x = x + 1
      end
    y = y + 1
      puts ""  
    end
  end  

  def blur(userDefineVariable) # step 2
    x = 0
    y = 0
    @image_arr.each do |row|
      x = 0
      row.each do |cell|
        # if cell == 1 # discovered the cell is 1
        #   @ordinal_arr.push([y,x]) # this is where i push the ordinals.
        #   puts "#{y},#{x}"
        # end
        @ordinal_arr.each do |point|
          if distance(x, point[1], y, point[0])<= userDefineVariable
            @image_arr[y][x] = 1
          end
        end  


        x = x + 1
      end
    y = y + 1
      puts ""  
    end
  end

  def output_image # step 3
    @image_arr.each do |row|
      row.each do |cell|
        print cell
      end
      puts ""  
    end
  end 
end

image = Image.new([
  [0, 0, 0, 0],
  [0, 1, 0, 0],
  [0, 0, 0, 1],
  [0, 0, 0, 0]
])
image.output_image
image.discover_points
image.blur(3)
image.output_image