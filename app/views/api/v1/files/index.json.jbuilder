json.array! @files do |file|
  json.(file, :id, :path, :is_dir)
  json.provider file.application.provider
end