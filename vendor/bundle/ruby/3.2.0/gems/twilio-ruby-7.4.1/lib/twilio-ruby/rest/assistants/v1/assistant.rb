##
#    This code was generated by
#    ___ _ _ _ _ _    _ ____    ____ ____ _    ____ ____ _  _ ____ ____ ____ ___ __   __
#     |  | | | | |    | |  | __ |  | |__| | __ | __ |___ |\ | |___ |__/ |__|  | |  | |__/
#     |  |_|_| | |___ | |__|    |__| |  | |    |__] |___ | \| |___ |  \ |  |  | |__| |  \
#
#    Twilio - Assistants
#    This is the public Twilio REST API.
#
#    NOTE: This class is auto generated by OpenAPI Generator.
#    https://openapi-generator.tech
#    Do not edit the class manually.
#


module Twilio
    module REST
        class Assistants < AssistantsBase
            class V1 < Version
                class AssistantList < ListResource
                
                    class AssistantsV1ServiceCreateAssistantRequest
                            # @param [customer_ai]: [AssistantList.AssistantsV1ServiceCustomerAi] 
                            # @param [name]: [String] The name of the assistant.
                            # @param [owner]: [String] The owner/company of the assistant.
                            # @param [personality_prompt]: [String] The personality prompt to be used for assistant.
                            # @param [segment_credential]: [AssistantList.AssistantsV1ServiceSegmentCredential] 
                        attr_accessor :customer_ai, :name, :owner, :personality_prompt, :segment_credential
                        def initialize(payload)
                                @customer_ai = payload["customer_ai"]
                                @name = payload["name"]
                                @owner = payload["owner"]
                                @personality_prompt = payload["personality_prompt"]
                                @segment_credential = payload["segment_credential"]
                        end
                        def to_json(options = {})
                        {
                                "customer_ai": @customer_ai,
                                "name": @name,
                                "owner": @owner,
                                "personality_prompt": @personality_prompt,
                                "segment_credential": @segment_credential,
                        }.to_json(options)
                        end
                    end

                    class AssistantsV1ServiceCustomerAi
                            # @param [perception_engine_enabled]: [Boolean] True if the perception engine is enabled.
                            # @param [personalization_engine_enabled]: [Boolean] True if the personalization engine is enabled.
                        attr_accessor :perception_engine_enabled, :personalization_engine_enabled
                        def initialize(payload)
                                @perception_engine_enabled = payload["perception_engine_enabled"]
                                @personalization_engine_enabled = payload["personalization_engine_enabled"]
                        end
                        def to_json(options = {})
                        {
                                "perception_engine_enabled": @perception_engine_enabled,
                                "personalization_engine_enabled": @personalization_engine_enabled,
                        }.to_json(options)
                        end
                    end

                    class AssistantsV1ServiceSegmentCredential
                            # @param [profile_api_key]: [String] The profile API key.
                            # @param [space_id]: [String] The space ID.
                            # @param [write_key]: [String] The write key.
                        attr_accessor :profile_api_key, :space_id, :write_key
                        def initialize(payload)
                                @profile_api_key = payload["profile_api_key"]
                                @space_id = payload["space_id"]
                                @write_key = payload["write_key"]
                        end
                        def to_json(options = {})
                        {
                                "profile_api_key": @profile_api_key,
                                "space_id": @space_id,
                                "write_key": @write_key,
                        }.to_json(options)
                        end
                    end

                    class AssistantsV1ServiceUpdateAssistantRequest
                            # @param [customer_ai]: [AssistantList.AssistantsV1ServiceCustomerAi] 
                            # @param [name]: [String] The name of the assistant.
                            # @param [owner]: [String] The owner/company of the assistant.
                            # @param [personality_prompt]: [String] The personality prompt to be used for assistant.
                            # @param [segment_credential]: [AssistantList.AssistantsV1ServiceSegmentCredential] 
                        attr_accessor :customer_ai, :name, :owner, :personality_prompt, :segment_credential
                        def initialize(payload)
                                @customer_ai = payload["customer_ai"]
                                @name = payload["name"]
                                @owner = payload["owner"]
                                @personality_prompt = payload["personality_prompt"]
                                @segment_credential = payload["segment_credential"]
                        end
                        def to_json(options = {})
                        {
                                "customer_ai": @customer_ai,
                                "name": @name,
                                "owner": @owner,
                                "personality_prompt": @personality_prompt,
                                "segment_credential": @segment_credential,
                        }.to_json(options)
                        end
                    end


                    class AssistantsV1ServiceCreateAssistantRequest
                            # @param [customer_ai]: [AssistantList.AssistantsV1ServiceCustomerAi] 
                            # @param [name]: [String] The name of the assistant.
                            # @param [owner]: [String] The owner/company of the assistant.
                            # @param [personality_prompt]: [String] The personality prompt to be used for assistant.
                            # @param [segment_credential]: [AssistantList.AssistantsV1ServiceSegmentCredential] 
                        attr_accessor :customer_ai, :name, :owner, :personality_prompt, :segment_credential
                        def initialize(payload)
                                @customer_ai = payload["customer_ai"]
                                @name = payload["name"]
                                @owner = payload["owner"]
                                @personality_prompt = payload["personality_prompt"]
                                @segment_credential = payload["segment_credential"]
                        end
                        def to_json(options = {})
                        {
                                "customer_ai": @customer_ai,
                                "name": @name,
                                "owner": @owner,
                                "personality_prompt": @personality_prompt,
                                "segment_credential": @segment_credential,
                        }.to_json(options)
                        end
                    end

                    class AssistantsV1ServiceCustomerAi
                            # @param [perception_engine_enabled]: [Boolean] True if the perception engine is enabled.
                            # @param [personalization_engine_enabled]: [Boolean] True if the personalization engine is enabled.
                        attr_accessor :perception_engine_enabled, :personalization_engine_enabled
                        def initialize(payload)
                                @perception_engine_enabled = payload["perception_engine_enabled"]
                                @personalization_engine_enabled = payload["personalization_engine_enabled"]
                        end
                        def to_json(options = {})
                        {
                                "perception_engine_enabled": @perception_engine_enabled,
                                "personalization_engine_enabled": @personalization_engine_enabled,
                        }.to_json(options)
                        end
                    end

                    class AssistantsV1ServiceSegmentCredential
                            # @param [profile_api_key]: [String] The profile API key.
                            # @param [space_id]: [String] The space ID.
                            # @param [write_key]: [String] The write key.
                        attr_accessor :profile_api_key, :space_id, :write_key
                        def initialize(payload)
                                @profile_api_key = payload["profile_api_key"]
                                @space_id = payload["space_id"]
                                @write_key = payload["write_key"]
                        end
                        def to_json(options = {})
                        {
                                "profile_api_key": @profile_api_key,
                                "space_id": @space_id,
                                "write_key": @write_key,
                        }.to_json(options)
                        end
                    end

                    class AssistantsV1ServiceUpdateAssistantRequest
                            # @param [customer_ai]: [AssistantList.AssistantsV1ServiceCustomerAi] 
                            # @param [name]: [String] The name of the assistant.
                            # @param [owner]: [String] The owner/company of the assistant.
                            # @param [personality_prompt]: [String] The personality prompt to be used for assistant.
                            # @param [segment_credential]: [AssistantList.AssistantsV1ServiceSegmentCredential] 
                        attr_accessor :customer_ai, :name, :owner, :personality_prompt, :segment_credential
                        def initialize(payload)
                                @customer_ai = payload["customer_ai"]
                                @name = payload["name"]
                                @owner = payload["owner"]
                                @personality_prompt = payload["personality_prompt"]
                                @segment_credential = payload["segment_credential"]
                        end
                        def to_json(options = {})
                        {
                                "customer_ai": @customer_ai,
                                "name": @name,
                                "owner": @owner,
                                "personality_prompt": @personality_prompt,
                                "segment_credential": @segment_credential,
                        }.to_json(options)
                        end
                    end


                    ##
                    # Initialize the AssistantList
                    # @param [Version] version Version that contains the resource
                    # @return [AssistantList] AssistantList
                    def initialize(version)
                        super(version)
                        # Path Solution
                        @solution = {  }
                        @uri = "/Assistants"
                        
                    end
                    ##
                    # Create the AssistantInstance
                    # @param [AssistantsV1ServiceCreateAssistantRequest] assistants_v1_service_create_assistant_request 
                    # @return [AssistantInstance] Created AssistantInstance
                    def create(assistants_v1_service_create_assistant_request: nil
                    )

                        headers = Twilio::Values.of({'Content-Type' => 'application/x-www-form-urlencoded', })
                        headers['Content-Type'] = 'application/json'
                        
                        
                        
                        
                        payload = @version.create('POST', @uri, headers: headers, data: assistants_v1_service_create_assistant_request.to_json)
                        AssistantInstance.new(
                            @version,
                            payload,
                        )
                    end

                
                    ##
                    # Lists AssistantInstance records from the API as a list.
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
                    # When passed a block, yields AssistantInstance records from the API.
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
                    # Retrieve a single page of AssistantInstance records from the API.
                    # Request is executed immediately.
                    # @param [String] page_token PageToken provided by the API
                    # @param [Integer] page_number Page Number, this value is simply for client state
                    # @param [Integer] page_size Number of records to return, defaults to 50
                    # @return [Page] Page of AssistantInstance
                    def page(page_token: :unset, page_number: :unset, page_size: :unset)
                        params = Twilio::Values.of({
                            'PageToken' => page_token,
                            'Page' => page_number,
                            'PageSize' => page_size,
                        })
                        headers = Twilio::Values.of({})
                        
                        

                        response = @version.page('GET', @uri, params: params, headers: headers)

                        AssistantPage.new(@version, response, @solution)
                    end

                    ##
                    # Retrieve a single page of AssistantInstance records from the API.
                    # Request is executed immediately.
                    # @param [String] target_url API-generated URL for the requested results page
                    # @return [Page] Page of AssistantInstance
                    def get_page(target_url)
                        response = @version.domain.request(
                            'GET',
                            target_url
                        )
                    AssistantPage.new(@version, response, @solution)
                    end
                    


                    # Provide a user friendly representation
                    def to_s
                        '#<Twilio.Assistants.V1.AssistantList>'
                    end
                end


                class AssistantContext < InstanceContext
                    ##
                    # Initialize the AssistantContext
                    # @param [Version] version Version that contains the resource
                    # @param [String] id 
                    # @return [AssistantContext] AssistantContext
                    def initialize(version, id)
                        super(version)

                        # Path Solution
                        @solution = { id: id,  }
                        @uri = "/Assistants/#{@solution[:id]}"

                        # Dependents
                        @feedbacks = nil
                        @messages = nil
                        @assistants_tools = nil
                        @assistants_knowledge = nil
                    end
                    ##
                    # Delete the AssistantInstance
                    # @return [Boolean] True if delete succeeds, false otherwise
                    def delete

                        headers = Twilio::Values.of({'Content-Type' => 'application/x-www-form-urlencoded', })
                        
                        
                        
                        @version.delete('DELETE', @uri, headers: headers)
                    end

                    ##
                    # Fetch the AssistantInstance
                    # @return [AssistantInstance] Fetched AssistantInstance
                    def fetch

                        headers = Twilio::Values.of({'Content-Type' => 'application/x-www-form-urlencoded', })
                        
                        
                        
                        
                        
                        payload = @version.fetch('GET', @uri, headers: headers)
                        AssistantInstance.new(
                            @version,
                            payload,
                            id: @solution[:id],
                        )
                    end

                    ##
                    # Update the AssistantInstance
                    # @param [AssistantsV1ServiceUpdateAssistantRequest] assistants_v1_service_update_assistant_request 
                    # @return [AssistantInstance] Updated AssistantInstance
                    def update(assistants_v1_service_update_assistant_request: :unset
                    )

                        headers = Twilio::Values.of({'Content-Type' => 'application/x-www-form-urlencoded', })
                        headers['Content-Type'] = 'application/json'
                        
                        
                        
                        
                        payload = @version.update('PUT', @uri, headers: headers, data: assistants_v1_service_update_assistant_request.to_json)
                        AssistantInstance.new(
                            @version,
                            payload,
                            id: @solution[:id],
                        )
                    end

                    ##
                    # Access the feedbacks
                    # @return [FeedbackList]
                    # @return [FeedbackContext]
                    def feedbacks
                      unless @feedbacks
                        @feedbacks = FeedbackList.new(
                                @version, id: @solution[:id], )
                      end
                      @feedbacks
                    end
                    ##
                    # Access the messages
                    # @return [MessageList]
                    # @return [MessageContext]
                    def messages
                      unless @messages
                        @messages = MessageList.new(
                                @version, id: @solution[:id], )
                      end
                      @messages
                    end
                    ##
                    # Access the assistants_tools
                    # @return [AssistantsToolList]
                    # @return [AssistantsToolContext] if sid was passed.
                    def assistants_tools(id=:unset)

                        raise ArgumentError, 'id cannot be nil' if id.nil?

                        if id != :unset
                            return AssistantsToolContext.new(@version, @solution[:id],id )
                        end

                        unless @assistants_tools
                            @assistants_tools = AssistantsToolList.new(
                                @version, )
                        end

                     @assistants_tools
                    end
                    ##
                    # Access the assistants_knowledge
                    # @return [AssistantsKnowledgeList]
                    # @return [AssistantsKnowledgeContext] if sid was passed.
                    def assistants_knowledge(id=:unset)

                        raise ArgumentError, 'id cannot be nil' if id.nil?

                        if id != :unset
                            return AssistantsKnowledgeContext.new(@version, @solution[:id],id )
                        end

                        unless @assistants_knowledge
                            @assistants_knowledge = AssistantsKnowledgeList.new(
                                @version, )
                        end

                     @assistants_knowledge
                    end

                    ##
                    # Provide a user friendly representation
                    def to_s
                        context = @solution.map{|k, v| "#{k}: #{v}"}.join(',')
                        "#<Twilio.Assistants.V1.AssistantContext #{context}>"
                    end

                    ##
                    # Provide a detailed, user friendly representation
                    def inspect
                        context = @solution.map{|k, v| "#{k}: #{v}"}.join(',')
                        "#<Twilio.Assistants.V1.AssistantContext #{context}>"
                    end
                end

                class AssistantPage < Page
                    ##
                    # Initialize the AssistantPage
                    # @param [Version] version Version that contains the resource
                    # @param [Response] response Response from the API
                    # @param [Hash] solution Path solution for the resource
                    # @return [AssistantPage] AssistantPage
                    def initialize(version, response, solution)
                        super(version, response)

                        # Path Solution
                        @solution = solution
                    end

                    ##
                    # Build an instance of AssistantInstance
                    # @param [Hash] payload Payload response from the API
                    # @return [AssistantInstance] AssistantInstance
                    def get_instance(payload)
                        AssistantInstance.new(@version, payload)
                    end

                    ##
                    # Provide a user friendly representation
                    def to_s
                        '<Twilio.Assistants.V1.AssistantPage>'
                    end
                end
                class AssistantInstance < InstanceResource
                    ##
                    # Initialize the AssistantInstance
                    # @param [Version] version Version that contains the resource
                    # @param [Hash] payload payload that contains response from Twilio
                    # @param [String] account_sid The SID of the
                    #   {Account}[https://www.twilio.com/docs/iam/api/account] that created this Assistant
                    #   resource.
                    # @param [String] sid The SID of the Call resource to fetch.
                    # @return [AssistantInstance] AssistantInstance
                    def initialize(version, payload , id: nil)
                        super(version)
                        
                        # Marshaled Properties
                        @properties = { 
                            'account_sid' => payload['account_sid'],
                            'customer_ai' => payload['customer_ai'],
                            'id' => payload['id'],
                            'model' => payload['model'],
                            'name' => payload['name'],
                            'owner' => payload['owner'],
                            'url' => payload['url'],
                            'personality_prompt' => payload['personality_prompt'],
                            'date_created' => Twilio.deserialize_iso8601_datetime(payload['date_created']),
                            'date_updated' => Twilio.deserialize_iso8601_datetime(payload['date_updated']),
                            'knowledge' => payload['knowledge'],
                            'tools' => payload['tools'],
                        }

                        # Context
                        @instance_context = nil
                        @params = { 'id' => id  || @properties['id']  , }
                    end

                    ##
                    # Generate an instance context for the instance, the context is capable of
                    # performing various actions.  All instance actions are proxied to the context
                    # @return [AssistantContext] CallContext for this CallInstance
                    def context
                        unless @instance_context
                            @instance_context = AssistantContext.new(@version , @params['id'])
                        end
                        @instance_context
                    end
                    
                    ##
                    # @return [String] The SID of the [Account](https://www.twilio.com/docs/iam/api/account) that created the Assistant resource.
                    def account_sid
                        @properties['account_sid']
                    end
                    
                    ##
                    # @return [Hash] The Personalization and Perception Engine settings.
                    def customer_ai
                        @properties['customer_ai']
                    end
                    
                    ##
                    # @return [String] The Assistant ID.
                    def id
                        @properties['id']
                    end
                    
                    ##
                    # @return [String] The default model used by the assistant.
                    def model
                        @properties['model']
                    end
                    
                    ##
                    # @return [String] The name of the assistant.
                    def name
                        @properties['name']
                    end
                    
                    ##
                    # @return [String] The owner/company of the assistant.
                    def owner
                        @properties['owner']
                    end
                    
                    ##
                    # @return [String] The url of the assistant resource.
                    def url
                        @properties['url']
                    end
                    
                    ##
                    # @return [String] The personality prompt to be used for assistant.
                    def personality_prompt
                        @properties['personality_prompt']
                    end
                    
                    ##
                    # @return [Time] The date and time in GMT when the Assistant was created specified in [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601) format.
                    def date_created
                        @properties['date_created']
                    end
                    
                    ##
                    # @return [Time] The date and time in GMT when the Assistant was last updated specified in [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601) format.
                    def date_updated
                        @properties['date_updated']
                    end
                    
                    ##
                    # @return [Array<AssistantsV1ServiceKnowledge>] The list of knowledge sources associated with the assistant.
                    def knowledge
                        @properties['knowledge']
                    end
                    
                    ##
                    # @return [Array<AssistantsV1ServiceTool>] The list of tools associated with the assistant.
                    def tools
                        @properties['tools']
                    end
                    
                    ##
                    # Delete the AssistantInstance
                    # @return [Boolean] True if delete succeeds, false otherwise
                    def delete

                        context.delete
                    end

                    ##
                    # Fetch the AssistantInstance
                    # @return [AssistantInstance] Fetched AssistantInstance
                    def fetch

                        context.fetch
                    end

                    ##
                    # Update the AssistantInstance
                    # @param [AssistantsV1ServiceUpdateAssistantRequest] assistants_v1_service_update_assistant_request 
                    # @return [AssistantInstance] Updated AssistantInstance
                    def update(assistants_v1_service_update_assistant_request: :unset
                    )

                        context.update(
                        )
                    end

                    ##
                    # Access the feedbacks
                    # @return [feedbacks] feedbacks
                    def feedbacks
                        context.feedbacks
                    end

                    ##
                    # Access the messages
                    # @return [messages] messages
                    def messages
                        context.messages
                    end

                    ##
                    # Access the assistants_tools
                    # @return [assistants_tools] assistants_tools
                    def assistants_tools
                        context.assistants_tools
                    end

                    ##
                    # Access the assistants_knowledge
                    # @return [assistants_knowledge] assistants_knowledge
                    def assistants_knowledge
                        context.assistants_knowledge
                    end

                    ##
                    # Provide a user friendly representation
                    def to_s
                        values = @params.map{|k, v| "#{k}: #{v}"}.join(" ")
                        "<Twilio.Assistants.V1.AssistantInstance #{values}>"
                    end

                    ##
                    # Provide a detailed, user friendly representation
                    def inspect
                        values = @properties.map{|k, v| "#{k}: #{v}"}.join(" ")
                        "<Twilio.Assistants.V1.AssistantInstance #{values}>"
                    end
                end

            end
        end
    end
end
