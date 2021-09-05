Base uses anroid-sdk image from https://github.com/thyrlian/AndroidSDK

# Note
Use `NODE_VERSION` to specify the node versio to install in the image. Defaults to `14` if not provided

## Example build command:
```
docker build --build-arg NODE_VERSION=10 --tag android-sdk:node10 .
```