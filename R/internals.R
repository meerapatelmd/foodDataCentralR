



get <-
        function(endpoint,
                 token,
                 ...) {

                url <- "https://api.nal.usda.gov/fdc"

                if (!missing(...)) {

                        Args <- list(api_key = token, ...)

                        httr::GET(url = url,
                                  path = endpoint,
                                  query = Args)

                } else {

                        httr::GET(url = url,
                                  httr::add_headers(api_key = token))

                }
        }


get_ff <-
        function(endpoint) {

                function(...,
                         token) {

                        get(endpoint = endpoint,
                            token = token,
                            ...)
                }
        }


get_search <-
        get_ff(endpoint = "/v1/foods/search")

get_search(query = "banana",
           token = Sys.getenv("FDC_API_KEY"))
