class ImageUploader < CarrierWave::Uploader::Base
  # Include RMagick or MiniMagick support:
  # include CarrierWave::RMagick
  # include CarrierWave::MiniMagick

  # Choose what kind of storage to use for this uploader:
  # storage :file
  # storage :fog
  include Cloudinary::CarrierWave
  # Override the directory where uploaded files will be stored.
  # This is a sensible default for uploaders that are meant to be mounted:
  # def store_dir
  #   "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  # end
  version :simple do
    process resize_to_fill: [164, 164, :fill]
    process convert: 'jpg'
    cloudinary_transformation quality: 80
  end

  # Generate a 100x150 face-detection based thumbnail,
  # round corners with a 20-pixel radius and increase brightness by 30%.
  version :bright_face do
    cloudinary_transformation effect: 'brightness:30', radius: 20,
                              width: 100, height: 150, crop: :thumb, gravity: :face
  end

  # Provide a default URL as a default if there hasn't been a file uploaded:
  # def default_url(*args)
  #   # For Rails 3.1+ asset pipeline compatibility:
  #   # ActionController::Base.helpers.asset_path("fallback/" + [version_name, "default.png"].compact.join('_'))
  #
  #   "/images/fallback/" + [version_name, "default.png"].compact.join('_')
  # end

  # Process files as they are uploaded:
  # process scale: [200, 300]
  #
  # def scale(width, height)
  #   # do something
  # end

  # Create different versions of your uploaded files:
  # version :thumb do
  #   process resize_to_fit: [50, 50]
  # end

  # Add a white list of extensions which are allowed to be uploaded.
  # For images you might use something like this:
  # def extension_whitelist
  #   %w(jpg jpeg gif png)
  # end

  # Override the filename of the uploaded files:
  # Avoid using model.id or version_name here, see uploader/store.rb for details.
  # def filename
  #   "something.jpg" if original_filename
  # end
end


# class ImageUploader < CarrierWave::Uploader::Base
#   # Include RMagick or MiniMagick support:
#   # include CarrierWave::RMagick
#   # include CarrierWave::MiniMagick

#   # Choose what kind of storage to use for this uploader:
#   storage :file
#   # storage :fog

#   # Override the directory where uploaded files will be stored.
#   # This is a sensible default for uploaders that are meant to be mounted:
#   def store_dir
#     "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
#   end

#   # Provide a default URL as a default if there hasn't been a file uploaded:
#   # def default_url(*args)
#   #   # For Rails 3.1+ asset pipeline compatibility:
#   #   # ActionController::Base.helpers.asset_path("fallback/" + [version_name, "default.png"].compact.join('_'))
#   #
#   #   "/images/fallback/" + [version_name, "default.png"].compact.join('_')
#   # end

#   # Process files as they are uploaded:
#   # process scale: [200, 300]
#   #
#   # def scale(width, height)
#   #   # do something
#   # end

#   # Create different versions of your uploaded files:
#   # version :thumb do
#   #   process resize_to_fit: [50, 50]
#   # end

#   # Add a white list of extensions which are allowed to be uploaded.
#   # For images you might use something like this:
#   # def extension_whitelist
#   #   %w(jpg jpeg gif png)
#   # end

#   # Override the filename of the uploaded files:
#   # Avoid using model.id or version_name here, see uploader/store.rb for details.
#   # def filename
#   #   "something.jpg" if original_filename
#   # end
# end

