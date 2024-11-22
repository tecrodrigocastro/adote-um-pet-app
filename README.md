<div align="left" style="position: relative;">
<img src="adote-um-pet-app.png" align="right" width="30%" style="margin: -20px 0 0 20px;">
<h1>ADOTE UM PET</h1>
<p align="left">
	<em>Bringing Tails and Hearts Together</em>
</p>
<p align="left">
	<!-- Shields.io badges disabled, using skill icons. --></p>
<p align="left">Built with the technologies:</p>
<p align="left">
	<a href="https://skillicons.dev">
		<img src="https://skillicons.dev/icons?i=dart,gradle,swift">
	</a></p>
</div>
<br clear="right">

## 🔗 Table of Contents

I. [📍 Overview](#-overview)
II. [👾 Features](#-features)
III. [📁 Project Structure](#-project-structure)
IV. [🚀 Getting Started](#-getting-started)
V. [📌 Project Roadmap](#-project-roadmap)
VI. [🔰 Contributing](#-contributing)
VII. [🎗 License](#-license)
VIII. [🙌 Acknowledgments](#-acknowledgments)

---

## 📍 Overview

The "adote-um-pet-app" is a Flutter-based mobile application designed to streamline the pet adoption process. It offers features like real-time pet listings, user-friendly search filters, and interactive adoption forms. Targeted at prospective pet owners and animal shelters, this app simplifies finding and adopting pets, enhancing the user experience and increasing adoption rates.

---

## 👾 Features

|      | Feature         | Summary       |
| :--- | :---:           | :---          |
| ⚙️  | **Architecture**  | <ul><li>Utilizes a multi-platform approach with dependencies on Dart, Swift, Kotlin, and C++.</li><li>Structured with support for both mobile (iOS, Android) and desktop (Windows, Linux) platforms.</li><li>Employs a modular approach with separate directories and configuration files for different platforms.</li></ul> |
| 🔩 | **Code Quality**  | <ul><li>Includes multiple configuration files like `analysis_options.yaml` for Dart which suggests a focus on maintaining code quality.</li><li>Use of modern programming languages and tools indicates adherence to current software development practices.</li><li>Presence of multiple language files and platform-specific code suggests complexity that requires robust quality control.</li></ul> |
| 📄 | **Documentation** | <ul><li>Documentation is primarily in Dart, with extensive use of additional config files (yaml, plist, xcconfig) indicating detailed setup and configuration documentation.</li><li>Multiple package managers and container tools documented, showing a comprehensive setup guide.</li><li>Usage of badges and markdown in documentation for better readability and accessibility.</li></ul> |
| 🔌 | **Integrations**  | <ul><li>Integrates with multiple build systems and package managers like Gradle, CMake, and Pub.</li><li>Supports containerization with Podman, indicating readiness for scalable deployments.</li><li>Platform-specific integrations with iOS and Android for mobile deployment and feature integration.</li></ul> |
| 🧩 | **Modularity**    | <ul><li>Project structure suggests a high degree of modularity with separate build configurations and dependency management for different components.</li><li>Use of platform-specific files and directories supports independent module development and maintenance.</li><li>Codebase includes platform-specific plugins and extensions, enhancing modularity.</li></ul> |
| 🧪 | **Testing**       | <ul><li>Lack of explicit mention of testing frameworks or test files in the provided details suggests potential area for improvement in testing practices.</li><li>Dependency on multiple programming environments implies a need for comprehensive multi-platform testing strategies.</li><li>Modular architecture could facilitate unit and integration testing of individual components.</li></ul> |
| ⚡️  | **Performance**   | <ul><li>Use of compiled languages like Dart could enhance performance for compute-intensive operations.</li><li>Flutter's performance features for smooth UI at 120 FPS could be leveraged for responsive app interfaces.</li><li>Performance optimization may be necessary for cross-platform compatibility and efficiency.</li></ul> |

---

## 📁 Project Structure

```sh
└── adote-um-pet-app/
    ├── README.md
    ├── analysis_options.yaml
    ├── android
    │   ├── .gitignore
    │   ├── app
    │   │   ├── build.gradle
    │   │   └── src
    │   │       ├── debug
    │   │       │   └── AndroidManifest.xml
    │   │       ├── main
    │   │       │   ├── AndroidManifest.xml
    │   │       │   ├── kotlin
    │   │       │   └── res
    │   │       └── profile
    │   │           └── AndroidManifest.xml
    │   ├── build.gradle
    │   ├── gradle
    │   │   └── wrapper
    │   │       └── gradle-wrapper.properties
    │   ├── gradle.properties
    │   └── settings.gradle
    ├── design_system
    │   ├── .gitignore
    │   ├── .metadata
    │   ├── CHANGELOG.md
    │   ├── LICENSE
    │   ├── README.md
    │   ├── analysis_options.yaml
    │   ├── assets
    │   │   ├── icons
    │   │   │   ├── adopt-drawer.png
    │   │   │   ├── donate-drawer.png
    │   │   │   ├── messages-drawer.png
    │   │   │   ├── my-account-drawer.png
    │   │   │   └── petinha-drawer.png
    │   │   └── images
    │   │       ├── bird-button.png
    │   │       ├── cat-button.png
    │   │       ├── cat-choose.png
    │   │       ├── coelho-button.png
    │   │       ├── dog-button.png
    │   │       ├── dog-choose.png
    │   │       └── logo.png
    │   ├── lib
    │   │   ├── design_system.dart
    │   │   └── src
    │   │       ├── buttons
    │   │       │   ├── buttons.dart
    │   │       │   ├── primary_button_ds.dart
    │   │       │   └── selectable_button.dart
    │   │       ├── drawer
    │   │       │   ├── drawer_ds.dart
    │   │       │   └── drawer_item.dart
    │   │       ├── icons
    │   │       │   ├── app_icons.dart
    │   │       │   └── icons.dart
    │   │       ├── image
    │   │       │   ├── app_image.dart
    │   │       │   └── image.dart
    │   │       ├── inputs
    │   │       │   ├── inputs.dart
    │   │       │   ├── text_input_ds.dart
    │   │       │   └── text_input_gray_ds.dart
    │   │       └── theme
    │   │           ├── app_colors.dart
    │   │           ├── app_theme.dart
    │   │           └── theme.dart
    │   └── pubspec.yaml
    ├── devtools_options.yaml
    ├── ios
    │   ├── .gitignore
    │   ├── Flutter
    │   │   ├── AppFrameworkInfo.plist
    │   │   ├── Debug.xcconfig
    │   │   └── Release.xcconfig
    │   ├── Podfile
    │   ├── Podfile.lock
    │   ├── Runner
    │   │   ├── AppDelegate.swift
    │   │   ├── Assets.xcassets
    │   │   │   ├── AppIcon.appiconset
    │   │   │   │   ├── Contents.json
    │   │   │   │   ├── Icon-App-1024x1024@1x.png
    │   │   │   │   ├── Icon-App-20x20@1x.png
    │   │   │   │   ├── Icon-App-20x20@2x.png
    │   │   │   │   ├── Icon-App-20x20@3x.png
    │   │   │   │   ├── Icon-App-29x29@1x.png
    │   │   │   │   ├── Icon-App-29x29@2x.png
    │   │   │   │   ├── Icon-App-29x29@3x.png
    │   │   │   │   ├── Icon-App-40x40@1x.png
    │   │   │   │   ├── Icon-App-40x40@2x.png
    │   │   │   │   ├── Icon-App-40x40@3x.png
    │   │   │   │   ├── Icon-App-60x60@2x.png
    │   │   │   │   ├── Icon-App-60x60@3x.png
    │   │   │   │   ├── Icon-App-76x76@1x.png
    │   │   │   │   ├── Icon-App-76x76@2x.png
    │   │   │   │   └── Icon-App-83.5x83.5@2x.png
    │   │   │   └── LaunchImage.imageset
    │   │   │       ├── Contents.json
    │   │   │       ├── LaunchImage.png
    │   │   │       ├── LaunchImage@2x.png
    │   │   │       ├── LaunchImage@3x.png
    │   │   │       └── README.md
    │   │   ├── Base.lproj
    │   │   │   ├── LaunchScreen.storyboard
    │   │   │   └── Main.storyboard
    │   │   ├── Info.plist
    │   │   └── Runner-Bridging-Header.h
    │   ├── Runner.xcodeproj
    │   │   ├── project.pbxproj
    │   │   ├── project.xcworkspace
    │   │   │   ├── contents.xcworkspacedata
    │   │   │   └── xcshareddata
    │   │   │       ├── IDEWorkspaceChecks.plist
    │   │   │       └── WorkspaceSettings.xcsettings
    │   │   └── xcshareddata
    │   │       └── xcschemes
    │   │           └── Runner.xcscheme
    │   ├── Runner.xcworkspace
    │   │   ├── contents.xcworkspacedata
    │   │   └── xcshareddata
    │   │       ├── IDEWorkspaceChecks.plist
    │   │       └── WorkspaceSettings.xcsettings
    │   └── RunnerTests
    │       └── RunnerTests.swift
    ├── lib
    │   ├── main.dart
    │   └── src
    │       ├── app
    │       │   └── features
    │       │       ├── auth
    │       │       ├── donate
    │       │       └── message
    │       ├── app_widget.dart
    │       ├── core
    │       │   ├── DI
    │       │   │   └── dependency_injector.dart
    │       │   ├── cache
    │       │   │   ├── cache.dart
    │       │   │   ├── cache_exception.dart
    │       │   │   ├── cache_interface.dart
    │       │   │   ├── cache_params.dart
    │       │   │   └── shared_preferences
    │       │   ├── client_http
    │       │   │   ├── app_response.dart
    │       │   │   ├── client_http.dart
    │       │   │   ├── client_interceptor_interface.dart
    │       │   │   ├── dio
    │       │   │   ├── rest_client_exception.dart
    │       │   │   ├── rest_client_http_message.dart
    │       │   │   ├── rest_client_interface.dart
    │       │   │   ├── rest_client_multipart.dart
    │       │   │   ├── rest_client_request.dart
    │       │   │   └── rest_client_response.dart
    │       │   ├── errors
    │       │   │   ├── base_exception.dart
    │       │   │   ├── default_exception.dart
    │       │   │   ├── errors.dart
    │       │   │   ├── not_found_exception.dart
    │       │   │   ├── server_exception.dart
    │       │   │   └── unauthorized_exception.dart
    │       │   ├── features
    │       │   │   ├── choose
    │       │   │   └── onboarding
    │       │   ├── logger
    │       │   │   ├── app_logger.dart
    │       │   │   └── logger_app_logger_impl.dart
    │       │   ├── typedefs
    │       │   │   └── types.dart
    │       │   ├── usecase
    │       │   │   └── usecase_interface.dart
    │       │   └── utils
    │       │       ├── end_points.dart
    │       │       ├── loading_start.dart
    │       │       └── show_snack_bar.dart
    │       └── routes.dart
    ├── linux
    │   ├── .gitignore
    │   ├── CMakeLists.txt
    │   ├── flutter
    │   │   ├── CMakeLists.txt
    │   │   ├── generated_plugin_registrant.cc
    │   │   ├── generated_plugin_registrant.h
    │   │   └── generated_plugins.cmake
    │   ├── main.cc
    │   ├── my_application.cc
    │   └── my_application.h
    ├── macos
    │   ├── .gitignore
    │   ├── Flutter
    │   │   ├── Flutter-Debug.xcconfig
    │   │   ├── Flutter-Release.xcconfig
    │   │   └── GeneratedPluginRegistrant.swift
    │   ├── Podfile
    │   ├── Runner
    │   │   ├── AppDelegate.swift
    │   │   ├── Assets.xcassets
    │   │   │   └── AppIcon.appiconset
    │   │   │       ├── Contents.json
    │   │   │       ├── app_icon_1024.png
    │   │   │       ├── app_icon_128.png
    │   │   │       ├── app_icon_16.png
    │   │   │       ├── app_icon_256.png
    │   │   │       ├── app_icon_32.png
    │   │   │       ├── app_icon_512.png
    │   │   │       └── app_icon_64.png
    │   │   ├── Base.lproj
    │   │   │   └── MainMenu.xib
    │   │   ├── Configs
    │   │   │   ├── AppInfo.xcconfig
    │   │   │   ├── Debug.xcconfig
    │   │   │   ├── Release.xcconfig
    │   │   │   └── Warnings.xcconfig
    │   │   ├── DebugProfile.entitlements
    │   │   ├── Info.plist
    │   │   ├── MainFlutterWindow.swift
    │   │   └── Release.entitlements
    │   ├── Runner.xcodeproj
    │   │   ├── project.pbxproj
    │   │   ├── project.xcworkspace
    │   │   │   └── xcshareddata
    │   │   │       └── IDEWorkspaceChecks.plist
    │   │   └── xcshareddata
    │   │       └── xcschemes
    │   │           └── Runner.xcscheme
    │   ├── Runner.xcworkspace
    │   │   ├── contents.xcworkspacedata
    │   │   └── xcshareddata
    │   │       └── IDEWorkspaceChecks.plist
    │   └── RunnerTests
    │       └── RunnerTests.swift
    ├── pubspec.lock
    ├── pubspec.yaml
    ├── web
    │   ├── favicon.png
    │   ├── icons
    │   │   ├── Icon-192.png
    │   │   ├── Icon-512.png
    │   │   ├── Icon-maskable-192.png
    │   │   └── Icon-maskable-512.png
    │   ├── index.html
    │   └── manifest.json
    └── windows
        ├── .gitignore
        ├── CMakeLists.txt
        ├── flutter
        │   ├── CMakeLists.txt
        │   ├── generated_plugin_registrant.cc
        │   ├── generated_plugin_registrant.h
        │   └── generated_plugins.cmake
        └── runner
            ├── CMakeLists.txt
            ├── Runner.rc
            ├── flutter_window.cpp
            ├── flutter_window.h
            ├── main.cpp
            ├── resource.h
            ├── resources
            │   └── app_icon.ico
            ├── runner.exe.manifest
            ├── utils.cpp
            ├── utils.h
            ├── win32_window.cpp
            └── win32_window.h
```


### 📂 Project Index
<details open>
	<summary><b><code>ADOTE-UM-PET-APP/</code></b></summary>
	<details> <!-- ios Submodule -->
		<summary><b>ios</b></summary>
		<blockquote>
			<table>
			<tr>
				<td><b><a href='https://github.com/tecrodrigocastro/adote-um-pet-app/blob/master/ios/Podfile'>Podfile</a></b></td>
				<td>- The ios/Podfile configures the iOS project dependencies for a Flutter application, ensuring the correct setup of CocoaPods for the iOS platform<br>- It disables analytics to improve build times, establishes project configurations, and integrates Flutter-specific settings to manage dependencies and build processes effectively.</td>
			</tr>
			</table>
			<details>
				<summary><b>Runner.xcworkspace</b></summary>
				<blockquote>
					<table>
					<tr>
						<td><b><a href='https://github.com/tecrodrigocastro/adote-um-pet-app/blob/master/ios/Runner.xcworkspace/contents.xcworkspacedata'>contents.xcworkspacedata</a></b></td>
						<td>- Manages the workspace configuration for an iOS application by referencing essential project components<br>- It integrates the main application project, Runner.xcodeproj, with its dependencies managed by CocoaPods, indicated by Pods.xcodeproj<br>- This setup facilitates the development and maintenance processes within the Xcode IDE, ensuring smooth project organization and build management.</td>
					</tr>
					</table>
					<details>
						<summary><b>xcshareddata</b></summary>
						<blockquote>
							<table>
							<tr>
								<td><b><a href='https://github.com/tecrodrigocastro/adote-um-pet-app/blob/master/ios/Runner.xcworkspace/xcshareddata/WorkspaceSettings.xcsettings'>WorkspaceSettings.xcsettings</a></b></td>
								<td>- Disables the preview functionality within the iOS workspace settings of the project<br>- Located in the xcworkspace directory, it configures environmental settings specific to the iOS version of the application, ensuring that preview features are turned off to possibly streamline the build process or adhere to specific development protocols.</td>
							</tr>
							<tr>
								<td><b><a href='https://github.com/tecrodrigocastro/adote-um-pet-app/blob/master/ios/Runner.xcworkspace/xcshareddata/IDEWorkspaceChecks.plist'>IDEWorkspaceChecks.plist</a></b></td>
								<td>- Manages Xcode workspace settings specific to 32-bit compatibility warnings<br>- Located within the iOS application's workspace directory, it ensures that developers are alerted about potential issues when running the app on older architectures, thereby maintaining compatibility and enhancing the development process within the broader project architecture.</td>
							</tr>
							</table>
						</blockquote>
					</details>
				</blockquote>
			</details>
			<details>
				<summary><b>Runner.xcodeproj</b></summary>
				<blockquote>
					<table>
					<tr>
						<td><b><a href='https://github.com/tecrodrigocastro/adote-um-pet-app/blob/master/ios/Runner.xcodeproj/project.pbxproj'>project.pbxproj</a></b></td>
						<td>- The file `ios/Runner.xcodeproj/project.pbxproj` serves as a crucial component within the iOS application module of the project<br>- It is essentially the project file for Xcode, defining the configuration and organization of all source files, frameworks, and resources required to build the iOS application<br>- This file includes references to various source files such as `GeneratedPluginRegistrant.m` and `AppDelegate.swift`, which are integral for registering plugins and initializing the application, respectively<br>- It also manages dependencies like the `Pods_Runner.framework`, which suggests the use of CocoaPods for managing external libraries.

  Additionally, the file outlines the inclusion of test files such as `RunnerTests.swift`, indicating a setup for unit testing within the iOS project<br>- The presence of `AppFrameworkInfo.plist` in the resources section points to the configuration settings necessary for the application framework.

  Overall, this file is pivotal for the iOS app's compilation and execution, orchestrating how components are compiled, linked, and bundled into the final application<br>- It is a key part of the project's structure, ensuring that all parts of the iOS application are correctly integrated and maintained throughout the development lifecycle.</td>
  					</tr>
					</table>
					<details>
						<summary><b>xcshareddata</b></summary>
						<blockquote>
							<details>
								<summary><b>xcschemes</b></summary>
								<blockquote>
									<table>
									<tr>
										<td><b><a href='https://github.com/tecrodrigocastro/adote-um-pet-app/blob/master/ios/Runner.xcodeproj/xcshareddata/xcschemes/Runner.xcscheme'>Runner.xcscheme</a></b></td>
										<td>- Defines the configuration for building, testing, launching, profiling, and archiving the iOS application named Runner within the Xcode project<br>- It specifies settings for parallel builds, debugging, and the use of environment arguments, ensuring streamlined development cycles and efficient handling of build actions across different configurations and modes.</td>
									</tr>
									</table>
								</blockquote>
							</details>
						</blockquote>
					</details>
					<details>
						<summary><b>project.xcworkspace</b></summary>
						<blockquote>
							<table>
							<tr>
								<td><b><a href='https://github.com/tecrodrigocastro/adote-um-pet-app/blob/master/ios/Runner.xcodeproj/project.xcworkspace/contents.xcworkspacedata'>contents.xcworkspacedata</a></b></td>
								<td>- Manages the workspace configuration for the iOS application within the Xcode project<br>- It specifies the workspace settings and references the project itself, ensuring that the development environment is correctly set up for modifications and builds<br>- This setup is crucial for maintaining the structure and dependencies of the iOS application as part of the larger project architecture.</td>
							</tr>
							</table>
							<details>
								<summary><b>xcshareddata</b></summary>
								<blockquote>
									<table>
									<tr>
										<td><b><a href='https://github.com/tecrodrigocastro/adote-um-pet-app/blob/master/ios/Runner.xcodeproj/project.xcworkspace/xcshareddata/WorkspaceSettings.xcsettings'>WorkspaceSettings.xcsettings</a></b></td>
										<td>- Configures workspace settings within the iOS application's Xcode project, specifically disabling the previews feature<br>- Located in the project's Xcode workspace directory, it plays a crucial role in managing development environment preferences that align with the broader architectural setup and operational protocols of the application.</td>
									</tr>
									<tr>
										<td><b><a href='https://github.com/tecrodrigocastro/adote-um-pet-app/blob/master/ios/Runner.xcodeproj/project.xcworkspace/xcshareddata/IDEWorkspaceChecks.plist'>IDEWorkspaceChecks.plist</a></b></td>
										<td>- Manages Xcode workspace settings specific to the iOS application within the project, ensuring compatibility and suppressing certain warnings during the development process<br>- It plays a crucial role in maintaining the development environment's integrity and configuration, particularly concerning 32-bit architecture compatibility warnings.</td>
									</tr>
									</table>
								</blockquote>
							</details>
						</blockquote>
					</details>
				</blockquote>
			</details>
			<details>
				<summary><b>Flutter</b></summary>
				<blockquote>
					<table>
					<tr>
						<td><b><a href='https://github.com/tecrodrigocastro/adote-um-pet-app/blob/master/ios/Flutter/AppFrameworkInfo.plist'>AppFrameworkInfo.plist</a></b></td>
						<td>- Defines essential configuration and metadata for the iOS application within the Flutter framework, including development region, executable name, bundle identifier, and version details<br>- It sets the minimum OS version requirement and specifies the application's bundle type as a framework, ensuring proper identification and functionality across iOS devices.</td>
					</tr>
					<tr>
						<td><b><a href='https://github.com/tecrodrigocastro/adote-um-pet-app/blob/master/ios/Flutter/Debug.xcconfig'>Debug.xcconfig</a></b></td>
						<td>- Integrates configuration settings for the iOS Flutter application's debug build, pulling in dependencies and environment-specific parameters from CocoaPods and generated sources<br>- This setup ensures that the debug version of the app aligns with the necessary configurations for successful compilation and runtime behavior, facilitating a streamlined development process within the iOS platform.</td>
					</tr>
					<tr>
						<td><b><a href='https://github.com/tecrodrigocastro/adote-um-pet-app/blob/master/ios/Flutter/Release.xcconfig'>Release.xcconfig</a></b></td>
						<td>- Incorporates configuration settings from external sources to streamline the release build process for the iOS platform within the Flutter framework<br>- By referencing specific configurations from the Pods dependency management and generated settings, it ensures consistent environment setup and optimizes the build performance for production releases.</td>
					</tr>
					</table>
				</blockquote>
			</details>
			<details>
				<summary><b>RunnerTests</b></summary>
				<blockquote>
					<table>
					<tr>
						<td><b><a href='https://github.com/tecrodrigocastro/adote-um-pet-app/blob/master/ios/RunnerTests/RunnerTests.swift'>RunnerTests.swift</a></b></td>
						<td>- RunnerTests.swift serves as a test suite for the iOS Runner application within the project<br>- It utilizes XCTest to potentially verify the functionality added to the Runner application, ensuring reliability and performance<br>- This setup encourages the development of robust, error-free software by facilitating regular and systematic testing.</td>
					</tr>
					</table>
				</blockquote>
			</details>
			<details>
				<summary><b>Runner</b></summary>
				<blockquote>
					<table>
					<tr>
						<td><b><a href='https://github.com/tecrodrigocastro/adote-um-pet-app/blob/master/ios/Runner/Runner-Bridging-Header.h'>Runner-Bridging-Header.h</a></b></td>
						<td>- Bridges native iOS code with Flutter plugins, enabling seamless integration and functionality enhancement in the iOS version of the application<br>- Located within the iOS-specific directory, it imports essential configurations from the GeneratedPluginRegistrant, ensuring all plugins are registered and available for use throughout the app's iOS environment.</td>
					</tr>
					<tr>
						<td><b><a href='https://github.com/tecrodrigocastro/adote-um-pet-app/blob/master/ios/Runner/AppDelegate.swift'>AppDelegate.swift</a></b></td>
						<td>- AppDelegate.swift serves as the primary entry point for the iOS application within the Flutter project, initializing the Flutter engine and registering generated plugins<br>- It ensures that the application is ready to handle Flutter-specific functionalities upon launch, integrating seamlessly with the underlying iOS system<br>- This setup is crucial for the app's performance and compatibility with iOS devices.</td>
					</tr>
					<tr>
						<td><b><a href='https://github.com/tecrodrigocastro/adote-um-pet-app/blob/master/ios/Runner/Info.plist'>Info.plist</a></b></td>
						<td>- Defines configuration settings for the iOS application "Adote Um Pet," including localization, display name, bundle identifiers, version details, and supported device orientations<br>- It also specifies launch and main storyboard files, enhancing the app's compatibility and user interface on various Apple devices.</td>
					</tr>
					</table>
					<details>
						<summary><b>Assets.xcassets</b></summary>
						<blockquote>
							<details>
								<summary><b>LaunchImage.imageset</b></summary>
								<blockquote>
									<table>
									<tr>
										<td><b><a href='https://github.com/tecrodrigocastro/adote-um-pet-app/blob/master/ios/Runner/Assets.xcassets/LaunchImage.imageset/Contents.json'>Contents.json</a></b></td>
										<td>- Manages the configuration of launch images for the iOS application, specifying different resolutions to support various device displays<br>- It includes three versions of the launch image to ensure optimal appearance across all device types, enhancing the user experience during app startup<br>- The JSON structure facilitates easy updates and maintenance of these assets by developers.</td>
									</tr>
									</table>
								</blockquote>
							</details>
							<details>
								<summary><b>AppIcon.appiconset</b></summary>
								<blockquote>
									<table>
									<tr>
										<td><b><a href='https://github.com/tecrodrigocastro/adote-um-pet-app/blob/master/ios/Runner/Assets.xcassets/AppIcon.appiconset/Contents.json'>Contents.json</a></b></td>
										<td>- Manages the configuration and assignment of various app icons for different Apple devices, ensuring that the correct icon sizes and resolutions are used for iPhones and iPads<br>- It specifies icons for multiple contexts, including standard application use and marketing purposes, across different screen resolutions and device models.</td>
									</tr>
									</table>
								</blockquote>
							</details>
						</blockquote>
					</details>
					<details>
						<summary><b>Base.lproj</b></summary>
						<blockquote>
							<table>
							<tr>
								<td><b><a href='https://github.com/tecrodrigocastro/adote-um-pet-app/blob/master/ios/Runner/Base.lproj/Main.storyboard'>Main.storyboard</a></b></td>
								<td>- Defines the user interface layout for the iOS application within the project, specifically setting up a FlutterViewController as the initial view controller<br>- It configures the view's dimensions, autoresizing behavior, and background color, ensuring the interface is adaptable to various screen sizes and orientations.</td>
							</tr>
							<tr>
								<td><b><a href='https://github.com/tecrodrigocastro/adote-um-pet-app/blob/master/ios/Runner/Base.lproj/LaunchScreen.storyboard'>LaunchScreen.storyboard</a></b></td>
								<td>- Defines the layout and visual elements of the iOS application's launch screen, utilizing an XML-based storyboard format<br>- It configures an image view centered within a white background, ensuring the app presents a branded appearance during startup, enhancing user experience from the initial interaction.</td>
							</tr>
							</table>
						</blockquote>
					</details>
				</blockquote>
			</details>
		</blockquote>
	</details>
	<details> <!-- lib Submodule -->
		<summary><b>lib</b></summary>
		<blockquote>
			<table>
			<tr>
				<td><b><a href='https://github.com/tecrodrigocastro/adote-um-pet-app/blob/master/lib/main.dart'>main.dart</a></b></td>
				<td>- Initializes the Flutter application by setting up essential configurations and dependencies<br>- It ensures the Flutter environment is ready, loads environment variables, configures dependency injection, and launches the main application widget<br>- This setup is crucial for the app's overall functionality and integration of its components, facilitating a smooth user experience and system operations.</td>
			</tr>
			</table>
			<details>
				<summary><b>src</b></summary>
				<blockquote>
					<table>
					<tr>
						<td><b><a href='https://github.com/tecrodrigocastro/adote-um-pet-app/blob/master/lib/src/routes.dart'>routes.dart</a></b></td>
						<td>- Defines the navigation structure for the application, setting up routes for user onboarding, authentication, and additional features like donation information<br>- It establishes an initial route for authentication and includes nested routes for login, registration, and welcome screens, alongside routes for choosing options and onboarding processes.</td>
					</tr>
					<tr>
						<td><b><a href='https://github.com/tecrodrigocastro/adote-um-pet-app/blob/master/lib/src/app_widget.dart'>app_widget.dart</a></b></td>
						<td>- AppWidget serves as the foundational widget for the application, integrating the design system and routing configurations<br>- It initializes the authentication management using Bloc and sets up the MaterialApp with predefined themes and routes, ensuring a cohesive user interface and navigation structure across the app.</td>
					</tr>
					</table>
					<details>
						<summary><b>core</b></summary>
						<blockquote>
							<details>
								<summary><b>features</b></summary>
								<blockquote>
									<details>
										<summary><b>choose</b></summary>
										<blockquote>
											<details>
												<summary><b>presentation</b></summary>
												<blockquote>
													<table>
													<tr>
														<td><b><a href='https://github.com/tecrodrigocastro/adote-um-pet-app/blob/master/lib/src/core/features/choose/presentation/choose_page.dart'>choose_page.dart</a></b></td>
														<td>- ChoosePage serves as a user interface within the application, presenting two main options: adopting or donating<br>- It utilizes visual elements and interactive containers to guide users either to initiate an adoption process or to navigate to donation information, enhancing user engagement through a visually appealing and straightforward layout.</td>
													</tr>
													</table>
												</blockquote>
											</details>
										</blockquote>
									</details>
									<details>
										<summary><b>onboarding</b></summary>
										<blockquote>
											<details>
												<summary><b>presentation</b></summary>
												<blockquote>
													<details>
														<summary><b>pages</b></summary>
														<blockquote>
															<table>
															<tr>
																<td><b><a href='https://github.com/tecrodrigocastro/adote-um-pet-app/blob/master/lib/src/core/features/onboarding/presentation/pages/onboarding_page.dart'>onboarding_page.dart</a></b></td>
																<td>- OnboardingPage serves as the introductory interface within the application, guiding new users through initial setup or features<br>- Positioned within the core features of the onboarding module, it leverages Flutter to create a stateful widget that dynamically presents the onboarding content, ensuring a smooth user transition into the app's environment.</td>
															</tr>
															</table>
														</blockquote>
													</details>
												</blockquote>
											</details>
										</blockquote>
									</details>
								</blockquote>
							</details>
							<details>
								<summary><b>typedefs</b></summary>
								<blockquote>
									<table>
									<tr>
										<td><b><a href='https://github.com/tecrodrigocastro/adote-um-pet-app/blob/master/lib/src/core/typedefs/types.dart'>types.dart</a></b></td>
										<td>- Defines a custom type alias `Output<T>` within the core functionality of the codebase, utilizing the `Either` type from the `fpdart` package<br>- This type encapsulates the dual nature of handling operations that may either result in a value of type `T` or an error represented by `BaseException`, streamlining error handling across the application.</td>
									</tr>
									</table>
								</blockquote>
							</details>
							<details>
								<summary><b>usecase</b></summary>
								<blockquote>
									<table>
									<tr>
										<td><b><a href='https://github.com/tecrodrigocastro/adote-um-pet-app/blob/master/lib/src/core/usecase/usecase_interface.dart'>usecase_interface.dart</a></b></td>
										<td>- Defines an abstract interface `UseCase` within the core framework, specifying a contract for all use cases across the application<br>- It mandates a method that executes business logic operations asynchronously, taking specific parameters and returning a typed result<br>- This structure ensures consistency and scalability in handling various business rules and data manipulations throughout the codebase.</td>
									</tr>
									</table>
								</blockquote>
							</details>
							<details>
								<summary><b>DI</b></summary>
								<blockquote>
									<table>
									<tr>
										<td><b><a href='https://github.com/tecrodrigocastro/adote-um-pet-app/blob/master/lib/src/core/DI/dependency_injector.dart'>dependency_injector.dart</a></b></td>
										<td>- Establishes the dependency injection framework for the application, configuring and managing dependencies for network clients, logging, authentication processes, and session management<br>- It utilizes the GetIt package to facilitate the creation and retrieval of instances, ensuring efficient resource handling and decoupling throughout the application's authentication feature.</td>
									</tr>
									</table>
								</blockquote>
							</details>
							<details>
								<summary><b>logger</b></summary>
								<blockquote>
									<table>
									<tr>
										<td><b><a href='https://github.com/tecrodrigocastro/adote-um-pet-app/blob/master/lib/src/core/logger/app_logger.dart'>app_logger.dart</a></b></td>
										<td>- AppLogger, defined within the core logger module, serves as the backbone for logging across the application<br>- It standardizes logging practices by providing methods for different levels of log messages, such as debug, error, warning, info, and fatal<br>- This abstraction ensures consistent logging behavior and facilitates easier maintenance and scalability of the logging system.</td>
									</tr>
									<tr>
										<td><b><a href='https://github.com/tecrodrigocastro/adote-um-pet-app/blob/master/lib/src/core/logger/logger_app_logger_impl.dart'>logger_app_logger_impl.dart</a></b></td>
										<td>- LoggerAppLoggerImpl serves as the implementation of the AppLogger interface, providing detailed logging capabilities across various levels such as debug, error, info, warning, and fatal<br>- It aggregates messages for batch processing and utilizes the Logger package to handle output, enhancing the traceability and debugging process within the application's architecture.</td>
									</tr>
									</table>
								</blockquote>
							</details>
							<details>
								<summary><b>cache</b></summary>
								<blockquote>
									<table>
									<tr>
										<td><b><a href='https://github.com/tecrodrigocastro/adote-um-pet-app/blob/master/lib/src/core/cache/cache_interface.dart'>cache_interface.dart</a></b></td>
										<td>- Defines the interface for caching mechanisms within the application, specifying methods for setting, retrieving, removing, and cleaning data<br>- The `ICache` interface ensures that any caching implementation adheres to a consistent protocol, facilitating data management and scalability across the system's architecture.</td>
									</tr>
									<tr>
										<td><b><a href='https://github.com/tecrodrigocastro/adote-um-pet-app/blob/master/lib/src/core/cache/cache_exception.dart'>cache_exception.dart</a></b></td>
										<td>- Defines a custom exception, CacheException, which extends from BaseException, specifically for handling errors related to caching operations within the application<br>- This exception enriches error handling by allowing more specific responses to cache-related issues, thereby improving the robustness and maintainability of the error management system.</td>
									</tr>
									<tr>
										<td><b><a href='https://github.com/tecrodrigocastro/adote-um-pet-app/blob/master/lib/src/core/cache/cache.dart'>cache.dart</a></b></td>
										<td>- Exports key components for caching functionality within the application, including exceptions specific to cache operations, a cache interface defining essential methods, and parameters that configure cache behavior<br>- These elements are crucial for implementing effective data storage and retrieval mechanisms across the software, enhancing performance and scalability.</td>
									</tr>
									<tr>
										<td><b><a href='https://github.com/tecrodrigocastro/adote-um-pet-app/blob/master/lib/src/core/cache/cache_params.dart'>cache_params.dart</a></b></td>
										<td>- Defines a class, CacheParams, crucial for managing caching mechanisms within the application<br>- It encapsulates parameters necessary for cache operations, specifically a key and a value<br>- This class is fundamental in enabling efficient data retrieval and storage, thereby optimizing performance and resource management across the software's architecture.</td>
									</tr>
									</table>
									<details>
										<summary><b>shared_preferences</b></summary>
										<blockquote>
											<table>
											<tr>
												<td><b><a href='https://github.com/tecrodrigocastro/adote-um-pet-app/blob/master/lib/src/core/cache/shared_preferences/shared_preferences_impl.dart'>shared_preferences_impl.dart</a></b></td>
												<td>- SharedPreferencesImpl serves as the concrete implementation of the ICache interface within the application's caching layer<br>- It manages data persistence using the SharedPreferences library, allowing storage, retrieval, modification, and deletion of user preferences and application data in a structured and type-safe manner.</td>
											</tr>
											</table>
										</blockquote>
									</details>
								</blockquote>
							</details>
							<details>
								<summary><b>errors</b></summary>
								<blockquote>
									<table>
									<tr>
										<td><b><a href='https://github.com/tecrodrigocastro/adote-um-pet-app/blob/master/lib/src/core/errors/unauthorized_exception.dart'>unauthorized_exception.dart</a></b></td>
										<td>- Defines a custom exception, UnauthorizedException, which extends from BaseException, specifically for handling authentication errors within the application<br>- It is structured to provide a clear and specific error message when a user or process fails to authenticate correctly, enhancing error management and debugging across the system.</td>
									</tr>
									<tr>
										<td><b><a href='https://github.com/tecrodrigocastro/adote-um-pet-app/blob/master/lib/src/core/errors/base_exception.dart'>base_exception.dart</a></b></td>
										<td>- Defines an abstract class BaseException that standardizes error handling across the application by encapsulating error messages, associated data, optional status codes, and stack traces<br>- This foundational component enhances the robustness and maintainability of error management within the system's architecture.</td>
									</tr>
									<tr>
										<td><b><a href='https://github.com/tecrodrigocastro/adote-um-pet-app/blob/master/lib/src/core/errors/errors.dart'>errors.dart</a></b></td>
										<td>- Centralizes the management of error handling by providing a collection of exception classes, including base, default, not found, and server exceptions<br>- These classes facilitate consistent error reporting and handling across the application, enhancing the robustness and maintainability of the system.</td>
									</tr>
									<tr>
										<td><b><a href='https://github.com/tecrodrigocastro/adote-um-pet-app/blob/master/lib/src/core/errors/server_exception.dart'>server_exception.dart</a></b></td>
										<td>- ServerException, defined within the core errors module, extends BaseException to handle server-related errors across the application<br>- It encapsulates error messages, specific error codes, and optional stack traces to aid in debugging and error reporting, enhancing the robustness and maintainability of error management within the system.</td>
									</tr>
									<tr>
										<td><b><a href='https://github.com/tecrodrigocastro/adote-um-pet-app/blob/master/lib/src/core/errors/default_exception.dart'>default_exception.dart</a></b></td>
										<td>- Defines a DefaultException class that extends BaseException, providing a structured way to handle generic errors throughout the application<br>- This class is essential for maintaining a consistent error handling strategy, allowing for clearer debugging and maintenance processes within the broader system architecture.</td>
									</tr>
									<tr>
										<td><b><a href='https://github.com/tecrodrigocastro/adote-um-pet-app/blob/master/lib/src/core/errors/not_found_exception.dart'>not_found_exception.dart</a></b></td>
										<td>- Defines a custom exception, `NotFoundException`, which extends from `BaseException`<br>- It is specifically used throughout the application to handle scenarios where a required resource or element is not found, enhancing error management by providing a clear and specific exception type for such cases.</td>
									</tr>
									</table>
								</blockquote>
							</details>
							<details>
								<summary><b>utils</b></summary>
								<blockquote>
									<table>
									<tr>
										<td><b><a href='https://github.com/tecrodrigocastro/adote-um-pet-app/blob/master/lib/src/core/utils/show_snack_bar.dart'>show_snack_bar.dart</a></b></td>
										<td>- ShowMessageSnackBar, located within the core utilities of the codebase, facilitates the display of customizable snack bars in the application<br>- It leverages the design system for consistent styling and supports dynamic iconography and color schemes, enhancing user feedback mechanisms across various parts of the application interface.</td>
									</tr>
									<tr>
										<td><b><a href='https://github.com/tecrodrigocastro/adote-um-pet-app/blob/master/lib/src/core/utils/end_points.dart'>end_points.dart</a></b></td>
										<td>- EndPoints in lib/src/core/utils/end_points.dart defines crucial URL paths for network communication within the application<br>- It establishes a base URL and specific endpoints for user authentication processes like login and registration, leveraging environment variables for configuration<br>- This setup centralizes the management of API routes, enhancing maintainability and scalability of network operations.</td>
									</tr>
									<tr>
										<td><b><a href='https://github.com/tecrodrigocastro/adote-um-pet-app/blob/master/lib/src/core/utils/loading_start.dart'>loading_start.dart</a></b></td>
										<td>- LoadingStart serves as a utility widget within the Flutter application, designed to manage initialization and cleanup processes for its child widgets<br>- It supports delayed initialization, allowing developers to specify a waiting period before executing setup logic, and provides a mechanism for clean resource disposal when the widget is removed from the widget tree.</td>
									</tr>
									</table>
								</blockquote>
							</details>
							<details>
								<summary><b>client_http</b></summary>
								<blockquote>
									<table>
									<tr>
										<td><b><a href='https://github.com/tecrodrigocastro/adote-um-pet-app/blob/master/lib/src/core/client_http/rest_client_interface.dart'>rest_client_interface.dart</a></b></td>
										<td>- Defines an abstract interface for HTTP client operations essential for network communication within the application<br>- It standardizes methods for HTTP requests such as POST, GET, PUT, DELETE, PATCH, and file uploads, alongside managing interceptors to modify requests and responses across the software's network layer.</td>
									</tr>
									<tr>
										<td><b><a href='https://github.com/tecrodrigocastro/adote-um-pet-app/blob/master/lib/src/core/client_http/rest_client_exception.dart'>rest_client_exception.dart</a></b></td>
										<td>- Defines a custom exception class, RestClientException, which extends the functionality of a base exception to handle errors specifically related to HTTP client operations<br>- It incorporates additional properties to capture error details and the associated HTTP response, enhancing error reporting and handling within the client-server communication framework of the application.</td>
									</tr>
									<tr>
										<td><b><a href='https://github.com/tecrodrigocastro/adote-um-pet-app/blob/master/lib/src/core/client_http/rest_client_http_message.dart'>rest_client_http_message.dart</a></b></td>
										<td>- Defines an abstract class, RestClientHttpMessage, serving as a foundational component within the core client HTTP functionality of the architecture<br>- It standardizes the structure and behavior of HTTP messages across various parts of the system, ensuring consistent communication protocols and data handling practices throughout the application.</td>
									</tr>
									<tr>
										<td><b><a href='https://github.com/tecrodrigocastro/adote-um-pet-app/blob/master/lib/src/core/client_http/rest_client_response.dart'>rest_client_response.dart</a></b></td>
										<td>- RestClientResponse, located within the core client HTTP framework, encapsulates the response from a network request<br>- It stores the response data, status code, and message, and retains a reference to the originating request<br>- This class is crucial for handling and processing server responses throughout the application, facilitating error handling and data management in client-server interactions.</td>
									</tr>
									<tr>
										<td><b><a href='https://github.com/tecrodrigocastro/adote-um-pet-app/blob/master/lib/src/core/client_http/client_http.dart'>client_http.dart</a></b></td>
										<td>- Centralizes the foundational components for HTTP client operations within the codebase, facilitating the management of HTTP requests and responses<br>- It defines interfaces for client interceptors, handles exceptions, and structures HTTP messages, thereby standardizing communication protocols and error handling across different parts of the application.</td>
									</tr>
									<tr>
										<td><b><a href='https://github.com/tecrodrigocastro/adote-um-pet-app/blob/master/lib/src/core/client_http/rest_client_request.dart'>rest_client_request.dart</a></b></td>
										<td>- RestClientRequest serves as a foundational component in the codebase, facilitating the creation and configuration of HTTP requests<br>- It supports setting paths, data payloads, HTTP methods, query parameters, and headers, essential for interacting with RESTful APIs<br>- The class also includes a method for cloning request configurations with modifications.</td>
									</tr>
									<tr>
										<td><b><a href='https://github.com/tecrodrigocastro/adote-um-pet-app/blob/master/lib/src/core/client_http/client_interceptor_interface.dart'>client_interceptor_interface.dart</a></b></td>
										<td>- Defines an interface for intercepting HTTP client requests, responses, and errors within the application's core networking layer<br>- IClientInterceptor allows for the modification and handling of HTTP messages and exceptions, facilitating customizable network operations and error management across the system.</td>
									</tr>
									<tr>
										<td><b><a href='https://github.com/tecrodrigocastro/adote-um-pet-app/blob/master/lib/src/core/client_http/rest_client_multipart.dart'>rest_client_multipart.dart</a></b></td>
										<td>- RestClientMultipart facilitates the handling of multipart file uploads within the application's HTTP client architecture<br>- It encapsulates the necessary parameters for file uploads, including the file key, file name, file path, and optional file bytes, streamlining the process of sending files over network requests in a structured manner.</td>
									</tr>
									<tr>
										<td><b><a href='https://github.com/tecrodrigocastro/adote-um-pet-app/blob/master/lib/src/core/client_http/app_response.dart'>app_response.dart</a></b></td>
										<td>- Defines a generic `AppResponse` class to standardize the structure of HTTP responses across the application<br>- It encapsulates success status, messages, data content, and HTTP status codes, providing both constructors and methods for JSON serialization and deserialization to facilitate data handling in network operations.</td>
									</tr>
									</table>
									<details>
										<summary><b>dio</b></summary>
										<blockquote>
											<table>
											<tr>
												<td><b><a href='https://github.com/tecrodrigocastro/adote-um-pet-app/blob/master/lib/src/core/client_http/dio/rest_client_dio_impl.dart'>rest_client_dio_impl.dart</a></b></td>
												<td>- RestClientDioImpl serves as the implementation of the IRestClient interface using the Dio library, facilitating HTTP operations like GET, POST, PUT, DELETE, PATCH, and file uploads<br>- It integrates error handling, logging via AppLogger, and supports dynamic addition and removal of interceptors to customize request handling.</td>
											</tr>
											<tr>
												<td><b><a href='https://github.com/tecrodrigocastro/adote-um-pet-app/blob/master/lib/src/core/client_http/dio/dio_adapter.dart'>dio_adapter.dart</a></b></td>
												<td>- DioAdapter serves as a bridge in the codebase, facilitating the conversion between Dio library exceptions and the application's custom RestClient exceptions<br>- It ensures seamless integration of the Dio HTTP client with the application's core networking architecture, enabling robust error handling and request-response transformations.</td>
											</tr>
											<tr>
												<td><b><a href='https://github.com/tecrodrigocastro/adote-um-pet-app/blob/master/lib/src/core/client_http/dio/client_interceptor_dio_impl.dart'>client_interceptor_dio_impl.dart</a></b></td>
												<td>- ClientInterceptorDioImpl serves as a bridge within the codebase, translating between Dio-specific data structures and the application's custom HTTP client interfaces<br>- It handles HTTP request, response, and error interception, facilitating the modification and handling of these events through a unified interface, thereby enhancing error management and request customization.</td>
											</tr>
											</table>
										</blockquote>
									</details>
								</blockquote>
							</details>
						</blockquote>
					</details>
					<details>
						<summary><b>app</b></summary>
						<blockquote>
							<details>
								<summary><b>features</b></summary>
								<blockquote>
									<details>
										<summary><b>auth</b></summary>
										<blockquote>
											<details>
												<summary><b>domain</b></summary>
												<blockquote>
													<details>
														<summary><b>entities</b></summary>
														<blockquote>
															<table>
															<tr>
																<td><b><a href='https://github.com/tecrodrigocastro/adote-um-pet-app/blob/master/lib/src/app/features/auth/domain/entities/auth_entity.dart'>auth_entity.dart</a></b></td>
																<td>- AuthEntity serves as a core component in the authentication system, encapsulating user credentials and access tokens<br>- It integrates with the UserEntity to manage user-specific data, ensuring secure and efficient user authentication and authorization throughout the application<br>- This entity is pivotal for handling sessions and user identity verification processes.</td>
															</tr>
															<tr>
																<td><b><a href='https://github.com/tecrodrigocastro/adote-um-pet-app/blob/master/lib/src/app/features/auth/domain/entities/user_entity.dart'>user_entity.dart</a></b></td>
																<td>- Defines a UserEntity class central to the authentication feature, encapsulating user details such as ID, name, email, and contact information<br>- This entity serves as a foundational data structure across the application, facilitating user management processes and interactions within the broader system architecture focused on user authentication and profile handling.</td>
															</tr>
															</table>
														</blockquote>
													</details>
													<details>
														<summary><b>usecases</b></summary>
														<blockquote>
															<table>
															<tr>
																<td><b><a href='https://github.com/tecrodrigocastro/adote-um-pet-app/blob/master/lib/src/app/features/auth/domain/usecases/sign_up_usecase.dart'>sign_up_usecase.dart</a></b></td>
																<td>- SignUpUsecase, located within the authentication domain of the app's feature layer, orchestrates user registration by leveraging the AuthRepository interface<br>- It defines a method to execute the signup process using provided user details, encapsulated in SignUpParams, and returns a response wrapped in AppResponse indicating the outcome of the operation.</td>
															</tr>
															<tr>
																<td><b><a href='https://github.com/tecrodrigocastro/adote-um-pet-app/blob/master/lib/src/app/features/auth/domain/usecases/login_usecase.dart'>login_usecase.dart</a></b></td>
																<td>- LoginUsecase, located within the authentication domain of the app's architecture, orchestrates user login by leveraging the AuthRepository interface<br>- It processes login credentials through the LoginParams class and returns an authentication response encapsulated in AppResponse, facilitating user authentication management across the application.</td>
															</tr>
															</table>
														</blockquote>
													</details>
													<details>
														<summary><b>repositories</b></summary>
														<blockquote>
															<table>
															<tr>
																<td><b><a href='https://github.com/tecrodrigocastro/adote-um-pet-app/blob/master/lib/src/app/features/auth/domain/repositories/auth_repository_interface.dart'>auth_repository_interface.dart</a></b></td>
																<td>- Defines an interface for the authentication repository within the application's architecture, enabling the implementation of various authentication strategies such as Firebase and mock repositories<br>- It specifies methods for user login and signup processes, ensuring these functionalities are adaptable and interchangeable across different authentication systems.</td>
															</tr>
															</table>
														</blockquote>
													</details>
												</blockquote>
											</details>
											<details>
												<summary><b>presentation</b></summary>
												<blockquote>
													<details>
														<summary><b>pages</b></summary>
														<blockquote>
															<table>
															<tr>
																<td><b><a href='https://github.com/tecrodrigocastro/adote-um-pet-app/blob/master/lib/src/app/features/auth/presentation/pages/auth_base_page.dart'>auth_base_page.dart</a></b></td>
																<td>- AuthBasePage serves as the initial interface for user authentication within the application, providing a user-friendly layout with options to log in or register<br>- It utilizes visual components from the design system, ensuring consistency across the app, and integrates navigation to further authentication processes, enhancing user flow and experience.</td>
															</tr>
															<tr>
																<td><b><a href='https://github.com/tecrodrigocastro/adote-um-pet-app/blob/master/lib/src/app/features/auth/presentation/pages/welcome_page.dart'>welcome_page.dart</a></b></td>
																<td>- WelcomePage serves as the introductory interface within the authentication feature of the application<br>- It presents a personalized greeting and a primary action button that navigates the user to the next step in the authentication process<br>- The design utilizes the project's design system for visual elements and responsiveness.</td>
															</tr>
															<tr>
																<td><b><a href='https://github.com/tecrodrigocastro/adote-um-pet-app/blob/master/lib/src/app/features/auth/presentation/pages/login_page.dart'>login_page.dart</a></b></td>
																<td>- LoginPage serves as the user interface for authentication within the application, facilitating user login through email and password verification<br>- It integrates with the AuthBloc for state management and SessionController for session handling, providing feedback via snack bars based on the authentication result.</td>
															</tr>
															<tr>
																<td><b><a href='https://github.com/tecrodrigocastro/adote-um-pet-app/blob/master/lib/src/app/features/auth/presentation/pages/register_page.dart'>register_page.dart</a></b></td>
																<td>- RegisterPage serves as the user interface for new user registration within the application's authentication feature<br>- It collects essential user information through various text inputs, including name, email, password, and contact details, and facilitates user registration by integrating navigation to welcome the user post-registration.</td>
															</tr>
															</table>
														</blockquote>
													</details>
													<details>
														<summary><b>bloc</b></summary>
														<blockquote>
															<table>
															<tr>
																<td><b><a href='https://github.com/tecrodrigocastro/adote-um-pet-app/blob/master/lib/src/app/features/auth/presentation/bloc/auth_event.dart'>auth_event.dart</a></b></td>
																<td>- Defines the events that trigger authentication processes within the application, specifically focusing on user sign-up and login actions<br>- The `SignUpAuthEvent` handles new user registrations by encapsulating user data, while the `LoginAuthEvent` manages user logins through email and password verification, ensuring these components interact seamlessly with the broader authentication system.</td>
															</tr>
															<tr>
																<td><b><a href='https://github.com/tecrodrigocastro/adote-um-pet-app/blob/master/lib/src/app/features/auth/presentation/bloc/auth_state.dart'>auth_state.dart</a></b></td>
																<td>- Defines the state management for user authentication within the application, handling various states such as initial, loading, success, and failure for both sign-up and login processes<br>- Each state extends a base class ensuring consistency and reusability, crucial for maintaining clear state transitions and facilitating debugging and enhancements in the authentication feature.</td>
															</tr>
															<tr>
																<td><b><a href='https://github.com/tecrodrigocastro/adote-um-pet-app/blob/master/lib/src/app/features/auth/presentation/bloc/auth_bloc.dart'>auth_bloc.dart</a></b></td>
																<td>- AuthBloc orchestrates user authentication within the application, managing both sign-up and login processes<br>- It utilizes business logic from domain use cases to handle user events, transitioning between different states based on the success or failure of authentication actions, thereby updating the UI accordingly.</td>
															</tr>
															</table>
														</blockquote>
													</details>
													<details>
														<summary><b>controller</b></summary>
														<blockquote>
															<table>
															<tr>
																<td><b><a href='https://github.com/tecrodrigocastro/adote-um-pet-app/blob/master/lib/src/app/features/auth/presentation/controller/session_controller.dart'>session_controller.dart</a></b></td>
																<td>- SessionController, located within the authentication feature of the app, manages user session data by interfacing with shared preferences<br>- It facilitates the secure storage and retrieval of user tokens, essential for maintaining user sessions across the application<br>- This controller ensures that token management is centralized and consistent throughout the app's lifecycle.</td>
															</tr>
															</table>
														</blockquote>
													</details>
												</blockquote>
											</details>
										</blockquote>
									</details>
									<details>
										<summary><b>message</b></summary>
										<blockquote>
											<details>
												<summary><b>presentation</b></summary>
												<blockquote>
													<details>
														<summary><b>bloc</b></summary>
														<blockquote>
															<table>
															<tr>
																<td><b><a href='https://github.com/tecrodrigocastro/adote-um-pet-app/blob/master/lib/src/app/features/message/presentation/bloc/message_state.dart'>message_state.dart</a></b></td>
																<td>- Defines the state management for messaging features within the application, utilizing the BLoC pattern<br>- It includes an abstract base class for message states and a concrete initial state class, ensuring that message-related UI components react appropriately to state changes, thereby facilitating a responsive and interactive user experience in the messaging module.</td>
															</tr>
															<tr>
																<td><b><a href='https://github.com/tecrodrigocastro/adote-um-pet-app/blob/master/lib/src/app/features/message/presentation/bloc/message_event.dart'>message_event.dart</a></b></td>
																<td>- Defines an abstract base class for events in the message feature's business logic component (BLoC), ensuring all message events maintain a consistent structure for state management<br>- It leverages the Equatable package for simplified value comparison, crucial for optimizing state transitions within the app's reactive data flow architecture.</td>
															</tr>
															<tr>
																<td><b><a href='https://github.com/tecrodrigocastro/adote-um-pet-app/blob/master/lib/src/app/features/message/presentation/bloc/message_bloc.dart'>message_bloc.dart</a></b></td>
																<td>- MessageBloc, located within the message feature of the app's presentation layer, orchestrates the handling of message-related events and states using the BLoC (Business Logic Component) pattern<br>- It initializes with a default state and is designed to respond dynamically to incoming message events, updating the UI state accordingly within the broader application architecture.</td>
															</tr>
															</table>
														</blockquote>
													</details>
												</blockquote>
											</details>
										</blockquote>
									</details>
									<details>
										<summary><b>donate</b></summary>
										<blockquote>
											<details>
												<summary><b>presentation</b></summary>
												<blockquote>
													<details>
														<summary><b>pages</b></summary>
														<blockquote>
															<table>
															<tr>
																<td><b><a href='https://github.com/tecrodrigocastro/adote-um-pet-app/blob/master/lib/src/app/features/donate/presentation/pages/donate_info_page.dart'>donate_info_page.dart</a></b></td>
																<td>- DonateInfoPage serves as a user interface within the donation feature, enabling users to provide details about their pets for adoption<br>- It includes text inputs for pet names and selection options for pet types, integrated within a structured layout that includes navigation and personalized user information, enhancing the user's interaction and experience within the app's donation process.</td>
															</tr>
															</table>
															<details>
																<summary><b>widgets</b></summary>
																<blockquote>
																	<table>
																	<tr>
																		<td><b><a href='https://github.com/tecrodrigocastro/adote-um-pet-app/blob/master/lib/src/app/features/donate/presentation/pages/widgets/choose_pet_type_row.dart'>choose_pet_type_row.dart</a></b></td>
																		<td>_Manages the user interface for selecting a pet type in the donation feature of the app._ The widget allows users to choose from different pet types (dogs, cats, birds, rabbits) for donation purposes, ensuring only one pet type is selected at a time through a visually appealing, horizontally scrollable row of selectable buttons.</td>
																	</tr>
																	</table>
																</blockquote>
															</details>
														</blockquote>
													</details>
													<details>
														<summary><b>bloc</b></summary>
														<blockquote>
															<table>
															<tr>
																<td><b><a href='https://github.com/tecrodrigocastro/adote-um-pet-app/blob/master/lib/src/app/features/donate/presentation/bloc/donate_bloc.dart'>donate_bloc.dart</a></b></td>
																<td>- DonateBloc, located within the donation feature's presentation layer, manages the state and events for user donations in the application<br>- It initializes with a default state and is designed to handle various donation-related events to update the UI accordingly, ensuring a responsive and interactive user experience in the donation process.</td>
															</tr>
															<tr>
																<td><b><a href='https://github.com/tecrodrigocastro/adote-um-pet-app/blob/master/lib/src/app/features/donate/presentation/bloc/donate_event.dart'>donate_event.dart</a></b></td>
																<td>- Defines the base class for events in the donation feature's business logic component (BLOC), ensuring all donation-related events maintain a consistent structure for state management<br>- It leverages the Equatable package for optimized value comparison, crucial for efficient state transitions within the app's reactive architecture.</td>
															</tr>
															<tr>
																<td><b><a href='https://github.com/tecrodrigocastro/adote-um-pet-app/blob/master/lib/src/app/features/donate/presentation/bloc/donate_state.dart'>donate_state.dart</a></b></td>
																<td>- Defines the state management for the donation feature within the application, utilizing the BLoC pattern<br>- It includes an abstract base class for donation states and a concrete initial state class, ensuring that donation-related UI components react appropriately to state changes, enhancing the app's responsiveness and user experience in the donation process.</td>
															</tr>
															</table>
														</blockquote>
													</details>
												</blockquote>
											</details>
										</blockquote>
									</details>
								</blockquote>
							</details>
						</blockquote>
					</details>
				</blockquote>
			</details>
		</blockquote>
	</details>
	<details> <!-- android Submodule -->
		<summary><b>android</b></summary>
		<blockquote>
			<table>
			<tr>
				<td><b><a href='https://github.com/tecrodrigocastro/adote-um-pet-app/blob/master/android/build.gradle'>build.gradle</a></b></td>
				<td>- Configures the build environment for all modules within the Android project by defining repository sources and setting directory paths for build outputs<br>- It ensures that all subprojects align with the root project's build directory structure and establishes dependencies on the main application module<br>- Additionally, it includes a task to clean up the build directories.</td>
			</tr>
			<tr>
				<td><b><a href='https://github.com/tecrodrigocastro/adote-um-pet-app/blob/master/android/settings.gradle'>settings.gradle</a></b></td>
				<td>- Manages plugin configurations and repository settings for the Android module of the project, ensuring the correct loading of Flutter SDK paths and the inclusion of essential repositories like Google and Maven Central<br>- It also specifies versioning for key plugins such as Flutter and Kotlin, crucial for the project's build process.</td>
			</tr>
			</table>
			<details>
				<summary><b>app</b></summary>
				<blockquote>
					<table>
					<tr>
						<td><b><a href='https://github.com/tecrodrigocastro/adote-um-pet-app/blob/master/android/app/build.gradle'>build.gradle</a></b></td>
						<td>- Configures the Android build environment for a Flutter application within the project, specifying dependencies on Android and Kotlin plugins, and setting Java and Kotlin compilation options<br>- It defines the application's namespace, SDK versions, and build configurations, including a placeholder for a unique application ID and signing configurations for release builds.</td>
					</tr>
					</table>
					<details>
						<summary><b>src</b></summary>
						<blockquote>
							<details>
								<summary><b>main</b></summary>
								<blockquote>
									<details>
										<summary><b>kotlin</b></summary>
										<blockquote>
											<details>
												<summary><b>com</b></summary>
												<blockquote>
													<details>
														<summary><b>example</b></summary>
														<blockquote>
															<details>
																<summary><b>adote_um_pet</b></summary>
																<blockquote>
																	<table>
																	<tr>
																		<td><b><a href='https://github.com/tecrodrigocastro/adote-um-pet-app/blob/master/android/app/src/main/kotlin/com/example/adote_um_pet/MainActivity.kt'>MainActivity.kt</a></b></td>
																		<td>- MainActivity.kt serves as the entry point for the Android platform within the Adote Um Pet application, integrating the Flutter framework<br>- It extends FlutterActivity, facilitating the rendering of the Flutter UI as the primary interface for the app, ensuring a seamless user experience across Android devices<br>- This setup is crucial for maintaining consistent app behavior and interface on Android platforms.</td>
																	</tr>
																	</table>
																</blockquote>
															</details>
														</blockquote>
													</details>
												</blockquote>
											</details>
										</blockquote>
									</details>
								</blockquote>
							</details>
						</blockquote>
					</details>
				</blockquote>
			</details>
		</blockquote>
	</details>
	<details> <!-- design_system Submodule -->
		<summary><b>design_system</b></summary>
		<blockquote>
			<table>
			<tr>
				<td><b><a href='https://github.com/tecrodrigocastro/adote-um-pet-app/blob/master/design_system/analysis_options.yaml'>analysis_options.yaml</a></b></td>
				<td>- Establishes coding standards and linting rules for the design system module within the broader project architecture<br>- By enforcing the use of relative imports, it enhances code maintainability and readability<br>- The configuration aligns with the Flutter community's best practices, ensuring consistency and quality in code development across the project.</td>
			</tr>
			<tr>
				<td><b><a href='https://github.com/tecrodrigocastro/adote-um-pet-app/blob/master/design_system/pubspec.yaml'>pubspec.yaml</a></b></td>
				<td>- Defines the configuration for the "design_system" package within a Flutter project, specifying its basic metadata, version, and dependencies<br>- It sets up the Flutter SDK and google_fonts library for UI styling, and includes assets for images and icons<br>- Additionally, it configures development dependencies for testing and linting to ensure code quality.</td>
			</tr>
			<tr>
				<td><b><a href='https://github.com/tecrodrigocastro/adote-um-pet-app/blob/master/design_system/.metadata'>.metadata</a></b></td>
				<td>- Maintains critical metadata for the Flutter project within the design_system directory, tracking properties essential for the Flutter tool's capability assessment and upgrade execution<br>- It records the project's Flutter version and channel, specifying the project type as a package, ensuring consistent tool behavior and compatibility across development environments.</td>
			</tr>
			</table>
			<details>
				<summary><b>lib</b></summary>
				<blockquote>
					<table>
					<tr>
						<td><b><a href='https://github.com/tecrodrigocastro/adote-um-pet-app/blob/master/design_system/lib/design_system.dart'>design_system.dart</a></b></td>
						<td>- Centralizes and exposes key user interface components of the design system, including buttons, icons, images, inputs, themes, and drawer elements<br>- By aggregating these resources, it simplifies access and integration into other parts of the application, ensuring consistency and reusability across the entire project architecture.</td>
					</tr>
					</table>
					<details>
						<summary><b>src</b></summary>
						<blockquote>
							<details>
								<summary><b>buttons</b></summary>
								<blockquote>
									<table>
									<tr>
										<td><b><a href='https://github.com/tecrodrigocastro/adote-um-pet-app/blob/master/design_system/lib/src/buttons/primary_button_ds.dart'>primary_button_ds.dart</a></b></td>
										<td>- PrimaryButtonDs defines a customizable button component within the design system library, tailored for the Flutter framework<br>- It facilitates the creation of buttons with configurable titles, actions, colors, and dimensions, adhering to the app's primary color scheme<br>- This component enhances UI consistency across the application by standardizing button design and functionality.</td>
									</tr>
									<tr>
										<td><b><a href='https://github.com/tecrodrigocastro/adote-um-pet-app/blob/master/design_system/lib/src/buttons/buttons.dart'>buttons.dart</a></b></td>
										<td>- Centralizes the management of button components within the design system by exporting primary and selectable button modules<br>- This setup facilitates modular development and ensures consistency across the user interface<br>- It serves as a foundational element in the architecture, allowing for streamlined updates and maintenance of button styles and behaviors across the application.</td>
									</tr>
									<tr>
										<td><b><a href='https://github.com/tecrodrigocastro/adote-um-pet-app/blob/master/design_system/lib/src/buttons/selectable_button.dart'>selectable_button.dart</a></b></td>
										<td>- SelectableButtonDs defines a customizable, state-aware button component within the design system library, enhancing the user interface by allowing visual differentiation based on selection state<br>- It supports dynamic sizing, optional imagery, and color adjustments, facilitating a cohesive and adaptable user experience across the application's various features and modules.</td>
									</tr>
									</table>
								</blockquote>
							</details>
							<details>
								<summary><b>drawer</b></summary>
								<blockquote>
									<table>
									<tr>
										<td><b><a href='https://github.com/tecrodrigocastro/adote-um-pet-app/blob/master/design_system/lib/src/drawer/drawer_item.dart'>drawer_item.dart</a></b></td>
										<td>- DrawerItemDS defines a reusable widget for navigation drawers in the Flutter-based design system, encapsulating a list tile with optional leading icons<br>- It enhances user interface consistency by standardizing drawer items across the application, supporting both icon display and tap functionality to trigger navigation or actions.</td>
									</tr>
									<tr>
										<td><b><a href='https://github.com/tecrodrigocastro/adote-um-pet-app/blob/master/design_system/lib/src/drawer/drawer_ds.dart'>drawer_ds.dart</a></b></td>
										<td>- CustomDrawerDS serves as a navigational component within the app's design system, providing a user interface for accessing different sections such as account settings, adoption options, donations, messaging, and logout functionalities<br>- It enhances user interaction by integrating personalized elements like user name, location, and image, alongside actionable items for a seamless app experience.</td>
									</tr>
									</table>
								</blockquote>
							</details>
							<details>
								<summary><b>image</b></summary>
								<blockquote>
									<table>
									<tr>
										<td><b><a href='https://github.com/tecrodrigocastro/adote-um-pet-app/blob/master/design_system/lib/src/image/image.dart'>image.dart</a></b></td>
										<td>- Exports the `app_image.dart` module, centralizing image-related functionalities within the design system library<br>- Positioned within the broader architecture, it simplifies the integration and management of image assets across the application, ensuring consistency and reusability<br>- This setup enhances the modularity and maintainability of the codebase, particularly in the handling of visual elements.</td>
									</tr>
									<tr>
										<td><b><a href='https://github.com/tecrodrigocastro/adote-um-pet-app/blob/master/design_system/lib/src/image/app_image.dart'>app_image.dart</a></b></td>
										<td>- Centralizes and manages the asset references for images within the design system of the project, ensuring consistent access to visual resources like logos and buttons across the application<br>- It defines a structured approach to handle image assets, facilitating easier updates and maintenance by referencing them through a single source point in the codebase.</td>
									</tr>
									</table>
								</blockquote>
							</details>
							<details>
								<summary><b>theme</b></summary>
								<blockquote>
									<table>
									<tr>
										<td><b><a href='https://github.com/tecrodrigocastro/adote-um-pet-app/blob/master/design_system/lib/src/theme/app_colors.dart'>app_colors.dart</a></b></td>
										<td>- AppColors in the design_system/lib/src/theme directory defines a centralized palette of colors used throughout the application<br>- It standardizes visual elements by providing consistent color values for primary, secondary, and utility colors, enhancing the UI's aesthetic coherence and maintainability<br>- This setup facilitates easy updates and ensures uniformity across different components and screens.</td>
									</tr>
									<tr>
										<td><b><a href='https://github.com/tecrodrigocastro/adote-um-pet-app/blob/master/design_system/lib/src/theme/theme.dart'>theme.dart</a></b></td>
										<td>- Centralizes and streamlines the management of visual aesthetics across the application by exporting theme-related functionalities<br>- Specifically, it facilitates the integration and consistent application of color schemes and overarching thematic elements defined in `app_colors.dart` and `app_theme.dart`, ensuring a cohesive user interface design throughout the project.</td>
									</tr>
									<tr>
										<td><b><a href='https://github.com/tecrodrigocastro/adote-um-pet-app/blob/master/design_system/lib/src/theme/app_theme.dart'>app_theme.dart</a></b></td>
										<td>- AppTheme in the design_system/lib/src/theme directory defines the visual style for the application, setting colors, typography, and layout properties using ThemeData<br>- It integrates Google Fonts for textual elements and ensures consistent theming across different UI components like app bars, drawers, and text elements.</td>
									</tr>
									</table>
								</blockquote>
							</details>
							<details>
								<summary><b>inputs</b></summary>
								<blockquote>
									<table>
									<tr>
										<td><b><a href='https://github.com/tecrodrigocastro/adote-um-pet-app/blob/master/design_system/lib/src/inputs/inputs.dart'>inputs.dart</a></b></td>
										<td>- Exports components for text input handling within the design system, specifically standard and gray-styled text inputs<br>- Positioned in the inputs directory of the design system library, it facilitates modular integration and enhances UI consistency across the application by providing predefined text input styles that developers can readily utilize in various parts of the project.</td>
									</tr>
									<tr>
										<td><b><a href='https://github.com/tecrodrigocastro/adote-um-pet-app/blob/master/design_system/lib/src/inputs/text_input_gray_ds.dart'>text_input_gray_ds.dart</a></b></td>
										<td>- TextInputGrayDs is a reusable widget in the design system library, specifically tailored for creating text input fields with a gray background<br>- It incorporates customizable features such as label text, input validation, and adjustable height, ensuring a consistent and user-friendly interface across the Flutter application<br>- This component enhances the UI consistency by adhering to the defined design standards.</td>
									</tr>
									<tr>
										<td><b><a href='https://github.com/tecrodrigocastro/adote-um-pet-app/blob/master/design_system/lib/src/inputs/text_input_ds.dart'>text_input_ds.dart</a></b></td>
										<td>- TextInputDs serves as a customizable text input widget within the design system, tailored for various user input scenarios<br>- It supports features like password visibility toggle, input validation, and adjustable dimensions, enhancing user interaction by adapting to different form factors and requirements in the application's UI design.</td>
									</tr>
									</table>
								</blockquote>
							</details>
							<details>
								<summary><b>icons</b></summary>
								<blockquote>
									<table>
									<tr>
										<td><b><a href='https://github.com/tecrodrigocastro/adote-um-pet-app/blob/master/design_system/lib/src/icons/icons.dart'>icons.dart</a></b></td>
										<td>- Exports the `app_icons.dart` module, centralizing icon resources for the design system<br>- Positioned within the `design_system/lib/src/icons` directory, it simplifies access to app-specific icons across the entire application, enhancing consistency and maintainability<br>- This setup supports a modular architecture by allowing straightforward updates and integration of icon assets.</td>
									</tr>
									<tr>
										<td><b><a href='https://github.com/tecrodrigocastro/adote-um-pet-app/blob/master/design_system/lib/src/icons/app_icons.dart'>app_icons.dart</a></b></td>
										<td>- AppIcons in the design_system library centralizes the management of icon assets used throughout the application's user interface<br>- It defines a set of constants for drawer icons, including adopt, donate, messages, my account, and petinha, ensuring consistent and efficient access to these resources across the application<br>- This approach facilitates maintainability and scalability of the UI components.</td>
									</tr>
									</table>
								</blockquote>
							</details>
						</blockquote>
					</details>
				</blockquote>
			</details>
		</blockquote>
	</details>
</details>

---
## 🚀 Getting Started

### ☑️ Prerequisites

Before getting started with adote-um-pet-app, ensure your runtime environment meets the following requirements:

- **Programming Language:** Dart


### ⚙️ Installation

Install adote-um-pet-app using one of the following methods:

**Build from source:**

1. Clone the adote-um-pet-app repository:
```sh
❯ git clone https://github.com/tecrodrigocastro/adote-um-pet-app
```

2. Navigate to the project directory:
```sh
❯ cd adote-um-pet-app
```

3. Install the project dependencies:


**Using `pub`** &nbsp; [<img align="center" src="https://img.shields.io/badge/Dart-0175C2.svg?style={badge_style}&logo=dart&logoColor=white" />](https://dart.dev/)

```sh
❯ flutter pub get
```


### 🤖 Usage
Run adote-um-pet-app using the following command:
**Using `pub`** &nbsp; [<img align="center" src="https://img.shields.io/badge/Dart-0175C2.svg?style={badge_style}&logo=dart&logoColor=white" />](https://dart.dev/)

```sh
❯ flutter run android
```


### 🧪 Testing
Run the test suite using the following command:
**Using `pub`** &nbsp; [<img align="center" src="https://img.shields.io/badge/Dart-0175C2.svg?style={badge_style}&logo=dart&logoColor=white" />](https://dart.dev/)

```sh
❯ flutter run test
```

---

## 🔰 Contributing

- **💬 [Join the Discussions](https://github.com/tecrodrigocastro/adote-um-pet-app/discussions)**: Share your insights, provide feedback, or ask questions.
- **🐛 [Report Issues](https://github.com/tecrodrigocastro/adote-um-pet-app/issues)**: Submit bugs found or log feature requests for the `adote-um-pet-app` project.
- **💡 [Submit Pull Requests](https://github.com/tecrodrigocastro/adote-um-pet-app/blob/main/CONTRIBUTING.md)**: Review open PRs, and submit your own PRs.

<details closed>
<summary>Contributing Guidelines</summary>

1. **Fork the Repository**: Start by forking the project repository to your github account.
2. **Clone Locally**: Clone the forked repository to your local machine using a git client.
   ```sh
   git clone https://github.com/tecrodrigocastro/adote-um-pet-app
   ```
3. **Create a New Branch**: Always work on a new branch, giving it a descriptive name.
   ```sh
   git checkout -b new-feature-x
   ```
4. **Make Your Changes**: Develop and test your changes locally.
5. **Commit Your Changes**: Commit with a clear message describing your updates.
   ```sh
   git commit -m 'Implemented new feature x.'
   ```
6. **Push to github**: Push the changes to your forked repository.
   ```sh
   git push origin new-feature-x
   ```
7. **Submit a Pull Request**: Create a PR against the original project repository. Clearly describe the changes and their motivations.
8. **Review**: Once your PR is reviewed and approved, it will be merged into the main branch. Congratulations on your contribution!
</details>

<details closed>
<summary>Contributor Graph</summary>
<br>
<p align="left">
   <a href="https://github.com{/tecrodrigocastro/adote-um-pet-app/}graphs/contributors">
      <img src="https://contrib.rocks/image?repo=tecrodrigocastro/adote-um-pet-app">
   </a>
</p>
</details>

---

## 🎗 License

This project is protected under the [SELECT-A-LICENSE](https://choosealicense.com/licenses) License. For more details, refer to the [LICENSE](https://choosealicense.com/licenses/) file.

---

## 🙌 Acknowledgments

- List any resources, contributors, inspiration, etc. here.

---

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.
