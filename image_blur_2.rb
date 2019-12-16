class Image

  def initialize(array)
    @image = array
    @row_length = array.length
    @col_length = array[0].length
  end

  def output_image
    @image.each do |row|
      row.each do |pixel|
        print pixel, ' '
      end
      puts
    end
  end

  def blur(row_index, pixel_index)
    @image[row_index][pixel_index + 1] = 1 unless pixel_index >= @col_length-1
    @image[row_index][pixel_index - 1] = 1 unless pixel_index == 0
    @image[row_index + 1][pixel_index] = 1 unless row_index >= @row_length-1
    @image[row_index - 1][pixel_index] = 1 unless row_index == 0
  end

  def scan_array
    temp_array = []

    @image.each_with_index do |row_array, row_index|
      row_array.each_with_index do |pix, pixel_index|
        if pix == 1
          temp_array << [row_index, pixel_index]
        end
      end
    end
    temp_array
  end

  def do_blur
    array_coords = scan_array
    array_coords.each do |x, y|
      blur(x, y)
    end
  end

end


image = Image.new([
  [0, 0, 0, 0],
  [0, 1, 0, 0],
  [0, 0, 0, 1],
  [0, 0, 0, 0]
])

puts "before blur:"
image.output_image
puts "after blur:"
image.do_blur
image.output_image