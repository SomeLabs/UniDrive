json.array! @files do |file|
  json.(file, :id, :path, :is_dir)
  json.name file.path.split('/').last
  json.provider file.application.provider
  json.info file.file_information, :size, :revision, :root, :mime_type, :modified
end