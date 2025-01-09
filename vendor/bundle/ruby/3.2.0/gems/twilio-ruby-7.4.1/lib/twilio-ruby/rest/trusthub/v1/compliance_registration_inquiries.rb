##
#    This code was generated by
#    ___ _ _ _ _ _    _ ____    ____ ____ _    ____ ____ _  _ ____ ____ ____ ___ __   __
#     |  | | | | |    | |  | __ |  | |__| | __ | __ |___ |\ | |___ |__/ |__|  | |  | |__/
#     |  |_|_| | |___ | |__|    |__| |  | |    |__] |___ | \| |___ |  \ |  |  | |__| |  \
#
#    Twilio - Trusthub
#    This is the public Twilio REST API.
#
#    NOTE: This class is auto generated by OpenAPI Generator.
#    https://openapi-generator.tech
#    Do not edit the class manually.
#


module Twilio
    module REST
        class Trusthub < TrusthubBase
            class V1 < Version
                class ComplianceRegistrationInquiriesList < ListResource
                
                    ##
                    # Initialize the ComplianceRegistrationInquiriesList
                    # @param [Version] version Version that contains the resource
                    # @return [ComplianceRegistrationInquiriesList] ComplianceRegistrationInquiriesList
                    def initialize(version)
                        super(version)
                        # Path Solution
                        @solution = {  }
                        @uri = "/ComplianceInquiries/Registration/RegulatoryCompliance/GB/Initialize"
                        
                    end
                    ##
                    # Create the ComplianceRegistrationInquiriesInstance
                    # @param [EndUserType] end_user_type 
                    # @param [PhoneNumberType] phone_number_type 
                    # @param [BusinessIdentityType] business_identity_type 
                    # @param [BusinessRegistrationAuthority] business_registration_authority 
                    # @param [String] business_legal_name he name of the business or organization using the Tollfree number.
                    # @param [String] notification_email he email address to receive the notification about the verification result.
                    # @param [Boolean] accepted_notification_receipt The email address to receive the notification about the verification result.
                    # @param [String] business_registration_number Business registration number of the business
                    # @param [String] business_website_url The URL of the business website
                    # @param [String] friendly_name Friendly name for your business information
                    # @param [String] authorized_representative1_first_name First name of the authorized representative
                    # @param [String] authorized_representative1_last_name Last name of the authorized representative
                    # @param [String] authorized_representative1_phone Phone number of the authorized representative
                    # @param [String] authorized_representative1_email Email address of the authorized representative
                    # @param [String] authorized_representative1_date_of_birth Birthdate of the authorized representative
                    # @param [String] address_street Street address of the business
                    # @param [String] address_street_secondary Street address of the business
                    # @param [String] address_city City of the business
                    # @param [String] address_subdivision State or province of the business
                    # @param [String] address_postal_code Postal code of the business
                    # @param [String] address_country_code Country code of the business
                    # @param [String] emergency_address_street Street address of the business
                    # @param [String] emergency_address_street_secondary Street address of the business
                    # @param [String] emergency_address_city City of the business
                    # @param [String] emergency_address_subdivision State or province of the business
                    # @param [String] emergency_address_postal_code Postal code of the business
                    # @param [String] emergency_address_country_code Country code of the business
                    # @param [Boolean] use_address_as_emergency_address Use the business address as the emergency address
                    # @param [String] file_name The name of the verification document to upload
                    # @param [String] file The verification document to upload
                    # @param [String] first_name The first name of the Individual User.
                    # @param [String] last_name The last name of the Individual User.
                    # @param [String] date_of_birth The date of birth of the Individual User.
                    # @param [String] individual_email The email address of the Individual User.
                    # @param [String] individual_phone The phone number of the Individual User.
                    # @param [Boolean] is_isv_embed Indicates if the inquiry is being started from an ISV embedded component.
                    # @param [String] isv_registering_for_self_or_tenant Indicates if the isv registering for self or tenant.
                    # @param [String] status_callback_url The url we call to inform you of bundle changes.
                    # @param [String] theme_set_id Theme id for styling the inquiry form.
                    # @return [ComplianceRegistrationInquiriesInstance] Created ComplianceRegistrationInquiriesInstance
                    def create(
                        end_user_type: nil, 
                        phone_number_type: nil, 
                        business_identity_type: :unset, 
                        business_registration_authority: :unset, 
                        business_legal_name: :unset, 
                        notification_email: :unset, 
                        accepted_notification_receipt: :unset, 
                        business_registration_number: :unset, 
                        business_website_url: :unset, 
                        friendly_name: :unset, 
                        authorized_representative1_first_name: :unset, 
                        authorized_representative1_last_name: :unset, 
                        authorized_representative1_phone: :unset, 
                        authorized_representative1_email: :unset, 
                        authorized_representative1_date_of_birth: :unset, 
                        address_street: :unset, 
                        address_street_secondary: :unset, 
                        address_city: :unset, 
                        address_subdivision: :unset, 
                        address_postal_code: :unset, 
                        address_country_code: :unset, 
                        emergency_address_street: :unset, 
                        emergency_address_street_secondary: :unset, 
                        emergency_address_city: :unset, 
                        emergency_address_subdivision: :unset, 
                        emergency_address_postal_code: :unset, 
                        emergency_address_country_code: :unset, 
                        use_address_as_emergency_address: :unset, 
                        file_name: :unset, 
                        file: :unset, 
                        first_name: :unset, 
                        last_name: :unset, 
                        date_of_birth: :unset, 
                        individual_email: :unset, 
                        individual_phone: :unset, 
                        is_isv_embed: :unset, 
                        isv_registering_for_self_or_tenant: :unset, 
                        status_callback_url: :unset, 
                        theme_set_id: :unset
                    )

                        data = Twilio::Values.of({
                            'EndUserType' => end_user_type,
                            'PhoneNumberType' => phone_number_type,
                            'BusinessIdentityType' => business_identity_type,
                            'BusinessRegistrationAuthority' => business_registration_authority,
                            'BusinessLegalName' => business_legal_name,
                            'NotificationEmail' => notification_email,
                            'AcceptedNotificationReceipt' => accepted_notification_receipt,
                            'BusinessRegistrationNumber' => business_registration_number,
                            'BusinessWebsiteUrl' => business_website_url,
                            'FriendlyName' => friendly_name,
                            'AuthorizedRepresentative1FirstName' => authorized_representative1_first_name,
                            'AuthorizedRepresentative1LastName' => authorized_representative1_last_name,
                            'AuthorizedRepresentative1Phone' => authorized_representative1_phone,
                            'AuthorizedRepresentative1Email' => authorized_representative1_email,
                            'AuthorizedRepresentative1DateOfBirth' => authorized_representative1_date_of_birth,
                            'AddressStreet' => address_street,
                            'AddressStreetSecondary' => address_street_secondary,
                            'AddressCity' => address_city,
                            'AddressSubdivision' => address_subdivision,
                            'AddressPostalCode' => address_postal_code,
                            'AddressCountryCode' => address_country_code,
                            'EmergencyAddressStreet' => emergency_address_street,
                            'EmergencyAddressStreetSecondary' => emergency_address_street_secondary,
                            'EmergencyAddressCity' => emergency_address_city,
                            'EmergencyAddressSubdivision' => emergency_address_subdivision,
                            'EmergencyAddressPostalCode' => emergency_address_postal_code,
                            'EmergencyAddressCountryCode' => emergency_address_country_code,
                            'UseAddressAsEmergencyAddress' => use_address_as_emergency_address,
                            'FileName' => file_name,
                            'File' => file,
                            'FirstName' => first_name,
                            'LastName' => last_name,
                            'DateOfBirth' => date_of_birth,
                            'IndividualEmail' => individual_email,
                            'IndividualPhone' => individual_phone,
                            'IsIsvEmbed' => is_isv_embed,
                            'IsvRegisteringForSelfOrTenant' => isv_registering_for_self_or_tenant,
                            'StatusCallbackUrl' => status_callback_url,
                            'ThemeSetId' => theme_set_id,
                        })

                        headers = Twilio::Values.of({'Content-Type' => 'application/x-www-form-urlencoded', })
                        
                        
                        
                        
                        
                        payload = @version.create('POST', @uri, data: data, headers: headers)
                        ComplianceRegistrationInquiriesInstance.new(
                            @version,
                            payload,
                        )
                    end

                


                    # Provide a user friendly representation
                    def to_s
                        '#<Twilio.Trusthub.V1.ComplianceRegistrationInquiriesList>'
                    end
                end


                class ComplianceRegistrationInquiriesContext < InstanceContext
                    ##
                    # Initialize the ComplianceRegistrationInquiriesContext
                    # @param [Version] version Version that contains the resource
                    # @param [String] registration_id The unique RegistrationId matching the Regulatory Compliance Inquiry that should be resumed or resubmitted. This value will have been returned by the initial Regulatory Compliance Inquiry creation call.
                    # @return [ComplianceRegistrationInquiriesContext] ComplianceRegistrationInquiriesContext
                    def initialize(version, registration_id)
                        super(version)

                        # Path Solution
                        @solution = { registration_id: registration_id,  }
                        @uri = "/ComplianceInquiries/Registration/#{@solution[:registration_id]}/RegulatoryCompliance/GB/Initialize"

                        
                    end
                    ##
                    # Update the ComplianceRegistrationInquiriesInstance
                    # @param [Boolean] is_isv_embed Indicates if the inquiry is being started from an ISV embedded component.
                    # @param [String] theme_set_id Theme id for styling the inquiry form.
                    # @return [ComplianceRegistrationInquiriesInstance] Updated ComplianceRegistrationInquiriesInstance
                    def update(
                        is_isv_embed: :unset, 
                        theme_set_id: :unset
                    )

                        data = Twilio::Values.of({
                            'IsIsvEmbed' => is_isv_embed,
                            'ThemeSetId' => theme_set_id,
                        })

                        headers = Twilio::Values.of({'Content-Type' => 'application/x-www-form-urlencoded', })
                        
                        
                        
                        
                        
                        payload = @version.update('POST', @uri, data: data, headers: headers)
                        ComplianceRegistrationInquiriesInstance.new(
                            @version,
                            payload,
                            registration_id: @solution[:registration_id],
                        )
                    end


                    ##
                    # Provide a user friendly representation
                    def to_s
                        context = @solution.map{|k, v| "#{k}: #{v}"}.join(',')
                        "#<Twilio.Trusthub.V1.ComplianceRegistrationInquiriesContext #{context}>"
                    end

                    ##
                    # Provide a detailed, user friendly representation
                    def inspect
                        context = @solution.map{|k, v| "#{k}: #{v}"}.join(',')
                        "#<Twilio.Trusthub.V1.ComplianceRegistrationInquiriesContext #{context}>"
                    end
                end

                class ComplianceRegistrationInquiriesPage < Page
                    ##
                    # Initialize the ComplianceRegistrationInquiriesPage
                    # @param [Version] version Version that contains the resource
                    # @param [Response] response Response from the API
                    # @param [Hash] solution Path solution for the resource
                    # @return [ComplianceRegistrationInquiriesPage] ComplianceRegistrationInquiriesPage
                    def initialize(version, response, solution)
                        super(version, response)

                        # Path Solution
                        @solution = solution
                    end

                    ##
                    # Build an instance of ComplianceRegistrationInquiriesInstance
                    # @param [Hash] payload Payload response from the API
                    # @return [ComplianceRegistrationInquiriesInstance] ComplianceRegistrationInquiriesInstance
                    def get_instance(payload)
                        ComplianceRegistrationInquiriesInstance.new(@version, payload)
                    end

                    ##
                    # Provide a user friendly representation
                    def to_s
                        '<Twilio.Trusthub.V1.ComplianceRegistrationInquiriesPage>'
                    end
                end
                class ComplianceRegistrationInquiriesInstance < InstanceResource
                    ##
                    # Initialize the ComplianceRegistrationInquiriesInstance
                    # @param [Version] version Version that contains the resource
                    # @param [Hash] payload payload that contains response from Twilio
                    # @param [String] account_sid The SID of the
                    #   {Account}[https://www.twilio.com/docs/iam/api/account] that created this ComplianceRegistrationInquiries
                    #   resource.
                    # @param [String] sid The SID of the Call resource to fetch.
                    # @return [ComplianceRegistrationInquiriesInstance] ComplianceRegistrationInquiriesInstance
                    def initialize(version, payload , registration_id: nil)
                        super(version)
                        
                        # Marshaled Properties
                        @properties = { 
                            'inquiry_id' => payload['inquiry_id'],
                            'inquiry_session_token' => payload['inquiry_session_token'],
                            'registration_id' => payload['registration_id'],
                            'url' => payload['url'],
                        }

                        # Context
                        @instance_context = nil
                        @params = { 'registration_id' => registration_id  || @properties['registration_id']  , }
                    end

                    ##
                    # Generate an instance context for the instance, the context is capable of
                    # performing various actions.  All instance actions are proxied to the context
                    # @return [ComplianceRegistrationInquiriesContext] CallContext for this CallInstance
                    def context
                        unless @instance_context
                            @instance_context = ComplianceRegistrationInquiriesContext.new(@version , @params['registration_id'])
                        end
                        @instance_context
                    end
                    
                    ##
                    # @return [String] The unique ID used to start an embedded compliance registration session.
                    def inquiry_id
                        @properties['inquiry_id']
                    end
                    
                    ##
                    # @return [String] The session token used to start an embedded compliance registration session.
                    def inquiry_session_token
                        @properties['inquiry_session_token']
                    end
                    
                    ##
                    # @return [String] The RegistrationId matching the Registration Profile that should be resumed or resubmitted for editing.
                    def registration_id
                        @properties['registration_id']
                    end
                    
                    ##
                    # @return [String] The URL of this resource.
                    def url
                        @properties['url']
                    end
                    
                    ##
                    # Update the ComplianceRegistrationInquiriesInstance
                    # @param [Boolean] is_isv_embed Indicates if the inquiry is being started from an ISV embedded component.
                    # @param [String] theme_set_id Theme id for styling the inquiry form.
                    # @return [ComplianceRegistrationInquiriesInstance] Updated ComplianceRegistrationInquiriesInstance
                    def update(
                        is_isv_embed: :unset, 
                        theme_set_id: :unset
                    )

                        context.update(
                            is_isv_embed: is_isv_embed, 
                            theme_set_id: theme_set_id, 
                        )
                    end

                    ##
                    # Provide a user friendly representation
                    def to_s
                        values = @params.map{|k, v| "#{k}: #{v}"}.join(" ")
                        "<Twilio.Trusthub.V1.ComplianceRegistrationInquiriesInstance #{values}>"
                    end

                    ##
                    # Provide a detailed, user friendly representation
                    def inspect
                        values = @properties.map{|k, v| "#{k}: #{v}"}.join(" ")
                        "<Twilio.Trusthub.V1.ComplianceRegistrationInquiriesInstance #{values}>"
                    end
                end

            end
        end
    end
end
