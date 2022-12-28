function solution(balls, share) {
    var answer = factorial(balls) / (factorial(balls-share) * factorial(share));
    return answer;
}
function factorial(num) {
    let ret = BigInt(1);
    for(let i=2; i<=num ; i++){
        ret *= BigInt(i);
    }
    return ret;
}