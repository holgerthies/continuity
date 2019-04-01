This webpage contains some information on how to check the contents of the formal proofs of statements in our paper.

## Installation instructions
You should have coq (8.9.0) running with the [Coquelicot](http://coquelicot.saclay.inria.fr/) library (3.0) and from [math-comp](https://math-comp.github.io/math-comp/) (1.7.0) the packages ssreflect,ssrnum,ssralg,poly and mxpoly. 

The following libraries have to be installed in this order:
- [mf](https://github.com/FlorianSteinberg/mf/tree/v1.0) 
- [rlzrs](https://github.com/FlorianSteinberg/rlzrs/tree/v1.0)
- [metric](https://github.com/FlorianSteinberg/metric/tree/v1.0)
- [incone](https://github.com/FlorianSteinberg/incone/tree/v1.0)

You can download each library from github using the above links (please use release version 1.0 for each library).
To install each library simply go into the respective folder and run 
`make && make install`.

Alternatively if you are using [opam](https://coq.inria.fr/opam-using.html) to build Coq
you need to clone [this](https://github.com/holgerthies/continuity) github repository (don't forget the --recurse-submodules as it contains submodules) and then do a

`opam install . --working-dir`

## Scopes and notations.

A general rule of the library is to use natural language to make the theorems as readable as possible.
For concepts where the order of arguments is not clear in prefix notation there is usually an infix notation.
To avoid blocking too many keywords by use of natural language in infix notation the words are connected by underscores and the first one is preceded by a backslash.
The libraries provide scopes for toggling the notations:
`mf_scope`, `baire_scope`, `met_scope` and `cs_scope`, where `mf` is for multi-function, `met` is for metric spaces and `cs` is for continuity spaces, that is represented spaces.
Each scope is delimited by a `%` followed by the phrase before the underscore.
Many of the notations in the different scopes overlap, for instance three of them have a notation `_ \is_continuous` and in some cases the notations are renamed with change of the scope:
For instance the notation `_ \is_continuous` from `baire_scope` is renamed to `_ \is_continuous_operator` in the `cs_scope`.

## Verifying the contents of the paper
All of the claims the paper makes about the incone library can be checked by installing the library, opening a new
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
To list all results involving a concept Coq’s search function can be used via `Search _ (concept)` and `Search "phrase"` might be useful where `phrase` is an expected substring of a lemma’s name.

### Example
One of the theorems in the paper has the name `cont_comp`.
In the library this is the lemma `cont_comp`.
`Check cont_comp.` prints the statement of the Lemma:
```
cont_comp
     : forall (X Y Z : cs) (f : Y -> Z) (g : X -> Y), 
        f \is_continuous -> g \is_continuous -> (f \o_f g) \is_continuous
```
This may or may not be the theorem you looked up in the paper.
`Locate cont_comp.` shows that there are several lemmas with this name and the one above can be found in the file `continuity_spaces/cs.v` in the incone library.
