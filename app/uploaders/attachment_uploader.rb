# encoding: utf-8

class AttachmentUploader < CarrierWave::Uploader::Base

  include CarrierWave::RMagick
  include CarrierWave::MimeTypes

  storage :file

  def store_dir
    "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end

  process :set_content_type

  version :thumb, :if => :image? do
    process :resize_to_fit => [50, 50]
  end

  version :preview, :if => :image? do
    process :resize_to_fit => [80, 80]
  end

  protected

  def image?(new_file)
    new_file.content_type.include? 'image'
  end


end
