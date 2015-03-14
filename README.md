# Env Vars Validator

Greps all Ruby files below the given starting dir for usage of the ENV hash and ensures that any ENV vars used have been defined.

# Example Usage

(assuming this code is placed in the entry point script at the root of your project's source tree)

```ruby
require 'env_vars_validator'

unless EnvVarsValidator.validate(File.dirname(__FILE__))
  puts EnvVarsValidator.last_error
  exit(1)
end
```

`EnvVarsValidator.validate` takes a directory as its single argument. It will scan the source code of all `*.rb` files in the directory tree starting at the directory it was passed (excluding any "vendor" folders). The method returns `true` if all ENV vars used in your source code have been declared, `false` otherwise. In the event that the moethod returns `false`, `EnvVarsValidator.last_error` will be populated with a descriptive error message something like this:

```
The following env vars are required and have not been defined:
  DB_USER
  DB_PASS
```
