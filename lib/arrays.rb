class Array
  def my_uniq
    result = []
    self.each do |val|
      result << val unless result.include?(val)
    end

    result
  end

  def two_sum
    result = []
    count.times do |i|
      (count - i).times do |j|
        next if j == 0
        if self[i] + self[i+j] == 0
          result << [i, i+j]
        end
      end
    end

    result
  end

  def my_transpose
    number_new_rows = self.first.count
    result = Array.new(number_new_rows) {[]}
    self.each_with_index do |row, row_i|
      row.each_with_index do |col, col_i|
        result[col_i] << col

      end
    end
    result
  end

  def stock_picker
    max_profit = nil
    best_days = nil
    self.each_with_index do |buy_val, buy_idx|
      (1...(count - buy_idx)).each do |days|
        sell_val = self[buy_idx + days]
        if max_profit.nil? || sell_val - buy_val > max_profit
          max_profit = sell_val - buy_val
          best_days = [buy_idx, buy_idx + days]
        end
      end
    end

    best_days
  end




end
