---
layout: post
title: Setting Up an Experiment in OpenAI's Spinning Up
tags: rl spinningup
---

I've been familiarizing myself with
OpenAI's [spinning up](https://spinningup.openai.com/en/latest/)
and [gym](https://gym.openai.com/) repositories over the past several
days, reading over the documentation and working to get my machine
configured correctly.

Today, I wanted to play around with setting up an experiment, so tried
running some of the included algorithm implementations to see how
things worked.

The following worked out of the box to train the [CartPole
environment](https://gym.openai.com/envs/CartPole-v0/). It uses the [PPO algorithm](https://openai.com/blog/openai-baselines-ppo/), specifying some
hyperparameters, such as the hidden layer dimentions and the
activation function:

```
python -m spinup.run ppo --env CartPole-v0 --hid[h] [128,128] --act tf.nn.relu --exp_name cartpole-ppo
```

Afterwards, there is handy output to the console to see what
experiments are actually being trained and run.

```
================================================================================
ExperimentGrid [cartpole-ppo] runs over parameters:

 env_name                                 [env] 

	CartPole-v0

 ac_kwargs:hidden_sizes                   [h] 

	[128, 128]

 ac_kwargs:activation                     [ac-act] 

	relu

 Variants, counting seeds:               1
 Variants, not counting seeds:           1

================================================================================

Preparing to run the following experiments...

cartpole-ppo

================================================================================

Launch delayed to give you a few seconds to review your experiments.

To customize or disable this behavior, change WAIT_BEFORE_LAUNCH in
spinup/user_config.py.

================================================================================
Running experiment:                                                             

cartpole-ppo

with kwargs:

{
    "ac_kwargs":	{
        "activation":	"relu",
        "hidden_sizes":	[
            128,
            128
        ]
    },
    "env_name":	"CartPole-v0",
    "seed":	0
}

```

By default, it trains 50 epochs. I've pasted the first and last epoch of training here:

```
---------------------------------------
|             Epoch |               0 |
|      AverageEpRet |            22.7 |
|          StdEpRet |            11.5 |
|          MaxEpRet |              68 |
|          MinEpRet |               8 |
|             EpLen |            22.7 |
|      AverageVVals |         -0.0188 |
|          StdVVals |          0.0517 |
|          MaxVVals |            0.12 |
|          MinVVals |          -0.229 |
| TotalEnvInteracts |           4e+03 |
|            LossPi |        1.14e-07 |
|             LossV |             283 |
|       DeltaLossPi |         -0.0268 |
|        DeltaLossV |            -172 |
|           Entropy |            0.68 |
|                KL |          0.0152 |
|          ClipFrac |           0.223 |
|          StopIter |              64 |
|              Time |            1.97 |
---------------------------------------

...

---------------------------------------
|             Epoch |              49 |
|      AverageEpRet |             198 |
|          StdEpRet |            3.87 |
|          MaxEpRet |             200 |
|          MinEpRet |             187 |
|             EpLen |             198 |
|      AverageVVals |            55.9 |
|          StdVVals |            16.8 |
|          MaxVVals |            72.5 |
|          MinVVals |           -15.1 |
| TotalEnvInteracts |           2e+05 |
|            LossPi |        1.26e-08 |
|             LossV |             318 |
|       DeltaLossPi |        -0.00653 |
|        DeltaLossV |           -38.7 |
|           Entropy |            0.53 |
|                KL |         0.00412 |
|          ClipFrac |          0.0342 |
|          StopIter |              79 |
|              Time |            84.1 |
---------------------------------------
```

You can see the average episode return starts off at 22.7, but climbs
to 198 by the end of training. 

You can then easily test the policy like so:

```
python -m spinup.run test_policy /Users/Kasim/Projects/ml/spinningup/data/cartpole-ppo/cartpole-ppo_s0
...
Episode 0 	 EpRet 200.000 	 EpLen 200
Episode 1 	 EpRet 200.000 	 EpLen 200
Episode 2 	 EpRet 200.000 	 EpLen 200
Episode 3 	 EpRet 200.000 	 EpLen 200
Episode 4 	 EpRet 200.000 	 EpLen 200
Episode 5 	 EpRet 200.000 	 EpLen 200
```

You should see something like the following:

<iframe width="560" height="315" src="https://www.youtube.com/embed/BsSCGabYWdg" frameborder="0" allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>
