class Bookshelf
    def generate_shelf_indexes(params)
        shelf_indexes = Array.new
        for row in 1..params["row"]
            for column in 1..params["column"]
                shelf_indexes.push("0#{params["id"]}0#{row}0#{column}")
            end
        end
        
        shelf_indexes
    end
end