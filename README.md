# cv-latex

My CV and cover-letter template, written in latex. The final document can be viewed at [cv.dlevy.me](https://cv.dlevym.me/).

## Compiling

The easiest way is using `nix` flake commands. You don't even need to pull this repository:

```
nix run github:danilevy1212/cv-latex
```

If you do pull this repository:

```
nix run .
```

## Special Mentions

The class file that describes the structure of the **.tex** files is based on [muratcankaracabey/latex_cv](https://github.com/muratcankaracabey/latex_cv) template, though the implementation in this repository heavily modifies it.

The design for the documents is based on [posquit0/Awesome-CV](https://github.com/posquit0/Awesome-CV).
