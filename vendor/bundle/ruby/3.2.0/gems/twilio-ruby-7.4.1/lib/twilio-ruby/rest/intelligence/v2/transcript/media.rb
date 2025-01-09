##
#    This code was generated by
#    ___ _ _ _ _ _    _ ____    ____ ____ _    ____ ____ _  _ ____ ____ ____ ___ __   __
#     |  | | | | |    | |  | __ |  | |__| | __ | __ |___ |\ | |___ |__/ |__|  | |  | |__/
#     |  |_|_| | |___ | |__|    |__| |  | |    |__] |___ | \| |___ |  \ |  |  | |__| |  \
#
#    Twilio - Intelligence
#    This is the public Twilio REST API.
#
#    NOTE: This class is auto generated by OpenAPI Generator.
#    https://openapi-generator.tech
#    Do not edit the class manually.
#


module Twilio
    module REST
        class Intelligence < IntelligenceBase
            class V2 < Version
                class TranscriptContext < InstanceContext

                     class MediaList < ListResource
                
                    ##
                    # Initialize the MediaList
                    # @param [Version] version Version that contains the resource
                    # @return [MediaList] MediaList
                    def initialize(version, sid: nil)
                        super(version)
                        # Path Solution
                        @solution = { sid: sid }
                        
                        
                    end
                


                    # Provide a user friendly representation
                    def to_s
                        '#<Twilio.Intelligence.V2.MediaList>'
                    end
                end


                class MediaContext < InstanceContext
                    ##
                    # Initialize the MediaContext
                    # @param [Version] version Version that contains the resource
                    # @param [String] sid The unique SID identifier of the Transcript.
                    # @return [MediaContext] MediaContext
                    def initialize(version, sid)
                        super(version)

                        # Path Solution
                        @solution = { sid: sid,  }
                        @uri = "/Transcripts/#{@solution[:sid]}/Media"

                        
                    end
                    ##
                    # Fetch the MediaInstance
                    # @param [Boolean] redacted Grant access to PII Redacted/Unredacted Media. If redaction is enabled, the default is `true` to access redacted media.
                    # @return [MediaInstance] Fetched MediaInstance
                    def fetch(
                        redacted: :unset
                    )

                        params = Twilio::Values.of({
                            'Redacted' => redacted,
                        })
                        headers = Twilio::Values.of({'Content-Type' => 'application/x-www-form-urlencoded', })
                        
                        
                        
                        
                        
                        payload = @version.fetch('GET', @uri, params: params, headers: headers)
                        MediaInstance.new(
                            @version,
                            payload,
                            sid: @solution[:sid],
                        )
                    end


                    ##
                    # Provide a user friendly representation
                    def to_s
                        context = @solution.map{|k, v| "#{k}: #{v}"}.join(',')
                        "#<Twilio.Intelligence.V2.MediaContext #{context}>"
                    end

                    ##
                    # Provide a detailed, user friendly representation
                    def inspect
                        context = @solution.map{|k, v| "#{k}: #{v}"}.join(',')
                        "#<Twilio.Intelligence.V2.MediaContext #{context}>"
                    end
                end

                class MediaPage < Page
                    ##
                    # Initialize the MediaPage
                    # @param [Version] version Version that contains the resource
                    # @param [Response] response Response from the API
                    # @param [Hash] solution Path solution for the resource
                    # @return [MediaPage] MediaPage
                    def initialize(version, response, solution)
                        super(version, response)

                        # Path Solution
                        @solution = solution
                    end

                    ##
                    # Build an instance of MediaInstance
                    # @param [Hash] payload Payload response from the API
                    # @return [MediaInstance] MediaInstance
                    def get_instance(payload)
                        MediaInstance.new(@version, payload, sid: @solution[:sid])
                    end

                    ##
                    # Provide a user friendly representation
                    def to_s
                        '<Twilio.Intelligence.V2.MediaPage>'
                    end
                end
                class MediaInstance < InstanceResource
                    ##
                    # Initialize the MediaInstance
                    # @param [Version] version Version that contains the resource
                    # @param [Hash] payload payload that contains response from Twilio
                    # @param [String] account_sid The SID of the
                    #   {Account}[https://www.twilio.com/docs/iam/api/account] that created this Media
                    #   resource.
                    # @param [String] sid The SID of the Call resource to fetch.
                    # @return [MediaInstance] MediaInstance
                    def initialize(version, payload , sid: nil)
                        super(version)
                        
                        # Marshaled Properties
                        @properties = { 
                            'account_sid' => payload['account_sid'],
                            'media_url' => payload['media_url'],
                            'service_sid' => payload['service_sid'],
                            'sid' => payload['sid'],
                            'url' => payload['url'],
                        }

                        # Context
                        @instance_context = nil
                        @params = { 'sid' => sid  || @properties['sid']  , }
                    end

                    ##
                    # Generate an instance context for the instance, the context is capable of
                    # performing various actions.  All instance actions are proxied to the context
                    # @return [MediaContext] CallContext for this CallInstance
                    def context
                        unless @instance_context
                            @instance_context = MediaContext.new(@version , @params['sid'])
                        end
                        @instance_context
                    end
                    
                    ##
                    # @return [String] The unique SID identifier of the Account.
                    def account_sid
                        @properties['account_sid']
                    end
                    
                    ##
                    # @return [String] Downloadable URL for media, if stored in Twilio AI.
                    def media_url
                        @properties['media_url']
                    end
                    
                    ##
                    # @return [String] The unique SID identifier of the Service.
                    def service_sid
                        @properties['service_sid']
                    end
                    
                    ##
                    # @return [String] The unique SID identifier of the Transcript.
                    def sid
                        @properties['sid']
                    end
                    
                    ##
                    # @return [String] The URL of this resource.
                    def url
                        @properties['url']
                    end
                    
                    ##
                    # Fetch the MediaInstance
                    # @param [Boolean] redacted Grant access to PII Redacted/Unredacted Media. If redaction is enabled, the default is `true` to access redacted media.
                    # @return [MediaInstance] Fetched MediaInstance
                    def fetch(
                        redacted: :unset
                    )

                        context.fetch(
                            redacted: redacted, 
                        )
                    end

                    ##
                    # Provide a user friendly representation
                    def to_s
                        values = @params.map{|k, v| "#{k}: #{v}"}.join(" ")
                        "<Twilio.Intelligence.V2.MediaInstance #{values}>"
                    end

                    ##
                    # Provide a detailed, user friendly representation
                    def inspect
                        values = @properties.map{|k, v| "#{k}: #{v}"}.join(" ")
                        "<Twilio.Intelligence.V2.MediaInstance #{values}>"
                    end
                end

             end
            end
        end
    end
end

