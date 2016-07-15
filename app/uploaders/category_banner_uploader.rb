# encoding: utf-8

class CategoryBannerUploader < CarrierWave::Uploader::Base
  include CarrierWave::MiniMagick

  storage :file

  def store_dir
    "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end

  process resize_to_fit: [2000, 1000]

  version :thumb do
    process :resize_to_fit => [100, 100]
  end

  version :large do
    process :resize_to_fit => [1000, 500]
  end

  def extension_white_list
    %w(jpg jpeg gif png)
  end

end
