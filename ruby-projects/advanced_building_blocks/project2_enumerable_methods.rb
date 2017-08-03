module Enumerable
    def my_each
        i = 0
        while i < self.length
            yield(self[i])
            i += 1
        end
        self
    end

    def my_each_with_index
        i = 0
        while i < self.length
            yield(self[i], i)
            i += 1
        end
        self
    end

    def my_select
        new_array = []
        self.my_each do |i|
            new_array.push i if yield i      
        end
        new_array 
    end

    def my_all?
        self.my_each do |i|
            return false unless yield i
        end
        true
    end

    def my_any? 
        self.my_each do |i|
            return true if yield i
        end
        false
    end

    def my_none?
        not self.my_any? do |i|
            yield i
        end
    end

    def my_count
        count = 0
        self.my_each do |i|
            count += 1 if yield i
        end
        count
    end

    def my_map
        new_array = []
        self.my_each do |i|
            new_array.push(yield i)
        end
        new_array
    end

    def my_inject(memo = nil)
        n = self.length
        if memo.nil? 
            memo = self[0]
            self[1..-1].each do |i|
                memo = yield(memo, i)
            end
        else
            self.each do |i|
                memo = yield(memo, i)
            end
        end
        memo
    end

end

def multiply_els(array)
    array.my_inject { |product, n| product * n  }
end

my_proc = Proc.new { |i| i + 2 }

p [1, 2, 3, 4].my_map(&my_proc)
