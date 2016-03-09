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

with Latin_Utils.Dictionary_Package; use Latin_Utils.Dictionary_Package;
with Word_Package;

package Tricks_Package is

   procedure Syncope
     (W       : String;
      Pa      : in out Parse_Array;
      Pa_Last : in out Integer;
      Xp      : in out Word_Package.Explanations);

   procedure Try_Tricks
     (W           : String;
      Pa          : in out Parse_Array;
      Pa_Last     : in out Integer;
      Line_Number : Integer;
      Word_Number : Integer;
      Xp          : in out Word_Package.Explanations);

   procedure Try_Slury
     (W           : String;
      Pa          : in out Parse_Array;
      Pa_Last     : in out Integer;
      Line_Number : Integer;
      Word_Number : Integer;
      Xp          : in out Word_Package.Explanations);

   procedure Roman_Numerals
     (Input_Word : String;
      Pa         : in out Parse_Array;
      Pa_Last    : in out Integer;
      Xp         : in out Word_Package.Explanations);

end Tricks_Package;
