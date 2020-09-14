json.set! :pokemon do 
    json.extract! @pokemon, :id, :name, :attack, :poke_type, :moves, :image_url
end

json.set! :items do
    @pokemon.items.each do |item|
        json.set! item.id do
           json.extract! item, :id, :pokemon_id, :name, :price, :happiness, :image_url 
        end
    end
end