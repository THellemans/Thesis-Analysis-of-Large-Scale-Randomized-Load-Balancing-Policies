# Thesis : Analysis of Large Scale Randomized Load Balancing Policies

In this repository we collect all files related to the thesis on power of d choices algorithms.
The complete text can be found at */LaTeX/thesis.pdf*. Here you can also find the TeX file which was used to obtain the pdf file.
For an in depth explanation of the code in this repo we refer to this *thesis.pdf*.

In the subfolder code, we provide all code required to generate the plots/tables inside the thesis.
All code was written in Matlab and should be functioning on *Matlab R2018a*.

We split the code over the associated chapters. As chapter one is the introductory chapter, the code associated to it
can be seen as all general code which is used throughout the other chapters. This code includes a function to compute a convolution using
the fft, generating and saving a figure (to pdf), initiating the distributions used throughout the thesis,...

For the other chapters (except for Chapter 4), the code is structured as follows:

 - *general_functions* : Contains functions which are used to efficiently compute the quantities of interest for the associated chapter.
 - *create_figures* : Here functions are defined which use the functions defined in *general_functions* to generate the data required to produce the plots.
 - *data* : This folder collects all data used for the plots of the associated chapter.
 - *create_figures* : Here we collect all functions used to generate plots from the data found in the *data* folder.
 - *figures* : Contains all figures used in the associated chapter.
 - *simulation_code* : For some chapters, we collect the code used for the simulation in a separate folder called *Simulation_code*

For Chapter 4, we used a different structure, in this chapter we consider 5 different load balancing policies and we collect all functions associated
to a load balancing policy in its own folder.
