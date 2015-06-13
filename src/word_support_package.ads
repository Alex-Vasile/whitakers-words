with text_io;
with direct_io;
with inflections_package; use inflections_package;
with dictionary_package; use dictionary_package;
package word_support_package is

   followed_by_period, follows_period, capitalized, all_caps :
	 boolean := false;

   type dictionary_stem is
	  record
		 stem : stem_type := null_stem_type;
		 part : part_entry := null_part_entry;
		 key  : stem_key_type := 0;
		 mnpc : dict_io.count := null_mnpc;
	  end record;

   package stem_io is new direct_io(dictionary_stem);
   package count_io is new text_io.integer_io(stem_io.count);

   subtype dictionary_file_kind is dictionary_kind range general..local;
   default_dictionary_file_kind : dictionary_file_kind := general;

   stem_file : array (dictionary_file_kind) of stem_io.file_type;

   stem_list : array (dictionary_file_kind) of text_io.file_type;
   indx_file : array (dictionary_file_kind) of text_io.file_type;

   type dict_array is array (positive range <>) of dictionary_stem;
   bdl : dict_array(1..100);
   bdl_last : integer := 0;
   --SIZE_OF_DICTIONARY_ARRAY : constant INTEGER := 120;    --  ###################
   --DDL : DICT_ARRAY(1..SIZE_OF_DICTIONARY_ARRAY);
   type dict_array_index is array (character range <>,
								   character range <>,
								   dictionary_file_kind range <>) of stem_io.count;

   bblf, bbll : dict_array_index(' '..' ', ' '..' ', dictionary_file_kind) :=
	 (others => (others => (others => 0)));
   bdlf, bdll : dict_array_index('a'..'z', ' '..' ', dictionary_file_kind) :=
	 (others => (others => (others => 0)));
   ddlf, ddll : dict_array_index('a'..'z', 'a'..'z', dictionary_file_kind) :=
	 (others => (others => (others => 0)));

   function adj_comp_from_key(key : stem_key_type) return comparison_type;

   function adv_comp_from_key(key : stem_key_type) return comparison_type;

   function num_sort_from_key(key : stem_key_type) return numeral_sort_type;

   function eff_part(part : part_of_speech_type) return part_of_speech_type;

   function len(s : string) return integer;

   function first_index(input_word : string;
						d_k : dictionary_file_kind := default_dictionary_file_kind)
					   return stem_io.count;

   function  last_index(input_word : string;
						d_k : dictionary_file_kind := default_dictionary_file_kind)
					   return stem_io.count;

   procedure load_indices_from_indx_file(indxfile_name : string;
										 d_k : dictionary_kind);

   procedure load_bdl_from_disk;

end word_support_package;
