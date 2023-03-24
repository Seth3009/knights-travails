class Node
  attr_accessor :position, :children
  
  def initialize(position, children=[])
    @position = position
    @children = children
  end
end

def knight_moves(start_pos, end_pos)
  # Define possible moves of the knight
  moves = [[-2,-1], [-2,1], [2,-1], [2,1], [-1,-2], [1,-2], [-1,2], [1,2]]
  
  # Initialize queue with start position
  queue = [start_pos]
  
  # Initialize hash to keep track of visited positions and their parents
  visited = {start_pos => nil}
  
  # Breadth-first search
  until queue.empty?
    current_pos = queue.shift
    
    # Check if current position is the end position
    if current_pos == end_pos
      # Build path from start to end position
      path = []
      pos = current_pos
      until pos.nil?
        path.unshift(pos)
        pos = visited[pos]
      end
      return path
    end
    
    # Generate next possible positions
    moves.each do |move|
      new_pos = [current_pos[0] + move[0], current_pos[1] + move[1]]
      if new_pos[0].between?(0, 7) && new_pos[1].between?(0, 7) && !visited.include?(new_pos)
        queue << new_pos
        visited[new_pos] = current_pos
      end
    end
  end
  
  # If end position is not reached, return nil
  return nil
end

# Set starting position of knight
knight_pos = [0, 0]

# Set target position for knight
target_pos = [3, 3]

# Find shortest path from knight to target position
path = knight_moves(knight_pos, target_pos)

# Print path
if path.nil?
  puts "No path found."
else
  puts "Shortest path:"
  path.each { |pos| puts "#{pos}" }
end

knight_moves([3,3],[4,3])