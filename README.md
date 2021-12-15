# native-lambda-layer-boilerplate
Boilerplate to create a lambda layer for native dependencies from.

## Usage

1. Clone using `git clone --depth=1 https://github.com/marcesengel/native-lambda-layer-boilerplate.git <YOUR_PROJECT_NAME>`.
2. Delete the `.git` folder using `rm -rf .git` and optionally init a fresh repo using `git init`.
3. Overwrite the `container/build_lib.sh` script with your build. If you need any additional files reference them using relative paths and put them into the `container` directory.
4. Run `build.sh` in the project root.
5. Upload the created `layer.zip` to AWS.
6. Use your Layer :tada: :confetti_ball:

## Layer layout

AWS unpacks your layers to `/opt` in your lambda ([source](https://docs.aws.amazon.com/lambda/latest/dg/configuration-layers.html#configuration-layers-upload)). As the lambdas `$PATH` includes `/opt/bin` your layer should have any executables in a `bin` directory (to verify: `docker run --rm lambci/lambda-base-2 /bin/bash -c 'echo $PATH'`).
