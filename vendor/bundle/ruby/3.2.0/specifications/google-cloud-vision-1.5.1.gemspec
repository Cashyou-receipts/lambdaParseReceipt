# -*- encoding: utf-8 -*-
# stub: google-cloud-vision 1.5.1 ruby lib

Gem::Specification.new do |s|
  s.name = "google-cloud-vision".freeze
  s.version = "1.5.1"

  s.required_rubygems_version = Gem::Requirement.new(">= 0".freeze) if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib".freeze]
  s.authors = ["Google LLC".freeze]
  s.date = "2024-08-08"
  s.description = "Cloud Vision API allows developers to easily integrate vision detection features within applications, including image labeling, face and landmark detection, optical character recognition (OCR), and tagging of explicit content.".freeze
  s.email = "googleapis-packages@google.com".freeze
  s.homepage = "https://github.com/googleapis/google-cloud-ruby".freeze
  s.licenses = ["Apache-2.0".freeze]
  s.required_ruby_version = Gem::Requirement.new(">= 2.7".freeze)
  s.rubygems_version = "3.4.10".freeze
  s.summary = "API Client library for the Cloud Vision API".freeze

  s.installed_by_version = "3.4.10" if s.respond_to? :installed_by_version

  s.specification_version = 4

  s.add_runtime_dependency(%q<google-cloud-core>.freeze, ["~> 1.6"])
  s.add_runtime_dependency(%q<google-cloud-vision-v1>.freeze, [">= 0.13", "< 2.a"])
  s.add_runtime_dependency(%q<google-cloud-vision-v1p3beta1>.freeze, [">= 0.12", "< 2.a"])
end
