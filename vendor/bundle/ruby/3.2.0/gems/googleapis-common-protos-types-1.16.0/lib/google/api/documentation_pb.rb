# frozen_string_literal: true
# Generated by the protocol buffer compiler.  DO NOT EDIT!
# source: google/api/documentation.proto

require 'google/protobuf'


descriptor_data = "\n\x1egoogle/api/documentation.proto\x12\ngoogle.api\"\xbb\x01\n\rDocumentation\x12\x0f\n\x07summary\x18\x01 \x01(\t\x12\x1f\n\x05pages\x18\x05 \x03(\x0b\x32\x10.google.api.Page\x12,\n\x05rules\x18\x03 \x03(\x0b\x32\x1d.google.api.DocumentationRule\x12\x1e\n\x16\x64ocumentation_root_url\x18\x04 \x01(\t\x12\x18\n\x10service_root_url\x18\x06 \x01(\t\x12\x10\n\x08overview\x18\x02 \x01(\t\"[\n\x11\x44ocumentationRule\x12\x10\n\x08selector\x18\x01 \x01(\t\x12\x13\n\x0b\x64\x65scription\x18\x02 \x01(\t\x12\x1f\n\x17\x64\x65precation_description\x18\x03 \x01(\t\"I\n\x04Page\x12\x0c\n\x04name\x18\x01 \x01(\t\x12\x0f\n\x07\x63ontent\x18\x02 \x01(\t\x12\"\n\x08subpages\x18\x03 \x03(\x0b\x32\x10.google.api.PageBt\n\x0e\x63om.google.apiB\x12\x44ocumentationProtoP\x01ZEgoogle.golang.org/genproto/googleapis/api/serviceconfig;serviceconfig\xa2\x02\x04GAPIb\x06proto3"

pool = Google::Protobuf::DescriptorPool.generated_pool

begin
  pool.add_serialized_file(descriptor_data)
rescue TypeError
  # Compatibility code: will be removed in the next major version.
  require 'google/protobuf/descriptor_pb'
  parsed = Google::Protobuf::FileDescriptorProto.decode(descriptor_data)
  parsed.clear_dependency
  serialized = parsed.class.encode(parsed)
  file = pool.add_serialized_file(serialized)
  warn "Warning: Protobuf detected an import path issue while loading generated file #{__FILE__}"
  imports = [
  ]
  imports.each do |type_name, expected_filename|
    import_file = pool.lookup(type_name).file_descriptor
    if import_file.name != expected_filename
      warn "- #{file.name} imports #{expected_filename}, but that import was loaded as #{import_file.name}"
    end
  end
  warn "Each proto file must use a consistent fully-qualified name."
  warn "This will become an error in the next major version."
end

module Google
  module Api
    Documentation = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.api.Documentation").msgclass
    DocumentationRule = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.api.DocumentationRule").msgclass
    Page = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.api.Page").msgclass
  end
end

#### Source proto file: google/api/documentation.proto ####
#
# // Copyright 2024 Google LLC
# //
# // Licensed under the Apache License, Version 2.0 (the "License");
# // you may not use this file except in compliance with the License.
# // You may obtain a copy of the License at
# //
# //     http://www.apache.org/licenses/LICENSE-2.0
# //
# // Unless required by applicable law or agreed to in writing, software
# // distributed under the License is distributed on an "AS IS" BASIS,
# // WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# // See the License for the specific language governing permissions and
# // limitations under the License.
#
# syntax = "proto3";
#
# package google.api;
#
# option go_package = "google.golang.org/genproto/googleapis/api/serviceconfig;serviceconfig";
# option java_multiple_files = true;
# option java_outer_classname = "DocumentationProto";
# option java_package = "com.google.api";
# option objc_class_prefix = "GAPI";
#
# // `Documentation` provides the information for describing a service.
# //
# // Example:
# // <pre><code>documentation:
# //   summary: >
# //     The Google Calendar API gives access
# //     to most calendar features.
# //   pages:
# //   - name: Overview
# //     content: &#40;== include google/foo/overview.md ==&#41;
# //   - name: Tutorial
# //     content: &#40;== include google/foo/tutorial.md ==&#41;
# //     subpages:
# //     - name: Java
# //       content: &#40;== include google/foo/tutorial_java.md ==&#41;
# //   rules:
# //   - selector: google.calendar.Calendar.Get
# //     description: >
# //       ...
# //   - selector: google.calendar.Calendar.Put
# //     description: >
# //       ...
# // </code></pre>
# // Documentation is provided in markdown syntax. In addition to
# // standard markdown features, definition lists, tables and fenced
# // code blocks are supported. Section headers can be provided and are
# // interpreted relative to the section nesting of the context where
# // a documentation fragment is embedded.
# //
# // Documentation from the IDL is merged with documentation defined
# // via the config at normalization time, where documentation provided
# // by config rules overrides IDL provided.
# //
# // A number of constructs specific to the API platform are supported
# // in documentation text.
# //
# // In order to reference a proto element, the following
# // notation can be used:
# // <pre><code>&#91;fully.qualified.proto.name]&#91;]</code></pre>
# // To override the display text used for the link, this can be used:
# // <pre><code>&#91;display text]&#91;fully.qualified.proto.name]</code></pre>
# // Text can be excluded from doc using the following notation:
# // <pre><code>&#40;-- internal comment --&#41;</code></pre>
# //
# // A few directives are available in documentation. Note that
# // directives must appear on a single line to be properly
# // identified. The `include` directive includes a markdown file from
# // an external source:
# // <pre><code>&#40;== include path/to/file ==&#41;</code></pre>
# // The `resource_for` directive marks a message to be the resource of
# // a collection in REST view. If it is not specified, tools attempt
# // to infer the resource from the operations in a collection:
# // <pre><code>&#40;== resource_for v1.shelves.books ==&#41;</code></pre>
# // The directive `suppress_warning` does not directly affect documentation
# // and is documented together with service config validation.
# message Documentation {
#   // A short description of what the service does. The summary must be plain
#   // text. It becomes the overview of the service displayed in Google Cloud
#   // Console.
#   // NOTE: This field is equivalent to the standard field `description`.
#   string summary = 1;
#
#   // The top level pages for the documentation set.
#   repeated Page pages = 5;
#
#   // A list of documentation rules that apply to individual API elements.
#   //
#   // **NOTE:** All service configuration rules follow "last one wins" order.
#   repeated DocumentationRule rules = 3;
#
#   // The URL to the root of documentation.
#   string documentation_root_url = 4;
#
#   // Specifies the service root url if the default one (the service name
#   // from the yaml file) is not suitable. This can be seen in any fully
#   // specified service urls as well as sections that show a base that other
#   // urls are relative to.
#   string service_root_url = 6;
#
#   // Declares a single overview page. For example:
#   // <pre><code>documentation:
#   //   summary: ...
#   //   overview: &#40;== include overview.md ==&#41;
#   // </code></pre>
#   // This is a shortcut for the following declaration (using pages style):
#   // <pre><code>documentation:
#   //   summary: ...
#   //   pages:
#   //   - name: Overview
#   //     content: &#40;== include overview.md ==&#41;
#   // </code></pre>
#   // Note: you cannot specify both `overview` field and `pages` field.
#   string overview = 2;
# }
#
# // A documentation rule provides information about individual API elements.
# message DocumentationRule {
#   // The selector is a comma-separated list of patterns for any element such as
#   // a method, a field, an enum value. Each pattern is a qualified name of the
#   // element which may end in "*", indicating a wildcard. Wildcards are only
#   // allowed at the end and for a whole component of the qualified name,
#   // i.e. "foo.*" is ok, but not "foo.b*" or "foo.*.bar". A wildcard will match
#   // one or more components. To specify a default for all applicable elements,
#   // the whole pattern "*" is used.
#   string selector = 1;
#
#   // Description of the selected proto element (e.g. a message, a method, a
#   // 'service' definition, or a field). Defaults to leading & trailing comments
#   // taken from the proto source definition of the proto element.
#   string description = 2;
#
#   // Deprecation description of the selected element(s). It can be provided if
#   // an element is marked as `deprecated`.
#   string deprecation_description = 3;
# }
#
# // Represents a documentation page. A page can contain subpages to represent
# // nested documentation set structure.
# message Page {
#   // The name of the page. It will be used as an identity of the page to
#   // generate URI of the page, text of the link to this page in navigation,
#   // etc. The full page name (start from the root page name to this page
#   // concatenated with `.`) can be used as reference to the page in your
#   // documentation. For example:
#   // <pre><code>pages:
#   // - name: Tutorial
#   //   content: &#40;== include tutorial.md ==&#41;
#   //   subpages:
#   //   - name: Java
#   //     content: &#40;== include tutorial_java.md ==&#41;
#   // </code></pre>
#   // You can reference `Java` page using Markdown reference link syntax:
#   // `[Java][Tutorial.Java]`.
#   string name = 1;
#
#   // The Markdown content of the page. You can use <code>&#40;== include {path}
#   // ==&#41;</code> to include content from a Markdown file. The content can be
#   // used to produce the documentation page such as HTML format page.
#   string content = 2;
#
#   // Subpages of this page. The order of subpages specified here will be
#   // honored in the generated docset.
#   repeated Page subpages = 3;
# }
