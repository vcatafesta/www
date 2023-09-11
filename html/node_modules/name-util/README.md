# name-util

[![semantic-release](https://img.shields.io/badge/%20%20%F0%9F%93%A6%F0%9F%9A%80-semantic--release-e10079.svg)](https://github.com/semantic-release/semantic-release)

A utility script to convert a string into camel case, dashed name, class name or to capitalized name

## Install

```sh
npm install name-util --save
```

or

```sh
yarn add name-util
```

## Usage

```ts
import { toDashedName } from 'name-util'

toDashedName('backgroundColor') // returns 'background-color'
```

## API

### toDashedName()

```ts
import { toDashedName } from 'name-util'

toDashedName('backgroundColor') // returns 'background-color'
```

### toUnderscoredName()

```ts
import { toUnderscoredName } from 'name-util'

toUnderscoredName('backgroundColor') // returns 'background_color'
```

### toCamelCase()

```ts
import { toCamelCase } from 'name-util'

toCamelCase('background-color') // returns 'backgroundColor'
```

### toClassName()

```ts
import { toClassName } from 'name-util'

toClassName('background-color') // returns 'BackgroundColor'
```

### capitalize()

```ts
import { capitalize } from 'name-util'

capitalize('background-color') // returns 'Background-color'
```

### capitalizeWords()

```ts
import { capitalizeWords } from 'name-util'

capitalizeWords('background-color') // returns 'Background Color'
```

## Test

```sh
npm test
```

## Contributing

Contributions are very welcome! Just send a pull request. Feel free to contact me or checkout my
[GitHub](https://github.com/rintoj) page.

## Author

**Rinto Jose** (rintoj)

Follow me: [GitHub](https://github.com/rintoj) | [Facebook](https://www.facebook.com/rinto.jose) |
[Twitter](https://twitter.com/rintoj) | [Google+](https://plus.google.com/+RintoJoseMankudy) |
[Youtube](https://youtube.com/+RintoJoseMankudy)

## Versions

[Check CHANGELOG](https://github.com/rintoj/name-util/blob/master/CHANGELOG.md)

## Automatic Release

Here is an example of the release type that will be done based on a commit messages:

| Commit message      | Release type          |
| ------------------- | --------------------- |
| fix: [comment]      | Patch Release         |
| feat: [comment]     | Minor Feature Release |
| perf: [comment]     | Major Feature Release |
| doc: [comment]      | No Release            |
| refactor: [comment] | No Release            |
| chore: [comment]    | No Release            |

## License

```
The MIT License (MIT)

Copyright (c) 2016 Rinto Jose (rintoj)

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in
all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
THE SOFTWARE.
``
```
