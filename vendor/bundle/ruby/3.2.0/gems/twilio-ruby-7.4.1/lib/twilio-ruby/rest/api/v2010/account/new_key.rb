##
#    This code was generated by
#    ___ _ _ _ _ _    _ ____    ____ ____ _    ____ ____ _  _ ____ ____ ____ ___ __   __
#     |  | | | | |    | |  | __ |  | |__| | __ | __ |___ |\ | |___ |__/ |__|  | |  | |__/
#     |  |_|_| | |___ | |__|    |__| |  | |    |__] |___ | \| |___ |  \ |  |  | |__| |  \
#
#    Twilio - Api
#    This is the public Twilio REST API.
#
#    NOTE: This class is auto generated by OpenAPI Generator.
#    https://openapi-generator.tech
#    Do not edit the class manually.
#


module Twilio
    module REST
        class Api < ApiBase
            class V2010 < Version
                class AccountContext < InstanceContext

                     class NewKeyList < ListResource
                
                    ##
                    # Initialize the NewKeyList
                    # @param [Version] version Version that contains the resource
                    # @return [NewKeyList] NewKeyList
                    def initialize(version, account_sid: nil)
                        super(version)
                        # Path Solution
                        @solution = { account_sid: account_sid }
                        @uri = "/Accounts/#{@solution[:account_sid]}/Keys.json"
                        
                    end
                    ##
                    # Create the NewKeyInstance
                    # @param [String] friendly_name A descriptive string that you create to describe the resource. It can be up to 64 characters long.
                    # @return [NewKeyInstance] Created NewKeyInstance
                    def create(
                        friendly_name: :unset
                    )

                        data = Twilio::Values.of({
                            'FriendlyName' => friendly_name,
                        })

                        headers = Twilio::Values.of({'Content-Type' => 'application/x-www-form-urlencoded', })
                        
                        
                        
                        
                        
                        payload = @version.create('POST', @uri, data: data, headers: headers)
                        NewKeyInstance.new(
                            @version,
                            payload,
                            account_sid: @solution[:account_sid],
                        )
                    end

                


                    # Provide a user friendly representation
                    def to_s
                        '#<Twilio.Api.V2010.NewKeyList>'
                    end
                end

                class NewKeyPage < Page
                    ##
                    # Initialize the NewKeyPage
                    # @param [Version] version Version that contains the resource
                    # @param [Response] response Response from the API
                    # @param [Hash] solution Path solution for the resource
                    # @return [NewKeyPage] NewKeyPage
                    def initialize(version, response, solution)
                        super(version, response)

                        # Path Solution
                        @solution = solution
                    end

                    ##
                    # Build an instance of NewKeyInstance
                    # @param [Hash] payload Payload response from the API
                    # @return [NewKeyInstance] NewKeyInstance
                    def get_instance(payload)
                        NewKeyInstance.new(@version, payload, account_sid: @solution[:account_sid])
                    end

                    ##
                    # Provide a user friendly representation
                    def to_s
                        '<Twilio.Api.V2010.NewKeyPage>'
                    end
                end
                class NewKeyInstance < InstanceResource
                    ##
                    # Initialize the NewKeyInstance
                    # @param [Version] version Version that contains the resource
                    # @param [Hash] payload payload that contains response from Twilio
                    # @param [String] account_sid The SID of the
                    #   {Account}[https://www.twilio.com/docs/iam/api/account] that created this NewKey
                    #   resource.
                    # @param [String] sid The SID of the Call resource to fetch.
                    # @return [NewKeyInstance] NewKeyInstance
                    def initialize(version, payload , account_sid: nil)
                        super(version)
                        
                        # Marshaled Properties
                        @properties = { 
                            'sid' => payload['sid'],
                            'friendly_name' => payload['friendly_name'],
                            'date_created' => Twilio.deserialize_rfc2822(payload['date_created']),
                            'date_updated' => Twilio.deserialize_rfc2822(payload['date_updated']),
                            'secret' => payload['secret'],
                        }
                    end

                    
                    ##
                    # @return [String] The unique string that that we created to identify the NewKey resource. You will use this as the basic-auth `user` when authenticating to the API.
                    def sid
                        @properties['sid']
                    end
                    
                    ##
                    # @return [String] The string that you assigned to describe the resource.
                    def friendly_name
                        @properties['friendly_name']
                    end
                    
                    ##
                    # @return [Time] The date and time in GMT that the API Key was created specified in [RFC 2822](https://www.ietf.org/rfc/rfc2822.txt) format.
                    def date_created
                        @properties['date_created']
                    end
                    
                    ##
                    # @return [Time] The date and time in GMT that the new API Key was last updated specified in [RFC 2822](https://www.ietf.org/rfc/rfc2822.txt) format.
                    def date_updated
                        @properties['date_updated']
                    end
                    
                    ##
                    # @return [String] The secret your application uses to sign Access Tokens and to authenticate to the REST API (you will use this as the basic-auth `password`).  **Note that for security reasons, this field is ONLY returned when the API Key is first created.**
                    def secret
                        @properties['secret']
                    end
                    
                    ##
                    # Provide a user friendly representation
                    def to_s
                        "<Twilio.Api.V2010.NewKeyInstance>"
                    end

                    ##
                    # Provide a detailed, user friendly representation
                    def inspect
                        "<Twilio.Api.V2010.NewKeyInstance>"
                    end
                end

             end
            end
        end
    end
end

