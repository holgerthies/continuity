## Introduction
This webpage contains some information on how to check the contents of the formal proofs of statements in our paper.

### Installation instructions
The following libraries have to be installed in this order:
- [mf](http://www.github.com/floriansteinberg/mf) 
- [rlzrs](http://www.github.com/floriansteinberg/rlzrs)
- [metric](http://www.github.com/floriansteinberg/metric)
- [incone](http://www.github.com/floriansteinberg/incone)

You can either download them from github or download a zip file containing all necessary files from this page.

To install each library go into the respective folder and run 
`coq_makefile -f _CoqProject -o Makefile && make && make install`

### Checking the claims of the paper
All of the claims about parts of the incone library can be checked by installing the library, opening a new 
Coq-file with the following includes in the preamble.
```
From mf Require Import choice_mf.
From rlzrs Require Import all_rlzrs.
From metric Require Import all_metric Qmetric.
From incone Require Import all_cs classical_func classical_cont classical_mach Duop Q_reals baire_metric.
```
This should allow to inspect the definitions via `Print def_name`, lemmas, theorems etc. via `Check lem_name` and notations via `Locate "not_name"`. 
In the case where the name of a lemma is not unique, `Locate "lem_name"` lists all lemmas with that name and unique identifiers and `Print Assumptions lem_name` shows the axioms that the result assumes. 
To list all results involving a concept Coq’s search function can be used via `Search _ (concept)` and `Search "phrase"` might be useful where phrase is an expected substring of a lemma’s name.
