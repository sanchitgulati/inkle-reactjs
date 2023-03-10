# author: Pat Scott
# title: β°
# description: Made for the Ludum Dare 41 Compo. The theme was "combine two incompatible genres." Thus, a textless text-based choose-your-own adventure.


VAR seenCat = false
VAR haveCoat = false
VAR time = 0

-> entre

=== increase_time ===

    ~ time ++
    β³
    
    -> DONE

=== entre ===

    = awaken
        +   (alarm) [β°]
        -
        +   π€
                <>{|π€|π€π€|π€π€π€}
                {alarm < 4: -> awaken | -> angry_cat ->}
        *   [π«]
        
        //Morning prep loop
        
        -   (prep) {not seenCat:π} 
            {time == 3: <>π}
        
            *   (petCat) {not seenCat} [π]π½
                
            *   (fedCat) {seenCat} [π₯«]πΈπ©
                
            *   (cleanedShit) {fedCat} [π₯]πΌ
                
            *   (showered) {not dressed} πΏ
                
            *   (ate) π₯
                
            *   (dressed) π[]π
            
        -   ~ seenCat = true
            <- increase_time
            {time < 4: -> prep}

        //End morning prep
        
        *   [π]
        -
        *   [πͺ]
            * * {dressed} π§£π§₯
                πͺ
            * * ->
        -   -> street
        
        
    = angry_cat
        *   [πΎ]
            ~ seenCat = true
        -   
        *   [π€]π€
                <- increase_time
        ->->
        
    = street
        VAR coldness = 0
        ~ time = 0
        {awaken.dressed:
            ~ haveCoat = true
        
        }
        
        βοΈ
        -> checkCold ->
        π£
        
        //Hobo encounter
        
        *   [π§]π€²
            * * (hobo_gaveCoat) {haveCoat} [π§₯]
                ~ haveCoat = false
                <- increase_time
                <>π
            * * (hobo_gaveMoney) [πΈ]
                <- increase_time
                <>π
            * * (hobo_fuckOff) [π]π¨
            
        -   <- increase_time
            -> checkCold ->
        
        //Elder encounter
        
        *   [{~π΅|π΄}]βΏ
            * * (elder_chat) [πͺ]
                <- increase_time
                <>π¬
            * * (elder_wave) [π]
            * * (elder_horns) [π€]π―οΈ
            
        -   <- increase_time
            -> checkCold ->
        
        //Getting on the train
        
        *   [π]π«
            * * (police) {stolenCoat} [π?]οΈβ
                ππ§₯
                *** [π]π€₯
                    ****[ποΈ]π
                        <- increase_time
                *** [π]π¨
                    π£
            * * ->
            
            - - π
            * * (mugger) {not police} {time < 5} [π΅οΈ]πͺ
                *** {not hobo_gaveMoney} {not boughtCoat} [πΈ]ποΈ
                    π
                *** [π±]π΅ππ₯
                    π
                    π€
                    <- increase_time
                *** [πΆ]πͺ{~π§|π¦}
                        -> fight
                        
            * * (on_train) ->
            
            - -
            <- increase_time
            <>
            <- increase_time
            

        -   -> adventure

    = checkCold
        {not haveCoat: 
            ~ coldness ++
            <>π‘οΈ
        }
        *   {coldness > 1} [π¬]
            * * π§₯[]π
                *** (boughtCoat) {not street.hobo_gaveMoney} [πΈ]π§₯
                *** (stolenCoat) [π]π―οΈβ
                    π¨
                
                --- <- increase_time
                    ~haveCoat = true
        +   ->
        
        -   ->->
    
    = fight
        *{hobo_gaveCoat}[π§π§₯]π§πͺ
            π§π
            **[π΅]π₯
                π»
                π©π
                π§π©π€³
                -> on_train
        *[π£]
            **[π‘]π₯
                ***[π]
                    ****[β]
                        π€
                        π€
                        π
                        *****[π΅]π₯
                            π»
                            -> on_train
            **[π€‘]
                π΅ββ
                ***[π¨]
                    βοΈ
                    -> checkCold ->
                    π£
                    <- increase_time
                    <>
                    <- increase_time
                    <>
                    <- increase_time
                    <>
                    <- increase_time
                    
                    -> adventure


=== adventure ===
    
    = arrival_at_office
        
        VAR got_written_up = false
        
        *   [π’]
            **  [π£οΈπ]
                {
                    - time < 5:
                        π
                    - time < 7:
                        π£β
                    - else:
                        πββ
                            ~ got_written_up = true
                }
                
                {not entre.awaken.dressed:
                    πβ
                    ~ got_written_up = true
                }
                
                {not entre.awaken.showered:
                    πΏβ
                    ~ got_written_up = true
                }
                
        -   
        *   {got_written_up} [π]β οΈπ 
            π
        *   ->
        
        -   
        *   [π»]π£
            π»
            
        //Work loop
        
        VAR ok_we_get_it_you_write_a_lot = false
        VAR work_loop = 0
        
        -   (computer)
            ~ work_loop++
            
            *   {work_loop > 4} [π]
                -> a_package
                
            *   {work_loop > 3} {not entre.awaken.cleanedShit} [π]π
                -> cat_in_a_bag ->
                -> computer
            
            *   {work_loop > 2} {not entre.awaken.ate} [ππ₯‘]πΆ
                π₯‘
                **  [ποΈ]π¨
                    *** [π₯’]π
                **  [π]π»
                --  -> computer
                
            *   {work_loop > 2} {boredom} [π½]π­
                --  (toilet)
                **  {smoke} [π»]π£
                    -> computer
                ++  (squat) [π±]{~π|π?}
                    {squat > 3: -> shit}
                    <- increase_time
                    -> toilet
                **  (shit) [π©]π
                    π£
                    -> computer
                **  (smoke) [π¬]π
                    -> toilet
                    
            *   [π§]π
                -> computer
                
            +   (write) {not ok_we_get_it_you_write_a_lot} [π]
                {write > 3:
                    ποΈ
                    <- increase_time
                    ~ ok_we_get_it_you_write_a_lot = true
                    -> computer
                }
                βοΈ
                {write > 1: ποΈ}
                -> computer
            
            *   (boredom) [π°]π
                π΄
                -> computer
            
        -   
    
        -> finale
    
    = cat_in_a_bag
        *   {not entre.awaken.fedCat} [π¨]
            **  [πΎ]π€
                πΎ
        *   {entre.awaken.fedCat} [π²]πΏ
            **  [π]
                π
                πΎ
        
        -   ->->
        
    = a_package
        *   [π¦]π?
        
        -   (contents)
        *   [π]π«
            -> dive_in
        *   [π]π­
            -> contents
            
        -   (dive_in)
        *   [π΅]
            π€­
            π¨βπ§
            π©βπ
            π½
            π
            
        -
        *   [π]π 
            π
        
        -   
        +   (forest) π³[] ποΈποΈ π³π³ π³π΄ π³ π΄ π³ π΄π΄
            VAR have_crown = false
            
            ++  [ποΈ]π£
                <-  increase_time
                -> mountain ->
                
            ++  {cat_in_a_bag} {not encounter} [πΎ]
                <-  increase_time
                -> prints ->
                
            **  (rabbit) [π³]
                -> chase
                
            ++  [π΄]ποΈπποΈ
                +++ {not have_crown} [π]β¨οΈπ‘οΈ
                    π£
                    
                *** {have_crown} [π]π πΈπ±π¦π 
                    π¨οΈπΈπ
                    
                    ****(ring) [π]π πΈπ±π€΄π 
                        -> got_ring ->
                        
                    ****[β]π π 
                    
                    ----π£
                        
        -   -> forest

    = mountain
        ππ» ποΈ π»
        
        +   [π]
            <- increase_time
            --  (volcano) π₯π₯ππ₯π₯
                {dragon > 1: πΏ}
            
            ++  (hole) {have_crown} {dragon < 2} [π³οΈ]
                --- (dragon) {dragon < 3: π}
                
                *** [π]π¨οΈπ²π
                    ****{have_crown} [π]
                        -> got_sword ->
                        -> volcano
                        
                    ****(dont_give_crown) [β]π₯π₯π₯π²
                        π±π¨
                        -> volcano
                
                *** {dont_give_crown} {have_crown} [π]
                        -> got_sword ->
                        -> volcano
                    
                *** [π]π₯π₯π₯π²
                    π
                    -> hole
                    
                +++ {not got_sword} [π±]{dragon > 1:π₯π₯π₯}π¨
                    -> volcano
                    
                +++ ->
                    <>π¨
                    -> volcano
                

            ++  [ποΈοΈ]
                <- increase_time
                
        +   [ποΈ]
            <- increase_time
            <>π¦
            {not desert:π}
            --  (desert) π΅π΅ π΅ π΅π΅π΅ 
                {desert == 3:π¦π¨}
            
            ++  {not have_crown} {not got_crown} [π΅]{not saw_crown: π}
                --- (saw_crown) π
                
                *** (got_crown) [π]π
                    ~ have_crown = true
                
                +++ [π]π₯<>
                    -> saw_crown
                    
                +++ [β©οΈ]
            
            
            **  [π΅]π¦
                *** [π¦]ποΈ
                    ****[π¦]ποΈβπ¨οΈ
                        π¦π¨
            
            
            **  [π΅]π
                *** {entre.street.hobo_gaveMoney} [π§πΈ]π§πͺ
                    ****[π]π₯
                        π»
                        π§π¨
            
                *** [π±]π₯
                    π²
                    ****[π΅]π―
                        <- increase_time
                        <>
                        <- increase_time
                        <>
                        <- increase_time
                        π€
                        *****[π«]
                            -> a_package.forest
            
            ++  [ποΈ]{not comet:βοΈ}
                --- (comet)
                <- increase_time
                -> mountain
                            
            --  -> desert

            
        +   [π³]
            -> leave
    
        -   -> mountain
        
        -   (leave) π£
            <- increase_time
            ->->
    
    = got_sword
        π‘οΈ
        *   [ποΈ]π
           ~ have_crown = false
           
        -   ->->
        
    = got_ring
        π
        *   [ποΈ]π
           ~ have_crown = false
           
        -   ->->
    
    = prints

        {flower > 2: π³}
        {bush: πΏ}
        {rabbit > 3: π³}
        
        +   (flower) {flower < 3} [π³]
            ++  [π·]{flower < 3: π|πΊ}
        
        *   (encounter) π¦[]πΏπ
            **  (handsy) οΈ[ποΈ]ππ¨
            
            **  (watchful) [π€]π¦π
                πΈ
                π¨
                
        *   (bush) {encounter} [πΏ]ποΈ
            **  (got_key) [π]π
            
            **  [π°]π¬οΈποΈπ¨
            
        +   {rabbit < 4} [π³]
            {not rabbit: ππ¨}
            
            ++  {rabbit} [π±]{rabbit < 3: π|π}
            
            ++  ->
            
            --  (rabbit)
            
        +   [β©οΈ]
            -> leave
        
        -   -> prints
        
        -   (leave) π£
            <- increase_time
            ->->
    
    = chase
        *   [π]π°
            **  [π°]π°π¬
               ππ¨
        
        -   
        *   [πΎ]π£
        
        -   π³ππβ¨
        +   [π©]
        -   (tea_party)
            {tea_party < 2:ππ¨}
            {tea_party == 3 && encounter:ππΎ}
            {tea_party < 4:β¨<>}
            {tea_party < 5:
                {used_crown:π¦<>|π΄<>}
            }
            π΅
            {tea_party < 6:
                {used_crown:<>π|<>πΊ}
            }
            {tea_party < 4:<>β¨}
            
        
        -
        *   (used_crown) {have_crown} [π]β¨π©β¨
        *   (used_ring) {got_ring} {tea_party > 3} [π]
            -> post_party
        
        +   {tea_party < 8} [π΅]
        
        *   {tea_party > 7} [π΅]π―
            <- increase_time
            <>
            <- increase_time
            <>
            <- increase_time
            π€
            **[π«]
                -> post_party
        
        -   -> tea_party
        
        -   (post_party)
        +   [π³]π£
            {not used_ring: π«}
            
        -   -> finale

=== finale ===

    //The mystery and the credits

    *   {entre.street.hobo_fuckOff} [π§π]π§π―οΈ
        **  (flip_off) [π]π«π§
            ***  {adventure.got_sword} [π‘οΈ]πͺ
                ****[π§]π₯
                    π»
            
            ***  [π±]π₯
                -> fin
        
        **  [π]π§ββ {adventure.encounter:π|π}
            *** {adventure.encounter} [π]πΎ
                π₯
                π§π¨
            
            *** [π§₯]π€
            
            *** [π]
                -> flip_off
    *   ->
    
    -   (box) π¦ {adventure.encounter && not cat: π}
    *   [π]π
    *   ->
    
    -
    *   {adventure.got_key} [ποΈ]π
        **  [π¦]π
            *** [π΅]π«
    
    *   (cat) {adventure.encounter} [π]π
        πΎ
        -> box
    
    *   [π€]π₯
        **  [π€]π₯
            *** [π]π₯
                ****π¦[]π
                    π«
                    *****[βοΈ]
    
    -   (fin)
    *   [π€]
    -
    *   β°
        a short by Pat Scott
        π
    -   ->  END