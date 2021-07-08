# Latent birds
## A bird's-eye view exploration of the latent space
#### Mini project for Machine Learning for Media Technology (SMC07-2019) presented at the 17th SMC conference

Bird song generator using a Variational Convolutional Autoencode. Keras + Tensorflow + GPU. 

Paper available at [Latent birds: a bird's-eye view exploration of the latent space](https://vbn.aau.dk/ws/files/406772724/SMCCIM_2020_paper_122.pdf)

Twitter bot available at [https://twitter.com/latentbirds/](https://twitter.com/latentbirds/)


#### Main files
[1- Mp3 to wav](utils/mp3_to_wav.command)
A bash script to split mp3 files into 4-second wav chunks. Remember to manually delete chunks shorter than 4 seconds.

[2- Spectrogram generator](spectrograms.ipynb)
A notebook to create the spectrograms from the wav chunks.

[3- Main file: latentbirds.ipynb](latentbirds.ipynb)
Jupyter notebook to train or test the generator. Execute the full notebook for training (1500 epochs, is going to take a while) or skip cell "Training" and load the precalculated weights.

### Citation

If you use this code please cite it as:

```latex
@inproceedings{
  moreno2020latent,
  title={Latent birds: a bird’s-eye view exploration of the latent space},
  author={Alonso, Juan and Bigoni, Francesco and Palamas, George},
  booktitle={Proceedings of 17th Sound and Music Computing Conference},
  year={2020}
}
```
