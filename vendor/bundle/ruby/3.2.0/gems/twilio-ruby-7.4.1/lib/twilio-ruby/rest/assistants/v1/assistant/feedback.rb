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
                class AssistantContext < InstanceContext

                     class FeedbackList < ListResource
                
                    class AssistantsV1ServiceCreateFeedbackRequest
                            # @param [message_id]: [String] The message ID.
                            # @param [score]: [Float] The score to be given(0-1).
                            # @param [session_id]: [String] The Session ID.
                            # @param [text]: [String] The text to be given as feedback.
                        attr_accessor :message_id, :score, :session_id, :text
                        def initialize(payload)
                                @message_id = payload["message_id"]
                                @score = payload["score"]
                                @session_id = payload["session_id"]
                                @text = payload["text"]
                        end
                        def to_json(options = {})
                        {
                                "message_id": @message_id,
                                "score": @score,
                                "session_id": @session_id,
                                "text": @text,
                        }.to_json(options)
                        end
                    end


                    ##
                    # Initialize the FeedbackList
                    # @param [Version] version Version that contains the resource
                    # @return [FeedbackList] FeedbackList
                    def initialize(version, id: nil)
                        super(version)
                        # Path Solution
                        @solution = { id: id }
                        @uri = "/Assistants/#{@solution[:id]}/Feedbacks"
                        
                    end
                    ##
                    # Create the FeedbackInstance
                    # @param [AssistantsV1ServiceCreateFeedbackRequest] assistants_v1_service_create_feedback_request 
                    # @return [FeedbackInstance] Created FeedbackInstance
                    def create(assistants_v1_service_create_feedback_request: nil
                    )

                        headers = Twilio::Values.of({'Content-Type' => 'application/x-www-form-urlencoded', })
                        headers['Content-Type'] = 'application/json'
                        
                        
                        
                        
                        payload = @version.create('POST', @uri, headers: headers, data: assistants_v1_service_create_feedback_request.to_json)
                        FeedbackInstance.new(
                            @version,
                            payload,
                            id: @solution[:id],
                        )
                    end

                
                    ##
                    # Lists FeedbackInstance records from the API as a list.
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
                    # When passed a block, yields FeedbackInstance records from the API.
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
                    # Retrieve a single page of FeedbackInstance records from the API.
                    # Request is executed immediately.
                    # @param [String] page_token PageToken provided by the API
                    # @param [Integer] page_number Page Number, this value is simply for client state
                    # @param [Integer] page_size Number of records to return, defaults to 50
                    # @return [Page] Page of FeedbackInstance
                    def page(page_token: :unset, page_number: :unset, page_size: :unset)
                        params = Twilio::Values.of({
                            'PageToken' => page_token,
                            'Page' => page_number,
                            'PageSize' => page_size,
                        })
                        headers = Twilio::Values.of({})
                        
                        

                        response = @version.page('GET', @uri, params: params, headers: headers)

                        FeedbackPage.new(@version, response, @solution)
                    end

                    ##
                    # Retrieve a single page of FeedbackInstance records from the API.
                    # Request is executed immediately.
                    # @param [String] target_url API-generated URL for the requested results page
                    # @return [Page] Page of FeedbackInstance
                    def get_page(target_url)
                        response = @version.domain.request(
                            'GET',
                            target_url
                        )
                    FeedbackPage.new(@version, response, @solution)
                    end
                    


                    # Provide a user friendly representation
                    def to_s
                        '#<Twilio.Assistants.V1.FeedbackList>'
                    end
                end

                class FeedbackPage < Page
                    ##
                    # Initialize the FeedbackPage
                    # @param [Version] version Version that contains the resource
                    # @param [Response] response Response from the API
                    # @param [Hash] solution Path solution for the resource
                    # @return [FeedbackPage] FeedbackPage
                    def initialize(version, response, solution)
                        super(version, response)

                        # Path Solution
                        @solution = solution
                    end

                    ##
                    # Build an instance of FeedbackInstance
                    # @param [Hash] payload Payload response from the API
                    # @return [FeedbackInstance] FeedbackInstance
                    def get_instance(payload)
                        FeedbackInstance.new(@version, payload, id: @solution[:id])
                    end

                    ##
                    # Provide a user friendly representation
                    def to_s
                        '<Twilio.Assistants.V1.FeedbackPage>'
                    end
                end
                class FeedbackInstance < InstanceResource
                    ##
                    # Initialize the FeedbackInstance
                    # @param [Version] version Version that contains the resource
                    # @param [Hash] payload payload that contains response from Twilio
                    # @param [String] account_sid The SID of the
                    #   {Account}[https://www.twilio.com/docs/iam/api/account] that created this Feedback
                    #   resource.
                    # @param [String] sid The SID of the Call resource to fetch.
                    # @return [FeedbackInstance] FeedbackInstance
                    def initialize(version, payload , id: nil)
                        super(version)
                        
                        # Marshaled Properties
                        @properties = { 
                            'assistant_id' => payload['assistant_id'],
                            'id' => payload['id'],
                            'account_sid' => payload['account_sid'],
                            'user_sid' => payload['user_sid'],
                            'message_id' => payload['message_id'],
                            'score' => payload['score'],
                            'session_id' => payload['session_id'],
                            'text' => payload['text'],
                            'date_created' => Twilio.deserialize_iso8601_datetime(payload['date_created']),
                            'date_updated' => Twilio.deserialize_iso8601_datetime(payload['date_updated']),
                        }
                    end

                    
                    ##
                    # @return [String] The Assistant ID.
                    def assistant_id
                        @properties['assistant_id']
                    end
                    
                    ##
                    # @return [String] The Feedback ID.
                    def id
                        @properties['id']
                    end
                    
                    ##
                    # @return [String] The SID of the [Account](https://www.twilio.com/docs/iam/api/account) that created the Feedback.
                    def account_sid
                        @properties['account_sid']
                    end
                    
                    ##
                    # @return [String] The SID of the User created the Feedback.
                    def user_sid
                        @properties['user_sid']
                    end
                    
                    ##
                    # @return [String] The Message ID.
                    def message_id
                        @properties['message_id']
                    end
                    
                    ##
                    # @return [Float] The Score to provide as Feedback (0-1)
                    def score
                        @properties['score']
                    end
                    
                    ##
                    # @return [String] The Session ID.
                    def session_id
                        @properties['session_id']
                    end
                    
                    ##
                    # @return [String] The text to be given as feedback.
                    def text
                        @properties['text']
                    end
                    
                    ##
                    # @return [Time] The date and time in GMT when the Feedback was created specified in [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601) format.
                    def date_created
                        @properties['date_created']
                    end
                    
                    ##
                    # @return [Time] The date and time in GMT when the Feedback was last updated specified in [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601) format.
                    def date_updated
                        @properties['date_updated']
                    end
                    
                    ##
                    # Provide a user friendly representation
                    def to_s
                        "<Twilio.Assistants.V1.FeedbackInstance>"
                    end

                    ##
                    # Provide a detailed, user friendly representation
                    def inspect
                        "<Twilio.Assistants.V1.FeedbackInstance>"
                    end
                end

             end
            end
        end
    end
end


