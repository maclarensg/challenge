eval <<-RUBY
class ConstraintChecker
    def initialize
        @items = {}
    end
    def <<(val)
        return unless val.to_i > 0
        raise if @items[val]
        @items[val] = true
    end
end
RUBY

def sudoku2(grid)
    c = 9.times.map { ConstraintChecker.new }
    r = 9.times.map { ConstraintChecker.new }
    b = 9.times.map { ConstraintChecker.new }
    p c,r, b
    begin
        9.times { |i|
            9.times { |j|
                r[i] << grid[i][j]
                c[j] << grid[i][j]
                b[(i / 3) * 3 + (j / 3)] << grid[i][j]
                p c
                p r
                p b
            }
        }
        true
    rescue
        false
    end
end


grid = [['.', '.', '.', '1', '4', '.', '.', '2', '.'],
        ['.', '.', '6', '.', '.', '.', '.', '.', '.'],
        ['.', '.', '.', '.', '.', '.', '.', '.', '.'],
        ['.', '.', '1', '.', '.', '.', '.', '.', '.'],
        ['.', '6', '7', '.', '.', '.', '.', '.', '9'],
        ['.', '.', '.', '.', '.', '.', '8', '1', '.'],
        ['.', '3', '.', '.', '.', '.', '.', '.', '6'],
        ['.', '.', '.', '.', '.', '7', '.', '.', '.'],
        ['.', '.', '.', '5', '.', '.', '.', '7', '.']]

grid = [[".",".",".",".",".",".",".",".","."], 
        [".",".","2",".",".",".",".",".","."], 
        [".",".",".",".",".","2","7","1","."], 
        [".",".",".",".",".",".",".",".","."], 
        [".","2",".",".",".",".",".",".","."], 
        [".","5",".",".",".",".",".",".","."], 
        [".",".",".",".","9",".",".",".","8"], 
        [".",".",".",".",".","1","6",".","."], 
        [".",".",".",".","6",".",".",".","."]]
        

p sudoku2(grid)

grid = [['.', '.', '.', '.', '2', '.', '.', '9', '.'],
         ['.', '.', '.', '.', '6', '.', '.', '.', '.'],
         ['7', '1', '.', '.', '7', '5', '.', '.', '.'],
         ['.', '7', '.', '.', '.', '.', '.', '.', '.'],
         ['.', '.', '.', '.', '8', '3', '.', '.', '.'],
         ['.', '.', '8', '.', '.', '7', '.', '6', '.'],
         ['.', '.', '.', '.', '.', '2', '.', '.', '.'],
         ['.', '1', '.', '2', '.', '.', '.', '.', '.'],
         ['.', '2', '.', '.', '3', '.', '.', '.', '.']]