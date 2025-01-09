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
                class CallContext < InstanceContext

                     class NotificationList < ListResource
                
                    ##
                    # Initialize the NotificationList
                    # @param [Version] version Version that contains the resource
                    # @return [NotificationList] NotificationList
                    def initialize(version, account_sid: nil, call_sid: nil)
                        super(version)
                        # Path Solution
                        @solution = { account_sid: account_sid, call_sid: call_sid }
                        @uri = "/Accounts/#{@solution[:account_sid]}/Calls/#{@solution[:call_sid]}/Notifications.json"
                        
                    end
                
                    ##
                    # Lists NotificationInstance records from the API as a list.
                    # Unlike stream(), this operation is eager and will load `limit` records into
                    # memory before returning.
                    # @param [String] log Only read notifications of the specified log level. Can be:  `0` to read only ERROR notifications or `1` to read only WARNING notifications. By default, all notifications are read.
                    # @param [Date] message_date Only show notifications for the specified date, formatted as `YYYY-MM-DD`. You can also specify an inequality, such as `<=YYYY-MM-DD` for messages logged at or before midnight on a date, or `>=YYYY-MM-DD` for messages logged at or after midnight on a date.
                    # @param [Date] message_date_before Only show notifications for the specified date, formatted as `YYYY-MM-DD`. You can also specify an inequality, such as `<=YYYY-MM-DD` for messages logged at or before midnight on a date, or `>=YYYY-MM-DD` for messages logged at or after midnight on a date.
                    # @param [Date] message_date_after Only show notifications for the specified date, formatted as `YYYY-MM-DD`. You can also specify an inequality, such as `<=YYYY-MM-DD` for messages logged at or before midnight on a date, or `>=YYYY-MM-DD` for messages logged at or after midnight on a date.
                    # @param [Integer] limit Upper limit for the number of records to return. stream()
                    #    guarantees to never return more than limit.  Default is no limit
                    # @param [Integer] page_size Number of records to fetch per request, when
                    #    not set will use the default value of 50 records.  If no page_size is defined
                    #    but a limit is defined, stream() will attempt to read the limit with the most
                    #    efficient page size, i.e. min(limit, 1000)
                    # @return [Array] Array of up to limit results
                    def list(log: :unset, message_date: :unset, message_date_before: :unset, message_date_after: :unset, limit: nil, page_size: nil)
                        self.stream(
                            log: log,
                            message_date: message_date,
                            message_date_before: message_date_before,
                            message_date_after: message_date_after,
                            limit: limit,
                            page_size: page_size
                        ).entries
                    end

                    ##
                    # Streams Instance records from the API as an Enumerable.
                    # This operation lazily loads records as efficiently as possible until the limit
                    # is reached.
                    # @param [String] log Only read notifications of the specified log level. Can be:  `0` to read only ERROR notifications or `1` to read only WARNING notifications. By default, all notifications are read.
                    # @param [Date] message_date Only show notifications for the specified date, formatted as `YYYY-MM-DD`. You can also specify an inequality, such as `<=YYYY-MM-DD` for messages logged at or before midnight on a date, or `>=YYYY-MM-DD` for messages logged at or after midnight on a date.
                    # @param [Date] message_date_before Only show notifications for the specified date, formatted as `YYYY-MM-DD`. You can also specify an inequality, such as `<=YYYY-MM-DD` for messages logged at or before midnight on a date, or `>=YYYY-MM-DD` for messages logged at or after midnight on a date.
                    # @param [Date] message_date_after Only show notifications for the specified date, formatted as `YYYY-MM-DD`. You can also specify an inequality, such as `<=YYYY-MM-DD` for messages logged at or before midnight on a date, or `>=YYYY-MM-DD` for messages logged at or after midnight on a date.
                    # @param [Integer] limit Upper limit for the number of records to return. stream()
                    #    guarantees to never return more than limit.  Default is no limit
                    # @param [Integer] page_size Number of records to fetch per request, when
                    #    not set will use the default value of 50 records.  If no page_size is defined
                    #    but a limit is defined, stream() will attempt to read the limit with the most
                    #    efficient page size, i.e. min(limit, 1000)
                    # @return [Enumerable] Enumerable that will yield up to limit results
                    def stream(log: :unset, message_date: :unset, message_date_before: :unset, message_date_after: :unset, limit: nil, page_size: nil)
                        limits = @version.read_limits(limit, page_size)

                        page = self.page(
                            log: log,
                            message_date: message_date,
                            message_date_before: message_date_before,
                            message_date_after: message_date_after,
                            page_size: limits[:page_size], )

                        @version.stream(page, limit: limits[:limit], page_limit: limits[:page_limit])
                    end

                    ##
                    # When passed a block, yields NotificationInstance records from the API.
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
                    # Retrieve a single page of NotificationInstance records from the API.
                    # Request is executed immediately.
                    # @param [String] log Only read notifications of the specified log level. Can be:  `0` to read only ERROR notifications or `1` to read only WARNING notifications. By default, all notifications are read.
                    # @param [Date] message_date Only show notifications for the specified date, formatted as `YYYY-MM-DD`. You can also specify an inequality, such as `<=YYYY-MM-DD` for messages logged at or before midnight on a date, or `>=YYYY-MM-DD` for messages logged at or after midnight on a date.
                    # @param [Date] message_date_before Only show notifications for the specified date, formatted as `YYYY-MM-DD`. You can also specify an inequality, such as `<=YYYY-MM-DD` for messages logged at or before midnight on a date, or `>=YYYY-MM-DD` for messages logged at or after midnight on a date.
                    # @param [Date] message_date_after Only show notifications for the specified date, formatted as `YYYY-MM-DD`. You can also specify an inequality, such as `<=YYYY-MM-DD` for messages logged at or before midnight on a date, or `>=YYYY-MM-DD` for messages logged at or after midnight on a date.
                    # @param [String] page_token PageToken provided by the API
                    # @param [Integer] page_number Page Number, this value is simply for client state
                    # @param [Integer] page_size Number of records to return, defaults to 50
                    # @return [Page] Page of NotificationInstance
                    def page(log: :unset, message_date: :unset, message_date_before: :unset, message_date_after: :unset, page_token: :unset, page_number: :unset, page_size: :unset)
                        params = Twilio::Values.of({
                            'Log' => log,
                            'MessageDate' =>  Twilio.serialize_iso8601_date(message_date),
                            'MessageDate<' =>  Twilio.serialize_iso8601_date(message_date_before),
                            'MessageDate>' =>  Twilio.serialize_iso8601_date(message_date_after),
                            'PageToken' => page_token,
                            'Page' => page_number,
                            'PageSize' => page_size,
                        })
                        headers = Twilio::Values.of({})
                        
                        

                        response = @version.page('GET', @uri, params: params, headers: headers)

                        NotificationPage.new(@version, response, @solution)
                    end

                    ##
                    # Retrieve a single page of NotificationInstance records from the API.
                    # Request is executed immediately.
                    # @param [String] target_url API-generated URL for the requested results page
                    # @return [Page] Page of NotificationInstance
                    def get_page(target_url)
                        response = @version.domain.request(
                            'GET',
                            target_url
                        )
                    NotificationPage.new(@version, response, @solution)
                    end
                    


                    # Provide a user friendly representation
                    def to_s
                        '#<Twilio.Api.V2010.NotificationList>'
                    end
                end


                class NotificationContext < InstanceContext
                    ##
                    # Initialize the NotificationContext
                    # @param [Version] version Version that contains the resource
                    # @param [String] account_sid The SID of the [Account](https://www.twilio.com/docs/iam/api/account) that created the Call Notification resource to fetch.
                    # @param [String] call_sid The [Call](https://www.twilio.com/docs/voice/api/call-resource) SID of the Call Notification resource to fetch.
                    # @param [String] sid The Twilio-provided string that uniquely identifies the Call Notification resource to fetch.
                    # @return [NotificationContext] NotificationContext
                    def initialize(version, account_sid, call_sid, sid)
                        super(version)

                        # Path Solution
                        @solution = { account_sid: account_sid, call_sid: call_sid, sid: sid,  }
                        @uri = "/Accounts/#{@solution[:account_sid]}/Calls/#{@solution[:call_sid]}/Notifications/#{@solution[:sid]}.json"

                        
                    end
                    ##
                    # Fetch the NotificationInstance
                    # @return [NotificationInstance] Fetched NotificationInstance
                    def fetch

                        headers = Twilio::Values.of({'Content-Type' => 'application/x-www-form-urlencoded', })
                        
                        
                        
                        
                        
                        payload = @version.fetch('GET', @uri, headers: headers)
                        NotificationInstance.new(
                            @version,
                            payload,
                            account_sid: @solution[:account_sid],
                            call_sid: @solution[:call_sid],
                            sid: @solution[:sid],
                        )
                    end


                    ##
                    # Provide a user friendly representation
                    def to_s
                        context = @solution.map{|k, v| "#{k}: #{v}"}.join(',')
                        "#<Twilio.Api.V2010.NotificationContext #{context}>"
                    end

                    ##
                    # Provide a detailed, user friendly representation
                    def inspect
                        context = @solution.map{|k, v| "#{k}: #{v}"}.join(',')
                        "#<Twilio.Api.V2010.NotificationContext #{context}>"
                    end
                end

                class NotificationPage < Page
                    ##
                    # Initialize the NotificationPage
                    # @param [Version] version Version that contains the resource
                    # @param [Response] response Response from the API
                    # @param [Hash] solution Path solution for the resource
                    # @return [NotificationPage] NotificationPage
                    def initialize(version, response, solution)
                        super(version, response)

                        # Path Solution
                        @solution = solution
                    end

                    ##
                    # Build an instance of NotificationInstance
                    # @param [Hash] payload Payload response from the API
                    # @return [NotificationInstance] NotificationInstance
                    def get_instance(payload)
                        NotificationInstance.new(@version, payload, account_sid: @solution[:account_sid], call_sid: @solution[:call_sid])
                    end

                    ##
                    # Provide a user friendly representation
                    def to_s
                        '<Twilio.Api.V2010.NotificationPage>'
                    end
                end
                class NotificationInstance < InstanceResource
                    ##
                    # Initialize the NotificationInstance
                    # @param [Version] version Version that contains the resource
                    # @param [Hash] payload payload that contains response from Twilio
                    # @param [String] account_sid The SID of the
                    #   {Account}[https://www.twilio.com/docs/iam/api/account] that created this Notification
                    #   resource.
                    # @param [String] sid The SID of the Call resource to fetch.
                    # @return [NotificationInstance] NotificationInstance
                    def initialize(version, payload , account_sid: nil, call_sid: nil, sid: nil)
                        super(version)
                        
                        # Marshaled Properties
                        @properties = { 
                            'account_sid' => payload['account_sid'],
                            'api_version' => payload['api_version'],
                            'call_sid' => payload['call_sid'],
                            'date_created' => Twilio.deserialize_rfc2822(payload['date_created']),
                            'date_updated' => Twilio.deserialize_rfc2822(payload['date_updated']),
                            'error_code' => payload['error_code'],
                            'log' => payload['log'],
                            'message_date' => Twilio.deserialize_rfc2822(payload['message_date']),
                            'message_text' => payload['message_text'],
                            'more_info' => payload['more_info'],
                            'request_method' => payload['request_method'],
                            'request_url' => payload['request_url'],
                            'request_variables' => payload['request_variables'],
                            'response_body' => payload['response_body'],
                            'response_headers' => payload['response_headers'],
                            'sid' => payload['sid'],
                            'uri' => payload['uri'],
                        }

                        # Context
                        @instance_context = nil
                        @params = { 'account_sid' => account_sid  ,'call_sid' => call_sid  || @properties['call_sid']  ,'sid' => sid  || @properties['sid']  , }
                    end

                    ##
                    # Generate an instance context for the instance, the context is capable of
                    # performing various actions.  All instance actions are proxied to the context
                    # @return [NotificationContext] CallContext for this CallInstance
                    def context
                        unless @instance_context
                            @instance_context = NotificationContext.new(@version , @params['account_sid'], @params['call_sid'], @params['sid'])
                        end
                        @instance_context
                    end
                    
                    ##
                    # @return [String] The SID of the [Account](https://www.twilio.com/docs/iam/api/account) that created the Call Notification resource.
                    def account_sid
                        @properties['account_sid']
                    end
                    
                    ##
                    # @return [String] The API version used to create the Call Notification resource.
                    def api_version
                        @properties['api_version']
                    end
                    
                    ##
                    # @return [String] The SID of the [Call](https://www.twilio.com/docs/voice/api/call-resource) the Call Notification resource is associated with.
                    def call_sid
                        @properties['call_sid']
                    end
                    
                    ##
                    # @return [Time] The date and time in GMT that the resource was created specified in [RFC 2822](https://www.ietf.org/rfc/rfc2822.txt) format.
                    def date_created
                        @properties['date_created']
                    end
                    
                    ##
                    # @return [Time] The date and time in GMT that the resource was last updated specified in [RFC 2822](https://www.ietf.org/rfc/rfc2822.txt) format.
                    def date_updated
                        @properties['date_updated']
                    end
                    
                    ##
                    # @return [String] A unique error code for the error condition that is described in our [Error Dictionary](https://www.twilio.com/docs/api/errors).
                    def error_code
                        @properties['error_code']
                    end
                    
                    ##
                    # @return [String] An integer log level that corresponds to the type of notification: `0` is ERROR, `1` is WARNING.
                    def log
                        @properties['log']
                    end
                    
                    ##
                    # @return [Time] The date the notification was actually generated in [RFC 2822](https://www.ietf.org/rfc/rfc2822.txt) format. Message buffering can cause this value to differ from `date_created`.
                    def message_date
                        @properties['message_date']
                    end
                    
                    ##
                    # @return [String] The text of the notification.
                    def message_text
                        @properties['message_text']
                    end
                    
                    ##
                    # @return [String] The URL for more information about the error condition. This value is a page in our [Error Dictionary](https://www.twilio.com/docs/api/errors).
                    def more_info
                        @properties['more_info']
                    end
                    
                    ##
                    # @return [String] The HTTP method used to generate the notification. If the notification was generated during a phone call, this is the HTTP Method used to request the resource on your server. If the notification was generated by your use of our REST API, this is the HTTP method used to call the resource on our servers.
                    def request_method
                        @properties['request_method']
                    end
                    
                    ##
                    # @return [String] The URL of the resource that generated the notification. If the notification was generated during a phone call, this is the URL of the resource on your server that caused the notification. If the notification was generated by your use of our REST API, this is the URL of the resource you called.
                    def request_url
                        @properties['request_url']
                    end
                    
                    ##
                    # @return [String] The HTTP GET or POST variables we sent to your server. However, if the notification was generated by our REST API, this contains the HTTP POST or PUT variables you sent to our API.
                    def request_variables
                        @properties['request_variables']
                    end
                    
                    ##
                    # @return [String] The HTTP body returned by your server.
                    def response_body
                        @properties['response_body']
                    end
                    
                    ##
                    # @return [String] The HTTP headers returned by your server.
                    def response_headers
                        @properties['response_headers']
                    end
                    
                    ##
                    # @return [String] The unique string that that we created to identify the Call Notification resource.
                    def sid
                        @properties['sid']
                    end
                    
                    ##
                    # @return [String] The URI of the resource, relative to `https://api.twilio.com`.
                    def uri
                        @properties['uri']
                    end
                    
                    ##
                    # Fetch the NotificationInstance
                    # @return [NotificationInstance] Fetched NotificationInstance
                    def fetch

                        context.fetch
                    end

                    ##
                    # Provide a user friendly representation
                    def to_s
                        values = @params.map{|k, v| "#{k}: #{v}"}.join(" ")
                        "<Twilio.Api.V2010.NotificationInstance #{values}>"
                    end

                    ##
                    # Provide a detailed, user friendly representation
                    def inspect
                        values = @properties.map{|k, v| "#{k}: #{v}"}.join(" ")
                        "<Twilio.Api.V2010.NotificationInstance #{values}>"
                    end
                end

             end
             end
            end
        end
    end
end

