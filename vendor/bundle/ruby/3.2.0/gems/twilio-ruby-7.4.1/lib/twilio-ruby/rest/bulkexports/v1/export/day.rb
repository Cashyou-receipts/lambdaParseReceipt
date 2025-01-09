##
#    This code was generated by
#    ___ _ _ _ _ _    _ ____    ____ ____ _    ____ ____ _  _ ____ ____ ____ ___ __   __
#     |  | | | | |    | |  | __ |  | |__| | __ | __ |___ |\ | |___ |__/ |__|  | |  | |__/
#     |  |_|_| | |___ | |__|    |__| |  | |    |__] |___ | \| |___ |  \ |  |  | |__| |  \
#
#    Twilio - Bulkexports
#    This is the public Twilio REST API.
#
#    NOTE: This class is auto generated by OpenAPI Generator.
#    https://openapi-generator.tech
#    Do not edit the class manually.
#


module Twilio
    module REST
        class Bulkexports < BulkexportsBase
            class V1 < Version
                class ExportContext < InstanceContext

                     class DayList < ListResource
                
                    ##
                    # Initialize the DayList
                    # @param [Version] version Version that contains the resource
                    # @return [DayList] DayList
                    def initialize(version, resource_type: nil)
                        super(version)
                        # Path Solution
                        @solution = { resource_type: resource_type }
                        @uri = "/Exports/#{@solution[:resource_type]}/Days"
                        
                    end
                
                    ##
                    # Lists DayInstance records from the API as a list.
                    # Unlike stream(), this operation is eager and will load `limit` records into
                    # memory before returning.
                    # @param [Integer] limit Upper limit for the number of records to return. stream()
                    #    guarantees to never return more than limit.  Default is no limit
                    # @param [Integer] page_size Number of records to fetch per request, when
                    #    not set will use the default value of 50 records.  If no page_size is defined
                    #    but a limit is defined, stream() will attempt to read the limit with the most
                    #    efficient page size, i.e. min(limit, 1000)
                    # @return [Array] Array of up to limit results
                    def list(limit: nil, page_size: nil)
                        self.stream(
                            limit: limit,
                            page_size: page_size
                        ).entries
                    end

                    ##
                    # Streams Instance records from the API as an Enumerable.
                    # This operation lazily loads records as efficiently as possible until the limit
                    # is reached.
                    # @param [Integer] limit Upper limit for the number of records to return. stream()
                    #    guarantees to never return more than limit.  Default is no limit
                    # @param [Integer] page_size Number of records to fetch per request, when
                    #    not set will use the default value of 50 records.  If no page_size is defined
                    #    but a limit is defined, stream() will attempt to read the limit with the most
                    #    efficient page size, i.e. min(limit, 1000)
                    # @return [Enumerable] Enumerable that will yield up to limit results
                    def stream(limit: nil, page_size: nil)
                        limits = @version.read_limits(limit, page_size)

                        page = self.page(
                            page_size: limits[:page_size], )

                        @version.stream(page, limit: limits[:limit], page_limit: limits[:page_limit])
                    end

                    ##
                    # When passed a block, yields DayInstance records from the API.
                    # This operation lazily loads records as efficiently as possible until the limit
                    # is reached.
                    def each
                        limits = @version.read_limits

                        page = self.page(page_size: limits[:page_size], )

                        @version.stream(page,
                            limit: limits[:limit],
                            page_limit: limits[:page_limit]).each {|x| yield x}
                    end

                    ##
                    # Retrieve a single page of DayInstance records from the API.
                    # Request is executed immediately.
                    # @param [String] page_token PageToken provided by the API
                    # @param [Integer] page_number Page Number, this value is simply for client state
                    # @param [Integer] page_size Number of records to return, defaults to 50
                    # @return [Page] Page of DayInstance
                    def page(page_token: :unset, page_number: :unset, page_size: :unset)
                        params = Twilio::Values.of({
                            'PageToken' => page_token,
                            'Page' => page_number,
                            'PageSize' => page_size,
                        })
                        headers = Twilio::Values.of({})
                        
                        

                        response = @version.page('GET', @uri, params: params, headers: headers)

                        DayPage.new(@version, response, @solution)
                    end

                    ##
                    # Retrieve a single page of DayInstance records from the API.
                    # Request is executed immediately.
                    # @param [String] target_url API-generated URL for the requested results page
                    # @return [Page] Page of DayInstance
                    def get_page(target_url)
                        response = @version.domain.request(
                            'GET',
                            target_url
                        )
                    DayPage.new(@version, response, @solution)
                    end
                    


                    # Provide a user friendly representation
                    def to_s
                        '#<Twilio.Bulkexports.V1.DayList>'
                    end
                end


                class DayContext < InstanceContext
                    ##
                    # Initialize the DayContext
                    # @param [Version] version Version that contains the resource
                    # @param [String] resource_type The type of communication – Messages, Calls, Conferences, and Participants
                    # @param [String] day The ISO 8601 format date of the resources in the file, for a UTC day
                    # @return [DayContext] DayContext
                    def initialize(version, resource_type, day)
                        super(version)

                        # Path Solution
                        @solution = { resource_type: resource_type, day: day,  }
                        @uri = "/Exports/#{@solution[:resource_type]}/Days/#{@solution[:day]}"

                        
                    end
                    ##
                    # Fetch the DayInstance
                    # @return [DayInstance] Fetched DayInstance
                    def fetch

                        headers = Twilio::Values.of({'Content-Type' => 'application/x-www-form-urlencoded', })
                        
                        
                        
                        
                        
                        payload = @version.fetch('GET', @uri, headers: headers)
                        DayInstance.new(
                            @version,
                            payload,
                            resource_type: @solution[:resource_type],
                            day: @solution[:day],
                        )
                    end


                    ##
                    # Provide a user friendly representation
                    def to_s
                        context = @solution.map{|k, v| "#{k}: #{v}"}.join(',')
                        "#<Twilio.Bulkexports.V1.DayContext #{context}>"
                    end

                    ##
                    # Provide a detailed, user friendly representation
                    def inspect
                        context = @solution.map{|k, v| "#{k}: #{v}"}.join(',')
                        "#<Twilio.Bulkexports.V1.DayContext #{context}>"
                    end
                end

                class DayPage < Page
                    ##
                    # Initialize the DayPage
                    # @param [Version] version Version that contains the resource
                    # @param [Response] response Response from the API
                    # @param [Hash] solution Path solution for the resource
                    # @return [DayPage] DayPage
                    def initialize(version, response, solution)
                        super(version, response)

                        # Path Solution
                        @solution = solution
                    end

                    ##
                    # Build an instance of DayInstance
                    # @param [Hash] payload Payload response from the API
                    # @return [DayInstance] DayInstance
                    def get_instance(payload)
                        DayInstance.new(@version, payload, resource_type: @solution[:resource_type])
                    end

                    ##
                    # Provide a user friendly representation
                    def to_s
                        '<Twilio.Bulkexports.V1.DayPage>'
                    end
                end
                class DayInstance < InstanceResource
                    ##
                    # Initialize the DayInstance
                    # @param [Version] version Version that contains the resource
                    # @param [Hash] payload payload that contains response from Twilio
                    # @param [String] account_sid The SID of the
                    #   {Account}[https://www.twilio.com/docs/iam/api/account] that created this Day
                    #   resource.
                    # @param [String] sid The SID of the Call resource to fetch.
                    # @return [DayInstance] DayInstance
                    def initialize(version, payload , resource_type: nil, day: nil)
                        super(version)
                        
                        # Marshaled Properties
                        @properties = { 
                            'redirect_to' => payload['redirect_to'],
                            'day' => payload['day'],
                            'size' => payload['size'] == nil ? payload['size'] : payload['size'].to_i,
                            'create_date' => payload['create_date'],
                            'friendly_name' => payload['friendly_name'],
                            'resource_type' => payload['resource_type'],
                        }

                        # Context
                        @instance_context = nil
                        @params = { 'resource_type' => resource_type  || @properties['resource_type']  ,'day' => day  || @properties['day']  , }
                    end

                    ##
                    # Generate an instance context for the instance, the context is capable of
                    # performing various actions.  All instance actions are proxied to the context
                    # @return [DayContext] CallContext for this CallInstance
                    def context
                        unless @instance_context
                            @instance_context = DayContext.new(@version , @params['resource_type'], @params['day'])
                        end
                        @instance_context
                    end
                    
                    ##
                    # @return [String] 
                    def redirect_to
                        @properties['redirect_to']
                    end
                    
                    ##
                    # @return [String] The ISO 8601 format date of the resources in the file, for a UTC day
                    def day
                        @properties['day']
                    end
                    
                    ##
                    # @return [String] The size of the day's data file in bytes
                    def size
                        @properties['size']
                    end
                    
                    ##
                    # @return [String] The ISO 8601 format date when resources is created
                    def create_date
                        @properties['create_date']
                    end
                    
                    ##
                    # @return [String] The friendly name specified when creating the job
                    def friendly_name
                        @properties['friendly_name']
                    end
                    
                    ##
                    # @return [String] The type of communication – Messages, Calls, Conferences, and Participants
                    def resource_type
                        @properties['resource_type']
                    end
                    
                    ##
                    # Fetch the DayInstance
                    # @return [DayInstance] Fetched DayInstance
                    def fetch

                        context.fetch
                    end

                    ##
                    # Provide a user friendly representation
                    def to_s
                        values = @params.map{|k, v| "#{k}: #{v}"}.join(" ")
                        "<Twilio.Bulkexports.V1.DayInstance #{values}>"
                    end

                    ##
                    # Provide a detailed, user friendly representation
                    def inspect
                        values = @properties.map{|k, v| "#{k}: #{v}"}.join(" ")
                        "<Twilio.Bulkexports.V1.DayInstance #{values}>"
                    end
                end

             end
            end
        end
    end
end


