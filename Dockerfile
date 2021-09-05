ARG NODE_VERSION=14

FROM thyrlian/android-sdk:latest AS android-sdk
ARG NODE_VERSION

# Get updates
RUN apt-get update -y && apt-get upgrade -y && \
    # clean up
    apt-get clean && apt-get autoremove

##############################################
#  Install NodeJS Version Manager (nvm)
##############################################

# Download and execute nvm install script
RUN wget -qO- https://raw.githubusercontent.com/nvm-sh/nvm/v0.38.0/install.sh | bash && \
    # Set up environment in ~/.profile
    echo '' >> ~/.profile && \
    echo 'export NVM_DIR="$HOME/.nvm"' >> ~/.profile && \
    echo '[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"' >> ~/.profile && \
    echo '' >> ~/.profile && \
    # Refrsh bash to nvm environment
    . ~/.profile && \
    # verify setup
    command -v nvm && \
    # install node version
    nvm install ${NODE_VERSION}
