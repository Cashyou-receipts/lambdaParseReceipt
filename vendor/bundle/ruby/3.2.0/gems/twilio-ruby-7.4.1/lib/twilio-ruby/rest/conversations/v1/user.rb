##
#    This code was generated by
#    ___ _ _ _ _ _    _ ____    ____ ____ _    ____ ____ _  _ ____ ____ ____ ___ __   __
#     |  | | | | |    | |  | __ |  | |__| | __ | __ |___ |\ | |___ |__/ |__|  | |  | |__/
#     |  |_|_| | |___ | |__|    |__| |  | |    |__] |___ | \| |___ |  \ |  |  | |__| |  \
#
#    Twilio - Conversations
#    This is the public Twilio REST API.
#
#    NOTE: This class is auto generated by OpenAPI Generator.
#    https://openapi-generator.tech
#    Do not edit the class manually.
#


module Twilio
    module REST
        class Conversations < ConversationsBase
            class V1 < Version
                class UserList < ListResource
                
                    ##
                    # Initialize the UserList
                    # @param [Version] version Version that contains the resource
                    # @return [UserList] UserList
                    def initialize(version)
                        super(version)
                        # Path Solution
                        @solution = {  }
                        @uri = "/Users"
                        
                    end
                    ##
                    # Create the UserInstance
                    # @param [String] identity The application-defined string that uniquely identifies the resource's User within the [Conversation Service](https://www.twilio.com/docs/conversations/api/service-resource). This value is often a username or an email address, and is case-sensitive.
                    # @param [String] friendly_name The string that you assigned to describe the resource.
                    # @param [String] attributes The JSON Object string that stores application-specific data. If attributes have not been set, `{}` is returned.
                    # @param [String] role_sid The SID of a service-level [Role](https://www.twilio.com/docs/conversations/api/role-resource) to assign to the user.
                    # @param [UserEnumWebhookEnabledType] x_twilio_webhook_enabled The X-Twilio-Webhook-Enabled HTTP request header
                    # @return [UserInstance] Created UserInstance
                    def create(
                        identity: nil, 
                        friendly_name: :unset, 
                        attributes: :unset, 
                        role_sid: :unset, 
                        x_twilio_webhook_enabled: :unset
                    )

                        data = Twilio::Values.of({
                            'Identity' => identity,
                            'FriendlyName' => friendly_name,
                            'Attributes' => attributes,
                            'RoleSid' => role_sid,
                        })

                        headers = Twilio::Values.of({'Content-Type' => 'application/x-www-form-urlencoded', 'X-Twilio-Webhook-Enabled' => x_twilio_webhook_enabled, })
                        
                        
                        
                        
                        
                        payload = @version.create('POST', @uri, data: data, headers: headers)
                        UserInstance.new(
                            @version,
                            payload,
                        )
                    end

                
                    ##
                    # Lists UserInstance records from the API as a list.
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
                    # When passed a block, yields UserInstance records from the API.
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
                    # Retrieve a single page of UserInstance records from the API.
                    # Request is executed immediately.
                    # @param [String] page_token PageToken provided by the API
                    # @param [Integer] page_number Page Number, this value is simply for client state
                    # @param [Integer] page_size Number of records to return, defaults to 50
                    # @return [Page] Page of UserInstance
                    def page(page_token: :unset, page_number: :unset, page_size: :unset)
                        params = Twilio::Values.of({
                            'PageToken' => page_token,
                            'Page' => page_number,
                            'PageSize' => page_size,
                        })
                        headers = Twilio::Values.of({})
                        
                        

                        response = @version.page('GET', @uri, params: params, headers: headers)

                        UserPage.new(@version, response, @solution)
                    end

                    ##
                    # Retrieve a single page of UserInstance records from the API.
                    # Request is executed immediately.
                    # @param [String] target_url API-generated URL for the requested results page
                    # @return [Page] Page of UserInstance
                    def get_page(target_url)
                        response = @version.domain.request(
                            'GET',
                            target_url
                        )
                    UserPage.new(@version, response, @solution)
                    end
                    


                    # Provide a user friendly representation
                    def to_s
                        '#<Twilio.Conversations.V1.UserList>'
                    end
                end


                class UserContext < InstanceContext
                    ##
                    # Initialize the UserContext
                    # @param [Version] version Version that contains the resource
                    # @param [String] sid The SID of the User resource to update. This value can be either the `sid` or the `identity` of the User resource to update.
                    # @return [UserContext] UserContext
                    def initialize(version, sid)
                        super(version)

                        # Path Solution
                        @solution = { sid: sid,  }
                        @uri = "/Users/#{@solution[:sid]}"

                        # Dependents
                        @user_conversations = nil
                    end
                    ##
                    # Delete the UserInstance
                    # @param [UserEnumWebhookEnabledType] x_twilio_webhook_enabled The X-Twilio-Webhook-Enabled HTTP request header
                    # @return [Boolean] True if delete succeeds, false otherwise
                    def delete(
                        x_twilio_webhook_enabled: :unset
                    )

                        headers = Twilio::Values.of({'Content-Type' => 'application/x-www-form-urlencoded', 'X-Twilio-Webhook-Enabled' => x_twilio_webhook_enabled, })
                        
                        
                        
                        @version.delete('DELETE', @uri, headers: headers)
                    end

                    ##
                    # Fetch the UserInstance
                    # @return [UserInstance] Fetched UserInstance
                    def fetch

                        headers = Twilio::Values.of({'Content-Type' => 'application/x-www-form-urlencoded', })
                        
                        
                        
                        
                        
                        payload = @version.fetch('GET', @uri, headers: headers)
                        UserInstance.new(
                            @version,
                            payload,
                            sid: @solution[:sid],
                        )
                    end

                    ##
                    # Update the UserInstance
                    # @param [String] friendly_name The string that you assigned to describe the resource.
                    # @param [String] attributes The JSON Object string that stores application-specific data. If attributes have not been set, `{}` is returned.
                    # @param [String] role_sid The SID of a service-level [Role](https://www.twilio.com/docs/conversations/api/role-resource) to assign to the user.
                    # @param [UserEnumWebhookEnabledType] x_twilio_webhook_enabled The X-Twilio-Webhook-Enabled HTTP request header
                    # @return [UserInstance] Updated UserInstance
                    def update(
                        friendly_name: :unset, 
                        attributes: :unset, 
                        role_sid: :unset, 
                        x_twilio_webhook_enabled: :unset
                    )

                        data = Twilio::Values.of({
                            'FriendlyName' => friendly_name,
                            'Attributes' => attributes,
                            'RoleSid' => role_sid,
                        })

                        headers = Twilio::Values.of({'Content-Type' => 'application/x-www-form-urlencoded', 'X-Twilio-Webhook-Enabled' => x_twilio_webhook_enabled, })
                        
                        
                        
                        
                        
                        payload = @version.update('POST', @uri, data: data, headers: headers)
                        UserInstance.new(
                            @version,
                            payload,
                            sid: @solution[:sid],
                        )
                    end

                    ##
                    # Access the user_conversations
                    # @return [UserConversationList]
                    # @return [UserConversationContext] if sid was passed.
                    def user_conversations(conversation_sid=:unset)

                        raise ArgumentError, 'conversation_sid cannot be nil' if conversation_sid.nil?

                        if conversation_sid != :unset
                            return UserConversationContext.new(@version, @solution[:sid],conversation_sid )
                        end

                        unless @user_conversations
                            @user_conversations = UserConversationList.new(
                                @version, user_sid: @solution[:sid], )
                        end

                     @user_conversations
                    end

                    ##
                    # Provide a user friendly representation
                    def to_s
                        context = @solution.map{|k, v| "#{k}: #{v}"}.join(',')
                        "#<Twilio.Conversations.V1.UserContext #{context}>"
                    end

                    ##
                    # Provide a detailed, user friendly representation
                    def inspect
                        context = @solution.map{|k, v| "#{k}: #{v}"}.join(',')
                        "#<Twilio.Conversations.V1.UserContext #{context}>"
                    end
                end

                class UserPage < Page
                    ##
                    # Initialize the UserPage
                    # @param [Version] version Version that contains the resource
                    # @param [Response] response Response from the API
                    # @param [Hash] solution Path solution for the resource
                    # @return [UserPage] UserPage
                    def initialize(version, response, solution)
                        super(version, response)

                        # Path Solution
                        @solution = solution
                    end

                    ##
                    # Build an instance of UserInstance
                    # @param [Hash] payload Payload response from the API
                    # @return [UserInstance] UserInstance
                    def get_instance(payload)
                        UserInstance.new(@version, payload)
                    end

                    ##
                    # Provide a user friendly representation
                    def to_s
                        '<Twilio.Conversations.V1.UserPage>'
                    end
                end
                class UserInstance < InstanceResource
                    ##
                    # Initialize the UserInstance
                    # @param [Version] version Version that contains the resource
                    # @param [Hash] payload payload that contains response from Twilio
                    # @param [String] account_sid The SID of the
                    #   {Account}[https://www.twilio.com/docs/iam/api/account] that created this User
                    #   resource.
                    # @param [String] sid The SID of the Call resource to fetch.
                    # @return [UserInstance] UserInstance
                    def initialize(version, payload , sid: nil)
                        super(version)
                        
                        # Marshaled Properties
                        @properties = { 
                            'sid' => payload['sid'],
                            'account_sid' => payload['account_sid'],
                            'chat_service_sid' => payload['chat_service_sid'],
                            'role_sid' => payload['role_sid'],
                            'identity' => payload['identity'],
                            'friendly_name' => payload['friendly_name'],
                            'attributes' => payload['attributes'],
                            'is_online' => payload['is_online'],
                            'is_notifiable' => payload['is_notifiable'],
                            'date_created' => Twilio.deserialize_iso8601_datetime(payload['date_created']),
                            'date_updated' => Twilio.deserialize_iso8601_datetime(payload['date_updated']),
                            'url' => payload['url'],
                            'links' => payload['links'],
                        }

                        # Context
                        @instance_context = nil
                        @params = { 'sid' => sid  || @properties['sid']  , }
                    end

                    ##
                    # Generate an instance context for the instance, the context is capable of
                    # performing various actions.  All instance actions are proxied to the context
                    # @return [UserContext] CallContext for this CallInstance
                    def context
                        unless @instance_context
                            @instance_context = UserContext.new(@version , @params['sid'])
                        end
                        @instance_context
                    end
                    
                    ##
                    # @return [String] The unique string that we created to identify the User resource.
                    def sid
                        @properties['sid']
                    end
                    
                    ##
                    # @return [String] The SID of the [Account](https://www.twilio.com/docs/iam/api/account) that created the User resource.
                    def account_sid
                        @properties['account_sid']
                    end
                    
                    ##
                    # @return [String] The SID of the [Conversation Service](https://www.twilio.com/docs/conversations/api/service-resource) the User resource is associated with.
                    def chat_service_sid
                        @properties['chat_service_sid']
                    end
                    
                    ##
                    # @return [String] The SID of a service-level [Role](https://www.twilio.com/docs/conversations/api/role-resource) assigned to the user.
                    def role_sid
                        @properties['role_sid']
                    end
                    
                    ##
                    # @return [String] The application-defined string that uniquely identifies the resource's User within the [Conversation Service](https://www.twilio.com/docs/conversations/api/service-resource). This value is often a username or an email address, and is case-sensitive.
                    def identity
                        @properties['identity']
                    end
                    
                    ##
                    # @return [String] The string that you assigned to describe the resource.
                    def friendly_name
                        @properties['friendly_name']
                    end
                    
                    ##
                    # @return [String] The JSON Object string that stores application-specific data. If attributes have not been set, `{}` is returned.
                    def attributes
                        @properties['attributes']
                    end
                    
                    ##
                    # @return [Boolean] Whether the User is actively connected to this Conversations Service and online. This value is only returned by Fetch actions that return a single resource and `null` is always returned by a Read action. This value is `null` if the Service's `reachability_enabled` is `false`, if the User has never been online for this Conversations Service, even if the Service's `reachability_enabled` is `true`.
                    def is_online
                        @properties['is_online']
                    end
                    
                    ##
                    # @return [Boolean] Whether the User has a potentially valid Push Notification registration (APN or GCM) for this Conversations Service. If at least one registration exists, `true`; otherwise `false`. This value is only returned by Fetch actions that return a single resource and `null` is always returned by a Read action. This value is `null` if the Service's `reachability_enabled` is `false`, and if the User has never had a notification registration, even if the Service's `reachability_enabled` is `true`.
                    def is_notifiable
                        @properties['is_notifiable']
                    end
                    
                    ##
                    # @return [Time] The date and time in GMT when the resource was created specified in [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601) format.
                    def date_created
                        @properties['date_created']
                    end
                    
                    ##
                    # @return [Time] The date and time in GMT when the resource was last updated specified in [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601) format.
                    def date_updated
                        @properties['date_updated']
                    end
                    
                    ##
                    # @return [String] An absolute API resource URL for this user.
                    def url
                        @properties['url']
                    end
                    
                    ##
                    # @return [Hash] 
                    def links
                        @properties['links']
                    end
                    
                    ##
                    # Delete the UserInstance
                    # @param [UserEnumWebhookEnabledType] x_twilio_webhook_enabled The X-Twilio-Webhook-Enabled HTTP request header
                    # @return [Boolean] True if delete succeeds, false otherwise
                    def delete(
                        x_twilio_webhook_enabled: :unset
                    )

                        context.delete(
                            x_twilio_webhook_enabled: x_twilio_webhook_enabled, 
                        )
                    end

                    ##
                    # Fetch the UserInstance
                    # @return [UserInstance] Fetched UserInstance
                    def fetch

                        context.fetch
                    end

                    ##
                    # Update the UserInstance
                    # @param [String] friendly_name The string that you assigned to describe the resource.
                    # @param [String] attributes The JSON Object string that stores application-specific data. If attributes have not been set, `{}` is returned.
                    # @param [String] role_sid The SID of a service-level [Role](https://www.twilio.com/docs/conversations/api/role-resource) to assign to the user.
                    # @param [UserEnumWebhookEnabledType] x_twilio_webhook_enabled The X-Twilio-Webhook-Enabled HTTP request header
                    # @return [UserInstance] Updated UserInstance
                    def update(
                        friendly_name: :unset, 
                        attributes: :unset, 
                        role_sid: :unset, 
                        x_twilio_webhook_enabled: :unset
                    )

                        context.update(
                            friendly_name: friendly_name, 
                            attributes: attributes, 
                            role_sid: role_sid, 
                            x_twilio_webhook_enabled: x_twilio_webhook_enabled, 
                        )
                    end

                    ##
                    # Access the user_conversations
                    # @return [user_conversations] user_conversations
                    def user_conversations
                        context.user_conversations
                    end

                    ##
                    # Provide a user friendly representation
                    def to_s
                        values = @params.map{|k, v| "#{k}: #{v}"}.join(" ")
                        "<Twilio.Conversations.V1.UserInstance #{values}>"
                    end

                    ##
                    # Provide a detailed, user friendly representation
                    def inspect
                        values = @properties.map{|k, v| "#{k}: #{v}"}.join(" ")
                        "<Twilio.Conversations.V1.UserInstance #{values}>"
                    end
                end

            end
        end
    end
end