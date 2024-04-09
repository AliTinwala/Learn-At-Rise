let dolphins;
let koalas;

function winner(dolphins_scores,koalas_scores)
{
    let total_dolphins = 0,avg_dolphins = 0
    let size_dolphins = dolphins_scores.length
    let total_koalas = 0,avg_koalas = 0
    let size_koalas = koalas_scores.length
    
    let i
    for(i=0;i<dolphins_scores.length;i++)
    {
        total_dolphins += dolphins_scores[i]
    }
    avg_dolphins = total_dolphins / size_dolphins;
    document.write("Average Dolphins Score:- "+avg_dolphins+"<br>");

    for(j=0;j<koalas_scores.length;j++)
    {
        total_koalas += koalas_scores[j]
    }
    avg_koalas = total_koalas / size_koalas;
    document.write("Average Koalas Score:- "+avg_koalas+"<br>");

    if(avg_dolphins >= 100 & avg_koalas >= 100)
    {
        if(avg_dolphins > avg_koalas)
        {
            document.write("Winner is Team Dolphins"+"<br>")
        }
        else if(avg_koalas > avg_dolphins)
        {
            document.write("Winner is Team Koalas"+"<br>")
        }
        else
        {
            document.write("It is a draw")
        }
    }
    else
    {
        document.write("No team wins the trophy")
        document.write("<br>")
    }
    
}

document.write("Race 1"+"<br>")
let dolphins_scores = [96,108,89]
let koalas_scores = [88,91,110]
winner(dolphins_scores,koalas_scores)
document.write("<br>")

document.write("Race 2"+"<br>")
dolphins_scores = [97,112,101]
koalas_scores = [109,95,123]
winner(dolphins_scores,koalas_scores)
document.write("<br>")

document.write("Race 3"+"<br>")
dolphins_scores = [97,112,101]
koalas_scores = [109,95,106]
winner(dolphins_scores,koalas_scores)
document.write("<br>")
