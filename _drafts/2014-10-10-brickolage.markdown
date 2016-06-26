---
layout: post
title:  "Brickolage"
date: 	Oct 10nd, 2014 12:00:00am
categories: project
preview: "images/project/brickolage/01-800.jpg"
---







## MY LEGO WALL
Everything started with my office LEgo wall, we started making pixel art using small bricks. I set this wall as an open canva where everybody could create, I started with Mario Bross and then we had Bomber man, bob the sponge, space invaders, etc. Later people used the wall to display messages or font based logo. Create un message with Lego is quite complexe and you endup with a deceptive result. That's where the idea of creating some "Lego" brick font came.

![Lego wall](/images/project/brickolage/02.jpg)

## THE FIRST POC
I started designing "Lego" chars by hand using 123Design but that rapidly became a nigthmare because it's complexity + I also wanted to been abble to generate all font char at once. But a least I had a first working POC:

![Brickolage](/images/project/brickolage/03.jpg)

![Brickolage](/images/project/brickolage/08.jpg)

## OPENSCAD

After exploring different 3D software and CAD tools I finally discovered an opensource 3D CAD named [OpenScad](http://www.openscad.org/). That was exactly what I was looking for, it's a programing language capable of generating 3D model using simple [3D shape and boolean operation](http://www.openscad.org/cheatsheet/) you can easely create whatever you want. You can also use a lot of differents [library](https://github.com/openscad/openscad/wiki/Libraries) developped by the community. The amazing part of this tools is his ability to generate 3D model dynamicaly, for my needs it finaly looks like this to generate A,B and C chars once my method where developped:

{% highlight javascript%}
renderBrick("simple",render_quality)  Letter("A");
renderBrick("simple",render_quality)  Letter("B");
renderBrick("simple",render_quality)  Letter("C");
{% endhighlight %}

That's usefull but you still need some manual work to generate the full set of chars of the font. But the amazing [OpenScad](http://www.openscad.org/) has an other feature that can save your life the [CLI arguments](https://en.wikibooks.org/wiki/OpenSCAD_User_Manual/Using_OpenSCAD_in_a_command_line_environment). Using Bash script you can call any [OpenScad](http://www.openscad.org/) program with a set of parameters in my case I was abble to pass a list of chars and a font ID to generate all chars from a font.

{% highlight javascript%}
string=${2}
array=(${string//,/ })
for i in "${!array[@]}"
do
  echo -e "generating: \033[35m"${array[i]}"\033[0m"
  openscad -o output/${3}-${fontArray[${3}]}/CHAR/${array[i]}.stl -D debug_mode=false -D fontID=${3}  -D 'letter="'${array[i]}'"' bricks_gen.scad
{% endhighlight %}

![Brickolage](/images/project/brickolage/09.jpg)

## EXPERIMENTS USING EXISTING FONT

![Brickolage](/images/project/brickolage/14.jpg)
![Brickolage](/images/project/brickolage/15.jpg)

## 4X8 FONT NAMED BRICKOLAGE


![Brickolage](/images/project/brickolage/05.jpg)

![Brickolage](/images/project/brickolage/06.jpg)

![Brickolage](/images/project/brickolage/04.jpg)

![Brickolage](/images/project/brickolage/07.jpg)


## 3X5 FONT NAMED BRICKFONT


![Brickolage](/images/project/brickolage/10.jpg)
![Brickolage](/images/project/brickolage/11.jpg)
![Brickolage](/images/project/brickolage/12.jpg)
![Brickolage](/images/project/brickolage/13.jpg)


Then I became clear that I have to handle 

## THE DIFFERENT PARTS OF A LEGO BRICK

- Top knobs
- roof 
- bottom knobs
- walls


<div class="uk-grid">
<div class="uk-width-large-1-2 uk-width-medium-1-1 uk-width-small-1-1">
<iframe src="https://vine.co/v/eiz3rQT6i1A/embed/simple" width="600" height="600" frameborder="0"></iframe>
</div>
<div class="uk-width-large-1-2 uk-width-medium-1-1 uk-width-small-1-1">
<iframe src="https://vine.co/v/eqE2QVd73P3/embed/simple" width="600" height="600" frameborder="0"></iframe>
</div>
</div>


<div class="uk-grid">
<div class="uk-width-large-1-2 uk-width-medium-1-1 uk-width-small-1-1">
<iframe src="https://vine.co/v/eqtJvarV1nz/embed/simple" width="600" height="600" frameborder="0"></iframe>
</div>
<div class="uk-width-large-1-2 uk-width-medium-1-1 uk-width-small-1-1">
<iframe src="https://vine.co/v/eKElLt3q00U/embed/simple" width="600" height="600" frameborder="0"></iframe>
</div>
</div>










