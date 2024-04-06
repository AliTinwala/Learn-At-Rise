let dolphins;
let koalas;

let avg_dolphins
let avg_koalas

function winner(dolphins_scores,koalas_scores)
{
    let i
    for(i=0;i<=dolphins_scores.length;i++)
    {
        console.log(dolphins_scores[i]);
    }
    for(j=0;j<=koalas_scores.length;j++)
    {
        console.log(koalas_scores[j]);
    }
}

let dolphins_scores = [96,108,89]
let koalas_scores = [88,91,110]

winner(dolphins_scores,koalas_scores)