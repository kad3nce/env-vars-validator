class EnvVarsValidator
  @@last_error = nil

  def self.last_error
    @@last_error
  end

  def self.source_from_ruby_files(starting_dir)
    Dir.glob(File.join(starting_dir, '**', '*.rb')).
      reject { |file_path| file_path.include?('vendor') }.
      map { |file_path| File.read(file_path) }.
      join("\n")
  end

  def self.used_env_vars(starting_dir)
    source_from_ruby_files(starting_dir).
      scan(/ENV\[(?:'|")([^\]]+)(?:'|")\]/).
      flatten.
      uniq.
      sort
  end

  def self.validate(starting_dir)
    declared_env_vars = ENV.keys

    missing_env_vars = used_env_vars(starting_dir) - declared_env_vars

    unless missing_env_vars.empty?
      @@last_error = "The following env vars are required and have not been defined:\n  #{missing_env_vars.sort.join("\n  ")}"
      return false
    end

    true
  end
end
