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
        class Numbers
            class V2 < Version
                ##
                # Initialize the V2 version of Numbers
                def initialize(domain)
                    super
                    @version = 'v2'
                    @authorization_documents = nil
                    @bulk_hosted_number_orders = nil
                    @bundle_clone = nil
                    @hosted_number_orders = nil
                    @regulatory_compliance = nil
                end

                ##
                # @param [String] sid A 34 character string that uniquely identifies this AuthorizationDocument.
                # @return [Twilio::REST::Numbers::V2::AuthorizationDocumentContext] if sid was passed.
                # @return [Twilio::REST::Numbers::V2::AuthorizationDocumentList]
                def authorization_documents(sid=:unset)
                    if sid.nil?
                        raise ArgumentError, 'sid cannot be nil'
                    end
                    if sid == :unset
                        @authorization_documents ||= AuthorizationDocumentList.new self
                    else
                        AuthorizationDocumentContext.new(self, sid)
                    end
                end
                ##
                # @param [String] bulk_hosting_sid A 34 character string that uniquely identifies this BulkHostedNumberOrder.
                # @return [Twilio::REST::Numbers::V2::BulkHostedNumberOrderContext] if bulkHostingSid was passed.
                # @return [Twilio::REST::Numbers::V2::BulkHostedNumberOrderList]
                def bulk_hosted_number_orders(bulk_hosting_sid=:unset)
                    if bulk_hosting_sid.nil?
                        raise ArgumentError, 'bulk_hosting_sid cannot be nil'
                    end
                    if bulk_hosting_sid == :unset
                        @bulk_hosted_number_orders ||= BulkHostedNumberOrderList.new self
                    else
                        BulkHostedNumberOrderContext.new(self, bulk_hosting_sid)
                    end
                end
                ##
                # @param [String] bundle_sid The unique string that identifies the Bundle to be cloned.
                # @return [Twilio::REST::Numbers::V2::BundleCloneContext] if bundleSid was passed.
                # @return [Twilio::REST::Numbers::V2::BundleCloneList]
                def bundle_clone(bundle_sid=:unset)
                    if bundle_sid.nil?
                        raise ArgumentError, 'bundle_sid cannot be nil'
                    end
                    if bundle_sid == :unset
                        @bundle_clone ||= BundleCloneList.new self
                    else
                        BundleCloneContext.new(self, bundle_sid)
                    end
                end
                ##
                # @param [String] sid A 34 character string that uniquely identifies this HostedNumberOrder.
                # @return [Twilio::REST::Numbers::V2::HostedNumberOrderContext] if sid was passed.
                # @return [Twilio::REST::Numbers::V2::HostedNumberOrderList]
                def hosted_number_orders(sid=:unset)
                    if sid.nil?
                        raise ArgumentError, 'sid cannot be nil'
                    end
                    if sid == :unset
                        @hosted_number_orders ||= HostedNumberOrderList.new self
                    else
                        HostedNumberOrderContext.new(self, sid)
                    end
                end
                ##
                # @return [Twilio::REST::Numbers::V2::RegulatoryComplianceList]
                def regulatory_compliance
                    @regulatory_compliance ||= RegulatoryComplianceList.new self
                end
                ##
                # Provide a user friendly representation
                def to_s
                    '<Twilio::REST::Numbers::V2>';
                end
            end
        end
    end
end
