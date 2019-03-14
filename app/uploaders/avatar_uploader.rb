class AvatarUploader < CarrierWave::Uploader::Base
   include CarrierWave::RMagick

  def store_dir
    "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end

  # 許可する画像の拡張子
 def extension_whitelist
    %w(jpg jpeg gif png)
 end

  # 一意となるトークンを作成
  def secure_token
     var = :"@#{mounted_as}_secure_token"
     model.instance_variable_get(var) or model.instance_variable_set(var, SecureRandom.uuid)
  end

 # 保存するファイルの命名規則
  def filename
     "#{secure_token}.#{file.extension}" if original_filename.present?
  end

  def store_dir
    "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end

  process resize_to_fit: [250, 250]

  version :thumb do
    process resize_to_fit: [50, 50]
  end
end
