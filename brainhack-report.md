---
event: '2015 OHBM Hackathon (HI)'

title:  'Nipype interfaces in CBRAIN'

author:

- initials: TG
  surname: Glatard
  firstname: Tristan
  email: tristan.glatard@mcgill.ca
  affiliation: aff1, aff2
  corref: aff1

- initials: SD
  surname: Das
  firstname: Samir
  email: samir.das@mcgill.ca
  affiliation: aff1
  
- initials: RA
  surname: Adalat
  firstname: Reza
  email: reza.adalat@mcgill.ca
  affiliation: aff1
  
- initials: NB
  surname: Beck
  firstname: Natacha
  email: natacha.beck@mcgill.ca
  affiliation: aff1
  
- initials: RB
  surname: Bernard
  firstname: Rémi
  email: remi.bernard@mail.mcgill.ca
  affiliation: aff1

- initials: NKM
  surname: Khalili-Mahani
  firstname: Najmeh
  email: najmeh.khalili@mcgill.ca
  affiliation: aff1

- initials: PR
  surname: Rioux
  firstname: Pierre
  email: pierre.rioux@mcgill.ca
  affiliation: aff1
  
- initials: MER
  surname: Rousseau
  firstname: Marc-Étienne
  email: marc.rousseau@mcgill.ca
  affiliation: aff1
  
- initials: ACE
  surname: Evans
  firstname: Alan C.
  email: alan.evans@mcgill.ca
  affiliation: aff1
  

affiliations: 

- id: aff1
  orgname: 'McGill Centre for Integrative Neuroscience (MCIN), Ludmer Centre for Neuroinformatics and Mental Health, Montreal Neurological Institute (MNI), McGill University'
  street: 3801 University Street, WB-208
  postcode: H3A 2B4
  city: Montréal
  state: Québec
  country: Canada
- id: aff2
  orgname: 'University of Lyon, CNRS, INSERM, CREATIS.'
  street: 7, avenue Jean Capelle
  postcode: 69621
  city: Villeurbanne
  state: 
  country: France

url: http://cbrain.mcgill.ca

coi: None

acknow: The authors would like to thank the organizers and attendees of the 2015 OHBM Hackathon.

contrib: TG wrote the software and the report; SD contributed to the concept elaboration at the OHBM event, RA, NB, PR and MER provided support on the CBRAIN framework, RB implemented Boutiques in CBRAIN, NKM provided background information on fMRI packages, ACE spearheaded the project.
  
bibliography: brainhack-report

gigascience-ref: REFXXX
...

#Introduction
We aim at the large-scale, automatic sharing of software tools between neuroimaging processing platforms. During the HBM 2015 Hackathon, we worked on the export of software tools from the Nipype workflow engine \cite{Gorgolewski2011} to the CBRAIN web platform for distributed computing \cite{sherif2014cbrain}. Our solution allows to export Nipype interfaces to the “Boutiques” description format importable by CBRAIN and pointing to a Docker image containing the implementation of the interface. The interface and its implementation can be automatically exported from Nipype to CBRAIN (see Fig. 1) and to other platforms supporting Boutiques (e.g. Virtual Imaging Platform and the Pegasus workflow engine). 

#Approach
We developed a tool to export Nipype interfaces to the Boutiques tool description format (step 1. on Fig 1.). nipype2boutiques relies on nipype_cmd, a tool to run Nipype Interfaces as Linux command lines. nipype2boutiques parses the inputs and outputs of a Nipype interface and extracts their name, type, description and position on the nipype_cmd command line. nipype2boutiques then generates a Boutiques descriptor pointing to a Docker image where the Nipype interface is available. Once a Nipype interface is exported using nipye2boutiques, it can be imported to CBRAIN. 

\begin{figure}[h!]
  \includegraphics[width=.47\textwidth]{architecture.pdf}
  \caption{\label{centfig} System architecture.}
\end{figure}


#Results
We tested nipype2boutiques on a few Nipype interfaces from the FSL Nipype module. We exported 64 FSL tools automatically from Nipype to CBRAIN, and made them available at \url{https://github.com/glatard/boutiques-nipype-fsl}. Limitations remain on the type of Nipype interface that can be exported by nipype2boutiques: in particular, InputMultiPath are currently not supported, and output files have to be written in the execution directory of the Nipype Interface. 

# Conclusions
We prototyped a software tool to export Nipype Interfaces as Boutiques descriptors which can be imported by CBRAIN and other platforms. Although the solution is still limited to simple interfaces, we believe that it has the potential to enable fully-automatic tool sharing between Nipype and CBRAIN. 
