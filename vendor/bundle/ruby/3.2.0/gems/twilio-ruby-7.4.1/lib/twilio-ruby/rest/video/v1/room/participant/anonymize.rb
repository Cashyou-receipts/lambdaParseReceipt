##
#    This code was generated by
#    ___ _ _ _ _ _    _ ____    ____ ____ _    ____ ____ _  _ ____ ____ ____ ___ __   __
#     |  | | | | |    | |  | __ |  | |__| | __ | __ |___ |\ | |___ |__/ |__|  | |  | |__/
#     |  |_|_| | |___ | |__|    |__| |  | |    |__] |___ | \| |___ |  \ |  |  | |__| |  \
#
#    Twilio - Video
#    This is the public Twilio REST API.
#
#    NOTE: This class is auto generated by OpenAPI Generator.
#    https://openapi-generator.tech
#    Do not edit the class manually.
#


module Twilio
    module REST
        class Video < VideoBase
            class V1 < Version
                class RoomContext < InstanceContext
                class ParticipantContext < InstanceContext

                     class AnonymizeList < ListResource
                
                    ##
                    # Initialize the AnonymizeList
                    # @param [Version] version Version that contains the resource
                    # @return [AnonymizeList] AnonymizeList
                    def initialize(version, room_sid: nil, sid: nil)
                        super(version)
                        # Path Solution
                        @solution = { room_sid: room_sid, sid: sid }
                        
                        
                    end
                


                    # Provide a user friendly representation
                    def to_s
                        '#<Twilio.Video.V1.AnonymizeList>'
                    end
                end


                class AnonymizeContext < InstanceContext
                    ##
                    # Initialize the AnonymizeContext
                    # @param [Version] version Version that contains the resource
                    # @param [String] room_sid The SID of the room with the participant to update.
                    # @param [String] sid The SID of the RoomParticipant resource to update.
                    # @return [AnonymizeContext] AnonymizeContext
                    def initialize(version, room_sid, sid)
                        super(version)

                        # Path Solution
                        @solution = { room_sid: room_sid, sid: sid,  }
                        @uri = "/Rooms/#{@solution[:room_sid]}/Participants/#{@solution[:sid]}/Anonymize"

                        
                    end
                    ##
                    # Update the AnonymizeInstance
                    # @return [AnonymizeInstance] Updated AnonymizeInstance
                    def update

                        headers = Twilio::Values.of({'Content-Type' => 'application/x-www-form-urlencoded', })
                        
                        
                        
                        
                        
                        payload = @version.update('POST', @uri, headers: headers)
                        AnonymizeInstance.new(
                            @version,
                            payload,
                            room_sid: @solution[:room_sid],
                            sid: @solution[:sid],
                        )
                    end


                    ##
                    # Provide a user friendly representation
                    def to_s
                        context = @solution.map{|k, v| "#{k}: #{v}"}.join(',')
                        "#<Twilio.Video.V1.AnonymizeContext #{context}>"
                    end

                    ##
                    # Provide a detailed, user friendly representation
                    def inspect
                        context = @solution.map{|k, v| "#{k}: #{v}"}.join(',')
                        "#<Twilio.Video.V1.AnonymizeContext #{context}>"
                    end
                end

                class AnonymizePage < Page
                    ##
                    # Initialize the AnonymizePage
                    # @param [Version] version Version that contains the resource
                    # @param [Response] response Response from the API
                    # @param [Hash] solution Path solution for the resource
                    # @return [AnonymizePage] AnonymizePage
                    def initialize(version, response, solution)
                        super(version, response)

                        # Path Solution
                        @solution = solution
                    end

                    ##
                    # Build an instance of AnonymizeInstance
                    # @param [Hash] payload Payload response from the API
                    # @return [AnonymizeInstance] AnonymizeInstance
                    def get_instance(payload)
                        AnonymizeInstance.new(@version, payload, room_sid: @solution[:room_sid], sid: @solution[:sid])
                    end

                    ##
                    # Provide a user friendly representation
                    def to_s
                        '<Twilio.Video.V1.AnonymizePage>'
                    end
                end
                class AnonymizeInstance < InstanceResource
                    ##
                    # Initialize the AnonymizeInstance
                    # @param [Version] version Version that contains the resource
                    # @param [Hash] payload payload that contains response from Twilio
                    # @param [String] account_sid The SID of the
                    #   {Account}[https://www.twilio.com/docs/iam/api/account] that created this Anonymize
                    #   resource.
                    # @param [String] sid The SID of the Call resource to fetch.
                    # @return [AnonymizeInstance] AnonymizeInstance
                    def initialize(version, payload , room_sid: nil, sid: nil)
                        super(version)
                        
                        # Marshaled Properties
                        @properties = { 
                            'sid' => payload['sid'],
                            'room_sid' => payload['room_sid'],
                            'account_sid' => payload['account_sid'],
                            'status' => payload['status'],
                            'identity' => payload['identity'],
                            'date_created' => Twilio.deserialize_iso8601_datetime(payload['date_created']),
                            'date_updated' => Twilio.deserialize_iso8601_datetime(payload['date_updated']),
                            'start_time' => Twilio.deserialize_iso8601_datetime(payload['start_time']),
                            'end_time' => Twilio.deserialize_iso8601_datetime(payload['end_time']),
                            'duration' => payload['duration'] == nil ? payload['duration'] : payload['duration'].to_i,
                            'url' => payload['url'],
                        }

                        # Context
                        @instance_context = nil
                        @params = { 'room_sid' => room_sid  || @properties['room_sid']  ,'sid' => sid  || @properties['sid']  , }
                    end

                    ##
                    # Generate an instance context for the instance, the context is capable of
                    # performing various actions.  All instance actions are proxied to the context
                    # @return [AnonymizeContext] CallContext for this CallInstance
                    def context
                        unless @instance_context
                            @instance_context = AnonymizeContext.new(@version , @params['room_sid'], @params['sid'])
                        end
                        @instance_context
                    end
                    
                    ##
                    # @return [String] The unique string that we created to identify the RoomParticipant resource.
                    def sid
                        @properties['sid']
                    end
                    
                    ##
                    # @return [String] The SID of the participant's room.
                    def room_sid
                        @properties['room_sid']
                    end
                    
                    ##
                    # @return [String] The SID of the [Account](https://www.twilio.com/docs/iam/api/account) that created the RoomParticipant resource.
                    def account_sid
                        @properties['account_sid']
                    end
                    
                    ##
                    # @return [Status] 
                    def status
                        @properties['status']
                    end
                    
                    ##
                    # @return [String] The SID of the participant.
                    def identity
                        @properties['identity']
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
                    # @return [Time] The time of participant connected to the room in [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601#UTC) format.
                    def start_time
                        @properties['start_time']
                    end
                    
                    ##
                    # @return [Time] The time when the participant disconnected from the room in [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601#UTC) format.
                    def end_time
                        @properties['end_time']
                    end
                    
                    ##
                    # @return [String] The duration in seconds that the participant was `connected`. Populated only after the participant is `disconnected`.
                    def duration
                        @properties['duration']
                    end
                    
                    ##
                    # @return [String] The absolute URL of the resource.
                    def url
                        @properties['url']
                    end
                    
                    ##
                    # Update the AnonymizeInstance
                    # @return [AnonymizeInstance] Updated AnonymizeInstance
                    def update

                        context.update
                    end

                    ##
                    # Provide a user friendly representation
                    def to_s
                        values = @params.map{|k, v| "#{k}: #{v}"}.join(" ")
                        "<Twilio.Video.V1.AnonymizeInstance #{values}>"
                    end

                    ##
                    # Provide a detailed, user friendly representation
                    def inspect
                        values = @properties.map{|k, v| "#{k}: #{v}"}.join(" ")
                        "<Twilio.Video.V1.AnonymizeInstance #{values}>"
                    end
                end

             end
             end
            end
        end
    end
end

