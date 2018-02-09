# Usage

## Add score
```
$ ruby index.rb create
>Please enter the person
hoge
>Please enter the score
80
>Successfully created score
```

## Show scores
```
$ ruby index.rb read
>Show all score
1.hoge,80
2.huga,70
3.piyo,100
```

## Show scores as HTML
```
$ ruby index.rb read_as_html
><h2>Show all score<h2>
<p>1.hoge,80</p>
<p>2.fuga,70</p>
<p>3.piyo,100</p>
```

## Delete score
```
$ ruby index.rb delete
>Please enter delete line number
3
>Successfully deleted score
```

## Show avarage
```
$ ruby index.rb average
>Score Average: 75.0
```
