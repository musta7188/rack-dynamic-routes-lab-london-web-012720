class Application
    @@items = [Item.new("Apple", 5), Item.new("Banana", 7)]
    def call(env)
        resp = Rack::Response.new
        req = Rack::Request.new(env)
        
        if req.path.match(/items/)
        saerch_term = req.path.split("/items/").last
        item = @@items.find {|i|i.name == saerch_term }
            
        if !item
            resp.status = 400
            resp.write "Item not found"
        else
            resp.write item.price
        end
        else 
    	resp.write "Route not found"
        resp.status = 404

        end
        resp.finish
    end

end




# Your application should only accept the 
# /items/<ITEM NAME> route. Everything else 
# should 404
# If a user requests /items/<Item Name> 
# it should return the price of that item
# IF a user requests an item that you don
# 't have, then return a 400 and an error message