module Services 
    class HttpClient
        def get(&block)
            Rails.logger.info("Making get Request")
            yield
            Rails.logger.info("Get Request completed")
        end

        def post

        end

        def put

        end
        
        def delete

        end
    end
end