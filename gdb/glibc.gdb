define exitfuncslen
   set lang c
   set var $count = 0
   set var $ptr = __exit_funcs
   while $ptr != 0
       set var $idx = 0
       while $idx < $ptr->idx
           set var $count = $count + ($ptr->fns[$idx].flavor != 0)
           set var $idx = $idx + 1
       end           
       set var $ptr = $ptr->next
   end
   print $count
end

define findexitfunc
   set lang c
   set var $ptr = __exit_funcs
   while $ptr != 0
       set var $idx = 0
       while $idx < $ptr->idx
           set var $entry = &$ptr->fns[$idx]
           if $entry.flavor == 4
               set var $handle = $entry->func.cxa.dso_handle
               if $start < $handle && $handle < $end
                   print/a $ptr->fns[$idx].func.cxa.arg
               end
           end
           set var $idx = $idx + 1
       end           
       set var $ptr = $ptr->next
   end
end
