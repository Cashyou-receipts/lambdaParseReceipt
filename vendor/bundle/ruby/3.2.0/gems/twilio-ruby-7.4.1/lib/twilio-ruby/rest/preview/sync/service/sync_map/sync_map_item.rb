##
#    This code was generated by
#    ___ _ _ _ _ _    _ ____    ____ ____ _    ____ ____ _  _ ____ ____ ____ ___ __   __
#     |  | | | | |    | |  | __ |  | |__| | __ | __ |___ |\ | |___ |__/ |__|  | |  | |__/
#     |  |_|_| | |___ | |__|    |__| |  | |    |__] |___ | \| |___ |  \ |  |  | |__| |  \
#
#    Twilio - Preview
#    This is the public Twilio REST API.
#
#    NOTE: This class is auto generated by OpenAPI Generator.
#    https://openapi-generator.tech
#    Do not edit the class manually.
#


module Twilio
    module REST
        class Preview < PreviewBase
            class Sync < Version
                class ServiceContext < InstanceContext
                class SyncMapContext < InstanceContext

                     class SyncMapItemList < ListResource
                
                    ##
                    # Initialize the SyncMapItemList
                    # @param [Version] version Version that contains the resource
                    # @return [SyncMapItemList] SyncMapItemList
                    def initialize(version, service_sid: nil, map_sid: nil)
                        super(version)
                        # Path Solution
                        @solution = { service_sid: service_sid, map_sid: map_sid }
                        @uri = "/Services/#{@solution[:service_sid]}/Maps/#{@solution[:map_sid]}/Items"
                        
                    end
                    ##
                    # Create the SyncMapItemInstance
                    # @param [String] key 
                    # @param [Object] data 
                    # @return [SyncMapItemInstance] Created SyncMapItemInstance
                    def create(
                        key: nil, 
                        data: nil
                    )

                        data = Twilio::Values.of({
                            'Key' => key,
                            'Data' => Twilio.serialize_object(data),
                        })

                        headers = Twilio::Values.of({'Content-Type' => 'application/x-www-form-urlencoded', })
                        
                        
                        
                        
                        
                        payload = @version.create('POST', @uri, data: data, headers: headers)
                        SyncMapItemInstance.new(
                            @version,
                            payload,
                            service_sid: @solution[:service_sid],
                            map_sid: @solution[:map_sid],
                        )
                    end

                
                    ##
                    # Lists SyncMapItemInstance records from the API as a list.
                    # Unlike stream(), this operation is eager and will load `limit` records into
                    # memory before returning.
                    # @param [QueryResultOrder] order 
                    # @param [String] from 
                    # @param [QueryFromBoundType] bounds 
                    # @param [Integer] limit Upper limit for the number of records to return. stream()
                    #    guarantees to never return more than limit.  Default is no limit
                    # @param [Integer] page_size Number of records to fetch per request, when
                    #    not set will use the default value of 50 records.  If no page_size is defined
                    #    but a limit is defined, stream() will attempt to read the limit with the most
                    #    efficient page size, i.e. min(limit, 1000)
                    # @return [Array] Array of up to limit results
                    def list(order: :unset, from: :unset, bounds: :unset, limit: nil, page_size: nil)
                        self.stream(
                            order: order,
                            from: from,
                            bounds: bounds,
                            limit: limit,
                            page_size: page_size
                        ).entries
                    end

                    ##
                    # Streams Instance records from the API as an Enumerable.
                    # This operation lazily loads records as efficiently as possible until the limit
                    # is reached.
                    # @param [QueryResultOrder] order 
                    # @param [String] from 
                    # @param [QueryFromBoundType] bounds 
                    # @param [Integer] limit Upper limit for the number of records to return. stream()
                    #    guarantees to never return more than limit.  Default is no limit
                    # @param [Integer] page_size Number of records to fetch per request, when
                    #    not set will use the default value of 50 records.  If no page_size is defined
                    #    but a limit is defined, stream() will attempt to read the limit with the most
                    #    efficient page size, i.e. min(limit, 1000)
                    # @return [Enumerable] Enumerable that will yield up to limit results
                    def stream(order: :unset, from: :unset, bounds: :unset, limit: nil, page_size: nil)
                        limits = @version.read_limits(limit, page_size)

                        page = self.page(
                            order: order,
                            from: from,
                            bounds: bounds,
                            page_size: limits[:page_size], )

                        @version.stream(page, limit: limits[:limit], page_limit: limits[:page_limit])
                    end

                    ##
                    # When passed a block, yields SyncMapItemInstance records from the API.
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
                    # Retrieve a single page of SyncMapItemInstance records from the API.
                    # Request is executed immediately.
                    # @param [QueryResultOrder] order 
                    # @param [String] from 
                    # @param [QueryFromBoundType] bounds 
                    # @param [String] page_token PageToken provided by the API
                    # @param [Integer] page_number Page Number, this value is simply for client state
                    # @param [Integer] page_size Number of records to return, defaults to 50
                    # @return [Page] Page of SyncMapItemInstance
                    def page(order: :unset, from: :unset, bounds: :unset, page_token: :unset, page_number: :unset, page_size: :unset)
                        params = Twilio::Values.of({
                            'Order' => order,
                            'From' => from,
                            'Bounds' => bounds,
                            'PageToken' => page_token,
                            'Page' => page_number,
                            'PageSize' => page_size,
                        })
                        headers = Twilio::Values.of({})
                        
                        

                        response = @version.page('GET', @uri, params: params, headers: headers)

                        SyncMapItemPage.new(@version, response, @solution)
                    end

                    ##
                    # Retrieve a single page of SyncMapItemInstance records from the API.
                    # Request is executed immediately.
                    # @param [String] target_url API-generated URL for the requested results page
                    # @return [Page] Page of SyncMapItemInstance
                    def get_page(target_url)
                        response = @version.domain.request(
                            'GET',
                            target_url
                        )
                    SyncMapItemPage.new(@version, response, @solution)
                    end
                    


                    # Provide a user friendly representation
                    def to_s
                        '#<Twilio.Preview.Sync.SyncMapItemList>'
                    end
                end


                class SyncMapItemContext < InstanceContext
                    ##
                    # Initialize the SyncMapItemContext
                    # @param [Version] version Version that contains the resource
                    # @param [String] service_sid 
                    # @param [String] map_sid 
                    # @param [String] key 
                    # @return [SyncMapItemContext] SyncMapItemContext
                    def initialize(version, service_sid, map_sid, key)
                        super(version)

                        # Path Solution
                        @solution = { service_sid: service_sid, map_sid: map_sid, key: key,  }
                        @uri = "/Services/#{@solution[:service_sid]}/Maps/#{@solution[:map_sid]}/Items/#{@solution[:key]}"

                        
                    end
                    ##
                    # Delete the SyncMapItemInstance
                    # @param [String] if_match The If-Match HTTP request header
                    # @return [Boolean] True if delete succeeds, false otherwise
                    def delete(
                        if_match: :unset
                    )

                        headers = Twilio::Values.of({'Content-Type' => 'application/x-www-form-urlencoded', 'If-Match' => if_match, })
                        
                        
                        
                        @version.delete('DELETE', @uri, headers: headers)
                    end

                    ##
                    # Fetch the SyncMapItemInstance
                    # @return [SyncMapItemInstance] Fetched SyncMapItemInstance
                    def fetch

                        headers = Twilio::Values.of({'Content-Type' => 'application/x-www-form-urlencoded', })
                        
                        
                        
                        
                        
                        payload = @version.fetch('GET', @uri, headers: headers)
                        SyncMapItemInstance.new(
                            @version,
                            payload,
                            service_sid: @solution[:service_sid],
                            map_sid: @solution[:map_sid],
                            key: @solution[:key],
                        )
                    end

                    ##
                    # Update the SyncMapItemInstance
                    # @param [Object] data 
                    # @param [String] if_match The If-Match HTTP request header
                    # @return [SyncMapItemInstance] Updated SyncMapItemInstance
                    def update(
                        data: nil, 
                        if_match: :unset
                    )

                        data = Twilio::Values.of({
                            'Data' => Twilio.serialize_object(data),
                        })

                        headers = Twilio::Values.of({'Content-Type' => 'application/x-www-form-urlencoded', 'If-Match' => if_match, })
                        
                        
                        
                        
                        
                        payload = @version.update('POST', @uri, data: data, headers: headers)
                        SyncMapItemInstance.new(
                            @version,
                            payload,
                            service_sid: @solution[:service_sid],
                            map_sid: @solution[:map_sid],
                            key: @solution[:key],
                        )
                    end


                    ##
                    # Provide a user friendly representation
                    def to_s
                        context = @solution.map{|k, v| "#{k}: #{v}"}.join(',')
                        "#<Twilio.Preview.Sync.SyncMapItemContext #{context}>"
                    end

                    ##
                    # Provide a detailed, user friendly representation
                    def inspect
                        context = @solution.map{|k, v| "#{k}: #{v}"}.join(',')
                        "#<Twilio.Preview.Sync.SyncMapItemContext #{context}>"
                    end
                end

                class SyncMapItemPage < Page
                    ##
                    # Initialize the SyncMapItemPage
                    # @param [Version] version Version that contains the resource
                    # @param [Response] response Response from the API
                    # @param [Hash] solution Path solution for the resource
                    # @return [SyncMapItemPage] SyncMapItemPage
                    def initialize(version, response, solution)
                        super(version, response)

                        # Path Solution
                        @solution = solution
                    end

                    ##
                    # Build an instance of SyncMapItemInstance
                    # @param [Hash] payload Payload response from the API
                    # @return [SyncMapItemInstance] SyncMapItemInstance
                    def get_instance(payload)
                        SyncMapItemInstance.new(@version, payload, service_sid: @solution[:service_sid], map_sid: @solution[:map_sid])
                    end

                    ##
                    # Provide a user friendly representation
                    def to_s
                        '<Twilio.Preview.Sync.SyncMapItemPage>'
                    end
                end
                class SyncMapItemInstance < InstanceResource
                    ##
                    # Initialize the SyncMapItemInstance
                    # @param [Version] version Version that contains the resource
                    # @param [Hash] payload payload that contains response from Twilio
                    # @param [String] account_sid The SID of the
                    #   {Account}[https://www.twilio.com/docs/iam/api/account] that created this SyncMapItem
                    #   resource.
                    # @param [String] sid The SID of the Call resource to fetch.
                    # @return [SyncMapItemInstance] SyncMapItemInstance
                    def initialize(version, payload , service_sid: nil, map_sid: nil, key: nil)
                        super(version)
                        
                        # Marshaled Properties
                        @properties = { 
                            'key' => payload['key'],
                            'account_sid' => payload['account_sid'],
                            'service_sid' => payload['service_sid'],
                            'map_sid' => payload['map_sid'],
                            'url' => payload['url'],
                            'revision' => payload['revision'],
                            'data' => payload['data'],
                            'date_created' => Twilio.deserialize_iso8601_datetime(payload['date_created']),
                            'date_updated' => Twilio.deserialize_iso8601_datetime(payload['date_updated']),
                            'created_by' => payload['created_by'],
                        }

                        # Context
                        @instance_context = nil
                        @params = { 'service_sid' => service_sid  || @properties['service_sid']  ,'map_sid' => map_sid  || @properties['map_sid']  ,'key' => key  || @properties['key']  , }
                    end

                    ##
                    # Generate an instance context for the instance, the context is capable of
                    # performing various actions.  All instance actions are proxied to the context
                    # @return [SyncMapItemContext] CallContext for this CallInstance
                    def context
                        unless @instance_context
                            @instance_context = SyncMapItemContext.new(@version , @params['service_sid'], @params['map_sid'], @params['key'])
                        end
                        @instance_context
                    end
                    
                    ##
                    # @return [String] 
                    def key
                        @properties['key']
                    end
                    
                    ##
                    # @return [String] 
                    def account_sid
                        @properties['account_sid']
                    end
                    
                    ##
                    # @return [String] 
                    def service_sid
                        @properties['service_sid']
                    end
                    
                    ##
                    # @return [String] 
                    def map_sid
                        @properties['map_sid']
                    end
                    
                    ##
                    # @return [String] 
                    def url
                        @properties['url']
                    end
                    
                    ##
                    # @return [String] 
                    def revision
                        @properties['revision']
                    end
                    
                    ##
                    # @return [Hash] 
                    def data
                        @properties['data']
                    end
                    
                    ##
                    # @return [Time] 
                    def date_created
                        @properties['date_created']
                    end
                    
                    ##
                    # @return [Time] 
                    def date_updated
                        @properties['date_updated']
                    end
                    
                    ##
                    # @return [String] 
                    def created_by
                        @properties['created_by']
                    end
                    
                    ##
                    # Delete the SyncMapItemInstance
                    # @param [String] if_match The If-Match HTTP request header
                    # @return [Boolean] True if delete succeeds, false otherwise
                    def delete(
                        if_match: :unset
                    )

                        context.delete(
                            if_match: if_match, 
                        )
                    end

                    ##
                    # Fetch the SyncMapItemInstance
                    # @return [SyncMapItemInstance] Fetched SyncMapItemInstance
                    def fetch

                        context.fetch
                    end

                    ##
                    # Update the SyncMapItemInstance
                    # @param [Object] data 
                    # @param [String] if_match The If-Match HTTP request header
                    # @return [SyncMapItemInstance] Updated SyncMapItemInstance
                    def update(
                        data: nil, 
                        if_match: :unset
                    )

                        context.update(
                            data: data, 
                            if_match: if_match, 
                        )
                    end

                    ##
                    # Provide a user friendly representation
                    def to_s
                        values = @params.map{|k, v| "#{k}: #{v}"}.join(" ")
                        "<Twilio.Preview.Sync.SyncMapItemInstance #{values}>"
                    end

                    ##
                    # Provide a detailed, user friendly representation
                    def inspect
                        values = @properties.map{|k, v| "#{k}: #{v}"}.join(" ")
                        "<Twilio.Preview.Sync.SyncMapItemInstance #{values}>"
                    end
                end

             end
             end
            end
        end
    end
end


