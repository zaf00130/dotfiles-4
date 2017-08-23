#!/bin/bash

. "$DOTPATH"/.zsh/20_functions.zsh

if ! has "tmux"; then
    if ! has "git"; then
        log_fail "ERROR: Require git"
        exit 1
    else
        case "$(get_os)" in
            osx)
                exit 1
                ;;

            linux)
                install libevent-dev
                install libncurses5-dev
                install automake
                install pkg-config
                if [ "$?" -eq 1 ]; then
                    exit 1
                fi
                ;;

            *)
                log_fail "ERROR: This script is only supported OSX or Linux"
                exit 1
                ;;
        esac

        cdirectory=`pwd`
        git clone https://github.com/tmux/tmux.git ${HOME}/tmp/tmux
        cd ${HOME}/tmp/tmux
        sh autogen.sh
        ./configure && make
        sudo make install
        cd "$cdirectory"
    fi

    log_pass "tmux: Installed tmux successfully"
else
    log_pass "tmux: Already installed"
fi

