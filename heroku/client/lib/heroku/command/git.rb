require "heroku/command/base"

# manage git for apps
#
class Heroku::Command::Git < Heroku::Command::Base

  DEFAULT_REMOTE_NAME = 'heroku'

  # git:clone APP [DIRECTORY]
  #
  # clones a heroku app to your local machine at DIRECTORY (defaults to app name)
  #
  # -r, --remote REMOTE  # the git remote to create, default "heroku"
  #     --http-git       # HIDDEN: Use HTTP git protocol
  #
  #
  #Examples:
  #
  # $ heroku git:clone example
  # Cloning from app 'example'...
  # Cloning into 'example'...
  # remote: Counting objects: 42, done.
  # ...
  #
  def clone
    name = options[:app] || shift_argument || error("Usage: heroku git:clone APP [DIRECTORY]")
    directory = shift_argument
    validate_arguments!

    puts "Cloning from app '#{name}'..."
    system "git clone -o #{remote_name} #{git_url} #{directory}".strip
  end

  alias_command "clone", "git:clone"

  # git:remote [OPTIONS]
  #
  # adds a git remote to an app repo
  #
  # if OPTIONS are specified they will be passed to git remote add
  #
  # -r, --remote REMOTE        # the git remote to create, default "heroku"
  #     --http-git             # HIDDEN: Use HTTP git protocol
  #
  #Examples:
  #
  # $ heroku git:remote -a example
  # Git remote heroku added
  #
  def remote
    if git('remote').split("\n").include?(remote_name)
      update_git_remote(remote_name, git_url)
    else
      create_git_remote(remote_name, git_url)
    end
  end

  private

  def remote_name
    options[:remote] || DEFAULT_REMOTE_NAME
  end

  def git_url
    app_info = api.get_app(app).body
    if options[:http_git]
      "https://#{Heroku::Auth.http_git_host}/#{app_info['name']}.git"
    else
      app_info['git_url']
    end
  end
end
