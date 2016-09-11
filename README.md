# notevil-browser

A browser port of Matt McKegg's [notevil](https://github.com/mmckegg/notevil).

Notevil is a JavaScript interpreter written in JavaScript. You can use it in place of `eval`. The advantage of notevil is that it isolates the execution context of the evaluated code, so it can't access global variables, cookies, the DOM state, etc., unless you explicitly allow it to do so.

## Usage

Grab the `notevil-browser.min.js` file from this repo and put it in your project. Be sure to add the `meta` tag for UTF-8, as the script contains non-ASCII characters.

```html
<head>
  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  <script src="notevil-browser.min.js"></script>
</head>
```

Then you can evaluate JavaScript code like this:

```javascript
NotEvil.eval("(function square(x) { return x * x })(5)") // returns 25
```

### Passing a context object

You can pass an object as the second argument to `NotEvil.eval`. Its properties will be made available to the evaluated code as global variables.

```
function square(x) {
  return x * x
}

NotEvil.eval("sq(5)", {sq: square}) // returns 25
```

The evaluated code can also set values on the context object:

```
var context = {}
NotEvil.eval("answer = 42", context)
console.log(context.answer) // prints "42"
```
