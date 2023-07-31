## renv issue 1617: the activation ghost

context: I have a project set up such that I have a {renv} project controlling
the transformation of lessons built with {sandpaper}. The workflow for a lesson
in the workbench uses renv profiles that are _only activated inside a callr
environment_ (renv -> sandpaper -> callr -> renv (profile)) so that the lesson
author can choose to use {renv} so that packages used to build the lessons are
kept separate from the packages needed for the lesson content. 

The transformation project is at https://github.com/carpentries/lesson-transition#readme

I have found that after 1.0.0, I am unable to build the lesson contents without
using `RENV_CONFIG_SANDBOX_ENABLED = FALSE`. Moreover, the activation process 
still takes a lot of time, _even If I don't call {renv}_. 

## Cloning this repository

I have the workbench-template-rmd as a submodule in the `lsn` folder. When you
clone this repository, use `--recurse-submodules` to provision it:

```sh
git clone --recurse-submodules https://github.com/zkamvar/renv-issue-1617.git
```


## Example 1: packages load slowly 

The `sandpaper::validate_lesson()` function reads in the markdown contents, 
converts it to XML, and then reports on the structure. It does not use the
{renv} package in any way shape or form.

When I load it inside the {renv}, it takes 11 seconds on my machine to execute this function. When I load it outside of {renv}, it takes 1 second.

You can run the test yourself with `bash script.sh`

The results are found in [`inside_renv.txt`](inside_renv.txt) and
[`outside_renv.txt`](outside_renv.txt)
