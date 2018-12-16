---
layout: post
title:  "Stay yound and play Lego"
date: 	Apr 28th, 2013 12:00:00am
categories: leisure
comments: true
preview: "images/leisure/stayyoung/01-800.jpg"
excerpt: "I made a motivational Lego poster that remind me to keep playing Lego"
---

![Stay young and play Lego](/images/leisure/stayyoung/07.jpg)

<div class="uk-grid" data-uk-grid-margin="">


    <div class="uk-width-large-1-2 uk-width-medium-1-1 uk-width-small-1-1">
        <p>
        After having working of my <a href="{{ site.github.url }}/keepcalm/">Keep calm serie</a> I feel inspired to create a Lego version. I wanted to create a poster with a size close to the original Kepp calm poster. I have build four of this one, 1 for my home, 1 for my office, 1 have been build for my boss at DigitasLbi and 1 for Michael Chaize for his Adobe office.
        </p>
        <h3>FRAME</h3>
        <p>
        As no such Lego plate of this size exist I had to find a way. I had an option to build the frame using bricks and plates but it will have been very expensive and heavy. So I choosed to use a piece of wood and blue base plates, they are 32X32 knobs and 25x25 cm so using 3 for the height and 2 for the with gave me a 50x75 frame wich is close enougth to my objective and doesn't require any cuting.
        </p>
        <h3>COST</h3>
        <p>
        Once the design was made I tried to optimize the number of bricks because that can make a big difference in term of price. I'm using <a href="http://shop.lego.com/en-FR/Pick-A-Brick-ByTheme">Lego pick a brick</a> to order the bricks. Concidering a "pixel" from the design as a 1x1 plate. A 1x1 Lego white plate cost 0,08 € where a 2X10 Lego white plate cost 0,26€. That give a cost per pixel of 0,013€ wich is much affordable. The design as 1720 colored pixel, if I had use 1x1 bricks the total cost of the bricks will have been around 140€.
        </p>
        <h3>PRICE OPTIMISATION</h3>
        <p>
        Figuring out what could be the best size of bricks and where to use them was tricky so I have write a script to sort this out. The script load an image of the design where each pixel represent an 1x1 brick, then he loop throuh a list of bricks and recursivly starting by the largest brick and try to fit them is the design. Next he move to a smaller brcik and so on till the smallest brick of the list. This minize the number of bricks and by concequence the final price of the frame. Using this technics I have reduce the number of bricks from 1720 to 273.
        </p>
    </div>
    <div class="uk-width-large-1-2 uk-width-medium-1-1 uk-width-small-1-1">
         <img src="/images/leisure/stayyoung/05.jpg" class="uk-responsive-width">
    </div>
    <div class="uk-width-large-1-2 uk-width-medium-1-1 uk-width-small-1-1">
         <img src="/images/leisure/stayyoung/plan.jpg" class="uk-responsive-width"><br/><br/><br/>
         <img src="/images/leisure/stayyoung/04.jpg" class="uk-responsive-width">
    </div>
    <div class="uk-width-large-1-2 uk-width-medium-1-1 uk-width-small-1-1">
        <h3>BUILD YOUR OWN</h3>
        <p>
        I'm open sourcing a part of the projet so anybody can build his own. The script is not part of the source because it's still buggy and miss some features. The BOM, the instruction and the <a href="http://www.leocad.org/trac">LeoCad</a> sources are free to <a href="https://github.com/TarGz/stay-young-and-play-lego">download and published on github.</a> It's published under "Creative Commons Attribution-NonCommercial 4.0 International Public License" meaning you can use the design but never use it in any commercial maner. If you build one please mention me and please point to the git repository, I would appreciate if you tweet me a pict of your finished frame.
        </p>
        <table class="uk-table uk-table-striped">
        <thead>
        <tr>
        <th>Brick</th>
        <th>Name</th>
        <th>Picture</th>
        <th>Part</th>
        <th>Quantity</th>
        </tr>
        </thead>
        <tbody>
        <tr>
        <td>300521</td>
        <td>BRICK 1X1</td>
        <td><img src="/images/leisure/stayyoung/bom/image001.png" width="40px"></td>
        <td>3005</td>
        <td>6</td>
        </tr>
        <tr>
        <td>245626</td>
        <td>BRICK 2X6</td>
        <td><img src="/images/leisure/stayyoung/bom/image002.png" width="40px"></td>
        <td>44237</td>
        <td>4</td>
        </tr>
        <tr>
        <td>300726</td>
        <td>BRICK 2X8</td>
        <td><img src="/images/leisure/stayyoung/bom/image003.png" width="40px"></td>
        <td>3007</td>
        <td>36</td>
        </tr>
        <tr>
        <td>302401</td>
        <td>PLATE 1X1</td>
        <td><img src="/images/leisure/stayyoung/bom/image004.png" width="40px"></td>
        <td>3024</td>
        <td>4</td>
        </tr>
        <tr>
        <td>302424</td>
        <td>PLATE 1X1</td>
        <td><img src="/images/leisure/stayyoung/bom/image005.png" width="40px"></td>
        <td>3024</td>
        <td>24</td>
        </tr>
        <tr>
        <td>302301</td>
        <td>PLATE 1X2</td>
        <td><img src="/images/leisure/stayyoung/bom/image006.png" width="40px"></td>
        <td>3023</td>
        <td>44</td>
        </tr>
        <tr>
        <td>302324</td>
        <td>PLATE 1X2</td>
        <td><img src="/images/leisure/stayyoung/bom/image007.png" width="40px"></td>
        <td>3023</td>
        <td>13</td>
        </tr>
        <tr>
        <td>362301</td>
        <td>PLATE 1X3</td>
        <td><img src="/images/leisure/stayyoung/bom/image008.png" width="40px"></td>
        <td>3623</td>
        <td>5</td>
        </tr>
        <tr>
        <td>362324</td>
        <td>PLATE 1X3</td>
        <td><img src="/images/leisure/stayyoung/bom/image009.png" width="40px"></td>
        <td>3623</td>
        <td>3</td>
        </tr>
        <tr>
        <td>302201</td>
        <td>PLATE 2X2</td>
        <td><img src="/images/leisure/stayyoung/bom/image010.png" width="40px"></td>
        <td>3022</td>
        <td>12</td>
        </tr>
        <tr>
        <td>371001</td>
        <td>PLATE 1X4</td>
        <td><img src="/images/leisure/stayyoung/bom/image011.png" width="40px"></td>
        <td>3710</td>
        <td>1</td>
        </tr>
        <tr>
        <td>302101</td>
        <td>PLATE 2X3</td>
        <td><img src="/images/leisure/stayyoung/bom/image012.png" width="40px"></td>
        <td>3021</td>
        <td>7</td>
        </tr>
        <tr>
        <td>366601</td>
        <td>PLATE 1X6</td>
        <td><img src="/images/leisure/stayyoung/bom/image013.png" width="40px"></td>
        <td>3666</td>
        <td>45</td>
        </tr>
        <tr>
        <td>366624</td>
        <td>PLATE 1X6</td>
        <td><img src="/images/leisure/stayyoung/bom/image014.png" width="40px"></td>
        <td>3666</td>
        <td>7</td>
        </tr>
        <tr>
        <td>302001</td>
        <td>PLATE 2X4</td>
        <td><img src="/images/leisure/stayyoung/bom/image015.png" width="40px"></td>
        <td>3020</td>
        <td>22</td>
        </tr>
        <tr>
        <td>447701</td>
        <td>PLATE 1X10</td>
        <td><img src="/images/leisure/stayyoung/bom/image016.png" width="40px"></td>
        <td>4477</td>
        <td>2</td>
        </tr>
        <tr>
        <td>379501</td>
        <td>PLATE 2X6</td>
        <td><img src="/images/leisure/stayyoung/bom/image017.png" width="40px"></td>
        <td>3795</td>
        <td>14</td>
        </tr>
        <tr>
        <td>303401</td>
        <td>PLATE 2X8</td>
        <td><img src="/images/leisure/stayyoung/bom/image018.png" width="40px"></td>
        <td>3034</td>
        <td>8</td>
        </tr>
        <tr>
        <td>383201</td>
        <td>PLATE 2X10</td>
        <td><img src="/images/leisure/stayyoung/bom/image019.png" width="40px"></td>
        <td>3832</td>
        <td>8</td>
        </tr>
        <tr>
        <td>244501</td>
        <td>PLATE 2X12</td>
        <td><img src="/images/leisure/stayyoung/bom/image020.png" width="40px"></td>
        <td>2445</td>
        <td>2</td>
        </tr>
        <tr>
        <td>381123</td>
        <td>BASE PLATE</td>
        <td><img src="/images/leisure/stayyoung/bom/image021.png" width="40px"></td>
        <td>32X32</td>
        <td>6</td>
        </tr>
        <tr>
        <td></td>
        <td></td>
        <td></td>
        <td>TOTAL</td>
        <td>273</td>
        </tr>
        </tbody>
        </table>
        <p>
        <a href="https://github.com/TarGz/stay-young-and-play-lego" class="uk-button uk-button-large uk-button-primary uk-width-1-1"><i class="uk-icon uk-icon-github uk-icon-medium">&nbsp;</i>DOWNLOAD FILES</a>
        </p>
    </div>

</div>











