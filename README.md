# csswizardry-grids

**Simple, fluid, nestable, flexible, Sass-based, responsive grid system.**

* Fully responsive
* Mobile first
* Infinitely nestable
* Reversible/reorderable
* With/without gutters
* Endless possible combinations
* Simple to understand, human-friendly classes
* Option to keep classes out of your HTML
* Robust
* Simple
* No `.clear` or `.last` classes
* It just _works_

Please see [Responsive grid systems; a solution?](http://csswizardry.com/2013/02/responsive-grid-systems-a-solution/)
for a comprehensive overview of the principles of the grid system.

## Demo

* [csswizardry.github.com/csswizardry-grids](http://csswizardry.github.com/csswizardry-grids).
* [Writeup](http://csswizardry.com/2013/02/introducing-csswizardry-grids/)

## Setup

Simply fill in/adjust the relevant variables.

* `$responsive` is used to turn csswizardry-grids’ responsive features on and
  off. csswizardry-grids is designed primarily for responsive builds but can
  also be used on non-responsive projects just as easily. Setting this to false
  will simply prevent Sass generating your `palm` etc modifiers.
* `$gutter` controls how much space there is between columns.
* `$mobile-first` controls whether you would like unclassed grid items to
  _initially_ adopt `width:100%;. This means that you won’t need to add a class
  to force a grid item to take up the full width of its container.
* `$use-silent-classes` tells csswizardry-grids whether to go ahead and compile
  solid, traditional classes (e.g. `.one-whole`) or to create Sass ‘silent’
  classes which only compile to CSS once explictly called.
* `$lap-start` and `$desk-start` tell csswizardry-grids when to fire particular
  media queries to service those particular sizes. Note that csswizardry-grids
  works out the ends of any other breakpoints by using these numbers.

## Basic usage

If you are using traditional classes then an example, basic usage might look
like this:

    <div class="grid">
    
        <div class="grid__item  lap-one-half  desk-two-thirds">
            ...
        </div><!--
    
     --><div class="grid__item  lap-one-half  desk-one-third">
            ...
        </div>
    
    </div>

If you are using silent classes then your HTML might look like this:

    <div class="page">
    
        <div class="content">
            ...
        </div><!--
    
     --><div class="sub-content">
            ...
        </div>
    
    </div>

**Note the empty HTML comments.** These are to remove whitespace caused by using
`inline-block`.  Prior to v1.1 this was tackled by using some
[`[letter|word]-spacing` trickery](https://github.com/csswizardry/csswizardry-grids/blob/60a5075ac65282bb24fa5a5d5ed32a060ce2975f/csswizardry-grids.scss#L64-L65),
however Chrome 25 introduced a change which meant this method now broke
csswizardry-grids.

…and your Sass, something like this:

    .page{
        @extend %grid;
    }
    
        .content,
        .sub-content{
            @extend %grid__item;
            @extend %one-whole;
            @extend %lap-one-half;
        }
    
        .content{
            @extend %desk-two-thirds;
        }
    
        .sub-content{
            @extend %desk-one-third;
        }
