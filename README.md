# InklingReader

Based on [roelj / inklingreader](https://github.com/roelj/inklingreader) on GitHub.

Since SketchManager by Wacom crashes Illustrator on Mac – and even does not really work for me – I searched for a working alternative. I found InklingReader.

As Docker lets containerize applications and I don't want to install every piece of software directly on my computer, I decided to write a Dockerfile for a Dockerimage for beeing abled to convert my Inkling scribbles.

This Container isn't meant to support any additional features of InklingReader than converting WCIs to usable file formats.

## Usage

```sh
DATA_FOLDER=~/wpi_files/

docker run -it --volume "$DATA_FOLDER:/inklingdata" --rm macwinnie/inklingreader
```

Opens container shell where you can do things like that:

```sh
# show help:
inklingreader --help

# convert Sketch.wpi to Sketch.svg
inklingreader -f Sketch.wpi -t Sketch.svg
```

### Help

```txt
# inklingreader --help

Available options:
  --dimensions,        -a  Specify the page dimensions for the document.
  --orientation,       -o  Specify the orientation of the page.
  --background,        -b  Specify the background color for the document.
  --colors,            -c  Specify a list of colors (comma separated).
  --pressure-factor,   -p  Specify a factor for handling pressure data.
  --convert-directory, -d  Convert all WPI files in a directory.
  --file,              -f  Specify the WPI file to convert.
  --to,                -t  Specify the file to write to.
  --direct-output,     -i  Tell the program to output SVG data to stdout.
  --merge,             -m  Merge two WPI files into one.
  --gui,               -g  Start the graphical user interface.
  --online-mode        -j  Use the online mode.
  --version,           -v  Show versioning information.
  --help,              -h  Show this message.

```