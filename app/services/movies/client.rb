module Movies
    class Client < HttpClient
        def get
            super do
                puts "hello"
            end
        end
    end
end
