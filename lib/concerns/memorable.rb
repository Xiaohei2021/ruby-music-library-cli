module Memorable

    # module InstanceMethods
    #     def initialize
    #         self.class.all << self
    #     end
    # end 

    
    
    module ClassMethods

        def destroy_all
            self.all.clear
        end

    end
end 