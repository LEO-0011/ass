# VideoEncoder Bot

A powerful Telegram bot for compressing, encoding, and manipulating video files. Built with Python (Pyrofork) and FFmpeg.

## 🚀 Features

### 🎥 Video Encoding
- **Formats**: Supports encoding to **MKV**, **MP4**, **AVI**.
- **Codecs**: Choose between **H264** (x264) and **H265** (HEVC).
- **Quality Control**: 
  - Custom **CRF** (Constant Rate Factor).
  - **Presets** (UltraFast to VerySlow).
  - **10-bit** encoding support.
- **Resolution**: Downscale videos to 1080p, 720p, 540p, 480p, 360p, or keep original.
- **Audio**: 
  - Change audio codecs (AAC, AC3, OPUS, MP3, etc.).
  - Custom bitrate and sample rates.
  - Mix/Remix audio channels (Stereo, Mono, 5.1).

### 🎛 Audio Rearrangement (`/af`)
- Interactively **reorder audio streams** in a video file using an inline button menu.
- Set the default audio track by moving it to the top.

### 📥 Download Methods
- **Telegram Files** (`/dl`): Reply to a video or document to process it.
- **Direct Links** (`/ddl`): Download files from direct URLs.
- **Batch Processing** (`/batch`): Process multiple links or files.

### 🛠 Utilities
- **Speedtest** (`/speedtest`): Check the server's internet speed and view a graphical report.
- **System Status** (`/status`): View real-time CPU, RAM, Disk usage, and active tasks queue.
- **Settings**: Per-user settings menu (`/settings`) to customize encoding preferences.
- **Watermark**: Add custom hardsub watermarks or metadata.
- **Subtitles**: Hardsub or copy soft subtitles.

## 🤖 Commands

| Command | Description |
| :--- | :--- |
| `/start` | Check if the bot is online. |
| `/help` | Show help message. |
| `/settings` | Open personal encoding settings menu. |
| `/reset` | Reset your settings to default. |
| `/vset` | View current video settings summary. |
| `/dl` | Download and process a Telegram file (Reply to message). |
| `/af` | Interactive audio stream rearrangement (Reply to message). |
| `/ddl [url]` | Download and process a file from a direct link. |
| `/speedtest` | Run an internet speed test. |
| `/status` | Show server stats and active queue. |
| `/stats` | Show bot statistics (Users, Uptime). |
| `/clean` | (Sudo) Clean download/encode directories. |
| `/restart` | (Sudo) Restart the bot. |
| `/update` | (Sudo) Update the bot from git. |

## ⚙️ Configuration

There are two ways to configure the bot:

### 1. Using a `config.env` file (Recommended for local development)

1.  Rename the `VideoEncoder/config.env.template` file to `config.env`.
2.  Open the `config.env` file and fill in the required values.

    ```
    # Basics #
    API_ID =  # https://my.telegram.org
    API_HASH = "" # https://my.telegram.org
    BOT_TOKEN = ""

    # Authorization # - List of id's, separated by space -
    OWNER_ID =
    SUDO_USERS = ""
    EVERYONE_CHATS = ""

    # Log Channel #
    LOG_CHANNEL =

    # Database #
    SESSION_NAME = "encoderbot"
    MONGO_URI = ""

    # Google Drive #
    INDEX_URL = ""
    DRIVE_DIR = ""

    # Optional #
    DOWNLOAD_DIR = "VideoEncoder/downloads/"
    ENCODE_DIR = "VideoEncoder/encodes/"
    ```

### 2. Using Environment Variables (Recommended for deployment)

You can also set the configuration variables as environment variables. This is the recommended method for deploying the bot on platforms like Heroku or Render.

**Required Variables:**

*   `API_ID`: Your Telegram API ID from [my.telegram.org](https://my.telegram.org).
*   `API_HASH`: Your Telegram API Hash from [my.telegram.org](https://my.telegram.org).
*   `BOT_TOKEN`: Your bot token from [@BotFather](https://t.me/BotFather).
*   `OWNER_ID`: Your Telegram user ID.
*   `MONGO_URI`: Your MongoDB connection string.

**Optional Variables:**

*   `SUDO_USERS`: A space-separated list of user IDs who have sudo access to the bot.
*   `EVERYONE_CHATS`: A space-separated list of chat IDs where everyone can use the bot.
*   `LOG_CHANNEL`: The ID of the Telegram channel where the bot will send logs.
*   `INDEX_URL`: The URL of your Google Drive index.
*   `DRIVE_DIR`: The ID of the Google Drive folder where you want to upload the encoded files.
*   `DOWNLOAD_DIR`: The directory where the bot will download files. Defaults to `VideoEncoder/downloads/`.
*   `ENCODE_DIR`: The directory where the bot will store encoded files. Defaults to `VideoEncoder/encodes/`.

## 📝 Notes

- **Task Limit**: Each user is limited to one active task at a time to ensure fair usage.
- **Settings Isolation**: Users cannot modify each other's settings via the interactive menu.
