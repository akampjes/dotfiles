FILEDIR='files'

Dir.chdir(FILEDIR) do
  Dir
    .glob('**/*', File::FNM_DOTMATCH) # Include hidden files
    .select {|f| !File.directory?(f) } # Only files
    .each do |f|

    # file has a directory
    if f =~ /\//
      dir_name = File.dirname(f)
      create_dir_cmd = "mkdir --parent ~/#{dir_name}"
      puts create_dir_cmd
      system(create_dir_cmd)
    end

    # symlink file
    symlink_file_cmd = "ln -sf #{Dir.pwd}/#{f} ~/#{f}"
    puts symlink_file_cmd
    system(symlink_file_cmd)
  end
end

