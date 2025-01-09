# -*- encoding: utf-8 -*-
# stub: google-cloud-vision-v1p3beta1 0.14.0 ruby lib

Gem::Specification.new do |s|
  s.name = "google-cloud-vision-v1p3beta1".freeze
  s.version = "0.14.0"

  s.required_rubygems_version = Gem::Requirement.new(">= 0".freeze) if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib".freeze]
  s.authors = ["Google LLC".freeze]
  s.date = "2024-12-10"
  s.description = "Cloud Vision API allows developers to easily integrate vision detection features within applications, including image labeling, face and landmark detection, optical character recognition (OCR), and tagging of explicit content. Note that google-cloud-vision-v1p3beta1 is a version-specific client library. For most uses, we recommend installing the main client library google-cloud-vision instead. See the readme for more details.".freeze
  s.email = "googleapis-packages@google.com".freeze
  s.homepage = "https://github.com/googleapis/google-cloud-ruby".freeze
  s.licenses = ["Apache-2.0".freeze]
  s.required_ruby_version = Gem::Requirement.new(">= 2.7".freeze)
  s.rubygems_version = "3.4.10".freeze
  s.summary = "Integrates Google Vision features, including image labeling, face, logo, and landmark detection, optical character recognition (OCR), and detection of explicit content, into applications.".freeze

  s.installed_by_version = "3.4.10" if s.respond_to? :installed_by_version

  s.specification_version = 4

  s.add_runtime_dependency(%q<gapic-common>.freeze, [">= 0.24.0", "< 2.a"])
  s.add_runtime_dependency(%q<google-cloud-errors>.freeze, ["~> 1.0"])
end
