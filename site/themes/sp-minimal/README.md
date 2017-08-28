# SP-Minimal

[Minimal](https://github.com/orderedlist/minimal) is a theme developed by [Steve Smith (orderedlist)](https://github.com/orderedlist) and belongs the official themes used by the Github Pages automatic page generator. I used the theme for many of my course pages, because it is simple and elegant. [SP-Minimal](https://github.com/eueung/hugo-sp-minimal) is a port of the theme for use within Hugo. The theme supports single- and multi-page rendering, code highlighting, Disqus comment system and Google Analytics.

![Screenshot](https://raw.githubusercontent.com/eueung/hugo-sp-minimal/master/images/screenshot.png)

## Theme Demo

- [Multi-page / blog-style ](//eueung.github.io/hugo-sp-minimal/)
- [Single-page](//eueung.github.io/ET3010/)

## Installation

Inside the folder of your Hugo site run:

    $ cd themes
    $ git clone https://github.com/eueung/hugo-sp-minimal.git sp-minimal

For more information read the official [setup guide](//gohugo.io/overview/installing/) of Hugo.

## Sample Configuration

The following `config.toml` is used for the demo site mentioned above (multi-page). Please note the line `renderType = "multi"`. Content must be of type `post`. For details please look at the `exampleSite/content/post` folder.

```toml
baseurl         = "https://eueung.github.io/hugo-sp-minimal/"
theme           = "sp-minimal"
languageCode    = "en-us"
title           = "SP-Minimal"
disqusShortname = ""
paginate        = 5

[params]
  title       = "SP-Minimal"
  subtitle    = "Another Minimalist Theme for Hugo"
  copyright   = "Released under the MIT license."
  authorImage = "logo.png"

  #"single" or "multi"
  renderType = "multi"
  #"simple" or "original"
  themeStyle = "simple"

  googleAnalytics = ""

  name = "EM"
  description = "Here is a description of your site."
  pageNotFoundTitle = "404 - Page not found"
```

For single-page rendering, `renderType` must be changed to `single`. Content must be of type `onepage`. You might just put your markdown file(s) inside `exampleSite/content/onepage` folder.

```toml
  renderType = "single"
  themeStyle = "simple"
```

## License

This theme is released under the MIT license. For more information read the [License](//github.com/eueung/hugo-sp-minimal/blob/master/LICENSE.md).


