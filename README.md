# Quiz
Console quiz game.

## About
That is simple quiz. You need to choose the correct answer before the question time will over.

## Before run
To start the app, make sure you have installed [ruby](https://www.ruby-lang.org/en/documentation/installation/ 'ruby install guide') и [git](https://git-scm.com/book/ru/v2/%D0%92%D0%B2%D0%B5%D0%B4%D0%B5%D0%BD%D0%B8%D0%B5-%D0%A3%D1%81%D1%82%D0%B0%D0%BD%D0%BE%D0%B2%D0%BA%D0%B0-Git 'git install guide').

## Run instruction
1. Clone the repository to your local computer by typing in the terminal:
```
git clone https://github.com/dasmodal/quiz.git
```
2. Open directory with the app:
```
cd quiz
```
3. Finally, you can run the app:
```
ruby victorina.rb
```
### Quiz play

[![quiz_process.gif](https://s4.gifyu.com/images/quiz_process.gif)](https://gifyu.com/image/S3G4L)

### Add yourself questions
1. Open the file `./data/questions.xml` with any text editor:
```
code .data/questions.xml
```
2. For each question, create new question structure as that did for old questions:
```
<question seconds="" points="">
  <text></text>
  <variants>
    <variant right="true"></variant>
    <variant></variant>
    <variant></variant>
    <variant></variant>
  </variants>
</question>
```
3. Fill question info:
```
<question seconds="50" points="20">
  <text>The question</text>
  <variants>
    <variant right="true">Right answer</variant>
    <variant>Wrong answer 1</variant>
    <variant>Wrong answer 1</variant>
    <variant>Wrong answer 2</variant>
  </variants>
</question>
```
4. Do that for each questions and save file