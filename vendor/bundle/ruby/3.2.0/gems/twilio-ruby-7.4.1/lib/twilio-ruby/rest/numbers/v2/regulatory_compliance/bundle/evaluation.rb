##
#    This code was generated by
#    ___ _ _ _ _ _    _ ____    ____ ____ _    ____ ____ _  _ ____ ____ ____ ___ __   __
#     |  | | | | |    | |  | __ |  | |__| | __ | __ |___ |\ | |___ |__/ |__|  | |  | |__/
#     |  |_|_| | |___ | |__|    |__| |  | |    |__] |___ | \| |___ |  \ |  |  | |__| |  \
#
#    Twilio - Numbers
#    This is the public Twilio REST API.
#
#    NOTE: This class is auto generated by OpenAPI Generator.
#    https://openapi-generator.tech
#    Do not edit the class manually.
#


module Twilio
    module REST
        class Numbers < NumbersBase
            class V2 < Version
                class RegulatoryComplianceList < ListResource
                class BundleContext < InstanceContext

                     class EvaluationList < ListResource
                
                    ##
                    # Initialize the EvaluationList
                    # @param [Version] version Version that contains the resource
                    # @return [EvaluationList] EvaluationList
                    def initialize(version, bundle_sid: nil)
                        super(version)
                        # Path Solution
                        @solution = { bundle_sid: bundle_sid }
                        @uri = "/RegulatoryCompliance/Bundles/#{@solution[:bundle_sid]}/Evaluations"
                        
                    end
                    ##
                    # Create the EvaluationInstance
                    # @return [EvaluationInstance] Created EvaluationInstance
                    def create

                        headers = Twilio::Values.of({'Content-Type' => 'application/x-www-form-urlencoded', })
                        
                        
                        
                        
                        
                        payload = @version.create('POST', @uri, headers: headers)
                        EvaluationInstance.new(
                            @version,
                            payload,
                            bundle_sid: @solution[:bundle_sid],
                        )
                    end

                
                    ##
                    # Lists EvaluationInstance records from the API as a list.
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
                    # When passed a block, yields EvaluationInstance records from the API.
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
                    # Retrieve a single page of EvaluationInstance records from the API.
                    # Request is executed immediately.
                    # @param [String] page_token PageToken provided by the API
                    # @param [Integer] page_number Page Number, this value is simply for client state
                    # @param [Integer] page_size Number of records to return, defaults to 50
                    # @return [Page] Page of EvaluationInstance
                    def page(page_token: :unset, page_number: :unset, page_size: :unset)
                        params = Twilio::Values.of({
                            'PageToken' => page_token,
                            'Page' => page_number,
                            'PageSize' => page_size,
                        })
                        headers = Twilio::Values.of({})
                        
                        

                        response = @version.page('GET', @uri, params: params, headers: headers)

                        EvaluationPage.new(@version, response, @solution)
                    end

                    ##
                    # Retrieve a single page of EvaluationInstance records from the API.
                    # Request is executed immediately.
                    # @param [String] target_url API-generated URL for the requested results page
                    # @return [Page] Page of EvaluationInstance
                    def get_page(target_url)
                        response = @version.domain.request(
                            'GET',
                            target_url
                        )
                    EvaluationPage.new(@version, response, @solution)
                    end
                    


                    # Provide a user friendly representation
                    def to_s
                        '#<Twilio.Numbers.V2.EvaluationList>'
                    end
                end


                class EvaluationContext < InstanceContext
                    ##
                    # Initialize the EvaluationContext
                    # @param [Version] version Version that contains the resource
                    # @param [String] bundle_sid The unique string that we created to identify the Bundle resource.
                    # @param [String] sid The unique string that identifies the Evaluation resource.
                    # @return [EvaluationContext] EvaluationContext
                    def initialize(version, bundle_sid, sid)
                        super(version)

                        # Path Solution
                        @solution = { bundle_sid: bundle_sid, sid: sid,  }
                        @uri = "/RegulatoryCompliance/Bundles/#{@solution[:bundle_sid]}/Evaluations/#{@solution[:sid]}"

                        
                    end
                    ##
                    # Fetch the EvaluationInstance
                    # @return [EvaluationInstance] Fetched EvaluationInstance
                    def fetch

                        headers = Twilio::Values.of({'Content-Type' => 'application/x-www-form-urlencoded', })
                        
                        
                        
                        
                        
                        payload = @version.fetch('GET', @uri, headers: headers)
                        EvaluationInstance.new(
                            @version,
                            payload,
                            bundle_sid: @solution[:bundle_sid],
                            sid: @solution[:sid],
                        )
                    end


                    ##
                    # Provide a user friendly representation
                    def to_s
                        context = @solution.map{|k, v| "#{k}: #{v}"}.join(',')
                        "#<Twilio.Numbers.V2.EvaluationContext #{context}>"
                    end

                    ##
                    # Provide a detailed, user friendly representation
                    def inspect
                        context = @solution.map{|k, v| "#{k}: #{v}"}.join(',')
                        "#<Twilio.Numbers.V2.EvaluationContext #{context}>"
                    end
                end

                class EvaluationPage < Page
                    ##
                    # Initialize the EvaluationPage
                    # @param [Version] version Version that contains the resource
                    # @param [Response] response Response from the API
                    # @param [Hash] solution Path solution for the resource
                    # @return [EvaluationPage] EvaluationPage
                    def initialize(version, response, solution)
                        super(version, response)

                        # Path Solution
                        @solution = solution
                    end

                    ##
                    # Build an instance of EvaluationInstance
                    # @param [Hash] payload Payload response from the API
                    # @return [EvaluationInstance] EvaluationInstance
                    def get_instance(payload)
                        EvaluationInstance.new(@version, payload, bundle_sid: @solution[:bundle_sid])
                    end

                    ##
                    # Provide a user friendly representation
                    def to_s
                        '<Twilio.Numbers.V2.EvaluationPage>'
                    end
                end
                class EvaluationInstance < InstanceResource
                    ##
                    # Initialize the EvaluationInstance
                    # @param [Version] version Version that contains the resource
                    # @param [Hash] payload payload that contains response from Twilio
                    # @param [String] account_sid The SID of the
                    #   {Account}[https://www.twilio.com/docs/iam/api/account] that created this Evaluation
                    #   resource.
                    # @param [String] sid The SID of the Call resource to fetch.
                    # @return [EvaluationInstance] EvaluationInstance
                    def initialize(version, payload , bundle_sid: nil, sid: nil)
                        super(version)
                        
                        # Marshaled Properties
                        @properties = { 
                            'sid' => payload['sid'],
                            'account_sid' => payload['account_sid'],
                            'regulation_sid' => payload['regulation_sid'],
                            'bundle_sid' => payload['bundle_sid'],
                            'status' => payload['status'],
                            'results' => payload['results'],
                            'date_created' => Twilio.deserialize_iso8601_datetime(payload['date_created']),
                            'url' => payload['url'],
                        }

                        # Context
                        @instance_context = nil
                        @params = { 'bundle_sid' => bundle_sid  || @properties['bundle_sid']  ,'sid' => sid  || @properties['sid']  , }
                    end

                    ##
                    # Generate an instance context for the instance, the context is capable of
                    # performing various actions.  All instance actions are proxied to the context
                    # @return [EvaluationContext] CallContext for this CallInstance
                    def context
                        unless @instance_context
                            @instance_context = EvaluationContext.new(@version , @params['bundle_sid'], @params['sid'])
                        end
                        @instance_context
                    end
                    
                    ##
                    # @return [String] The unique string that identifies the Evaluation resource.
                    def sid
                        @properties['sid']
                    end
                    
                    ##
                    # @return [String] The SID of the [Account](https://www.twilio.com/docs/iam/api/account) that created the Bundle resource.
                    def account_sid
                        @properties['account_sid']
                    end
                    
                    ##
                    # @return [String] The unique string of a regulation that is associated to the Bundle resource.
                    def regulation_sid
                        @properties['regulation_sid']
                    end
                    
                    ##
                    # @return [String] The unique string that we created to identify the Bundle resource.
                    def bundle_sid
                        @properties['bundle_sid']
                    end
                    
                    ##
                    # @return [Status] 
                    def status
                        @properties['status']
                    end
                    
                    ##
                    # @return [Array<Hash>] The results of the Evaluation which includes the valid and invalid attributes.
                    def results
                        @properties['results']
                    end
                    
                    ##
                    # @return [Time] 
                    def date_created
                        @properties['date_created']
                    end
                    
                    ##
                    # @return [String] 
                    def url
                        @properties['url']
                    end
                    
                    ##
                    # Fetch the EvaluationInstance
                    # @return [EvaluationInstance] Fetched EvaluationInstance
                    def fetch

                        context.fetch
                    end

                    ##
                    # Provide a user friendly representation
                    def to_s
                        values = @params.map{|k, v| "#{k}: #{v}"}.join(" ")
                        "<Twilio.Numbers.V2.EvaluationInstance #{values}>"
                    end

                    ##
                    # Provide a detailed, user friendly representation
                    def inspect
                        values = @properties.map{|k, v| "#{k}: #{v}"}.join(" ")
                        "<Twilio.Numbers.V2.EvaluationInstance #{values}>"
                    end
                end

             end
             end
            end
        end
    end
end


