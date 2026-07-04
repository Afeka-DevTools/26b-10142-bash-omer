# Bash scripting - home assignment

**Omer Peled - 209110519**

This is a home assignment project for the Development tools course at Afeka college.

## Running scripts

First, clone the repo and enter its root directory:

```sh
git clone https://github.com/Afeka-DevTools/26b-10142-bash-omer
cd 26b-10142-bash-omer
```

Make sure the script you would like to run is executable:

```sh
chmod +x ./scripts/script.sh
```

Where `script.sh` should be replaced with the name of the chosen script.

Then you can run it with:

```sh
./scripts/script.sh
```

## Scripts

The following scripts are located in the `scripts/` directory:

### `user-info.sh`

Shows info about the current user - including their username, home directory, groups and shell.

### `prefix-txt.sh`

Finds all `.txt` files in the current directory and adds a given prefix to their name.

Usage:

```sh
prefix-txt.sh <prefix>
```

where `<prefix>` should be replaced with the prefix you want to add.

### `count-ext.sh`

Counts how many files with a specified file extension are present in the current directory; Displays a user friendly message with the result.

Usage:

```sh
count-ext.sh <ext>
```

where `<ext>` should be replaced with a file extension, NOT including a dot at the start. If it starts with a dot, the script will exit with an error.

Example:

```sh
count-ext.sh txt
```

### `timer.sh`

Counts down from a specified time in the format `HH:MM:SS`.

Usage:

```sh
timer.sh HH:MM:SS
```

Example:

```sh
timer.sh 00:02:30
```

### `fetch-weather.sh`

Fetches the weather for a given location from [wttr.in](https://github.com/chubin/wttr.in) (specifically its fallback URL, `wttr.is`), a free weather API.

Usage:

```sh
fetch-weather.sh <location>
```

where `<location>` should be replaced with the name of a location, like a city name. If that name includes spaces, make sure to wrap the entire name in quotes.

Example:

```sh
fetch-weather.sh "Tel Aviv"
```
