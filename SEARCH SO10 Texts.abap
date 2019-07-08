                                                                   *
*&---------------------------------------------------------------------*
*&      Form  F_SELECT_SO10_TEXT
*&---------------------------------------------------------------------*
*     Search Text from SO10
*----------------------------------------------------------------------*
FORM f_select_so10_text  CHANGING ch_sotext TYPE rssce-tdname.

  DATA e_thead TYPE thead.

  CONSTANTS: c_st TYPE thead-tdid VALUE 'ST'.

  CLEAR e_thead.

  CALL FUNCTION 'RETRIEVAL_TEXT'
    EXPORTING
      name             = ch_sotext
      id               = 'ST'
      language         = sy-langu
    IMPORTING
      header           = e_thead
    EXCEPTIONS
      canceled         = 1
      retrieval_error  = 2
      invalid_id       = 3
      invalid_language = 4
      OTHERS           = 5.

  CASE sy-subrc.
    WHEN 0.
      MOVE e_thead-tdname TO ch_sotext.
    WHEN 1.
      MESSAGE s603(td) WITH rssce-tdid 'TEXT'.
    WHEN 2.
      MESSAGE s604(td) WITH sy-langu.
    WHEN OTHERS.
  ENDCASE.

ENDFORM.                    " F_SELECT_SO10_TEXT
