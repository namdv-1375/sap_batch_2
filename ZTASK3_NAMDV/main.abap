*&---------------------------------------------------------------------*
*& Report ZSYR1440_NAMDV
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT ZSYR1440_NAMDV.

TABLES: SFLIGHT.
*&---------------------------------------------------------------------*
*& SELECTION SCREEN
*&---------------------------------------------------------------------*
SELECTION-SCREEN BEGIN OF BLOCK B1 WITH FRAME TITLE TEXT-T01.
  PARAMETERS: P_CARRID TYPE SCARR-CARRID OBLIGATORY DEFAULT 'JL'.
  PARAMETERS: P_FLIGHT TYPE SFLIGHT-CONNID.
  SELECT-OPTIONS: S_DATE FOR SFLIGHT-FLDATE OBLIGATORY NO-EXTENSION.
SELECTION-SCREEN END OF BLOCK B1.

SELECTION-SCREEN BEGIN OF BLOCK B2 WITH FRAME TITLE TEXT-T02.
  PARAMETERS: P_CHKDST AS CHECKBOX.
  PARAMETERS: P_CTY_FR TYPE SPFLI-CITYFROM.
  PARAMETERS: P_CTY_T TYPE SPFLI-CITYTO.
SELECTION-SCREEN END OF BLOCK B2.

SELECTION-SCREEN BEGIN OF BLOCK B3 WITH FRAME TITLE TEXT-T03.
  PARAMETERS: P_ECON RADIOBUTTON GROUP GRP1 DEFAULT 'X'.
  PARAMETERS: P_BUSI RADIOBUTTON GROUP GRP1.
  PARAMETERS: P_FIRST RADIOBUTTON GROUP GRP1.
SELECTION-SCREEN END OF BLOCK B3.

*&---------------------------------------------------------------------*
*& AT SELECTION-SCREEN
*&---------------------------------------------------------------------*
AT SELECTION-SCREEN.
  IF P_CHKDST = ABAP_TRUE AND P_CTY_FR IS INITIAL AND P_CTY_T IS INITIAL.
    MESSAGE TEXT-E01 TYPE 'E'.
  ENDIF.

*&---------------------------------------------------------------------*
*& START-OF-SELECTION
*&---------------------------------------------------------------------*
START-OF-SELECTION.
  PERFORM DISPLAY_RESULT.

*&---------------------------------------------------------------------*
*& FORM DISPLAY_RESULT
*&---------------------------------------------------------------------*
FORM DISPLAY_RESULT.
  WRITE: / |{ TEXT-T04 }: { P_CARRID }|.
  WRITE: / |{ TEXT-T05 }: { P_FLIGHT }|.
  WRITE: / |{ TEXT-T06 }: { S_DATE-LOW } - { S_DATE-HIGH }|.
  WRITE: / TEXT-T07, ':', COND STRING( WHEN P_ECON  = 'X' THEN ''(T12)
                                       WHEN P_BUSI  = 'X' THEN ''(T13)
                                       WHEN P_FIRST = 'X' THEN ''(T14) ).

  IF P_CHKDST = 'X'.
    WRITE: / |{ TEXT-T08 }: { P_CTY_FR }|.
    WRITE: / |{ TEXT-T09 }: { P_CTY_T }|.
  ENDIF.

  WRITE: / |{ TEXT-T10 }: { SY-DATUM }|.
  WRITE: / |{ TEXT-T11 }: { SY-UZEIT }|.
ENDFORM.