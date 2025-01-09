# frozen_string_literal: true
# Generated by the protocol buffer compiler.  DO NOT EDIT!
# source: google/cloud/vision/v1p3beta1/image_annotator.proto

require 'google/protobuf'

require 'google/api/annotations_pb'
require 'google/api/client_pb'
require 'google/api/field_behavior_pb'
require 'google/cloud/vision/v1p3beta1/geometry_pb'
require 'google/cloud/vision/v1p3beta1/product_search_pb'
require 'google/cloud/vision/v1p3beta1/text_annotation_pb'
require 'google/cloud/vision/v1p3beta1/web_detection_pb'
require 'google/longrunning/operations_pb'
require 'google/protobuf/timestamp_pb'
require 'google/rpc/status_pb'
require 'google/type/color_pb'
require 'google/type/latlng_pb'


descriptor_data = "\n3google/cloud/vision/v1p3beta1/image_annotator.proto\x12\x1dgoogle.cloud.vision.v1p3beta1\x1a\x1cgoogle/api/annotations.proto\x1a\x17google/api/client.proto\x1a\x1fgoogle/api/field_behavior.proto\x1a,google/cloud/vision/v1p3beta1/geometry.proto\x1a\x32google/cloud/vision/v1p3beta1/product_search.proto\x1a\x33google/cloud/vision/v1p3beta1/text_annotation.proto\x1a\x31google/cloud/vision/v1p3beta1/web_detection.proto\x1a#google/longrunning/operations.proto\x1a\x1fgoogle/protobuf/timestamp.proto\x1a\x17google/rpc/status.proto\x1a\x17google/type/color.proto\x1a\x18google/type/latlng.proto\"\x8e\x03\n\x07\x46\x65\x61ture\x12\x39\n\x04type\x18\x01 \x01(\x0e\x32+.google.cloud.vision.v1p3beta1.Feature.Type\x12\x13\n\x0bmax_results\x18\x02 \x01(\x05\x12\r\n\x05model\x18\x03 \x01(\t\"\xa3\x02\n\x04Type\x12\x14\n\x10TYPE_UNSPECIFIED\x10\x00\x12\x12\n\x0e\x46\x41\x43\x45_DETECTION\x10\x01\x12\x16\n\x12LANDMARK_DETECTION\x10\x02\x12\x12\n\x0eLOGO_DETECTION\x10\x03\x12\x13\n\x0fLABEL_DETECTION\x10\x04\x12\x12\n\x0eTEXT_DETECTION\x10\x05\x12\x1b\n\x17\x44OCUMENT_TEXT_DETECTION\x10\x0b\x12\x19\n\x15SAFE_SEARCH_DETECTION\x10\x06\x12\x14\n\x10IMAGE_PROPERTIES\x10\x07\x12\x0e\n\nCROP_HINTS\x10\t\x12\x11\n\rWEB_DETECTION\x10\n\x12\x12\n\x0ePRODUCT_SEARCH\x10\x0c\x12\x17\n\x13OBJECT_LOCALIZATION\x10\x13\"7\n\x0bImageSource\x12\x15\n\rgcs_image_uri\x18\x01 \x01(\t\x12\x11\n\timage_uri\x18\x02 \x01(\t\"T\n\x05Image\x12\x0f\n\x07\x63ontent\x18\x01 \x01(\x0c\x12:\n\x06source\x18\x02 \x01(\x0b\x32*.google.cloud.vision.v1p3beta1.ImageSource\"\x9b\x0e\n\x0e\x46\x61\x63\x65\x41nnotation\x12\x42\n\rbounding_poly\x18\x01 \x01(\x0b\x32+.google.cloud.vision.v1p3beta1.BoundingPoly\x12\x45\n\x10\x66\x64_bounding_poly\x18\x02 \x01(\x0b\x32+.google.cloud.vision.v1p3beta1.BoundingPoly\x12I\n\tlandmarks\x18\x03 \x03(\x0b\x32\x36.google.cloud.vision.v1p3beta1.FaceAnnotation.Landmark\x12\x12\n\nroll_angle\x18\x04 \x01(\x02\x12\x11\n\tpan_angle\x18\x05 \x01(\x02\x12\x12\n\ntilt_angle\x18\x06 \x01(\x02\x12\x1c\n\x14\x64\x65tection_confidence\x18\x07 \x01(\x02\x12\x1e\n\x16landmarking_confidence\x18\x08 \x01(\x02\x12\x41\n\x0ejoy_likelihood\x18\t \x01(\x0e\x32).google.cloud.vision.v1p3beta1.Likelihood\x12\x44\n\x11sorrow_likelihood\x18\n \x01(\x0e\x32).google.cloud.vision.v1p3beta1.Likelihood\x12\x43\n\x10\x61nger_likelihood\x18\x0b \x01(\x0e\x32).google.cloud.vision.v1p3beta1.Likelihood\x12\x46\n\x13surprise_likelihood\x18\x0c \x01(\x0e\x32).google.cloud.vision.v1p3beta1.Likelihood\x12K\n\x18under_exposed_likelihood\x18\r \x01(\x0e\x32).google.cloud.vision.v1p3beta1.Likelihood\x12\x45\n\x12\x62lurred_likelihood\x18\x0e \x01(\x0e\x32).google.cloud.vision.v1p3beta1.Likelihood\x12\x46\n\x13headwear_likelihood\x18\x0f \x01(\x0e\x32).google.cloud.vision.v1p3beta1.Likelihood\x1a\xc7\x07\n\x08Landmark\x12I\n\x04type\x18\x03 \x01(\x0e\x32;.google.cloud.vision.v1p3beta1.FaceAnnotation.Landmark.Type\x12\x39\n\x08position\x18\x04 \x01(\x0b\x32\'.google.cloud.vision.v1p3beta1.Position\"\xb4\x06\n\x04Type\x12\x14\n\x10UNKNOWN_LANDMARK\x10\x00\x12\x0c\n\x08LEFT_EYE\x10\x01\x12\r\n\tRIGHT_EYE\x10\x02\x12\x18\n\x14LEFT_OF_LEFT_EYEBROW\x10\x03\x12\x19\n\x15RIGHT_OF_LEFT_EYEBROW\x10\x04\x12\x19\n\x15LEFT_OF_RIGHT_EYEBROW\x10\x05\x12\x1a\n\x16RIGHT_OF_RIGHT_EYEBROW\x10\x06\x12\x19\n\x15MIDPOINT_BETWEEN_EYES\x10\x07\x12\x0c\n\x08NOSE_TIP\x10\x08\x12\r\n\tUPPER_LIP\x10\t\x12\r\n\tLOWER_LIP\x10\n\x12\x0e\n\nMOUTH_LEFT\x10\x0b\x12\x0f\n\x0bMOUTH_RIGHT\x10\x0c\x12\x10\n\x0cMOUTH_CENTER\x10\r\x12\x15\n\x11NOSE_BOTTOM_RIGHT\x10\x0e\x12\x14\n\x10NOSE_BOTTOM_LEFT\x10\x0f\x12\x16\n\x12NOSE_BOTTOM_CENTER\x10\x10\x12\x19\n\x15LEFT_EYE_TOP_BOUNDARY\x10\x11\x12\x19\n\x15LEFT_EYE_RIGHT_CORNER\x10\x12\x12\x1c\n\x18LEFT_EYE_BOTTOM_BOUNDARY\x10\x13\x12\x18\n\x14LEFT_EYE_LEFT_CORNER\x10\x14\x12\x1a\n\x16RIGHT_EYE_TOP_BOUNDARY\x10\x15\x12\x1a\n\x16RIGHT_EYE_RIGHT_CORNER\x10\x16\x12\x1d\n\x19RIGHT_EYE_BOTTOM_BOUNDARY\x10\x17\x12\x19\n\x15RIGHT_EYE_LEFT_CORNER\x10\x18\x12\x1f\n\x1bLEFT_EYEBROW_UPPER_MIDPOINT\x10\x19\x12 \n\x1cRIGHT_EYEBROW_UPPER_MIDPOINT\x10\x1a\x12\x14\n\x10LEFT_EAR_TRAGION\x10\x1b\x12\x15\n\x11RIGHT_EAR_TRAGION\x10\x1c\x12\x12\n\x0eLEFT_EYE_PUPIL\x10\x1d\x12\x13\n\x0fRIGHT_EYE_PUPIL\x10\x1e\x12\x15\n\x11\x46OREHEAD_GLABELLA\x10\x1f\x12\x11\n\rCHIN_GNATHION\x10 \x12\x14\n\x10\x43HIN_LEFT_GONION\x10!\x12\x15\n\x11\x43HIN_RIGHT_GONION\x10\"\"4\n\x0cLocationInfo\x12$\n\x07lat_lng\x18\x01 \x01(\x0b\x32\x13.google.type.LatLng\"=\n\x08Property\x12\x0c\n\x04name\x18\x01 \x01(\t\x12\r\n\x05value\x18\x02 \x01(\t\x12\x14\n\x0cuint64_value\x18\x03 \x01(\x04\"\xbc\x02\n\x10\x45ntityAnnotation\x12\x0b\n\x03mid\x18\x01 \x01(\t\x12\x0e\n\x06locale\x18\x02 \x01(\t\x12\x13\n\x0b\x64\x65scription\x18\x03 \x01(\t\x12\r\n\x05score\x18\x04 \x01(\x02\x12\x12\n\nconfidence\x18\x05 \x01(\x02\x12\x12\n\ntopicality\x18\x06 \x01(\x02\x12\x42\n\rbounding_poly\x18\x07 \x01(\x0b\x32+.google.cloud.vision.v1p3beta1.BoundingPoly\x12>\n\tlocations\x18\x08 \x03(\x0b\x32+.google.cloud.vision.v1p3beta1.LocationInfo\x12;\n\nproperties\x18\t \x03(\x0b\x32\'.google.cloud.vision.v1p3beta1.Property\"\xa0\x01\n\x19LocalizedObjectAnnotation\x12\x0b\n\x03mid\x18\x01 \x01(\t\x12\x15\n\rlanguage_code\x18\x02 \x01(\t\x12\x0c\n\x04name\x18\x03 \x01(\t\x12\r\n\x05score\x18\x04 \x01(\x02\x12\x42\n\rbounding_poly\x18\x05 \x01(\x0b\x32+.google.cloud.vision.v1p3beta1.BoundingPoly\"\xbc\x02\n\x14SafeSearchAnnotation\x12\x38\n\x05\x61\x64ult\x18\x01 \x01(\x0e\x32).google.cloud.vision.v1p3beta1.Likelihood\x12\x38\n\x05spoof\x18\x02 \x01(\x0e\x32).google.cloud.vision.v1p3beta1.Likelihood\x12:\n\x07medical\x18\x03 \x01(\x0e\x32).google.cloud.vision.v1p3beta1.Likelihood\x12;\n\x08violence\x18\x04 \x01(\x0e\x32).google.cloud.vision.v1p3beta1.Likelihood\x12\x37\n\x04racy\x18\t \x01(\x0e\x32).google.cloud.vision.v1p3beta1.Likelihood\"a\n\x0bLatLongRect\x12(\n\x0bmin_lat_lng\x18\x01 \x01(\x0b\x32\x13.google.type.LatLng\x12(\n\x0bmax_lat_lng\x18\x02 \x01(\x0b\x32\x13.google.type.LatLng\"U\n\tColorInfo\x12!\n\x05\x63olor\x18\x01 \x01(\x0b\x32\x12.google.type.Color\x12\r\n\x05score\x18\x02 \x01(\x02\x12\x16\n\x0epixel_fraction\x18\x03 \x01(\x02\"T\n\x18\x44ominantColorsAnnotation\x12\x38\n\x06\x63olors\x18\x01 \x03(\x0b\x32(.google.cloud.vision.v1p3beta1.ColorInfo\"c\n\x0fImageProperties\x12P\n\x0f\x64ominant_colors\x18\x01 \x01(\x0b\x32\x37.google.cloud.vision.v1p3beta1.DominantColorsAnnotation\"\x7f\n\x08\x43ropHint\x12\x42\n\rbounding_poly\x18\x01 \x01(\x0b\x32+.google.cloud.vision.v1p3beta1.BoundingPoly\x12\x12\n\nconfidence\x18\x02 \x01(\x02\x12\x1b\n\x13importance_fraction\x18\x03 \x01(\x02\"R\n\x13\x43ropHintsAnnotation\x12;\n\ncrop_hints\x18\x01 \x03(\x0b\x32\'.google.cloud.vision.v1p3beta1.CropHint\"(\n\x0f\x43ropHintsParams\x12\x15\n\raspect_ratios\x18\x01 \x03(\x02\"1\n\x12WebDetectionParams\x12\x1b\n\x13include_geo_results\x18\x02 \x01(\x08\"c\n\x13TextDetectionParams\x12.\n&enable_text_detection_confidence_score\x18\t \x01(\x08\x12\x1c\n\x14\x61\x64vanced_ocr_options\x18\x0b \x03(\t\"\xab\x03\n\x0cImageContext\x12\x41\n\rlat_long_rect\x18\x01 \x01(\x0b\x32*.google.cloud.vision.v1p3beta1.LatLongRect\x12\x16\n\x0elanguage_hints\x18\x02 \x03(\t\x12I\n\x11\x63rop_hints_params\x18\x04 \x01(\x0b\x32..google.cloud.vision.v1p3beta1.CropHintsParams\x12Q\n\x15product_search_params\x18\x05 \x01(\x0b\x32\x32.google.cloud.vision.v1p3beta1.ProductSearchParams\x12O\n\x14web_detection_params\x18\x06 \x01(\x0b\x32\x31.google.cloud.vision.v1p3beta1.WebDetectionParams\x12Q\n\x15text_detection_params\x18\x0c \x01(\x0b\x32\x32.google.cloud.vision.v1p3beta1.TextDetectionParams\"\xc9\x01\n\x14\x41nnotateImageRequest\x12\x33\n\x05image\x18\x01 \x01(\x0b\x32$.google.cloud.vision.v1p3beta1.Image\x12\x38\n\x08\x66\x65\x61tures\x18\x02 \x03(\x0b\x32&.google.cloud.vision.v1p3beta1.Feature\x12\x42\n\rimage_context\x18\x03 \x01(\x0b\x32+.google.cloud.vision.v1p3beta1.ImageContext\":\n\x16ImageAnnotationContext\x12\x0b\n\x03uri\x18\x01 \x01(\t\x12\x13\n\x0bpage_number\x18\x02 \x01(\x05\"\xbf\x08\n\x15\x41nnotateImageResponse\x12G\n\x10\x66\x61\x63\x65_annotations\x18\x01 \x03(\x0b\x32-.google.cloud.vision.v1p3beta1.FaceAnnotation\x12M\n\x14landmark_annotations\x18\x02 \x03(\x0b\x32/.google.cloud.vision.v1p3beta1.EntityAnnotation\x12I\n\x10logo_annotations\x18\x03 \x03(\x0b\x32/.google.cloud.vision.v1p3beta1.EntityAnnotation\x12J\n\x11label_annotations\x18\x04 \x03(\x0b\x32/.google.cloud.vision.v1p3beta1.EntityAnnotation\x12^\n\x1clocalized_object_annotations\x18\x16 \x03(\x0b\x32\x38.google.cloud.vision.v1p3beta1.LocalizedObjectAnnotation\x12I\n\x10text_annotations\x18\x05 \x03(\x0b\x32/.google.cloud.vision.v1p3beta1.EntityAnnotation\x12K\n\x14\x66ull_text_annotation\x18\x0c \x01(\x0b\x32-.google.cloud.vision.v1p3beta1.TextAnnotation\x12S\n\x16safe_search_annotation\x18\x06 \x01(\x0b\x32\x33.google.cloud.vision.v1p3beta1.SafeSearchAnnotation\x12S\n\x1bimage_properties_annotation\x18\x08 \x01(\x0b\x32..google.cloud.vision.v1p3beta1.ImageProperties\x12Q\n\x15\x63rop_hints_annotation\x18\x0b \x01(\x0b\x32\x32.google.cloud.vision.v1p3beta1.CropHintsAnnotation\x12\x42\n\rweb_detection\x18\r \x01(\x0b\x32+.google.cloud.vision.v1p3beta1.WebDetection\x12S\n\x16product_search_results\x18\x0e \x01(\x0b\x32\x33.google.cloud.vision.v1p3beta1.ProductSearchResults\x12!\n\x05\x65rror\x18\t \x01(\x0b\x32\x12.google.rpc.Status\x12\x46\n\x07\x63ontext\x18\x15 \x01(\x0b\x32\x35.google.cloud.vision.v1p3beta1.ImageAnnotationContext\"\xa1\x01\n\x14\x41nnotateFileResponse\x12@\n\x0cinput_config\x18\x01 \x01(\x0b\x32*.google.cloud.vision.v1p3beta1.InputConfig\x12G\n\tresponses\x18\x02 \x03(\x0b\x32\x34.google.cloud.vision.v1p3beta1.AnnotateImageResponse\"h\n\x1a\x42\x61tchAnnotateImagesRequest\x12J\n\x08requests\x18\x01 \x03(\x0b\x32\x33.google.cloud.vision.v1p3beta1.AnnotateImageRequestB\x03\xe0\x41\x02\"f\n\x1b\x42\x61tchAnnotateImagesResponse\x12G\n\tresponses\x18\x01 \x03(\x0b\x32\x34.google.cloud.vision.v1p3beta1.AnnotateImageResponse\"\x9e\x02\n\x18\x41syncAnnotateFileRequest\x12@\n\x0cinput_config\x18\x01 \x01(\x0b\x32*.google.cloud.vision.v1p3beta1.InputConfig\x12\x38\n\x08\x66\x65\x61tures\x18\x02 \x03(\x0b\x32&.google.cloud.vision.v1p3beta1.Feature\x12\x42\n\rimage_context\x18\x03 \x01(\x0b\x32+.google.cloud.vision.v1p3beta1.ImageContext\x12\x42\n\routput_config\x18\x04 \x01(\x0b\x32+.google.cloud.vision.v1p3beta1.OutputConfig\"_\n\x19\x41syncAnnotateFileResponse\x12\x42\n\routput_config\x18\x01 \x01(\x0b\x32+.google.cloud.vision.v1p3beta1.OutputConfig\"p\n\x1e\x41syncBatchAnnotateFilesRequest\x12N\n\x08requests\x18\x01 \x03(\x0b\x32\x37.google.cloud.vision.v1p3beta1.AsyncAnnotateFileRequestB\x03\xe0\x41\x02\"n\n\x1f\x41syncBatchAnnotateFilesResponse\x12K\n\tresponses\x18\x01 \x03(\x0b\x32\x38.google.cloud.vision.v1p3beta1.AsyncAnnotateFileResponse\"^\n\x0bInputConfig\x12<\n\ngcs_source\x18\x01 \x01(\x0b\x32(.google.cloud.vision.v1p3beta1.GcsSource\x12\x11\n\tmime_type\x18\x02 \x01(\t\"j\n\x0cOutputConfig\x12\x46\n\x0fgcs_destination\x18\x01 \x01(\x0b\x32-.google.cloud.vision.v1p3beta1.GcsDestination\x12\x12\n\nbatch_size\x18\x02 \x01(\x05\"\x18\n\tGcsSource\x12\x0b\n\x03uri\x18\x01 \x01(\t\"\x1d\n\x0eGcsDestination\x12\x0b\n\x03uri\x18\x01 \x01(\t\"\x8f\x02\n\x11OperationMetadata\x12\x45\n\x05state\x18\x01 \x01(\x0e\x32\x36.google.cloud.vision.v1p3beta1.OperationMetadata.State\x12/\n\x0b\x63reate_time\x18\x05 \x01(\x0b\x32\x1a.google.protobuf.Timestamp\x12/\n\x0bupdate_time\x18\x06 \x01(\x0b\x32\x1a.google.protobuf.Timestamp\"Q\n\x05State\x12\x15\n\x11STATE_UNSPECIFIED\x10\x00\x12\x0b\n\x07\x43REATED\x10\x01\x12\x0b\n\x07RUNNING\x10\x02\x12\x08\n\x04\x44ONE\x10\x03\x12\r\n\tCANCELLED\x10\x04*e\n\nLikelihood\x12\x0b\n\x07UNKNOWN\x10\x00\x12\x11\n\rVERY_UNLIKELY\x10\x01\x12\x0c\n\x08UNLIKELY\x10\x02\x12\x0c\n\x08POSSIBLE\x10\x03\x12\n\n\x06LIKELY\x10\x04\x12\x0f\n\x0bVERY_LIKELY\x10\x05\x32\xb5\x04\n\x0eImageAnnotator\x12\xbe\x01\n\x13\x42\x61tchAnnotateImages\x12\x39.google.cloud.vision.v1p3beta1.BatchAnnotateImagesRequest\x1a:.google.cloud.vision.v1p3beta1.BatchAnnotateImagesResponse\"0\xda\x41\x08requests\x82\xd3\xe4\x93\x02\x1f\"\x1a/v1p3beta1/images:annotate:\x01*\x12\xe9\x01\n\x17\x41syncBatchAnnotateFiles\x12=.google.cloud.vision.v1p3beta1.AsyncBatchAnnotateFilesRequest\x1a\x1d.google.longrunning.Operation\"p\xca\x41\x34\n\x1f\x41syncBatchAnnotateFilesResponse\x12\x11OperationMetadata\xda\x41\x08requests\x82\xd3\xe4\x93\x02(\"#/v1p3beta1/files:asyncBatchAnnotate:\x01*\x1av\xca\x41\x15vision.googleapis.com\xd2\x41[https://www.googleapis.com/auth/cloud-platform,https://www.googleapis.com/auth/cloud-visionBx\n!com.google.cloud.vision.v1p3beta1B\x13ImageAnnotatorProtoP\x01Z9cloud.google.com/go/vision/apiv1p3beta1/visionpb;visionpb\xf8\x01\x01\x62\x06proto3"

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
    ["google.cloud.vision.v1p3beta1.BoundingPoly", "google/cloud/vision/v1p3beta1/geometry.proto"],
    ["google.type.LatLng", "google/type/latlng.proto"],
    ["google.type.Color", "google/type/color.proto"],
    ["google.cloud.vision.v1p3beta1.ProductSearchParams", "google/cloud/vision/v1p3beta1/product_search.proto"],
    ["google.cloud.vision.v1p3beta1.TextAnnotation", "google/cloud/vision/v1p3beta1/text_annotation.proto"],
    ["google.cloud.vision.v1p3beta1.WebDetection", "google/cloud/vision/v1p3beta1/web_detection.proto"],
    ["google.rpc.Status", "google/rpc/status.proto"],
    ["google.protobuf.Timestamp", "google/protobuf/timestamp.proto"],
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
  module Cloud
    module Vision
      module V1p3beta1
        Feature = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.cloud.vision.v1p3beta1.Feature").msgclass
        Feature::Type = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.cloud.vision.v1p3beta1.Feature.Type").enummodule
        ImageSource = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.cloud.vision.v1p3beta1.ImageSource").msgclass
        Image = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.cloud.vision.v1p3beta1.Image").msgclass
        FaceAnnotation = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.cloud.vision.v1p3beta1.FaceAnnotation").msgclass
        FaceAnnotation::Landmark = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.cloud.vision.v1p3beta1.FaceAnnotation.Landmark").msgclass
        FaceAnnotation::Landmark::Type = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.cloud.vision.v1p3beta1.FaceAnnotation.Landmark.Type").enummodule
        LocationInfo = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.cloud.vision.v1p3beta1.LocationInfo").msgclass
        Property = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.cloud.vision.v1p3beta1.Property").msgclass
        EntityAnnotation = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.cloud.vision.v1p3beta1.EntityAnnotation").msgclass
        LocalizedObjectAnnotation = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.cloud.vision.v1p3beta1.LocalizedObjectAnnotation").msgclass
        SafeSearchAnnotation = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.cloud.vision.v1p3beta1.SafeSearchAnnotation").msgclass
        LatLongRect = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.cloud.vision.v1p3beta1.LatLongRect").msgclass
        ColorInfo = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.cloud.vision.v1p3beta1.ColorInfo").msgclass
        DominantColorsAnnotation = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.cloud.vision.v1p3beta1.DominantColorsAnnotation").msgclass
        ImageProperties = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.cloud.vision.v1p3beta1.ImageProperties").msgclass
        CropHint = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.cloud.vision.v1p3beta1.CropHint").msgclass
        CropHintsAnnotation = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.cloud.vision.v1p3beta1.CropHintsAnnotation").msgclass
        CropHintsParams = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.cloud.vision.v1p3beta1.CropHintsParams").msgclass
        WebDetectionParams = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.cloud.vision.v1p3beta1.WebDetectionParams").msgclass
        TextDetectionParams = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.cloud.vision.v1p3beta1.TextDetectionParams").msgclass
        ImageContext = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.cloud.vision.v1p3beta1.ImageContext").msgclass
        AnnotateImageRequest = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.cloud.vision.v1p3beta1.AnnotateImageRequest").msgclass
        ImageAnnotationContext = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.cloud.vision.v1p3beta1.ImageAnnotationContext").msgclass
        AnnotateImageResponse = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.cloud.vision.v1p3beta1.AnnotateImageResponse").msgclass
        AnnotateFileResponse = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.cloud.vision.v1p3beta1.AnnotateFileResponse").msgclass
        BatchAnnotateImagesRequest = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.cloud.vision.v1p3beta1.BatchAnnotateImagesRequest").msgclass
        BatchAnnotateImagesResponse = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.cloud.vision.v1p3beta1.BatchAnnotateImagesResponse").msgclass
        AsyncAnnotateFileRequest = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.cloud.vision.v1p3beta1.AsyncAnnotateFileRequest").msgclass
        AsyncAnnotateFileResponse = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.cloud.vision.v1p3beta1.AsyncAnnotateFileResponse").msgclass
        AsyncBatchAnnotateFilesRequest = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.cloud.vision.v1p3beta1.AsyncBatchAnnotateFilesRequest").msgclass
        AsyncBatchAnnotateFilesResponse = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.cloud.vision.v1p3beta1.AsyncBatchAnnotateFilesResponse").msgclass
        InputConfig = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.cloud.vision.v1p3beta1.InputConfig").msgclass
        OutputConfig = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.cloud.vision.v1p3beta1.OutputConfig").msgclass
        GcsSource = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.cloud.vision.v1p3beta1.GcsSource").msgclass
        GcsDestination = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.cloud.vision.v1p3beta1.GcsDestination").msgclass
        OperationMetadata = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.cloud.vision.v1p3beta1.OperationMetadata").msgclass
        OperationMetadata::State = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.cloud.vision.v1p3beta1.OperationMetadata.State").enummodule
        Likelihood = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.cloud.vision.v1p3beta1.Likelihood").enummodule
      end
    end
  end
end
