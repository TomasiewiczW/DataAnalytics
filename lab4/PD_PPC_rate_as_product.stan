// Passenger deaths - prior predictive checks with rate as product of intensity and miles flown

data {
    real Intensity; //Intensity of deaths per mile flown
}

generated quantities {
    real alpha = normal_rng(692,200); // Our previous distribution of lambda
    real beta = lognormal_rng(0,1);  // Lognormal because with more miles flown we are expecting more deaths
    int deaths = poisson_rng(Intensity*beta+alpha);
}