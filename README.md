This webpage contains some information on how to check the contents of the formal proofs of statements in our paper.

## Installation instructions
You should have a coq (8.9.0) running with the coquelicot library (3.0).
The following libraries have to be installed in this order:
- [mf](http://www.github.com/floriansteinberg/mf) (master)
- [rlzrs](https://github.com/FlorianSteinberg/rlzrs/tree/development) (development)
- [metric](http://www.github.com/floriansteinberg/metric) (master)
- [incone](https://github.com/FlorianSteinberg/incone/tree/development)
(development)

You can either download them from github or download a zip file containing all necessary files here.

To install each library go into the respective folder and run
`make && make install`

Alternatively if you are using [opam](https://coq.inria.fr/opam-using.html) to buil Coq
you need to clone this github (don't forget the --recurse-submodules as it contains submodules) and then do a

`opam install . --working-dir`

## Checking the claims of the paper
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

### Theorem 1
In the library this is the lemma `cont_comp`
```
Lemma cont_comp (X Y Z: cs) (f: Y -> Z) (g: X -> Y):
    f \is_continuous -> g \is_continuous -> (f \o_f g) \is_continuous.
```
The lemma can be found in the file `continuity_spaces/cs.v` in the incone library.
