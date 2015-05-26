# inclusion of /etc/skel/.bashrc from Debian is good as it is...

# Debian packaging
export EMAIL="gui@iroqwa.org"
export QUILT_PATCHES=debian/patches
export QUILT_REFRESH_ARGS="-p ab --no-timestamps --no-index"
export DEB_BUILD_OPTIONS="parallel=$(grep --count processor /proc/cpuinfo)"

export EDITOR=vi

export HISTFILESIZE=9999999
export HISTSIZE=9999999
export HISTTIMEFORMAT='%F %T '

# keep colors
export LESS="-R"

source ~/liquidprompt/liquidprompt
