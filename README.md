# Bitbucket Pipelines Pipe: Dorametrix

Sends a custom notification to [Slack](https://slack.com).

You can configure [Slack integration][slack integration] for your repository to get notifications on standard events, such as build failures and deployments. Use this pipe to send your own additional notifications at any point in your pipelines.

## YAML Definition

Add the following snippet to the script section of your `bitbucket-pipelines.yml` file:

```yaml
- pipe: atlassian/slack-notify:2.0.0
  variables:
    WEBHOOK_URL: "<string>"
    PRETEXT: "<string>"
    MESSAGE: "<string>"
    # PAYLOAD_FILE: '<string>' # Optional.
    # DEBUG: '<boolean>' # Optional.
```

## Variables

| Variable         | Usage                                                                                                                            |
| ---------------- | -------------------------------------------------------------------------------------------------------------------------------- |
| WEBHOOK_URL (\*) | Incoming Webhook URL. It is recommended to use a secure repository variable.                                                     |
| MESSAGE (\*)     | Notification attachment message.                                                                                                 |
| PRETEXT          | Notification pretext. - Default: `Notification sent from <pipeline link>`                                                        |
| PAYLOAD_FILE     | Path to JSON file containing custom payload. Build your own with [Slack Block Kit][slack block kit]. Default: `''(empty string)` |
| DEBUG            | Turn on extra debug information. Default: `false`.                                                                               |

_(\*) = required variable._

## Prerequisites

To send notifications to Slack, you need an Incoming Webhook URL. You can follow the instructions [here](https://api.slack.com/incoming-webhooks) to create one.

## Examples

Basic example:

```yaml
script:
  - pipe: atlassian/slack-notify:2.0.0
    variables:
      WEBHOOK_URL: $WEBHOOK_URL
      MESSAGE: "Hello, world!"
```

Advanced example:

If you want to pass complex string with structure elements, use double quotes

```yaml
script:
  - pipe: atlassian/slack-notify:2.0.0
    variables:
      WEBHOOK_URL: $WEBHOOK_URL
      MESSAGE: '"[${ENVIRONMENT_NAME}] build has exited with status $build_status"'
```

Use custom payload created with [Slack Block Kit][slack block kit] and modify payload with the [envsubst][envsubst] program that substitutes the values of environment variables:

```yaml
script:
  - envsubst < "payload.json.template" > "payload.json"
  - pipe: atlassian/slack-notify:2.0.0
    variables:
      WEBHOOK_URL: $WEBHOOK_URL
      PAYLOAD_FILE: payload.json
```

## Support

If you'd like help with this pipe, or you have an issue or feature request, [let us know on Community][community].

If you're reporting an issue, please include:

- the version of the pipe
- relevant logs and error messages
- steps to reproduce

## License

Copyright (c) 2018 Atlassian and others.
Apache 2.0 licensed, see [LICENSE.txt](LICENSE.txt) file.

[community]: https://community.atlassian.com/t5/forums/postpage/board-id/bitbucket-pipelines-questions?add-tags=pipes,slack
[slack integration]: https://confluence.atlassian.com/bitbucket/bitbucket-cloud-for-slack-945096776.html
[slack block kit]: https://api.slack.com/block-kit
[envsubst]: https://www.gnu.org/software/gettext/manual/html_node/envsubst-Invocation.html
