if [[ -e /usr/local/share/chruby ]]; then
  # Load chruby
  source '/usr/local/share/chruby/chruby.sh'

  # Automatically switch rubies
  source '/usr/local/share/chruby/auto.sh'

  # Set a default ruby if a .ruby-version file exists in the home dir
  if [[ -f ~/.ruby-version ]]; then
    chruby $(cat ~/.ruby-version)
  fi
fi

alias pg-start='pg_ctl -D /usr/local/var/postgres -l logfile start'
alias pg-stop='pg_ctl -D /usr/local/var/postgres stop -s -m fast'
