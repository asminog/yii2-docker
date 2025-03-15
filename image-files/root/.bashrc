echo "PHP version: ${PHP_VERSION}"

if ! shopt -oq posix; then
  if [ -f /etc/bash_completion.d/yii ]; then
    . /etc/bash_completion.d/yii
  fi
  if [ -f /etc/bash_completion.d/composer ]; then
    . /etc/bash_completion.d/composer
  fi
fi

alias ll='ls -la'
