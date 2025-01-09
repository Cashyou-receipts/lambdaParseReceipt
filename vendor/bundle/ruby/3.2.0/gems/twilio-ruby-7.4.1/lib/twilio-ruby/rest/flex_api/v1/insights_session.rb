##
#    This code was generated by
#    ___ _ _ _ _ _    _ ____    ____ ____ _    ____ ____ _  _ ____ ____ ____ ___ __   __
#     |  | | | | |    | |  | __ |  | |__| | __ | __ |___ |\ | |___ |__/ |__|  | |  | |__/
#     |  |_|_| | |___ | |__|    |__| |  | |    |__] |___ | \| |___ |  \ |  |  | |__| |  \
#
#    Twilio - Flex
#    This is the public Twilio REST API.
#
#    NOTE: This class is auto generated by OpenAPI Generator.
#    https://openapi-generator.tech
#    Do not edit the class manually.
#


module Twilio
    module REST
        class FlexApi < FlexApiBase
            class V1 < Version
                class InsightsSessionList < ListResource
                
                    ##
                    # Initialize the InsightsSessionList
                    # @param [Version] version Version that contains the resource
                    # @return [InsightsSessionList] InsightsSessionList
                    def initialize(version)
                        super(version)
                        # Path Solution
                        @solution = {  }
                        
                        
                    end
                


                    # Provide a user friendly representation
                    def to_s
                        '#<Twilio.FlexApi.V1.InsightsSessionList>'
                    end
                end


                class InsightsSessionContext < InstanceContext
                    ##
                    # Initialize the InsightsSessionContext
                    # @param [Version] version Version that contains the resource
                    # @return [InsightsSessionContext] InsightsSessionContext
                    def initialize(version)
                        super(version)

                        # Path Solution
                        @solution = {  }
                        @uri = "/Insights/Session"

                        
                    end
                    ##
                    # Create the InsightsSessionInstance
                    # @param [String] authorization The Authorization HTTP request header
                    # @return [InsightsSessionInstance] Created InsightsSessionInstance
                    def create(
                        authorization: :unset
                    )

                        headers = Twilio::Values.of({'Content-Type' => 'application/x-www-form-urlencoded', 'Authorization' => authorization, })
                        
                        
                        
                        
                        
                        payload = @version.create('POST', @uri, headers: headers)
                        InsightsSessionInstance.new(
                            @version,
                            payload,
                        )
                    end


                    ##
                    # Provide a user friendly representation
                    def to_s
                        context = @solution.map{|k, v| "#{k}: #{v}"}.join(',')
                        "#<Twilio.FlexApi.V1.InsightsSessionContext #{context}>"
                    end

                    ##
                    # Provide a detailed, user friendly representation
                    def inspect
                        context = @solution.map{|k, v| "#{k}: #{v}"}.join(',')
                        "#<Twilio.FlexApi.V1.InsightsSessionContext #{context}>"
                    end
                end

                class InsightsSessionPage < Page
                    ##
                    # Initialize the InsightsSessionPage
                    # @param [Version] version Version that contains the resource
                    # @param [Response] response Response from the API
                    # @param [Hash] solution Path solution for the resource
                    # @return [InsightsSessionPage] InsightsSessionPage
                    def initialize(version, response, solution)
                        super(version, response)

                        # Path Solution
                        @solution = solution
                    end

                    ##
                    # Build an instance of InsightsSessionInstance
                    # @param [Hash] payload Payload response from the API
                    # @return [InsightsSessionInstance] InsightsSessionInstance
                    def get_instance(payload)
                        InsightsSessionInstance.new(@version, payload)
                    end

                    ##
                    # Provide a user friendly representation
                    def to_s
                        '<Twilio.FlexApi.V1.InsightsSessionPage>'
                    end
                end
                class InsightsSessionInstance < InstanceResource
                    ##
                    # Initialize the InsightsSessionInstance
                    # @param [Version] version Version that contains the resource
                    # @param [Hash] payload payload that contains response from Twilio
                    # @param [String] account_sid The SID of the
                    #   {Account}[https://www.twilio.com/docs/iam/api/account] that created this InsightsSession
                    #   resource.
                    # @param [String] sid The SID of the Call resource to fetch.
                    # @return [InsightsSessionInstance] InsightsSessionInstance
                    def initialize(version, payload )
                        super(version)
                        
                        # Marshaled Properties
                        @properties = { 
                            'workspace_id' => payload['workspace_id'],
                            'session_expiry' => payload['session_expiry'],
                            'session_id' => payload['session_id'],
                            'base_url' => payload['base_url'],
                            'url' => payload['url'],
                        }

                        # Context
                        @instance_context = nil
                        @params = {  }
                    end

                    ##
                    # Generate an instance context for the instance, the context is capable of
                    # performing various actions.  All instance actions are proxied to the context
                    # @return [InsightsSessionContext] CallContext for this CallInstance
                    def context
                        unless @instance_context
                            @instance_context = InsightsSessionContext.new(@version )
                        end
                        @instance_context
                    end
                    
                    ##
                    # @return [String] Unique ID to identify the user's workspace
                    def workspace_id
                        @properties['workspace_id']
                    end
                    
                    ##
                    # @return [String] The session expiry date and time, given in ISO 8601 format.
                    def session_expiry
                        @properties['session_expiry']
                    end
                    
                    ##
                    # @return [String] The unique ID for the session
                    def session_id
                        @properties['session_id']
                    end
                    
                    ##
                    # @return [String] The base URL to fetch reports and dashboards
                    def base_url
                        @properties['base_url']
                    end
                    
                    ##
                    # @return [String] The URL of this resource.
                    def url
                        @properties['url']
                    end
                    
                    ##
                    # Create the InsightsSessionInstance
                    # @param [String] authorization The Authorization HTTP request header
                    # @return [InsightsSessionInstance] Created InsightsSessionInstance
                    def create(
                        authorization: :unset
                    )

                        context.create(
                            authorization: authorization, 
                        )
                    end

                    ##
                    # Provide a user friendly representation
                    def to_s
                        values = @params.map{|k, v| "#{k}: #{v}"}.join(" ")
                        "<Twilio.FlexApi.V1.InsightsSessionInstance #{values}>"
                    end

                    ##
                    # Provide a detailed, user friendly representation
                    def inspect
                        values = @properties.map{|k, v| "#{k}: #{v}"}.join(" ")
                        "<Twilio.FlexApi.V1.InsightsSessionInstance #{values}>"
                    end
                end

            end
        end
    end
end
