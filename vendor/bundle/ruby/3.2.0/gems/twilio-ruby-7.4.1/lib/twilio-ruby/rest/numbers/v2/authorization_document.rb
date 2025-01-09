##
#    This code was generated by
#    ___ _ _ _ _ _    _ ____    ____ ____ _    ____ ____ _  _ ____ ____ ____ ___ __   __
#     |  | | | | |    | |  | __ |  | |__| | __ | __ |___ |\ | |___ |__/ |__|  | |  | |__/
#     |  |_|_| | |___ | |__|    |__| |  | |    |__] |___ | \| |___ |  \ |  |  | |__| |  \
#
#    Twilio - Numbers
#    This is the public Twilio REST API.
#
#    NOTE: This class is auto generated by OpenAPI Generator.
#    https://openapi-generator.tech
#    Do not edit the class manually.
#


module Twilio
    module REST
        class Numbers < NumbersBase
            class V2 < Version
                class AuthorizationDocumentList < ListResource
                
                    ##
                    # Initialize the AuthorizationDocumentList
                    # @param [Version] version Version that contains the resource
                    # @return [AuthorizationDocumentList] AuthorizationDocumentList
                    def initialize(version)
                        super(version)
                        # Path Solution
                        @solution = {  }
                        @uri = "/HostedNumber/AuthorizationDocuments"
                        
                    end
                    ##
                    # Create the AuthorizationDocumentInstance
                    # @param [String] address_sid A 34 character string that uniquely identifies the Address resource that is associated with this AuthorizationDocument.
                    # @param [String] email Email that this AuthorizationDocument will be sent to for signing.
                    # @param [String] contact_phone_number The contact phone number of the person authorized to sign the Authorization Document.
                    # @param [Array[String]] hosted_number_order_sids A list of HostedNumberOrder sids that this AuthorizationDocument will authorize for hosting phone number capabilities on Twilio's platform.
                    # @param [String] contact_title The title of the person authorized to sign the Authorization Document for this phone number.
                    # @param [Array[String]] cc_emails Email recipients who will be informed when an Authorization Document has been sent and signed.
                    # @return [AuthorizationDocumentInstance] Created AuthorizationDocumentInstance
                    def create(
                        address_sid: nil, 
                        email: nil, 
                        contact_phone_number: nil, 
                        hosted_number_order_sids: nil, 
                        contact_title: :unset, 
                        cc_emails: :unset
                    )

                        data = Twilio::Values.of({
                            'AddressSid' => address_sid,
                            'Email' => email,
                            'ContactPhoneNumber' => contact_phone_number,
                            'HostedNumberOrderSids' => Twilio.serialize_list(hosted_number_order_sids) { |e| e },
                            'ContactTitle' => contact_title,
                            'CcEmails' => Twilio.serialize_list(cc_emails) { |e| e },
                        })

                        headers = Twilio::Values.of({'Content-Type' => 'application/x-www-form-urlencoded', })
                        
                        
                        
                        
                        
                        payload = @version.create('POST', @uri, data: data, headers: headers)
                        AuthorizationDocumentInstance.new(
                            @version,
                            payload,
                        )
                    end

                
                    ##
                    # Lists AuthorizationDocumentInstance records from the API as a list.
                    # Unlike stream(), this operation is eager and will load `limit` records into
                    # memory before returning.
                    # @param [String] email Email that this AuthorizationDocument will be sent to for signing.
                    # @param [Status] status Status of an instance resource. It can hold one of the values: 1. opened 2. signing, 3. signed LOA, 4. canceled, 5. failed. See the section entitled [Status Values](https://www.twilio.com/docs/phone-numbers/hosted-numbers/hosted-numbers-api/authorization-document-resource#status-values) for more information on each of these statuses.
                    # @param [Integer] limit Upper limit for the number of records to return. stream()
                    #    guarantees to never return more than limit.  Default is no limit
                    # @param [Integer] page_size Number of records to fetch per request, when
                    #    not set will use the default value of 50 records.  If no page_size is defined
                    #    but a limit is defined, stream() will attempt to read the limit with the most
                    #    efficient page size, i.e. min(limit, 1000)
                    # @return [Array] Array of up to limit results
                    def list(email: :unset, status: :unset, limit: nil, page_size: nil)
                        self.stream(
                            email: email,
                            status: status,
                            limit: limit,
                            page_size: page_size
                        ).entries
                    end

                    ##
                    # Streams Instance records from the API as an Enumerable.
                    # This operation lazily loads records as efficiently as possible until the limit
                    # is reached.
                    # @param [String] email Email that this AuthorizationDocument will be sent to for signing.
                    # @param [Status] status Status of an instance resource. It can hold one of the values: 1. opened 2. signing, 3. signed LOA, 4. canceled, 5. failed. See the section entitled [Status Values](https://www.twilio.com/docs/phone-numbers/hosted-numbers/hosted-numbers-api/authorization-document-resource#status-values) for more information on each of these statuses.
                    # @param [Integer] limit Upper limit for the number of records to return. stream()
                    #    guarantees to never return more than limit.  Default is no limit
                    # @param [Integer] page_size Number of records to fetch per request, when
                    #    not set will use the default value of 50 records.  If no page_size is defined
                    #    but a limit is defined, stream() will attempt to read the limit with the most
                    #    efficient page size, i.e. min(limit, 1000)
                    # @return [Enumerable] Enumerable that will yield up to limit results
                    def stream(email: :unset, status: :unset, limit: nil, page_size: nil)
                        limits = @version.read_limits(limit, page_size)

                        page = self.page(
                            email: email,
                            status: status,
                            page_size: limits[:page_size], )

                        @version.stream(page, limit: limits[:limit], page_limit: limits[:page_limit])
                    end

                    ##
                    # When passed a block, yields AuthorizationDocumentInstance records from the API.
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
                    # Retrieve a single page of AuthorizationDocumentInstance records from the API.
                    # Request is executed immediately.
                    # @param [String] email Email that this AuthorizationDocument will be sent to for signing.
                    # @param [Status] status Status of an instance resource. It can hold one of the values: 1. opened 2. signing, 3. signed LOA, 4. canceled, 5. failed. See the section entitled [Status Values](https://www.twilio.com/docs/phone-numbers/hosted-numbers/hosted-numbers-api/authorization-document-resource#status-values) for more information on each of these statuses.
                    # @param [String] page_token PageToken provided by the API
                    # @param [Integer] page_number Page Number, this value is simply for client state
                    # @param [Integer] page_size Number of records to return, defaults to 50
                    # @return [Page] Page of AuthorizationDocumentInstance
                    def page(email: :unset, status: :unset, page_token: :unset, page_number: :unset, page_size: :unset)
                        params = Twilio::Values.of({
                            'Email' => email,
                            'Status' => status,
                            'PageToken' => page_token,
                            'Page' => page_number,
                            'PageSize' => page_size,
                        })
                        headers = Twilio::Values.of({})
                        
                        

                        response = @version.page('GET', @uri, params: params, headers: headers)

                        AuthorizationDocumentPage.new(@version, response, @solution)
                    end

                    ##
                    # Retrieve a single page of AuthorizationDocumentInstance records from the API.
                    # Request is executed immediately.
                    # @param [String] target_url API-generated URL for the requested results page
                    # @return [Page] Page of AuthorizationDocumentInstance
                    def get_page(target_url)
                        response = @version.domain.request(
                            'GET',
                            target_url
                        )
                    AuthorizationDocumentPage.new(@version, response, @solution)
                    end
                    


                    # Provide a user friendly representation
                    def to_s
                        '#<Twilio.Numbers.V2.AuthorizationDocumentList>'
                    end
                end


                class AuthorizationDocumentContext < InstanceContext
                    ##
                    # Initialize the AuthorizationDocumentContext
                    # @param [Version] version Version that contains the resource
                    # @param [String] sid A 34 character string that uniquely identifies this AuthorizationDocument.
                    # @return [AuthorizationDocumentContext] AuthorizationDocumentContext
                    def initialize(version, sid)
                        super(version)

                        # Path Solution
                        @solution = { sid: sid,  }
                        @uri = "/HostedNumber/AuthorizationDocuments/#{@solution[:sid]}"

                        # Dependents
                        @dependent_hosted_number_orders = nil
                    end
                    ##
                    # Delete the AuthorizationDocumentInstance
                    # @return [Boolean] True if delete succeeds, false otherwise
                    def delete

                        headers = Twilio::Values.of({'Content-Type' => 'application/x-www-form-urlencoded', })
                        
                        
                        
                        @version.delete('DELETE', @uri, headers: headers)
                    end

                    ##
                    # Fetch the AuthorizationDocumentInstance
                    # @return [AuthorizationDocumentInstance] Fetched AuthorizationDocumentInstance
                    def fetch

                        headers = Twilio::Values.of({'Content-Type' => 'application/x-www-form-urlencoded', })
                        
                        
                        
                        
                        
                        payload = @version.fetch('GET', @uri, headers: headers)
                        AuthorizationDocumentInstance.new(
                            @version,
                            payload,
                            sid: @solution[:sid],
                        )
                    end

                    ##
                    # Access the dependent_hosted_number_orders
                    # @return [DependentHostedNumberOrderList]
                    # @return [DependentHostedNumberOrderContext]
                    def dependent_hosted_number_orders
                      unless @dependent_hosted_number_orders
                        @dependent_hosted_number_orders = DependentHostedNumberOrderList.new(
                                @version, signing_document_sid: @solution[:sid], )
                      end
                      @dependent_hosted_number_orders
                    end

                    ##
                    # Provide a user friendly representation
                    def to_s
                        context = @solution.map{|k, v| "#{k}: #{v}"}.join(',')
                        "#<Twilio.Numbers.V2.AuthorizationDocumentContext #{context}>"
                    end

                    ##
                    # Provide a detailed, user friendly representation
                    def inspect
                        context = @solution.map{|k, v| "#{k}: #{v}"}.join(',')
                        "#<Twilio.Numbers.V2.AuthorizationDocumentContext #{context}>"
                    end
                end

                class AuthorizationDocumentPage < Page
                    ##
                    # Initialize the AuthorizationDocumentPage
                    # @param [Version] version Version that contains the resource
                    # @param [Response] response Response from the API
                    # @param [Hash] solution Path solution for the resource
                    # @return [AuthorizationDocumentPage] AuthorizationDocumentPage
                    def initialize(version, response, solution)
                        super(version, response)

                        # Path Solution
                        @solution = solution
                    end

                    ##
                    # Build an instance of AuthorizationDocumentInstance
                    # @param [Hash] payload Payload response from the API
                    # @return [AuthorizationDocumentInstance] AuthorizationDocumentInstance
                    def get_instance(payload)
                        AuthorizationDocumentInstance.new(@version, payload)
                    end

                    ##
                    # Provide a user friendly representation
                    def to_s
                        '<Twilio.Numbers.V2.AuthorizationDocumentPage>'
                    end
                end
                class AuthorizationDocumentInstance < InstanceResource
                    ##
                    # Initialize the AuthorizationDocumentInstance
                    # @param [Version] version Version that contains the resource
                    # @param [Hash] payload payload that contains response from Twilio
                    # @param [String] account_sid The SID of the
                    #   {Account}[https://www.twilio.com/docs/iam/api/account] that created this AuthorizationDocument
                    #   resource.
                    # @param [String] sid The SID of the Call resource to fetch.
                    # @return [AuthorizationDocumentInstance] AuthorizationDocumentInstance
                    def initialize(version, payload , sid: nil)
                        super(version)
                        
                        # Marshaled Properties
                        @properties = { 
                            'sid' => payload['sid'],
                            'address_sid' => payload['address_sid'],
                            'status' => payload['status'],
                            'email' => payload['email'],
                            'cc_emails' => payload['cc_emails'],
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
                    # @return [AuthorizationDocumentContext] CallContext for this CallInstance
                    def context
                        unless @instance_context
                            @instance_context = AuthorizationDocumentContext.new(@version , @params['sid'])
                        end
                        @instance_context
                    end
                    
                    ##
                    # @return [String] A 34 character string that uniquely identifies this AuthorizationDocument.
                    def sid
                        @properties['sid']
                    end
                    
                    ##
                    # @return [String] A 34 character string that uniquely identifies the Address resource that is associated with this AuthorizationDocument.
                    def address_sid
                        @properties['address_sid']
                    end
                    
                    ##
                    # @return [Status] 
                    def status
                        @properties['status']
                    end
                    
                    ##
                    # @return [String] Email that this AuthorizationDocument will be sent to for signing.
                    def email
                        @properties['email']
                    end
                    
                    ##
                    # @return [Array<String>] Email recipients who will be informed when an Authorization Document has been sent and signed.
                    def cc_emails
                        @properties['cc_emails']
                    end
                    
                    ##
                    # @return [Time] The date this resource was created, given as [GMT RFC 2822](http://www.ietf.org/rfc/rfc2822.txt) format.
                    def date_created
                        @properties['date_created']
                    end
                    
                    ##
                    # @return [Time] The date that this resource was updated, given as [GMT RFC 2822](http://www.ietf.org/rfc/rfc2822.txt) format.
                    def date_updated
                        @properties['date_updated']
                    end
                    
                    ##
                    # @return [String] 
                    def url
                        @properties['url']
                    end
                    
                    ##
                    # @return [Hash] 
                    def links
                        @properties['links']
                    end
                    
                    ##
                    # Delete the AuthorizationDocumentInstance
                    # @return [Boolean] True if delete succeeds, false otherwise
                    def delete

                        context.delete
                    end

                    ##
                    # Fetch the AuthorizationDocumentInstance
                    # @return [AuthorizationDocumentInstance] Fetched AuthorizationDocumentInstance
                    def fetch

                        context.fetch
                    end

                    ##
                    # Access the dependent_hosted_number_orders
                    # @return [dependent_hosted_number_orders] dependent_hosted_number_orders
                    def dependent_hosted_number_orders
                        context.dependent_hosted_number_orders
                    end

                    ##
                    # Provide a user friendly representation
                    def to_s
                        values = @params.map{|k, v| "#{k}: #{v}"}.join(" ")
                        "<Twilio.Numbers.V2.AuthorizationDocumentInstance #{values}>"
                    end

                    ##
                    # Provide a detailed, user friendly representation
                    def inspect
                        values = @properties.map{|k, v| "#{k}: #{v}"}.join(" ")
                        "<Twilio.Numbers.V2.AuthorizationDocumentInstance #{values}>"
                    end
                end

            end
        end
    end
end