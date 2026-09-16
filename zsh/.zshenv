. "$HOME/.cargo/env"

export PATH="/opt/homebrew/bin:/opt/homebrew/sbin:/usr/local/bin:/usr/local/sbin:/usr/bin:/bin:/usr/sbin:/sbin"

export ANDROID_HOME=~/Library/Android/sdk
export NDK_HOME=$ANDROID_HOME/ndk-bundle
if [ -d "$ANDROID_HOME" ]; then
    export PATH=$PATH:$ANDROID_HOME
    export PATH=$PATH:$ANDROID_HOME/platform-tools
    export PATH=$PATH:$ANDROID_HOME/tools
    export PATH=$PATH:$NDK_HOME
fi
export LANG=en_US.UTF-8
