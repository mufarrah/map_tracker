<br/>
<p align="center">
  <a href="https://github.com/mufarrah/map_tracker">
    <img src="assets/images/skippylogo_noTxtr.png" alt="Logo" width="80" height="80">
  </a>

  <h3 align="center">Map Tracker</h3>

  <p align="center">
    Futter map project
    <br/>
    <br/>
    <a href="https://github.com/mufarrah/map_tracker/issues">Report Bug</a>
    .
    <a href="https://github.com/mufarrah/map_tracker/issues">Request Feature</a>
  </p>
</p>

![Downloads](https://img.shields.io/github/downloads/mufarrah/map_tracker/total) ![Contributors](https://img.shields.io/github/contributors/mufarrah/map_tracker?color=dark-green) ![Forks](https://img.shields.io/github/forks/mufarrah/map_tracker?style=social) ![Stargazers](https://img.shields.io/github/stars/mufarrah/map_tracker?style=social) ![Issues](https://img.shields.io/github/issues/mufarrah/map_tracker)

## Table Of Contents

- [About the Project](#about-the-project)
- [Built With](#built-with)
- [Getting Started](#getting-started)
  - [Installation](#installation)
- [Roadmap](#roadmap)
- [Contributing](#contributing)
- [Authors](#authors)
- [Acknowledgements](#acknowledgements)

## About The Project

![Screen Shot](assets/images/gif_map.gif)

This project demonstrate a flutter map that recives location data from robots using websocket protocol and display location data on a map

You can find the packages used in pubspec.yaml file. running the project will not display anything, so you should connect to your websocket server to see results. also, you should create an access key and a token to show the map on mapbox website. all requirements are showen in the code files.

## Built With

Flutter, AWS, getx,

## Getting Started

### Installation

1. Clone the repo

```sh
https://github.com/mufarrah/map_tracker.git
```

2. Install pub packages

```sh
flutter pub get
```

3. before running you project, you should connect to your websocket that share location data and modify your code based on your ws response.

4. Run the project using chrome

```JS
flutter run -d chrome
```

\*Note: The ws package used in this project is only for web, so if you are trying to run this code on mobile, you should use "websocket_channel" instead of "dart html" package.

## Roadmap

See the [open issues](https://github.com/mufarrah/map_tracker/issues) for a list of proposed features (and known issues).

## Contributing

Contributions are what make the open source community such an amazing place to be learn, inspire, and create. Any contributions you make are **greatly appreciated**.

- If you have suggestions for adding or removing projects, feel free to [open an issue](https://github.com/mufarrah/map_tracker/issues/new) to discuss it, or directly create a pull request after you edit the _README.md_ file with necessary changes.
- Please make sure you check your spelling and grammar.
- Create individual PR for each suggestion.
- Please also read through the [Code Of Conduct](https://github.com/mufarrah/map_tracker/blob/main/CODE_OF_CONDUCT.md) before posting your first idea as well.

### Creating A Pull Request

1. Fork the Project
2. Create your Feature Branch (`git checkout -b feature/AmazingFeature`)
3. Commit your Changes (`git commit -m 'Add some AmazingFeature'`)
4. Push to the Branch (`git push origin feature/AmazingFeature`)
5. Open a Pull Request

## Authors

- **A.Rahman Mufarrah** - _Frontend Developer_ - [A.Rahman Mufarrah](https://github.com/mufarrah) - _Map Tracker_
