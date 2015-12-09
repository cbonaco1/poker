require 'arrays'

describe "Array" do

  describe "#my_uniq" do
    it "removes duplicate values" do
      expect([1, 2, 1, 3, 3].my_uniq).to eq([1, 2, 3])
    end
  end

  describe "#two_sum" do
    it "finds all pairs of positions where the elements at those positions sum to zero" do
      expect([-1, 0, 2, -2, 1].two_sum).to eq([[0, 4], [2, 3]])
    end
  end

  describe "#my_transpose" do
    let(:test_array) { [
                        [0, 1, 2],
                        [3, 4, 5],
                        [6, 7, 8]
                      ]}

    it "converts row to columns and converts columns to rows" do

      expect(test_array.my_transpose).to eq([[0, 3, 6],
                                             [1, 4, 7],
                                             [2, 5, 8]]
                                        )
    end
  end

  describe "#stock_picker" do
    let(:variable_stocks) { [20, 10, 50, 5, 10] }
    let(:increasing_stocks) { [10, 20, 40, 70, 73] }
    let(:decreasing_stocks) { [90, 50, 45, 30, 21] }

    it "outputs the most profitable pair of days on which to first buy the stock and then sell" do
      expect(variable_stocks.stock_picker).to eq([1, 2])
      expect(increasing_stocks.stock_picker).to eq([0, 4])
      expect(decreasing_stocks.stock_picker).to eq([1, 2])
    end
  end

end
