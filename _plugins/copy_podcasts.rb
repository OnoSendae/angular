Jekyll::Hooks.register :site, :post_write do |site|
  source_dir = File.join(site.source, 'assets', 'podcasts')
  dest_dir = File.join(site.dest, 'assets', 'podcasts')
  
  if File.directory?(source_dir)
    FileUtils.mkdir_p(dest_dir)
    FileUtils.cp_r(Dir.glob(File.join(source_dir, '*')), dest_dir)
    Jekyll.logger.info "Copied podcasts to #{dest_dir}"
  end
end

