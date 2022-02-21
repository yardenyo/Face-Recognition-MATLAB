# Face-Recognition-MATLAB
## recognize face parts by user choice
Made by Yarden Yosef && Itai Simhoni

# Introduction
face recognition is a subject that has a use in so many industries and for so many uses, example: police identify, fashion industry or digital image processing
such as photoshop, social media and so on.
recognize face parts by an algorithm could benefit especially in security field.
in this specific project we used GUI which the user can use to choose the part he wishes to recognize in the picture.

## Project Purpose
the main goal of this project is face recognition fully or partly by the user choice interactivly.
this tool could help us identify people, example: when a person is trying to cross a board between countries we will be able to
identify this person by his face. this tool will help us filter the people who enter the country by DataBase and prevent impersonating.

the program will get as an input face picture of single person or multiply persons, and will be able to recognize their faces partly of fully.
in case the part of face that the user chose was found, a message will be displayed that this element was found and in case of multiply parts
was found, the message will change and show the amount of parts found. as it is said above, we are looking for face parts, and if the pic
doesnt include face the message will say so.

our goal is to reach atleast 75% success for this program to detect face parts, this algorithm will work in different lighting conditions and angles.

## Definitions
proper image:
- the camera angle will be above the recognition position, in the center.
- the person/s will face to the camera.
- the face/s wont be hidden fully or partly.
- the pictures has to be clear and close as much as possible to the camera for effective recognition.
- mouth recognition is done at maximum accuracy when the mouth is closed.
- minimum of face/face part is **1**.

not-proper image:
- the camera position is non-strategic.
- the person/s is not facing the camera.
- part of the face/the whole face is hidden.
- non-clear pictures.
- lighting conditions is not good as expected.
- **there is no face/face part in this specific picture.**

## Algorithm
in this algorithm we used matlab function called CascadeObjectDetector.
this function is using Viola-Jones algorithm to identify full face/face parts in a picture or a video.
using switch case we will be able to interactivly recognize the chosen element by creating FaceDetector object for each scenario (case).
also, for each scenario we changed the Threshold value to match the specific face part to increase the algorithm accuracy.

the output we will get using step by array of Bounding Box, this type of algorithm will generate rectangle on the chosen part to recognize,
this rectangle wont affect the picture and wont hide the element in the picture.

picture load - <br><br>
<img data-src="https://gcdnb.pbrd.co/images/Afk5JTkhoiWc.png?o=1" data-load-src="https://pasteboard.co/images/Afk5JTkhoiWc.png/load" alt="uploaded image" class="image js" src="https://gcdnb.pbrd.co/images/Afk5JTkhoiWc.png?o=1">

reading value - <br><br>
<img data-src="https://gcdnb.pbrd.co/images/gyw5WpMYoQWN.png?o=1" data-load-src="https://pasteboard.co/images/gyw5WpMYoQWN.png/load" alt="uploaded image" class="image js" src="https://gcdnb.pbrd.co/images/gyw5WpMYoQWN.png?o=1">

each scenario read the img, creting FaceDetector object, setting the rectangle and showing the part that was found - <br>
(example for full face recognition)
<br>
<br>
<img data-src="https://gcdnb.pbrd.co/images/LjNKtNTcITvN.png?o=1" data-load-src="https://pasteboard.co/images/LjNKtNTcITvN.png/load" alt="uploaded image" class="image js" src="https://gcdnb.pbrd.co/images/LjNKtNTcITvN.png?o=1">

find out if there is face part or not - <br><br>
<img data-src="https://gcdnb.pbrd.co/images/odBaVYOyHmso.png?o=1" data-load-src="https://pasteboard.co/images/odBaVYOyHmso.png/load" alt="uploaded image" class="image js" src="https://gcdnb.pbrd.co/images/odBaVYOyHmso.png?o=1">

# Test-Run

<img data-src="https://gcdnb.pbrd.co/images/Yb7ht1z642nt.png?o=1" data-load-src="https://pasteboard.co/images/Yb7ht1z642nt.png/load" alt="uploaded image" class="image js" src="https://gcdnb.pbrd.co/images/Yb7ht1z642nt.png?o=1">

<img data-src="https://gcdnb.pbrd.co/images/Y6fi1FG5wgEP.png?o=1" data-load-src="https://pasteboard.co/images/Y6fi1FG5wgEP.png/load" alt="uploaded image" class="image js" src="https://gcdnb.pbrd.co/images/Y6fi1FG5wgEP.png?o=1">

<img data-src="https://gcdnb.pbrd.co/images/XFkP0oqLNmhP.png?o=1" data-load-src="https://pasteboard.co/images/XFkP0oqLNmhP.png/load" alt="uploaded image" class="image js" src="https://gcdnb.pbrd.co/images/XFkP0oqLNmhP.png?o=1">

<img data-src="https://gcdnb.pbrd.co/images/zJKxibUfmEdK.png?o=1" data-load-src="https://pasteboard.co/images/zJKxibUfmEdK.png/load" alt="uploaded image" class="image js" src="https://gcdnb.pbrd.co/images/zJKxibUfmEdK.png?o=1">

