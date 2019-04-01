This webpage contains some information on how to check the contents of the formal proofs of statements in our paper.

## Installation instructions
The library has been tested with Coq version 8.9.
It further depends on [Coquelicot](http://coquelicot.saclay.inria.fr/) (v3.0.2) and [math-comp](https://math-comp.github.io/math-comp/) (v1.7.0).

The following libraries have to be installed in this order:
- [mf](https://github.com/FlorianSteinberg/mf/tree/v1.0) 
- [rlzrs](https://github.com/FlorianSteinberg/rlzrs/tree/v1.0)
- [metric](https://github.com/FlorianSteinberg/metric/tree/v1.0)
- [incone](https://github.com/FlorianSteinberg/incone/tree/v1.0)

You can either download them from github (release version 1.0) or download a zip file containing all necessary files here.

To install each library simply go into the respective folder and run 
`make && make install`

## Checking the claims of the paper
All of the claims about parts of the incone library can be checked by installing the library, opening a new 
Coq-file with the following includes in the preamble.
```
From mf Require Import choice_mf.
From rlzrs Require Import all_rlzrs.
From metric Require Import all_metric Qmetric.
From incone Require Import all_cs classical_func classical_cont classical_mach Duop Q_reals baire_metric.
```
The paper contains references to the names of all definitions, lemmas, and so on. 
This allows to inspect the definitions via `Print def_name`, lemmas, theorems etc. via `Check lem_name` and notations via `Locate "not_name"`. 
In the case where the name of a lemma is not unique, `Locate "lem_name"` lists all lemmas with that name and unique identifiers and `Print Assumptions lem_name` shows the axioms that the result assumes. 
To list all results involving a concept Coq’s search function can be used via `Search _ (concept)` and `Search "phrase"` might be useful where phrase is an expected substring of a lemma’s name.

### Example
Theorem 1 in the paper has the name `cont_comp`.
In the library this is the lemma `cont_comp`.
`Check cont_comp.` prints the statement of the Lemma:
```
cont_comp
     : forall (X Y Z : cs) (f : Y -> Z) (g : X -> Y), 
        f \is_continuous -> g \is_continuous -> (f \o_f g) \is_continuous
```
`Locate cont_comp.` shows that the lemma can be found in the file `continuity_spaces/cs.v` in the incone library.
