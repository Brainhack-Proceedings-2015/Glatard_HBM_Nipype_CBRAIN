---
event: '2015 OHBM Hackathon (HI)'

title:  'Nipype in CBRAIN'

author:

- initials: TG
  surname: Glatard
  firstname: T
  email: glatard@mcgill.edu.ca
  affiliation: aff1, aff2
  corref: aff1

affiliations: 

- id: aff1
  orgname: 'McConnell Brain Imaging Centre, Montréal Neurological Institute, McGill University and Institute of Pscychology'
  street: 1 Queen St
  postcode: 055332
  city: Montréal
  state: Québec
  country: Canada
- id: aff2
  orgname: 'CREATIS, Université Claude Bernard Lyon 1'
  street: 2 Rue Lyon
  postcode: 87777
  city: Lyon
  state: 
  country: France

url: http://github.com/LORIS

coi: None

acknow: The authors would like to thank the organizers and attendees of the 2015 OHBM Hackathon.

contrib: TG wrote the software and the report.
  
bibliography: brainhack-report

gigascience-ref: REFXXX
...

#Introduction
We aim at the large-scale, automatic sharing of software tools between neuroimaging processing platforms. In this session, we worked on the export of tools from Nipype to CBRAIN.

During the HBM 2015 Hackathon, we worked on the export of software tools from the Nipype workflow engine \cite{Gorgolewski2011} to the CBRAIN web platform for distributed computing \cite{sherif2014cbrain}. Our solution allows to export Nipype interfaces to the “Boutiques” description format importable by CBRAIN and pointing to a Docker image, containing the implementation of the interface. The interface and its implementation can be automatically exported from Nipype to CBRAIN (see Fig. 1) and to other platforms supporting Boutiques (e.g. Virtual Imaging Platform and the Pegasus workflow engine). 

#Approach
We developed a tool to export Nipype interfaces to the Boutiques tool description format (step 1. on Fig 1.). nipype2boutiques relies on nipype_cmd (a tool to run Nipype Interfaces as Linux command lines). nipype2boutiques parses the inputs and outputs of a Nipype interface and extracts their name, type, description and position on the nipype_cmd command line. nipype2boutiques then generates a Boutiques descriptor pointing to a docker image where the Nipype interface is available. Once a Nipype interface is exported using nipye2boutiques, it can be imported to CBRAIN. 

\begin{figure}[h!]
  \includegraphics[width=.47\textwidth]{Nipype_CBRAIN.png}
  \caption{\label{centfig} System architecture.}
\end{figure}


#Results
We tested nipype2boutiques on a few Nipype interfaces from the FSL Nipype module. We were able to export 3 FSL tools automatically from Nipype to CBRAIN, and we verified their correct execution in CBRAIN. Limitations remain on the type of Nipype interface that can be exported by nipype2boutiques: In particular, optional inputs are currently ignored, InputMultiPath are not supported, and output files have to be written in the execution directory of the Nipype Interface. 

# Conclusions
We prototyped a software tool to export Nipype Interfaces as Boutiques descriptors which can be imported by CBRAIN and other platforms. Although the solution is still limited to simple interfaces, we believe that it has the potential to enable fully-automatic tool sharing between Nipype and CBRAIN. 