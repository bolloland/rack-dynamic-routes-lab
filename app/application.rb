require 'pry'
class Application

    @@items = [Item.new("Figs",3.42), Item.new("Pears", 0.99)]


    def call(env)
        resp = Rack::Response.new
        req = Rack::Request.new(env)

        if req.path.match(/items/)
            #binding.pry
            i = req.path.split("/items/").last #=> "Figs"
            item =@@items.find{|item_from_array| item_from_array.name == i}
            # binding.pry
            if !!item
                resp.write item.price
            else 
                resp.status = 400
                resp.write "Item not found"
                
            end
            
                
        else
            resp.status = 404
            resp.write "Route not found"
        end
        resp.finish
    end
end 

          
        #     item_name = req.params["q"]
      
        #     if @@items.include?(item_name)
        #       resp.write "#{search_term} is one of our items"
        #     else
        #       resp.write "Couldn't find #{search_term}"
        #     end
      
        #   else
        #     resp.write "Path Not Found"
        #   end
      
