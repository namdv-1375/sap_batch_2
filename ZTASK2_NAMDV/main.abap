*&---------------------------------------------------------------------*
*& Report ZSYR1430_NAMDV
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT ZSYR1430_NAMDV.

PARAMETERS:
  P_NUM1 TYPE N LENGTH 2 OBLIGATORY,
  P_NUM2 TYPE N LENGTH 2 OBLIGATORY.

DATA:
  LV_COMPARISON TYPE STRING,
  LV_RESULT     TYPE P LENGTH 10.

START-OF-SELECTION.

  " Step 1: Compare values and determine comparison result
  IF P_NUM1 > P_NUM2.
    LV_COMPARISON = |P_NUM1 > P_NUM2|.
  ELSEIF P_NUM1 < P_NUM2.
    LV_COMPARISON = |P_NUM1 < P_NUM2|.
  ELSE.
    LV_COMPARISON = |P_NUM1 = P_NUM2|.
  ENDIF.

  " Step 2: Perform calculation
  LV_RESULT = P_NUM2 * ( P_NUM1 + ( P_NUM1 * P_NUM2 ) ).

  " Display results
  WRITE: / LV_COMPARISON,
         / LV_RESULT.