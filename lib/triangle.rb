class Triangle
  
  
  
      def initialize(side_1, side_2, side_3)
        @side_1 = side_1 
        @side_2 = side_2 
        @side_3 = side_3
      end
        
      def equilateral? 
        @side_1 == @side_2 && @side_2 == @side_3 
      end
      
      def isosceles? 
        @side_1 == @side_2 || @side_1 == @side_3 || @side_3 == @side_2
      end
      
      def scalene? 
        @side_1 != @side_2 && @side_2 != @side_3 && @side_3 != @side_1 
      end
      
      def invalid?
        self.inequality? || self.side_is_negative? || self.side_is_zero?
      end
      
      def inequality? 
        @side_1 < @side_3 + @side_2 || @side_2 < @side_3 + @side_1  || @side_3 < @side_2 + @side_1 
      end 
      
      def side_is_zero?
        @side_1 * @side_2 *  @side_3 == 0 
      end
      
      def side_is_negative
        @side_1 <= 0 || @side_2 <= 0 || @side_3 <= 0
      end
      
      def triangle_type
        return :equilateral if self.equilateral?
        return :isosceles if self.isosceles?
        return :scalene if self.scalene?
      end
      
    def kind 
       if self.invalid?
       raise TriangleError
       
    else
      if (@side_1 == @side_2) && (@side_2 == @side_3)
        :equilateral
      elsif (@side_1 == @side_2) || (@side_2 == @side_3) || (@side_1 == @side_3)
        :isosceles
      elsif (@side_1 != @side_2) && (@side_2 != @side_3) && (@side_1 != @side_3)
        :scalene
      end
    end
     end
   
      
      
      class TriangleError < StandardError
        
        def message 
          "This is not a valid triangle. The sum of 2 sides of a triangle must be greater than the last side." 
        end
        
      end
    
    
    end
