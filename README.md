# Bitbucket Pipelines Pipe: `dorametrix-pipe`

Conveniently call [Dorametrix](https://github.com/mikaelvesavuori/dorametrix) to create a deployment event.

Looking for a demo? In that case you might be interested in the [Dorametrix Pipe demo](https://github.com/mikaelvesavuori/demo-dorametrix-pipe).

## YAML Definition

Add the following snippet to the script section of your `bitbucket-pipelines.yml` file:

```yml
- pipe: docker://mikaelvesavuori/dorametrix-pipe:1.0.0
  variables:
    ENDPOINT: "$ENDPOINT"
    API_KEY: "$API_KEY"
    PRODUCT: "$BITBUCKET_REPO_SLUG"
```

## Variables

Ideally set these as repository variables ("secrets").

### `endpoint`

Environment variable name: `ENDPOINT`.

Dorametrix API endpoint, in the format `https://mydomain.com/stagename`.

### `api-key`

Environment variable name: `API_KEY`.

Dorametrix API token.

### `product` (optional)

Environment variable name: `PRODUCT`.

The product name can be optionally set. If not, it will default to the repository name.

## Details

This Action uses two secrets: `ENDPOINT` and `API_KEY`, as described above.

## Prerequisites

- Set the required environment variables, `ENDPOINT` and `API_KEY`.
- Always ensure you have secure settings regarding what actions you allow.
- Note that Dorametrix will _not_ work without access to the Git history (i.e. `with.fetch-depth: 0`).

## Examples

```yml
image:
  name: atlassian/default-image:3

pipelines:
  default:
    - step:
        name: Dorametrix
        script:
          - pipe: docker://mikaelvesavuori/dorametrix-pipe:1.0.0
            variables:
              ENDPOINT: "$ENDPOINT"
              API_KEY: "$API_KEY"
              PRODUCT: "$BITBUCKET_REPO_SLUG"
```

## Support

Please create an issue on [GitHub](https://github.com/mikaelvesavuori/dorametrix-pipe/issues).

If you're reporting an issue, please include:

- The version of the pipe
- Relevant logs and error messages
- Steps to reproduce the issue
