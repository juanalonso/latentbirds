# Latent birds
## A bird's-eye view exploration of the latent space
#### Mini project for Machine Learning for Media Technology (SMC07-2019)

Bird song generator using a Variational Convolutional Autoencode. Keras + Tensorflow + GPU.

[Main file: latentbirds.ipynb](latentbirds.ipynb)
Jupyter notebook to train or test the generator. Execute the full notebook for training (1500 epochs, is going to take a while) or skip cell "Training" and load the precalculated weights.

[Utils: mp3 splitter](mp3_to_wav.command)
A bash script to split mp3 files into 4-second wav chunks. Remember to manually delete chunks shorter than 4 seconds.
