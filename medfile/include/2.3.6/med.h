/*  This file is part of MED.
 *
 *  COPYRIGHT (C) 1999 - 2020  EDF R&D, CEA/DEN
 *  MED is free software: you can redistribute it and/or modify
 *  it under the terms of the GNU Lesser General Public License as published by
 *  the Free Software Foundation, either version 3 of the License, or
 *  (at your option) any later version.
 *
 *  MED is distributed in the hope that it will be useful,
 *  but WITHOUT ANY WARRANTY; without even the implied warranty of
 *  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 *  GNU Lesser General Public License for more details.
 *
 *  You should have received a copy of the GNU Lesser General Public License
 *  along with MED.  If not, see <http://www.gnu.org/licenses/>.
 */

#ifndef MED23_H
#define MED23_H

#include <hdf5.h>

#ifdef __cplusplus
extern "C" {
#endif

#define HDF5_VERSION (H5_VERS_MAJOR * 10000 + H5_VERS_MINOR * 100  + H5_VERS_RELEASE )
#if HDF5_VERSION < 10607
#define HDF5_SELECT_BUG (const hsize_t **)
#else
#define HDF5_SELECT_BUG
#endif


#define MED_NUM_MAJEUR 2 
#define MED_NUM_MINEUR 3 
#define MED_NUM_RELEASE 6 

#define MED_NULL       (void *) NULL
#define MED_MAX_PARA        20

#define MED_TAILLE_DESC 200
#define MED_TAILLE_IDENT  8
#define MED_TAILLE_NOM   32
#define MED_TAILLE_LNOM  80    
#define MED_TAILLE_PNOM  16

#define MED_PNOM_BLANC "                "
#define MED_NOM_BLANC  "                                "
/*                      01234567890123456789012345678901 */
/*
  MED_FULL_INTERLACE : exemple avec 3 composantes X,Y,Z : X1Y1Z1X2Y2Z2X3Y3Z3...
  MED_NO_INTERLACE   : exemple avec 3 composantes X,Y,Z : X1X2X3Y1Y2Y3Z1Z2Z3...
*/
typedef enum {MED_FULL_INTERLACE,
	      MED_NO_INTERLACE}  med_mode_switch; 

typedef enum {MED_NO_PFLMOD,
              MED_GLOBAL,
	      MED_COMPACT }  med_mode_profil;
          
typedef enum {MED_PFL_NON_COMPACT, MED_PFL_COMPACT} med_lecture_profil;

/* 
   MED_LECTURE          : Ouverture en lecture seule
   MED_LECTURE_ECRITURE : Ouverture en lecture/ecriture, si un �l�ment existe il est �cras�
   MED_LECTURE_AJOUT    : Ouverture en lecture/ecriture, si un �l�ment existe une erreur est g�n�r�e
   MED_CREATION         : Cr�er le fichier s'il n'existe pas, l'�crase sinon
   MED_MODE_ACCESS      : Variable globale interne initialis�e au mode d'ouverture
*/
typedef enum {MED_LECTURE, MED_LECTURE_ECRITURE, 
	MED_LECTURE_AJOUT, MED_CREATION, MED_UNDEF_MODE_ACCES} med_mode_acces; 

typedef enum {MED_NON_STRUCTURE, MED_STRUCTURE} med_maillage;

typedef enum {MED_GRILLE_CARTESIENNE, MED_GRILLE_POLAIRE, MED_GRILLE_STANDARD} med_type_grille;

typedef enum {MED_MAILLE, MED_FACE, MED_ARETE, MED_NOEUD, MED_NOEUD_MAILLE } med_entite_maillage;

typedef enum {MED_COOR, MED_CONN, MED_NOM, MED_NUM, MED_FAM,MED_COOR_IND1,MED_COOR_IND2,MED_COOR_IND3} med_table;

typedef enum {MED_FLOAT64=6, MED_INT32=24,MED_INT64=26, MED_INT=28} med_type_champ;

typedef enum {MED_MAILLAGE,MED_CHAMP} med_type_donnee;

#define MED_NBR_GEOMETRIE_MAILLE 15
#define MED_NBR_GEOMETRIE_FACE 4
#define MED_NBR_GEOMETRIE_ARETE 2
typedef enum {MED_POINT1=1, MED_SEG2=102, MED_SEG3=103, MED_TRIA3=203,
	      MED_QUAD4=204, MED_TRIA6=206,MED_QUAD8=208, MED_TETRA4=304,
	      MED_PYRA5=305, MED_PENTA6=306, MED_HEXA8=308, MED_TETRA10=310, 
	      MED_PYRA13=313, MED_PENTA15=315, MED_HEXA20=320, 
	      MED_POLYGONE=400, MED_POLYGONE2=420, MED_POLYEDRE=500, MED_NONE=0,
              MED_SEG4=104, MED_TRIA7=207,MED_QUAD9=209,MED_OCTA12=312,MED_PENTA18=318,MED_HEXA27=327
	     } med_geometrie_element;

/* Ces types ont �t� d�finis � partir de la version 3.0 de med et ne peuvent pas �tre pr�sents ds les fichiers 2.3 :
              MED_SEG4=104, MED_TRIA7=207,MED_QUAD9=209,MED_OCTA12=312, MED_HEXA27=327, MED_PENTA18=318
   Ils ont �t� d�clar�s afin de pouvoir uliser l'API3 sur des fichier 2.3
 */

typedef enum {MED_NOD, MED_DESC} med_connectivite ; 

typedef enum {MED_CART, MED_CYL,MED_SPHER} med_repere; 

typedef enum {MED_FAUX, MED_VRAI} med_booleen ; 

typedef enum {MED_GROUPE, MED_ATTR, MED_FAMILLE} med_dim_famille; 

typedef enum {MED_COMP, MED_DTYPE} med_dim_champ; 

typedef enum {MED_HDF_VERSION, MED_VERSION, MED_FICH_DES} med_fich_info; 

#define MED_NOPG    1                   /* Variable Interne                            */
#define MED_NOGAUSS  ""                 /* -> pas de point de Gauss                    */
#define MED_NOGAUSSi  MED_NOM_BLANC     /* Variable Interne                            */
#define MED_GAUSS_ELNO "MED_GAUSS_ELNO" /* localisation aux points de Gauss definis
					    sur les noeuds de l'element */              
#define MED_NOPFL   ""                  /* -> pas de profils utilisateur               */
#define MED_NOPFLi  MED_NOM_BLANC       /* Variable Interne                            */
#define MED_NOLIEN  ""
#define MED_NOLIENi MED_NOM_BLANC      /* Variable Interne                            */
#define MED_NOPF   0                   /* -> pas de profils pour _MEDdataseNnumEcrire */
#define MED_NOPDT -1                   /* rem: pas de pas de temps negatifs           */
#define MED_NONOR -1                   /* rem: pas de n�ordre negatif                 */
#define MED_DIM1   1                   /* PAS */
#define MED_ALL    0
#define MED_NOREF  ""
#define MED_DEFAUT ""                  /* Toutes les donnees champs ou maillage pour le montage */

/* correspondance des types avec HDF 5 */

typedef hsize_t        med_size;
typedef hssize_t       med_ssize;
typedef hid_t          med_idt;
typedef herr_t         med_err;

/* types elementaires */

typedef double         med_float;
/*La ligne suivante est d�termin�e � l'�tape de configuration*/
typedef long  med_int;

#include "med_proto.h"

extern MEDC_EXPORT char * MED_ENTITE_MAILLAGE_AFF[5];

extern MEDC_EXPORT char * MED_GEOMETRIE_MAILLE_AFF[MED_NBR_GEOMETRIE_MAILLE+2];
extern MEDC_EXPORT char * MED_GEOMETRIE_FACE_AFF[MED_NBR_GEOMETRIE_FACE+1];
extern MEDC_EXPORT char * MED_GEOMETRIE_ARETE_AFF[MED_NBR_GEOMETRIE_ARETE];
extern MEDC_EXPORT char * MED_GEOMETRIE_NOEUD_AFF[1];  

#ifdef __cplusplus
}
#endif

#endif  /* MED23_H */
