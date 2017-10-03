require "shrine"
require "shrine/storage/file_system"
require "shrine/storage/s3"
 
s3_options = {
    access_key_id:      ENV['S3_KEY'],
    secret_access_key:  ENV['S3_SECRET'],
    region:             ENV['S3_REGION'],
    bucket:             ENV['S3_BUCKET'],
}
 
Shrine.storages = {
    cache: Shrine::Storage::FileSystem.new("public", prefix: "uploads/cache"),
    store: Shrine::Storage::S3.new(prefix: "store", **s3_options)
}

Shrine.plugin :activerecord
Shrine.plugin :logging, logger: Rails.logger
Shrine.plugin :validation_helpers
Shrine.plugin :presign_endpoint
Shrine.plugin :backgrounding

Shrine::Attacher.promote { |data| PromoteJob.perform_async(data) }
Shrine::Attacher.delete { |data| DeleteJob.perform_async(data) }