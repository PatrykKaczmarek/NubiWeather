## Project Setup

### Instalation

1. Clone repository:

  ```bash
  # over https:
  git clone https://github.com/PatrykKaczmarek/NubiWeather.git
  # or over SSH:
  git clone git@github.com:PatrykKaczmarek/NubiWeather.git
  ```

2. Go to `{SRCROOT}/NubiWeather/App/` and duplicate `AppConfig.sample.plist`. Change its name to `AppConfig.plist`. Open it and use appropriate config values. Alternatively paste `AppConfig.plist` received from authors.

> [!IMPORTANT]  
> `AppConfig.plist` is added to `.gitignore` so you won't accidentally push it to the repository.


> [!TIP]  
> You can obtain your own `APIAppId` by signing up on the [main site](https://app.tomorrow.io) and getting one for free.


3. Open `NubiWeather.xcodeproj` file and build the project.
