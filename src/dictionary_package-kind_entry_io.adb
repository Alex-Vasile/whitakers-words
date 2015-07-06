-- WORDS, a Latin dictionary, by Colonel William Whitaker (USAF, Retired)
--
-- Copyright William A. Whitaker (1936–2010)
--
-- This is a free program, which means it is proper to copy it and pass
-- it on to your friends. Consider it a developmental item for which
-- there is no charge. However, just for form, it is Copyrighted
-- (c). Permission is hereby freely given for any and all use of program
-- and data. You can sell it as your own, but at least tell me.
--
-- This version is distributed without obligation, but the developer
-- would appreciate comments and suggestions.
--
-- All parts of the WORDS system, source code and data files, are made freely
-- available to anyone who wishes to use them, for whatever purpose.

separate (Dictionary_Package)
package body Kind_Entry_IO is
   use Noun_Kind_Type_IO;
   use Pronoun_Kind_Type_IO;
   use Inflections_Package.Integer_IO;
   use Verb_Kind_Type_IO;

   ---------------------------------------------------------------------------

   Noun_Kind      : Noun_Kind_Type;
   Pronoun_Kind   : Pronoun_Kind_Type;
   Propack_Kind   : Pronoun_Kind_Type;
   Verb_Kind      : Verb_Kind_Type;
   Vpar_Kind      : Verb_Kind_Type;
   Supine_Kind    : Verb_Kind_Type;
   Numeral_Value  : Numeral_Value_Type;

   ---------------------------------------------------------------------------

   procedure Get
      ( File : in  File_Type;
        POFS : in  Part_Of_Speech_Type;
        Item : out Kind_Entry
      )
   is
   begin
      case POFS is
         when n =>
            Get (File, Noun_Kind);
            Item := (n, Noun_Kind);
         when pron =>
            Get (File, Pronoun_Kind);
            Item := (pron, Pronoun_Kind);
         when pack =>
            Get (File, Propack_Kind);
            Item := (pack, Propack_Kind);
         when adj =>
            Set_Col
               ( File,
                 Col (File) + Positive_Count (Kind_Entry_IO.Default_Width)
               );
            Item := (pofs => adj);
         when num =>
            Get (File, Numeral_Value);
            Item := (num, Numeral_Value);
         when adv =>
            Set_Col
               ( File,
                 Col (File) + Positive_Count (Kind_Entry_IO.Default_Width)
               );
            Item := (pofs => adv);
         when v =>
            Get (File, Verb_Kind);
            Item := (v, Verb_Kind);
         when vpar =>
            Get (File, Vpar_Kind);
            Item := (vpar, Vpar_Kind);
         when supine =>
            Get (File, Supine_Kind);
            Item := (supine, Supine_Kind);
         when prep =>
            Set_Col
               ( File,
                 Col (File) + Positive_Count (Kind_Entry_IO.Default_Width)
               );
            Item := (pofs => prep);
         when conj =>
            Set_Col
               ( File,
                 Col (File) + Positive_Count (Kind_Entry_IO.Default_Width)
               );
            Item := (pofs => conj);
         when interj =>
            Set_Col
               ( File,
                 Col (File) + Positive_Count (Kind_Entry_IO.Default_Width)
               );
            Item := (pofs => interj);
         when tackon =>
            Set_Col
               ( File,
                 Col (File) + Positive_Count (Kind_Entry_IO.Default_Width)
               );
            Item := (pofs => tackon);
         when prefix =>
            Set_Col
               ( File,
                 Col (File) + Positive_Count (Kind_Entry_IO.Default_Width)
               );
            Item := (pofs => prefix);
         when suffix =>
            Set_Col
               ( File,
                 Col (File) + Positive_Count (Kind_Entry_IO.Default_Width)
               );
            Item := (pofs => suffix);
         when x =>
            Set_Col
               ( File,
                 Col (File) + Positive_Count (Kind_Entry_IO.Default_Width)
               );
            Item := (pofs => x);
      end case;
   end Get;

   ---------------------------------------------------------------------------

   procedure Get (POFS : in Part_Of_Speech_Type; Item : out Kind_Entry) is
   begin
      case POFS is
         when n =>
            Get (Noun_Kind);
            Item := (n, Noun_Kind);
         when pron =>
            Get (Pronoun_Kind);
            Item := (pron, Pronoun_Kind);
         when pack =>
            Get (Propack_Kind);
            Item := (pack, Propack_Kind);
         when adj =>
            Set_Col (Col + Positive_Count (Kind_Entry_IO.Default_Width));
            Item := (pofs => adj);
         when num =>
            Get (Numeral_Value);
            Item := (num, Numeral_Value);
         when adv =>
            Set_Col (Col + Positive_Count (Kind_Entry_IO.Default_Width));
            Item := (pofs => adv);
         when v =>
            Get (Verb_Kind);
            Item := (v, Verb_Kind);
         when vpar =>
            Get (Vpar_Kind);
            Item := (vpar, Vpar_Kind);
         when supine =>
            Get (Supine_Kind);
            Item := (supine, Supine_Kind);
         when prep =>
            Set_Col (Col + Positive_Count (Kind_Entry_IO.Default_Width));
            Item := (pofs => prep);
         when conj =>
            Set_Col (Col + Positive_Count (Kind_Entry_IO.Default_Width));
            Item := (pofs => conj);
         when interj =>
            Set_Col (Col + Positive_Count (Kind_Entry_IO.Default_Width));
            Item := (pofs => interj);
         when tackon =>
            Set_Col (Col + Positive_Count (Kind_Entry_IO.Default_Width));
            Item := (pofs => tackon);
         when prefix =>
            Set_Col (Col + Positive_Count (Kind_Entry_IO.Default_Width));
            Item := (pofs => prefix);
         when suffix =>
            Set_Col (Col + Positive_Count (Kind_Entry_IO.Default_Width));
            Item := (pofs => suffix);
         when x =>
            Set_Col (Col + Positive_Count (Kind_Entry_IO.Default_Width));
            Item := (pofs => x);
      end case;
   end Get;

   ---------------------------------------------------------------------------

   pragma Warnings (Off, "formal parameter ""POFS"" is not referenced");
   procedure Put
      ( File : in File_Type;
        POFS : in Part_Of_Speech_Type;
        Item : in Kind_Entry
      )
   is
      pragma Warnings (On, "formal parameter ""POFS"" is not referenced");
      Starting_Col : constant Positive := Positive (Col (File));
   begin
      case Item.pofs is
         when n =>
            Put (File, Item.n_kind);
         when pron =>
            Put (File, Item.pron_kind);
         when pack =>
            Put (File, Item.pack_kind);
         when num =>
            Put (File, Item.num_value, Numeral_Value_Type_IO_Default_Width);
         when v =>
            Put (File, Item.v_kind);
         when vpar =>
            Put (File, Item.vpar_kind);
         when supine =>
            Put (File, Item.supine_kind);
         when others =>
            null;
      end case;
      Put
         ( File,
           String'((Integer (Col (File)) ..
                    Kind_Entry_IO.Default_Width + Starting_Col - 1
              => ' '))
         );
   end Put;

   ---------------------------------------------------------------------------

   pragma Warnings (Off, "formal parameter ""POFS"" is not referenced");
   procedure Put (POFS : in Part_Of_Speech_Type; Item : in Kind_Entry) is
      pragma Warnings (On, "formal parameter ""POFS"" is not referenced");
      Starting_Col : constant Positive := Positive (Col);
   begin
      case Item.pofs is
         when n =>
            Put (Item.n_kind);
         when pron =>
            Put (Item.pron_kind);
         when pack =>
            Put (Item.pack_kind);
         when num =>
            Put (Item.num_value, Numeral_Value_Type_IO_Default_Width);
         when v =>
            Put (Item.v_kind);
         when vpar =>
            Put (Item.vpar_kind);
         when supine =>
            Put (Item.supine_kind);
         when others =>
            null;
      end case;
      Put
         ( String'((Integer (Col) ..
                    Kind_Entry_IO.Default_Width + Starting_Col - 1
              => ' '))
         );
   end Put;

   ---------------------------------------------------------------------------

   procedure Get
      ( Source : in  String;
        POFS   : in  Part_Of_Speech_Type;
        Target : out Kind_Entry;
        Last   : out Integer
      )
   is
      Low : constant Integer := Source'First - 1;
   begin
      Last := Low;         --  In case it is not set later
      case POFS is
         when n =>
            Get (Source (Low + 1 .. Source'Last), Noun_Kind, Last);
            Target := (n, Noun_Kind);
         when pron =>
            Get (Source (Low + 1 .. Source'Last), Pronoun_Kind, Last);
            Target := (pron, Pronoun_Kind);
         when pack =>
            Get (Source (Low + 1 .. Source'Last), Propack_Kind, Last);
            Target := (pack, Propack_Kind);
         when adj =>
            Target := (pofs => adj);
         when num =>
            Get (Source (Low + 1 .. Source'Last), Numeral_Value, Last);
            Target := (num, Numeral_Value);
         when adv =>
            Target := (pofs => adv);
         when v =>
            Get (Source (Low + 1 .. Source'Last), Verb_Kind, Last);
            Target := (v, Verb_Kind);
         when vpar =>
            Get (Source (Low + 1 .. Source'Last), Vpar_Kind, Last);
            Target := (vpar, Vpar_Kind);
         when supine =>
            Get (Source (Low + 1 .. Source'Last), Supine_Kind, Last);
            Target := (supine, Supine_Kind);
         when prep =>
            Target := (pofs => prep);
         when conj =>
            Target := (pofs => conj);
         when interj =>
            Target := (pofs => interj);
         when tackon =>
            Target := (pofs => tackon);
         when prefix =>
            Target := (pofs => prefix);
         when suffix =>
            Target := (pofs => suffix);
         when x =>
            Target := (pofs => x);
      end case;
   end Get;

   ---------------------------------------------------------------------------

   pragma Warnings (Off, "formal parameter ""POFS"" is not referenced");
   procedure Put
      ( Target : out String;
        POFS   : in  Part_Of_Speech_Type;
        Item   : in  Kind_Entry
      )
   is
      pragma Warnings (On, "formal parameter ""POFS"" is not referenced");
      Low  : constant Integer := Target'First - 1;
      High : Integer := 0;
   begin
      case Item.pofs is
         when n =>
            High := Low + Noun_Kind_Type_IO.Default_Width;
            Put (Target (Low + 1 .. High), Item.n_kind);
         when pron =>
            High := Low + Pronoun_Kind_Type_IO.Default_Width;
            Put (Target (Low + 1 .. High), Item.pron_kind);
         when pack =>
            High := Low + Pronoun_Kind_Type_IO.Default_Width;
            Put (Target (Low + 1 .. High), Item.pack_kind);
         when num =>
            High := Low + Numeral_Value_Type_IO_Default_Width;
            Put (Target (Low + 1 .. High), Item.num_value);
         when v =>
            High := Low + Verb_Kind_Type_IO.Default_Width;
            Put (Target (Low + 1 .. High), Item.v_kind);
         when vpar =>
            High := Low + Verb_Kind_Type_IO.Default_Width;
            Put (Target (Low + 1 .. High), Item.vpar_kind);
         when supine =>
            High := Low + Verb_Kind_Type_IO.Default_Width;
            Put (Target (Low + 1 .. High), Item.supine_kind);
         when others =>
            null;
      end case;
      Target (High + 1 .. Target'Last) := (others => ' ');
   end Put;

   ---------------------------------------------------------------------------

end Kind_Entry_IO;
