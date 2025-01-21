*&---------------------------------------------------------------------*
*& Report ZSYR1420_NAMDV
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT ZSYR1420_NAMDV.

START-OF-SELECTION.
  ULINE AT 50(50).
  SKIP 1.
  WRITE: 50 |{ TEXT-T01 }| COLOR COL_NORMAL,
  /50 TEXT-T02, ':', sy-datum COLOR COL_HEADING,
  /50 TEXT-T03, ':', sy-uzeit COLOR COL_HEADING,
  /50 TEXT-T04, ':', sy-uname COLOR COL_HEADING.
  SKIP 1.
  ULINE AT 50(50).