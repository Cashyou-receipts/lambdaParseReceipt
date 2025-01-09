##
#    This code was generated by
#    ___ _ _ _ _ _    _ ____    ____ ____ _    ____ ____ _  _ ____ ____ ____ ___ __   __
#     |  | | | | |    | |  | __ |  | |__| | __ | __ |___ |\ | |___ |__/ |__|  | |  | |__/
#     |  |_|_| | |___ | |__|    |__| |  | |    |__] |___ | \| |___ |  \ |  |  | |__| |  \
#
#    Twilio - Verify
#    This is the public Twilio REST API.
#
#    NOTE: This class is auto generated by OpenAPI Generator.
#    https://openapi-generator.tech
#    Do not edit the class manually.
#


module Twilio
    module REST
        class Verify < VerifyBase
            class V2 < Version
                class ServiceContext < InstanceContext
                class EntityContext < InstanceContext

                     class ChallengeList < ListResource
                
                    ##
                    # Initialize the ChallengeList
                    # @param [Version] version Version that contains the resource
                    # @return [ChallengeList] ChallengeList
                    def initialize(version, service_sid: nil, identity: nil)
                        super(version)
                        # Path Solution
                        @solution = { service_sid: service_sid, identity: identity }
                        @uri = "/Services/#{@solution[:service_sid]}/Entities/#{@solution[:identity]}/Challenges"
                        
                    end
                    ##
                    # Create the ChallengeInstance
                    # @param [String] factor_sid The unique SID identifier of the Factor.
                    # @param [Time] expiration_date The date-time when this Challenge expires, given in [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601) format. The default value is five (5) minutes after Challenge creation. The max value is sixty (60) minutes after creation.
                    # @param [String] details_message Shown to the user when the push notification arrives. Required when `factor_type` is `push`. Can be up to 256 characters in length
                    # @param [Array[Hash]] details_fields A list of objects that describe the Fields included in the Challenge. Each object contains the label and value of the field, the label can be up to 36 characters in length and the value can be up to 128 characters in length. Used when `factor_type` is `push`. There can be up to 20 details fields.
                    # @param [Object] hidden_details Details provided to give context about the Challenge. Not shown to the end user. It must be a stringified JSON with only strings values eg. `{\\\"ip\\\": \\\"172.168.1.234\\\"}`. Can be up to 1024 characters in length
                    # @param [String] auth_payload Optional payload used to verify the Challenge upon creation. Only used with a Factor of type `totp` to carry the TOTP code that needs to be verified. For `TOTP` this value must be between 3 and 8 characters long.
                    # @return [ChallengeInstance] Created ChallengeInstance
                    def create(
                        factor_sid: nil, 
                        expiration_date: :unset, 
                        details_message: :unset, 
                        details_fields: :unset, 
                        hidden_details: :unset, 
                        auth_payload: :unset
                    )

                        data = Twilio::Values.of({
                            'FactorSid' => factor_sid,
                            'ExpirationDate' => Twilio.serialize_iso8601_datetime(expiration_date),
                            'Details.Message' => details_message,
                            'Details.Fields' => Twilio.serialize_list(details_fields) { |e| Twilio.serialize_object(e) },
                            'HiddenDetails' => Twilio.serialize_object(hidden_details),
                            'AuthPayload' => auth_payload,
                        })

                        headers = Twilio::Values.of({'Content-Type' => 'application/x-www-form-urlencoded', })
                        
                        
                        
                        
                        
                        payload = @version.create('POST', @uri, data: data, headers: headers)
                        ChallengeInstance.new(
                            @version,
                            payload,
                            service_sid: @solution[:service_sid],
                            identity: @solution[:identity],
                        )
                    end

                
                    ##
                    # Lists ChallengeInstance records from the API as a list.
                    # Unlike stream(), this operation is eager and will load `limit` records into
                    # memory before returning.
                    # @param [String] factor_sid The unique SID identifier of the Factor.
                    # @param [ChallengeStatuses] status The Status of the Challenges to fetch. One of `pending`, `expired`, `approved` or `denied`.
                    # @param [ListOrders] order The desired sort order of the Challenges list. One of `asc` or `desc` for ascending and descending respectively. Defaults to `asc`.
                    # @param [Integer] limit Upper limit for the number of records to return. stream()
                    #    guarantees to never return more than limit.  Default is no limit
                    # @param [Integer] page_size Number of records to fetch per request, when
                    #    not set will use the default value of 50 records.  If no page_size is defined
                    #    but a limit is defined, stream() will attempt to read the limit with the most
                    #    efficient page size, i.e. min(limit, 1000)
                    # @return [Array] Array of up to limit results
                    def list(factor_sid: :unset, status: :unset, order: :unset, limit: nil, page_size: nil)
                        self.stream(
                            factor_sid: factor_sid,
                            status: status,
                            order: order,
                            limit: limit,
                            page_size: page_size
                        ).entries
                    end

                    ##
                    # Streams Instance records from the API as an Enumerable.
                    # This operation lazily loads records as efficiently as possible until the limit
                    # is reached.
                    # @param [String] factor_sid The unique SID identifier of the Factor.
                    # @param [ChallengeStatuses] status The Status of the Challenges to fetch. One of `pending`, `expired`, `approved` or `denied`.
                    # @param [ListOrders] order The desired sort order of the Challenges list. One of `asc` or `desc` for ascending and descending respectively. Defaults to `asc`.
                    # @param [Integer] limit Upper limit for the number of records to return. stream()
                    #    guarantees to never return more than limit.  Default is no limit
                    # @param [Integer] page_size Number of records to fetch per request, when
                    #    not set will use the default value of 50 records.  If no page_size is defined
                    #    but a limit is defined, stream() will attempt to read the limit with the most
                    #    efficient page size, i.e. min(limit, 1000)
                    # @return [Enumerable] Enumerable that will yield up to limit results
                    def stream(factor_sid: :unset, status: :unset, order: :unset, limit: nil, page_size: nil)
                        limits = @version.read_limits(limit, page_size)

                        page = self.page(
                            factor_sid: factor_sid,
                            status: status,
                            order: order,
                            page_size: limits[:page_size], )

                        @version.stream(page, limit: limits[:limit], page_limit: limits[:page_limit])
                    end

                    ##
                    # When passed a block, yields ChallengeInstance records from the API.
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
                    # Retrieve a single page of ChallengeInstance records from the API.
                    # Request is executed immediately.
                    # @param [String] factor_sid The unique SID identifier of the Factor.
                    # @param [ChallengeStatuses] status The Status of the Challenges to fetch. One of `pending`, `expired`, `approved` or `denied`.
                    # @param [ListOrders] order The desired sort order of the Challenges list. One of `asc` or `desc` for ascending and descending respectively. Defaults to `asc`.
                    # @param [String] page_token PageToken provided by the API
                    # @param [Integer] page_number Page Number, this value is simply for client state
                    # @param [Integer] page_size Number of records to return, defaults to 50
                    # @return [Page] Page of ChallengeInstance
                    def page(factor_sid: :unset, status: :unset, order: :unset, page_token: :unset, page_number: :unset, page_size: :unset)
                        params = Twilio::Values.of({
                            'FactorSid' => factor_sid,
                            'Status' => status,
                            'Order' => order,
                            'PageToken' => page_token,
                            'Page' => page_number,
                            'PageSize' => page_size,
                        })
                        headers = Twilio::Values.of({})
                        
                        

                        response = @version.page('GET', @uri, params: params, headers: headers)

                        ChallengePage.new(@version, response, @solution)
                    end

                    ##
                    # Retrieve a single page of ChallengeInstance records from the API.
                    # Request is executed immediately.
                    # @param [String] target_url API-generated URL for the requested results page
                    # @return [Page] Page of ChallengeInstance
                    def get_page(target_url)
                        response = @version.domain.request(
                            'GET',
                            target_url
                        )
                    ChallengePage.new(@version, response, @solution)
                    end
                    


                    # Provide a user friendly representation
                    def to_s
                        '#<Twilio.Verify.V2.ChallengeList>'
                    end
                end


                class ChallengeContext < InstanceContext
                    ##
                    # Initialize the ChallengeContext
                    # @param [Version] version Version that contains the resource
                    # @param [String] service_sid The unique SID identifier of the Service.
                    # @param [String] identity Customer unique identity for the Entity owner of the Challenge. This identifier should be immutable, not PII, length between 8 and 64 characters, and generated by your external system, such as your user's UUID, GUID, or SID. It can only contain dash (-) separated alphanumeric characters.
                    # @param [String] sid A 34 character string that uniquely identifies this Challenge.
                    # @return [ChallengeContext] ChallengeContext
                    def initialize(version, service_sid, identity, sid)
                        super(version)

                        # Path Solution
                        @solution = { service_sid: service_sid, identity: identity, sid: sid,  }
                        @uri = "/Services/#{@solution[:service_sid]}/Entities/#{@solution[:identity]}/Challenges/#{@solution[:sid]}"

                        # Dependents
                        @notifications = nil
                    end
                    ##
                    # Fetch the ChallengeInstance
                    # @return [ChallengeInstance] Fetched ChallengeInstance
                    def fetch

                        headers = Twilio::Values.of({'Content-Type' => 'application/x-www-form-urlencoded', })
                        
                        
                        
                        
                        
                        payload = @version.fetch('GET', @uri, headers: headers)
                        ChallengeInstance.new(
                            @version,
                            payload,
                            service_sid: @solution[:service_sid],
                            identity: @solution[:identity],
                            sid: @solution[:sid],
                        )
                    end

                    ##
                    # Update the ChallengeInstance
                    # @param [String] auth_payload The optional payload needed to verify the Challenge. E.g., a TOTP would use the numeric code. For `TOTP` this value must be between 3 and 8 characters long. For `Push` this value can be up to 5456 characters in length
                    # @param [Object] metadata Custom metadata associated with the challenge. This is added by the Device/SDK directly to allow for the inclusion of device information. It must be a stringified JSON with only strings values eg. `{\\\"os\\\": \\\"Android\\\"}`. Can be up to 1024 characters in length.
                    # @return [ChallengeInstance] Updated ChallengeInstance
                    def update(
                        auth_payload: :unset, 
                        metadata: :unset
                    )

                        data = Twilio::Values.of({
                            'AuthPayload' => auth_payload,
                            'Metadata' => Twilio.serialize_object(metadata),
                        })

                        headers = Twilio::Values.of({'Content-Type' => 'application/x-www-form-urlencoded', })
                        
                        
                        
                        
                        
                        payload = @version.update('POST', @uri, data: data, headers: headers)
                        ChallengeInstance.new(
                            @version,
                            payload,
                            service_sid: @solution[:service_sid],
                            identity: @solution[:identity],
                            sid: @solution[:sid],
                        )
                    end

                    ##
                    # Access the notifications
                    # @return [NotificationList]
                    # @return [NotificationContext]
                    def notifications
                      unless @notifications
                        @notifications = NotificationList.new(
                                @version, service_sid: @solution[:service_sid], identity: @solution[:identity], challenge_sid: @solution[:sid], )
                      end
                      @notifications
                    end

                    ##
                    # Provide a user friendly representation
                    def to_s
                        context = @solution.map{|k, v| "#{k}: #{v}"}.join(',')
                        "#<Twilio.Verify.V2.ChallengeContext #{context}>"
                    end

                    ##
                    # Provide a detailed, user friendly representation
                    def inspect
                        context = @solution.map{|k, v| "#{k}: #{v}"}.join(',')
                        "#<Twilio.Verify.V2.ChallengeContext #{context}>"
                    end
                end

                class ChallengePage < Page
                    ##
                    # Initialize the ChallengePage
                    # @param [Version] version Version that contains the resource
                    # @param [Response] response Response from the API
                    # @param [Hash] solution Path solution for the resource
                    # @return [ChallengePage] ChallengePage
                    def initialize(version, response, solution)
                        super(version, response)

                        # Path Solution
                        @solution = solution
                    end

                    ##
                    # Build an instance of ChallengeInstance
                    # @param [Hash] payload Payload response from the API
                    # @return [ChallengeInstance] ChallengeInstance
                    def get_instance(payload)
                        ChallengeInstance.new(@version, payload, service_sid: @solution[:service_sid], identity: @solution[:identity])
                    end

                    ##
                    # Provide a user friendly representation
                    def to_s
                        '<Twilio.Verify.V2.ChallengePage>'
                    end
                end
                class ChallengeInstance < InstanceResource
                    ##
                    # Initialize the ChallengeInstance
                    # @param [Version] version Version that contains the resource
                    # @param [Hash] payload payload that contains response from Twilio
                    # @param [String] account_sid The SID of the
                    #   {Account}[https://www.twilio.com/docs/iam/api/account] that created this Challenge
                    #   resource.
                    # @param [String] sid The SID of the Call resource to fetch.
                    # @return [ChallengeInstance] ChallengeInstance
                    def initialize(version, payload , service_sid: nil, identity: nil, sid: nil)
                        super(version)
                        
                        # Marshaled Properties
                        @properties = { 
                            'sid' => payload['sid'],
                            'account_sid' => payload['account_sid'],
                            'service_sid' => payload['service_sid'],
                            'entity_sid' => payload['entity_sid'],
                            'identity' => payload['identity'],
                            'factor_sid' => payload['factor_sid'],
                            'date_created' => Twilio.deserialize_iso8601_datetime(payload['date_created']),
                            'date_updated' => Twilio.deserialize_iso8601_datetime(payload['date_updated']),
                            'date_responded' => Twilio.deserialize_iso8601_datetime(payload['date_responded']),
                            'expiration_date' => Twilio.deserialize_iso8601_datetime(payload['expiration_date']),
                            'status' => payload['status'],
                            'responded_reason' => payload['responded_reason'],
                            'details' => payload['details'],
                            'hidden_details' => payload['hidden_details'],
                            'metadata' => payload['metadata'],
                            'factor_type' => payload['factor_type'],
                            'url' => payload['url'],
                            'links' => payload['links'],
                        }

                        # Context
                        @instance_context = nil
                        @params = { 'service_sid' => service_sid  || @properties['service_sid']  ,'identity' => identity  || @properties['identity']  ,'sid' => sid  || @properties['sid']  , }
                    end

                    ##
                    # Generate an instance context for the instance, the context is capable of
                    # performing various actions.  All instance actions are proxied to the context
                    # @return [ChallengeContext] CallContext for this CallInstance
                    def context
                        unless @instance_context
                            @instance_context = ChallengeContext.new(@version , @params['service_sid'], @params['identity'], @params['sid'])
                        end
                        @instance_context
                    end
                    
                    ##
                    # @return [String] A 34 character string that uniquely identifies this Challenge.
                    def sid
                        @properties['sid']
                    end
                    
                    ##
                    # @return [String] The unique SID identifier of the Account.
                    def account_sid
                        @properties['account_sid']
                    end
                    
                    ##
                    # @return [String] The unique SID identifier of the Service.
                    def service_sid
                        @properties['service_sid']
                    end
                    
                    ##
                    # @return [String] The unique SID identifier of the Entity.
                    def entity_sid
                        @properties['entity_sid']
                    end
                    
                    ##
                    # @return [String] Customer unique identity for the Entity owner of the Challenge. This identifier should be immutable, not PII, length between 8 and 64 characters, and generated by your external system, such as your user's UUID, GUID, or SID. It can only contain dash (-) separated alphanumeric characters.
                    def identity
                        @properties['identity']
                    end
                    
                    ##
                    # @return [String] The unique SID identifier of the Factor.
                    def factor_sid
                        @properties['factor_sid']
                    end
                    
                    ##
                    # @return [Time] The date that this Challenge was created, given in [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601) format.
                    def date_created
                        @properties['date_created']
                    end
                    
                    ##
                    # @return [Time] The date that this Challenge was updated, given in [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601) format.
                    def date_updated
                        @properties['date_updated']
                    end
                    
                    ##
                    # @return [Time] The date that this Challenge was responded, given in [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601) format.
                    def date_responded
                        @properties['date_responded']
                    end
                    
                    ##
                    # @return [Time] The date-time when this Challenge expires, given in [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601) format. The default value is five (5) minutes after Challenge creation. The max value is sixty (60) minutes after creation.
                    def expiration_date
                        @properties['expiration_date']
                    end
                    
                    ##
                    # @return [ChallengeStatuses] 
                    def status
                        @properties['status']
                    end
                    
                    ##
                    # @return [ChallengeReasons] 
                    def responded_reason
                        @properties['responded_reason']
                    end
                    
                    ##
                    # @return [Hash] Details provided to give context about the Challenge. Intended to be shown to the end user.
                    def details
                        @properties['details']
                    end
                    
                    ##
                    # @return [Hash] Details provided to give context about the Challenge. Intended to be hidden from the end user. It must be a stringified JSON with only strings values eg. `{\"ip\": \"172.168.1.234\"}`
                    def hidden_details
                        @properties['hidden_details']
                    end
                    
                    ##
                    # @return [Hash] Custom metadata associated with the challenge. This is added by the Device/SDK directly to allow for the inclusion of device information. It must be a stringified JSON with only strings values eg. `{\"os\": \"Android\"}`. Can be up to 1024 characters in length.
                    def metadata
                        @properties['metadata']
                    end
                    
                    ##
                    # @return [FactorTypes] 
                    def factor_type
                        @properties['factor_type']
                    end
                    
                    ##
                    # @return [String] The URL of this resource.
                    def url
                        @properties['url']
                    end
                    
                    ##
                    # @return [Hash] Contains a dictionary of URL links to nested resources of this Challenge.
                    def links
                        @properties['links']
                    end
                    
                    ##
                    # Fetch the ChallengeInstance
                    # @return [ChallengeInstance] Fetched ChallengeInstance
                    def fetch

                        context.fetch
                    end

                    ##
                    # Update the ChallengeInstance
                    # @param [String] auth_payload The optional payload needed to verify the Challenge. E.g., a TOTP would use the numeric code. For `TOTP` this value must be between 3 and 8 characters long. For `Push` this value can be up to 5456 characters in length
                    # @param [Object] metadata Custom metadata associated with the challenge. This is added by the Device/SDK directly to allow for the inclusion of device information. It must be a stringified JSON with only strings values eg. `{\\\"os\\\": \\\"Android\\\"}`. Can be up to 1024 characters in length.
                    # @return [ChallengeInstance] Updated ChallengeInstance
                    def update(
                        auth_payload: :unset, 
                        metadata: :unset
                    )

                        context.update(
                            auth_payload: auth_payload, 
                            metadata: metadata, 
                        )
                    end

                    ##
                    # Access the notifications
                    # @return [notifications] notifications
                    def notifications
                        context.notifications
                    end

                    ##
                    # Provide a user friendly representation
                    def to_s
                        values = @params.map{|k, v| "#{k}: #{v}"}.join(" ")
                        "<Twilio.Verify.V2.ChallengeInstance #{values}>"
                    end

                    ##
                    # Provide a detailed, user friendly representation
                    def inspect
                        values = @properties.map{|k, v| "#{k}: #{v}"}.join(" ")
                        "<Twilio.Verify.V2.ChallengeInstance #{values}>"
                    end
                end

             end
             end
            end
        end
    end
end


