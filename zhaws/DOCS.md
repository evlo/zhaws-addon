# Home Assistant Add-on: ZHAWS

## Installation

Follow these steps to get the add-on installed on your system:

1. Navigate in your Home Assistant frontend to **Supervisor** -> **Add-on Store**.
2. Find the "ZHAWS" add-on and click it.
3. Click on the "INSTALL" button.

## How to use

The add-on needs to know where your Zigbee stick can be found, and therefore,
you'll need to configure the add-on to point to the right device.

If you're using Home Assistant you may find the correct value for this on the
`Supervisor -> System -> Host system -> Hardware` page. It is recommended
to use a "by-id" path to the device if one exists, as it is not subject to
change if other devices are added to the system.

1. Replace `null` in the `device` option in the add-on configuration and specify
   the device name in quotes: e.g., something like
   `"/dev/serial/by-id/usb-0658_0200-if00"`,
   `"/dev/ttyUSB0"`, `"/dev/ttyAMA0"`, or `"/dev/ttyACM0"`.
2. Click on "SAVE" to save the add-on configuration.
3. Start the add-on.
4. Add the ZHAWS integration to Home Assistant, see documentation:
   <https://www.home-assistant.io/integrations/zha>

## Configuration

Add-on configuration:

```yaml
device: /dev/ttyUSB0
```

### Option `device`

The device address of your Zigbee controller.

If you're using Home Assistant you may find the correct value for this on the
`Supervisor -> System -> Host system -> Hardware` page. It is recommended
to use a "by-id" path to the device if one exists, as it is not subject to
change if other devices are added to the system.

In most cases this looks like one of the following:

- `"/dev/serial/by-id/usb-0658_0200-if00"`
- `"/dev/ttyUSB0"`
- `"/dev/ttyAMA0"`
- `"/dev/ttyACM0"`

### Option `log_level` (optional)

This option sets the log level of ZHAWS. Valid options are:

- silly
- debug
- verbose
- http
- info
- warn
- error

If no `log_level` is specified, the log level will be set to the level set in
the Supervisor.

## Known issues and limitations

- Your hardware needs to be compatible with the ZHAWS library

## Support

Got questions?

You have several options to get them answered:

- The [Home Assistant Discord Chat Server][discord].
- The Home Assistant [Community Forum][forum].
- Join the [Reddit subreddit][reddit] in [/r/homeassistant][reddit]

In case you've found a bug, please [open an issue on our GitHub][issue].

[discord]: https://discord.gg/c5DvZ4e
[forum]: https://community.home-assistant.io
[issue]: https://github.com/home-assistant/hassio-addons/issues
[reddit]: https://reddit.com/r/homeassistant
