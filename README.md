# mbot2

Lambda to receive Slack commands, deployed to AWS via Serverless.

## Contributing

### Environment setup

1. Install Node with `yarn`
1. Install Python with `pip`
1. Install requirements
    ```sh
    make install
    ```
1. Setup environment variables, including `$PATH` modification
    ```sh
    cp .envrc.example .envrc
    # replace placeholders
    ```
1. Configure serverless
    ```sh
    make config-deploy
    ```

### Deploying

1. To deploy lambda:
    ```sh
    make deploy
    ```
1. To destroy all deployed lambdas:
    ```sh
    make destroy
    ```

### Adding new functions

To add a lambda `foo`:

1. add the following to the top level directory
    ```
    \_ foo
       - lambda.py
       - requirements.txt
    ```

    where `lambda.py` has a `handle` function defined globally
1. Update `serverless.yml`

    ```yaml
    functions:

      ...

      foo:
        name: foo-${opt:stage}
        handler: lambda.handle
        package:
          include:
            - foo
          artifact: ${self:custom.pkgPyFuncs.buildDir}/foo-${opt:stage}.zip
    ```
1. To reuse modules in `lib`, simply add `import bar` where `./lib/bar.py` exists
