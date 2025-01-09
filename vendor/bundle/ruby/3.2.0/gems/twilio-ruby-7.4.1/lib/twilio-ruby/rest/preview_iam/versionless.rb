##
#    This code was generated by
#    ___ _ _ _ _ _    _ ____    ____ ____ _    ____ ____ _  _ ____ ____ ____ ___ __   __
#     |  | | | | |    | |  | __ |  | |__| | __ | __ |___ |\ | |___ |__/ |__|  | |  | |__/
#     |  |_|_| | |___ | |__|    |__| |  | |    |__] |___ | \| |___ |  \ |  |  | |__| |  \
#
#    Organization Public API
#    No description provided (generated by Openapi Generator https://github.com/openapitools/openapi-generator)
#
#    NOTE: This class is auto generated by OpenAPI Generator.
#    https://openapi-generator.tech
#    Do not edit the class manually.
#

module Twilio
    module REST
        class PreviewIam
            class Versionless < Version
                ##
                # Initialize the Versionless version of PreviewIam
                def initialize(domain)
                    super
                    @version = 'Organizations'
                    @organization = nil
                end

                ##
                # @param [String] organization_sid 
                # @return [Twilio::REST::PreviewIam::Versionless::OrganizationContext] if organizationSid was passed.
                # @return [Twilio::REST::PreviewIam::Versionless::OrganizationList]
                def organization(organization_sid=:unset)
                    if organization_sid.nil?
                        raise ArgumentError, 'organization_sid cannot be nil'
                    end
                    if organization_sid == :unset
                        @organization ||= OrganizationList.new self
                    else
                        OrganizationContext.new(self, organization_sid)
                    end
                end
                ##
                # Provide a user friendly representation
                def to_s
                    '<Twilio::REST::PreviewIam::Versionless>';
                end
            end
        end
    end
end