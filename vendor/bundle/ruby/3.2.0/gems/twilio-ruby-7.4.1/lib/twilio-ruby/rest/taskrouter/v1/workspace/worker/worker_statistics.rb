##
#    This code was generated by
#    ___ _ _ _ _ _    _ ____    ____ ____ _    ____ ____ _  _ ____ ____ ____ ___ __   __
#     |  | | | | |    | |  | __ |  | |__| | __ | __ |___ |\ | |___ |__/ |__|  | |  | |__/
#     |  |_|_| | |___ | |__|    |__| |  | |    |__] |___ | \| |___ |  \ |  |  | |__| |  \
#
#    Twilio - Taskrouter
#    This is the public Twilio REST API.
#
#    NOTE: This class is auto generated by OpenAPI Generator.
#    https://openapi-generator.tech
#    Do not edit the class manually.
#


module Twilio
    module REST
        class Taskrouter < TaskrouterBase
            class V1 < Version
                class WorkspaceContext < InstanceContext
                class WorkerContext < InstanceContext

                     class WorkerStatisticsList < ListResource
                
                    ##
                    # Initialize the WorkerStatisticsList
                    # @param [Version] version Version that contains the resource
                    # @return [WorkerStatisticsList] WorkerStatisticsList
                    def initialize(version, workspace_sid: nil, worker_sid: nil)
                        super(version)
                        # Path Solution
                        @solution = { workspace_sid: workspace_sid, worker_sid: worker_sid }
                        
                        
                    end
                


                    # Provide a user friendly representation
                    def to_s
                        '#<Twilio.Taskrouter.V1.WorkerStatisticsList>'
                    end
                end


                class WorkerStatisticsContext < InstanceContext
                    ##
                    # Initialize the WorkerStatisticsContext
                    # @param [Version] version Version that contains the resource
                    # @param [String] workspace_sid The SID of the Workspace with the WorkerChannel to fetch.
                    # @param [String] worker_sid The SID of the Worker with the WorkerChannel to fetch.
                    # @return [WorkerStatisticsContext] WorkerStatisticsContext
                    def initialize(version, workspace_sid, worker_sid)
                        super(version)

                        # Path Solution
                        @solution = { workspace_sid: workspace_sid, worker_sid: worker_sid,  }
                        @uri = "/Workspaces/#{@solution[:workspace_sid]}/Workers/#{@solution[:worker_sid]}/Statistics"

                        
                    end
                    ##
                    # Fetch the WorkerStatisticsInstance
                    # @param [String] minutes Only calculate statistics since this many minutes in the past. The default 15 minutes. This is helpful for displaying statistics for the last 15 minutes, 240 minutes (4 hours), and 480 minutes (8 hours) to see trends.
                    # @param [Time] start_date Only calculate statistics from this date and time and later, specified in [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601) format.
                    # @param [Time] end_date Only include usage that occurred on or before this date, specified in GMT as an [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601) date-time.
                    # @param [String] task_channel Only calculate statistics on this TaskChannel. Can be the TaskChannel's SID or its `unique_name`, such as `voice`, `sms`, or `default`.
                    # @return [WorkerStatisticsInstance] Fetched WorkerStatisticsInstance
                    def fetch(
                        minutes: :unset, 
                        start_date: :unset, 
                        end_date: :unset, 
                        task_channel: :unset
                    )

                        params = Twilio::Values.of({
                            'Minutes' => minutes,
                            'StartDate' => Twilio.serialize_iso8601_datetime(start_date),
                            'EndDate' => Twilio.serialize_iso8601_datetime(end_date),
                            'TaskChannel' => task_channel,
                        })
                        headers = Twilio::Values.of({'Content-Type' => 'application/x-www-form-urlencoded', })
                        
                        
                        
                        
                        
                        payload = @version.fetch('GET', @uri, params: params, headers: headers)
                        WorkerStatisticsInstance.new(
                            @version,
                            payload,
                            workspace_sid: @solution[:workspace_sid],
                            worker_sid: @solution[:worker_sid],
                        )
                    end


                    ##
                    # Provide a user friendly representation
                    def to_s
                        context = @solution.map{|k, v| "#{k}: #{v}"}.join(',')
                        "#<Twilio.Taskrouter.V1.WorkerStatisticsContext #{context}>"
                    end

                    ##
                    # Provide a detailed, user friendly representation
                    def inspect
                        context = @solution.map{|k, v| "#{k}: #{v}"}.join(',')
                        "#<Twilio.Taskrouter.V1.WorkerStatisticsContext #{context}>"
                    end
                end

                class WorkerStatisticsPage < Page
                    ##
                    # Initialize the WorkerStatisticsPage
                    # @param [Version] version Version that contains the resource
                    # @param [Response] response Response from the API
                    # @param [Hash] solution Path solution for the resource
                    # @return [WorkerStatisticsPage] WorkerStatisticsPage
                    def initialize(version, response, solution)
                        super(version, response)

                        # Path Solution
                        @solution = solution
                    end

                    ##
                    # Build an instance of WorkerStatisticsInstance
                    # @param [Hash] payload Payload response from the API
                    # @return [WorkerStatisticsInstance] WorkerStatisticsInstance
                    def get_instance(payload)
                        WorkerStatisticsInstance.new(@version, payload, workspace_sid: @solution[:workspace_sid], worker_sid: @solution[:worker_sid])
                    end

                    ##
                    # Provide a user friendly representation
                    def to_s
                        '<Twilio.Taskrouter.V1.WorkerStatisticsPage>'
                    end
                end
                class WorkerStatisticsInstance < InstanceResource
                    ##
                    # Initialize the WorkerStatisticsInstance
                    # @param [Version] version Version that contains the resource
                    # @param [Hash] payload payload that contains response from Twilio
                    # @param [String] account_sid The SID of the
                    #   {Account}[https://www.twilio.com/docs/iam/api/account] that created this WorkerStatistics
                    #   resource.
                    # @param [String] sid The SID of the Call resource to fetch.
                    # @return [WorkerStatisticsInstance] WorkerStatisticsInstance
                    def initialize(version, payload , workspace_sid: nil, worker_sid: nil)
                        super(version)
                        
                        # Marshaled Properties
                        @properties = { 
                            'account_sid' => payload['account_sid'],
                            'cumulative' => payload['cumulative'],
                            'worker_sid' => payload['worker_sid'],
                            'workspace_sid' => payload['workspace_sid'],
                            'url' => payload['url'],
                        }

                        # Context
                        @instance_context = nil
                        @params = { 'workspace_sid' => workspace_sid  || @properties['workspace_sid']  ,'worker_sid' => worker_sid  || @properties['worker_sid']  , }
                    end

                    ##
                    # Generate an instance context for the instance, the context is capable of
                    # performing various actions.  All instance actions are proxied to the context
                    # @return [WorkerStatisticsContext] CallContext for this CallInstance
                    def context
                        unless @instance_context
                            @instance_context = WorkerStatisticsContext.new(@version , @params['workspace_sid'], @params['worker_sid'])
                        end
                        @instance_context
                    end
                    
                    ##
                    # @return [String] The SID of the [Account](https://www.twilio.com/docs/iam/api/account) that created the Worker resource.
                    def account_sid
                        @properties['account_sid']
                    end
                    
                    ##
                    # @return [Hash] An object that contains the cumulative statistics for the Worker.
                    def cumulative
                        @properties['cumulative']
                    end
                    
                    ##
                    # @return [String] The SID of the Worker that contains the WorkerChannel.
                    def worker_sid
                        @properties['worker_sid']
                    end
                    
                    ##
                    # @return [String] The SID of the Workspace that contains the WorkerChannel.
                    def workspace_sid
                        @properties['workspace_sid']
                    end
                    
                    ##
                    # @return [String] The absolute URL of the WorkerChannel statistics resource.
                    def url
                        @properties['url']
                    end
                    
                    ##
                    # Fetch the WorkerStatisticsInstance
                    # @param [String] minutes Only calculate statistics since this many minutes in the past. The default 15 minutes. This is helpful for displaying statistics for the last 15 minutes, 240 minutes (4 hours), and 480 minutes (8 hours) to see trends.
                    # @param [Time] start_date Only calculate statistics from this date and time and later, specified in [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601) format.
                    # @param [Time] end_date Only include usage that occurred on or before this date, specified in GMT as an [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601) date-time.
                    # @param [String] task_channel Only calculate statistics on this TaskChannel. Can be the TaskChannel's SID or its `unique_name`, such as `voice`, `sms`, or `default`.
                    # @return [WorkerStatisticsInstance] Fetched WorkerStatisticsInstance
                    def fetch(
                        minutes: :unset, 
                        start_date: :unset, 
                        end_date: :unset, 
                        task_channel: :unset
                    )

                        context.fetch(
                            minutes: minutes, 
                            start_date: start_date, 
                            end_date: end_date, 
                            task_channel: task_channel, 
                        )
                    end

                    ##
                    # Provide a user friendly representation
                    def to_s
                        values = @params.map{|k, v| "#{k}: #{v}"}.join(" ")
                        "<Twilio.Taskrouter.V1.WorkerStatisticsInstance #{values}>"
                    end

                    ##
                    # Provide a detailed, user friendly representation
                    def inspect
                        values = @properties.map{|k, v| "#{k}: #{v}"}.join(" ")
                        "<Twilio.Taskrouter.V1.WorkerStatisticsInstance #{values}>"
                    end
                end

             end
             end
            end
        end
    end
end


