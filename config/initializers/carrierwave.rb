::CarrierWave.configure do |config|
  config.storage             = :qiniu
  config.qiniu_access_key    = Settings.qiniu.qiniu_access_key
  config.qiniu_secret_key    = Settings.qiniu.qiniu_secret_key
  config.qiniu_bucket        = Settings.qiniu.qiniu_bucket
  config.qiniu_bucket_domain = Settings.qiniu.qiniu_bucket_domain
  config.qiniu_block_size    = Settings.qiniu.qiniu_block_size
  config.qiniu_protocal      = Settings.qiniu.qiniu_protocal
end
