%%---------------------------------------------------------------------------------------------------------------------------%%
%% $Id: wlreport.cls 169 2011-11-12 20:27:39Z mip $ #########################################################################%%
%%---------------------------------------------------------------------------------------------------------------------------%%
%%
%%
%% Abstract:
%%   LaTeX class file wlreport.cls defines a report document class for the Wegener Center Document Preparation Framework.
%% Actually, it is a wrapper around the scrreprt document class provided by the KOMA-Script bundle.
%%
%% Details:
%% - This class file requires a TeX distribution equivalent to TeX Live 2009.
%%
%% References:
%% - LaTeX 2ε for class and package writers
%%   --> http://tug.ctan.org/tex-archive/macros/latex/doc/clsguide.pdf
%% - The Not So Short Introduction to LaTeX 2ε
%%   --> http://tug.ctan.org/tex-archive/info/lshort/english/lshort.pdf
%% - An essential guide to LaTeX 2ε usage
%%   --> http://tug.ctan.org/tex-archive/info/l2tabu/english/l2tabuen.pdf
%% - The pdfTeX user manual
%%   --> http://tug.ctan.org/tex-archive/systems/pdftex/pdftex-a.pdf
%% - Dvipdfm User’s Manual
%%   --> http://tug.ctan.org/tex-archive/dviware/dvipdfm/dvipdfm.pdf
%%
%% TODO:
%%   None.
%%
%% Author:
%%   Michael H. Pock || MHP || michael.pock@uni-graz.at
%%
%% © Copyright 2008-2011 [ WEGC && IGAM/IP ] / Uni Graz
%%
%%
%%---------------------------------------------------------------------------------------------------------------------------%%
%%###########################################################################################################################%%
%%---------------------------------------------------------------------------------------------------------------------------%%


\RequirePackage{wlinfo}


%%---------------------------------------------------------------------------------------------------------------------------%%


\NeedsTeXFormat{LaTeX2e}[\WL@TexFormatReleaseDate]


\ProvidesClass{wlreport}[\WL@ReleaseInfo]


%%---------------------------------------------------------------------------------------------------------------------------%%


\RequirePackage{wltools}


%%---------------------------------------------------------------------------------------------------------------------------%%


\PassOptionsToClass{%
  version=last,
  listof=totoc,
  bibliography=totoc,
  index=totoc,
  numbers=nodotatend,
  captions=tableheading%
}{scrreprt}


\BeforePackage{biblatex}{%
  \preto\@classoptionslist{%
    bibliography=totoc,%
  }%
}


\ifthenelse{\boolean{WebVersion}}{%
  \PassOptionsToClass{twoside=semi}{scrreprt}%
}{%
  \PassOptionsToClass{twoside=on}{scrreprt}%
}


%%---------------------------------------------------------------------------------------------------------------------------%%


%% NOTE: This suppresses an erroneous warning about unused global options.
\DeclareOption{web}{%
  \relax%
}


%% NOTE: This suppresses an erroneous warning about unused global options.
\DeclareOption{print}{%
  \relax%
}


%%---------------------------------------------------------------------------------------------------------------------------%%


\DeclareOption{naustrian}{%
  \PassOptionsToClass{numbers=autoenddot}{scrreprt}%
}


\DeclareOption{ngerman}{%
  \PassOptionsToClass{numbers=autoenddot}{scrreprt}%
}


%%---------------------------------------------------------------------------------------------------------------------------%%


\DeclareOption*{\PassOptionsToClass{\CurrentOption}{scrreprt}}


%%---------------------------------------------------------------------------------------------------------------------------%%


\ProcessOptions*


%%---------------------------------------------------------------------------------------------------------------------------%%


\ifthenelse{\boolean{WebVersion}}{%
  \PassOptionsToClass{BCOR=0pt}{scrreprt}%
}{%
}


%%---------------------------------------------------------------------------------------------------------------------------%%


\LoadClass{scrreprt}[2011/06/16]
%% --> http://tug.ctan.org/tex-archive/macros/latex/contrib/koma-script/scrguide.pdf


%%---------------------------------------------------------------------------------------------------------------------------%%


\RequirePackage{wlmain}


%%---------------------------------------------------------------------------------------------------------------------------%%


\SetUpPrimaryPageStyle{scrheadings}


%%---------------------------------------------------------------------------------------------------------------------------%%


\endinput


%%---------------------------------------------------------------------------------------------------------------------------%%
