object FMain: TFMain
  Left = 0
  Top = 0
  Caption = 'FMain'
  ClientHeight = 612
  ClientWidth = 1057
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  Position = poDesigned
  WindowState = wsMaximized
  OnClose = FormClose
  OnCreate = FormCreate
  OnResize = FormResize
  OnShow = FormShow
  TextHeight = 15
  object PCMain: TPageControl
    Left = 231
    Top = 29
    Width = 826
    Height = 564
    Align = alClient
    MultiLine = True
    TabOrder = 0
    OnMouseDown = PCMainMouseDown
  end
  object SplitViewMenu: TSplitView
    Left = 0
    Top = 29
    Width = 231
    Height = 564
    AnimationDelay = 0
    AnimationStep = 0
    CloseStyle = svcCompact
    Color = clBlack
    CompactWidth = 0
    UseDockManager = False
    OpenedWidth = 231
    Placement = svpLeft
    TabOrder = 1
    UseAnimation = False
    object CPGMenu: TCategoryPanelGroup
      Left = 0
      Top = 34
      Width = 231
      Height = 530
      VertScrollBar.Tracking = True
      VertScrollBar.Visible = False
      Constraints.MinWidth = 210
      HeaderFont.Charset = DEFAULT_CHARSET
      HeaderFont.Color = clWindowText
      HeaderFont.Height = -15
      HeaderFont.Name = 'Segoe UI'
      HeaderFont.Style = []
      Images = Imagenes
      TabOrder = 0
    end
    object PMenuCabecera: TPanel
      Left = 0
      Top = 0
      Width = 231
      Height = 34
      Align = alTop
      TabOrder = 1
      Visible = False
    end
  end
  object pnlToolbar: TPanel
    Left = 0
    Top = 0
    Width = 1057
    Height = 29
    Align = alTop
    BevelOuter = bvNone
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -19
    Font.Name = 'Segoe UI'
    Font.Style = [fsBold]
    ParentBackground = False
    ParentColor = True
    ParentFont = False
    ParentShowHint = False
    ShowHint = True
    TabOrder = 2
    object Image1: TImage
      Left = 1000
      Top = 0
      Width = 28
      Height = 29
      Align = alRight
      Picture.Data = {
        0954506E67496D61676589504E470D0A1A0A0000000D494844520000002C0000
        002C080200000091E6CD56000000097048597300000B1300000B1301009A9C18
        00000A4F6943435050686F746F73686F70204943432070726F66696C65000078
        DA9D53675453E9163DF7DEF4424B8880944B6F5215082052428B801491262A21
        09104A8821A1D91551C1114545041BC8A088038E8E808C15512C0C8A0AD807E4
        21A28E83A3888ACAFBE17BA36BD6BCF7E6CDFEB5D73EE7ACF39DB3CF07C0080C
        9648335135800CA9421E11E083C7C4C6E1E42E40810A2470001008B3642173FD
        230100F87E3C3C2B22C007BE000178D30B0800C04D9BC0301C87FF0FEA42995C
        01808401C07491384B08801400407A8E42A600404601809D98265300A0040060
        CB6362E300502D0060277FE6D300809DF8997B01005B94211501A09100201365
        884400683B00ACCF568A450058300014664BC43900D82D00304957664800B0B7
        00C0CE100BB200080C00305188852900047B0060C8232378008499001446F257
        3CF12BAE10E72A00007899B23CB9243945815B082D710757572E1E28CE49172B
        14366102619A402EC27999193281340FE0F3CC0000A0911511E083F3FD78CE0E
        AECECE368EB60E5F2DEABF06FF226262E3FEE5CFAB70400000E1747ED1FE2C2F
        B31A803B06806DFEA225EE04685E0BA075F78B66B20F40B500A0E9DA57F370F8
        7E3C3C45A190B9D9D9E5E4E4D84AC4425B61CA577DFE67C25FC057FD6CF97E3C
        FCF7F5E0BEE22481325D814704F8E0C2CCF44CA51CCF92098462DCE68F47FCB7
        0BFFFC1DD322C44962B9582A14E35112718E449A8CF332A52289429229C525D2
        FF64E2DF2CFB033EDF3500B06A3E017B912DA85D6303F64B27105874C0E2F700
        00F2BB6FC1D4280803806883E1CF77FFEF3FFD47A02500806649927100005E44
        242E54CAB33FC708000044A0812AB0411BF4C1182CC0061CC105DCC10BFC6036
        844224C4C24210420A64801C726029AC82422886CDB01D2A602FD4401D34C051
        688693700E2EC255B80E3D700FFA61089EC128BC81090441C808136121DA8801
        628A58238E08179985F821C14804128B2420C9881451224B91354831528A5420
        55481DF23D720239875C46BA913BC8003282FC86BC47319481B2513DD40CB543
        B9A8371A8446A20BD06474319A8F16A09BD072B41A3D8C36A1E7D0AB680FDA8F
        3E43C730C0E8180733C46C302EC6C342B1382C099363CBB122AC0CABC61AB056
        AC03BB89F563CFB17704128145C0093604774220611E4148584C584ED848A820
        1C243411DA093709038451C2272293A84BB426BA11F9C4186232318758482C23
        D6128F132F107B8843C437241289433227B9900249B1A454D212D246D26E5223
        E92CA99B34481A2393C9DA646BB20739942C202BC885E49DE4C3E433E41BE421
        F25B0A9D624071A4F853E22852CA6A4A19E510E534E5066598324155A39A52DD
        A8A15411358F5A42ADA1B652AF5187A81334759A39CD8316494BA5ADA295D31A
        681768F769AFE874BA11DD951E4E97D057D2CBE947E897E803F4770C0D861583
        C7886728199B18071867197718AF984CA619D38B19C754303731EB98E7990F99
        6F55582AB62A7C1591CA0A954A9526951B2A2F54A9AAA6AADEAA0B55F355CB54
        8FA95E537DAE46553353E3A909D496AB55AA9D50EB531B5367A93BA887AA67A8
        6F543FA47E59FD890659C34CC34F43A451A0B15FE3BCC6200B6319B3782C216B
        0DAB86758135C426B1CDD97C762ABB98FD1DBB8B3DAAA9A13943334A3357B352
        F394663F07E39871F89C744E09E728A797F37E8ADE14EF29E2291BA6344CB931
        655C6BAA96979658AB48AB51AB47EBBD36AEEDA79DA6BD45BB59FB810E41C74A
        275C2747678FCE059DE753D953DDA70AA7164D3D3AF5AE2EAA6BA51BA1BB4477
        BF6EA7EE989EBE5E809E4C6FA7DE79BDE7FA1C7D2FFD54FD6DFAA7F5470C5806
        B30C2406DB0CCE183CC535716F3C1D2FC7DBF151435DC34043A561956197E184
        91B9D13CA3D5468D460F8C69C65CE324E36DC66DC6A326062621264B4DEA4DEE
        9A524DB9A629A63B4C3B4CC7CDCCCDA2CDD699359B3D31D732E79BE79BD79BDF
        B7605A785A2CB6A8B6B86549B2E45AA659EEB6BC6E855A3959A558555A5DB346
        AD9DAD25D6BBADBBA711A7B94E934EAB9ED667C3B0F1B6C9B6A9B719B0E5D806
        DBAEB66DB67D6167621767B7C5AEC3EE93BD937DBA7D8DFD3D070D87D90EAB1D
        5A1D7E73B472143A563ADE9ACE9CEE3F7DC5F496E92F6758CF10CFD833E3B613
        CB29C4699D539BD347671767B97383F3888B894B82CB2E973E2E9B1BC6DDC8BD
        E44A74F5715DE17AD2F59D9BB39BC2EDA8DBAFEE36EE69EE87DC9FCC349F299E
        593373D0C3C843E051E5D13F0B9F95306BDFAC7E4F434F8167B5E7232F632F91
        57ADD7B0B7A577AAF761EF173EF63E729FE33EE33C37DE32DE595FCC37C0B7C8
        B7CB4FC36F9E5F85DF437F23FF64FF7AFFD100A78025016703898141815B02FB
        F87A7C21BF8E3F3ADB65F6B2D9ED418CA0B94115418F82AD82E5C1AD2168C8EC
        90AD21F7E798CE91CE690E85507EE8D6D00761E6618BC37E0C2785878557863F
        8E7088581AD131973577D1DC4373DF44FA449644DE9B67314F39AF2D4A352A3E
        AA2E6A3CDA37BA34BA3FC62E6659CCD5589D58496C4B1C392E2AAE366E6CBEDF
        FCEDF387E29DE20BE37B17982FC85D7079A1CEC2F485A716A92E122C3A96404C
        884E3894F041102AA8168C25F21377258E0A79C21DC267222FD136D188D8435C
        2A1E4EF2482A4D7A92EC91BC357924C533A52CE5B98427A990BC4C0D4CDD9B3A
        9E169A76206D323D3ABD31839291907142AA214D93B667EA67E66676CBAC6585
        B2FEC56E8BB72F1E9507C96BB390AC05592D0AB642A6E8545A28D72A07B26765
        5766BFCD89CA3996AB9E2BCDEDCCB3CADB90379CEF9FFFED12C212E192B6A586
        4B572D1D58E6BDAC6A39B23C7179DB0AE315052B865606AC3CB88AB62A6DD54F
        ABED5797AE7EBD267A4D6B815EC1CA82C1B5016BEB0B550AE5857DEBDCD7ED5D
        4F582F59DFB561FA869D1B3E15898AAE14DB1797157FD828DC78E51B876FCABF
        99DC94B4A9ABC4B964CF66D266E9E6DE2D9E5B0E96AA97E6970E6E0DD9DAB40D
        DF56B4EDF5F645DB2F97CD28DBBB83B643B9A3BF3CB8BC65A7C9CECD3B3F54A4
        54F454FA5436EED2DDB561D7F86ED1EE1B7BBCF634ECD5DB5BBCF7FD3EC9BEDB
        5501554DD566D565FB49FBB3F73FAE89AAE9F896FB6D5DAD4E6D71EDC703D203
        FD07230EB6D7B9D4D51DD23D54528FD62BEB470EC71FBEFE9DEF772D0D360D55
        8D9CC6E223704479E4E9F709DFF71E0D3ADA768C7BACE107D31F761D671D2F6A
        429AF29A469B539AFB5B625BBA4FCC3ED1D6EADE7AFC47DB1F0F9C343C59794A
        F354C969DAE982D39367F2CF8C9D959D7D7E2EF9DC60DBA2B67BE763CEDF6A0F
        6FEFBA1074E1D245FF8BE73BBC3BCE5CF2B874F2B2DBE51357B8579AAF3A5F6D
        EA74EA3CFE93D34FC7BB9CBB9AAEB95C6BB9EE7ABDB57B66F7E91B9E37CEDDF4
        BD79F116FFD6D59E393DDDBDF37A6FF7C5F7F5DF16DD7E7227FDCECBBBD97727
        EEADBC4FBC5FF440ED41D943DD87D53F5BFEDCD8EFDC7F6AC077A0F3D1DC47F7
        068583CFFE91F58F0F43058F998FCB860D86EB9E383E3939E23F72FDE9FCA743
        CF64CF269E17FEA2FECBAE17162F7EF8D5EBD7CED198D1A197F29793BF6D7CA5
        FDEAC0EB19AFDBC6C2C61EBEC97833315EF456FBEDC177DC771DEFA3DF0F4FE4
        7C207F28FF68F9B1F553D0A7FB93199393FF040398F3FC63332DDB00000AB249
        44415478DAED987B7414D51DC77FF7CEECBC7637D9DD6C028497BC3454148A01
        232A0F6D501151443CC4075502142151AB6DA8ED2150508B07AAA2011212DE91
        00427923010491102C2A85C2010403C190F73BFB9ADD9D99DB3BBB2124C86EC2
        39F5F49FDEEC9ECCCEDCB9F733F7FEE6FB7BA03E094FD6373441C8861000A17F
        B4F97CF410710201959E0F7C6ED130208D76F76160558C11FDA585E8196C564B
        0432F77DC0E17485E98480108580DBD977409C8165CF9F3A0B92041C0B5A88EE
        5E0086240E749E2BE14ACB2590FC0821127A7CB3C9886C710FD7353486EC4208
        383D268BF10F29536626BF6030B01939B91F2F5B5B5B590F6629B04CD7E786C0
        02C928A1BFFCCE738DE386565EAB327EB03D7A59BE595331F07439302284FC8C
        C766890C0D41A7F7C880D1538923D267CF8CBF6F90C7E3A613899274F6DC85F9
        0B3FFD7CE7017D9724912EB9A61290599B55797B6C2DFDF09217DC002C008F0F
        7E1FF5FE16CBE1B3466034C453064CF4A13B08E1F6C40F1E909EF6DA98C49181
        5F72331B10511030C6070E172CFC28EBC8B193981738064F1BD9F0E6B8BADEDD
        1CE00150F559347D1B18242A4411361C8D98BFC57EB19CC39C6E301D83F0C86F
        A7BCF2EE9CB704CEE074B9E87DAD4C8B04AC15994C92A26A69F3162FC958B137
        BDF1B1FBEB4126E047D7FB40CB4DBA494850E7105FF83036FFA41978B5B551DF
        12429F03DCEE3D9FAF18337A94C3E10863B366B369E3F6FCC9D3A65D5B5E1163
        55C11FC6FE004C909AD92D635714485A4721B6AEFF64FCD8D14E973BDCB02669
        FDE63DC9B3528A3EADE811A3B40321C28CCCEE597B6DFF7D8875142225E5F292
        CA1E313E50C23104207A5C8768C7266E1B624A4ACA95DB80A0DBA1FEEF202498
        B1FC7621722944A2CBE909B5CF44173B0AB137396556603B1450B4107D035226
        A2DF65DEB1E28B48103BBC1D7BB6E68CF9CD084753532B59BC1922C26CDEB463
        FFCB53A7566455D8AC7E5DB04341D0312C2435A367C62E0B12438A55702A557F
        B90985F0273E317CE97BB3FBF5EDE5F2B835BFDAECC8AE033098918CC66BA515
        A9690B76EC3E3827C9FDE767AA79D10BB22E52843A317D22AA0FF4360206023C
        3AF85DE4CC65A64B651232F1D0CA9BB459094CDD9DC680863BF3DE29B686FC72
        ED92B9777ADA8CE4A4B116B3D5ED74A9BACB2254064D4623B595DCCD3B3F5892
        5D7CB984CA1671A161FDDD69131A9E1E524B29884F7F7A423066546A8FD7CA8C
        0BF2A47585B103C73E2D3B6B4EEF3FA88F23F041356BBB1D1A2360FFCCA88659
        9D1DBD85265913569609EF5E31497183DF9B3DEDF971A335A23F1DC3305FECFF
        6AFEA26527BEF917F002120CF44E3A26F1627A303EC13D7762EDC03E4DE023C0
        118743F8FB364BD61EA374CFE8A7664DEE79F7BDAADF77FED89143EB728B4FD1
        DB3960391B75E551710FD7D6E9F1C4E311AE055DEBE28D4ED0E874485F7EAC56
        F88D8BAEF21F965B47258E583CF70DA320CE9EB768C7BEC3FABE49428BE604FE
        11FDC93C5812D42989CE79132B0F9F16FFB246A896E2C7A54C1F307C981E63C8
        32EDC24B4645767FBF6B57FECA958E9A0A5B976E14E221BBBB6E7EE78A09511E
        067989CAB4B128A401C6271C62DA25E369A93BCB3235A595603286B2D6000CA6
        96D1C5EE75AA11439E4D7A2469A2101921BB5C2DBE13056C4A12C5DA9FAE7D95
        B7BEE87821EA13977020F66C2FD1030A5281A181106EFB52D25F989EC2F8D90B
        5DB6D59B80C3E0F303C7355F5614BD87EEF73D37C8247A559CF1E1E2B8878779
        9A9CAADA461882164EADDF60E024B3E9C0271FA3B8B821C7BA9EB1B16A183DD0
        5F18469B56DC3DA7DA2208865EDD3A9D3FF7030812C86E7BE74E96483385983E
        79026630EDCD324C76EED6F33F14BFB56A8DBD572F450F0A43AA87603617AE5D
        89EE8A1B7234F66C34E7A77600A11B859872A5DBEAAA481A3C14EECCD973A820
        7DEEE24183EFC95BF551E6EA0DA31E7CE0E28F4597AF9622169B2469FB175F16
        1597BE9195D3A9DF9DED40984C056B726E1BC220E0439B724C66BEC929B32CC4
        D86C19ABF3C63DFE6865554D7D43A3C0F39FE46C38FDDDBF598B393563F92F05
        C14BECBEDC8CD477DE7FFE99C7B7EF3E3075F273256555C387C51F3F71926270
        1CB7FFEBC20BE78B58514C5DFA0B423085DBD7BCFC46FAB97F9EA4E7376D5EFE
        C3C5E2A14307BDF85A5AEDE5523D0A17382A262CC3BEBE74794C0721E2E2E229
        849D534241341B2626C957BBADAAB2723C4A7F736AD667FF28B9564E5F8DD419
        2F975754F7EBDD3D3B6F474D4D3D9D5E176B1519389CBA342BBA4F5F35044470
        32C1642E589B8DEE8C1BFA6DD73311064525CDA28F5A853D81A09446AB0818E5
        D5A21E6B6AAC88D588EC05CE405F5AFD9DA4C7F4802638067A0605462754B8A9
        62FF3E7B55D75FF577373592102F1EC238C26E3F92B90C45DFF5D070289F175B
        3D407453DFA39180CB69E9471F0B9306855B54625F51175907ACE653A9370AB7
        71447F0E51F5D9EF1E98F86A725CC2107A8BE2BFB11E282012BC20AA7EF5F4BE
        DDDF6EDB1A90ED5A8795F1BF1AED4CEF521DC97A41C59A3E120ECA656EA5E5AF
        97235DFD8C9393B1686036E4F82E9ED1280762024E2AE8279BBF44974B80A70D
        8E49C6A6334DFE95FEE8A8479E1C3B7D7AA79E3DBC6E5953A837269C816305FE
        D23785F9D9D9974F9DB4C544B738304C37B2BF28CFE95233C9DA84A8F723E864
        93987625FA04674A9C0063C6229AFC6944F179D8635F921D9BA1A64C0181A119
        0E8260B6AA43DCCB7A92F98678834C35920728D5D0BA1AEE88B5CF7D935E1CF9
        EC04AADF74656BAEFE7474E386E3BB76AAB28766946DE2097D63357DA04722BD
        6FC6D4EEA9356F6A8A18389A19FF9CD6A90BC81E55D3DD0A46581145545BC5E4
        EF54BEDC4B53548404423DCE1D8CEF45BEFE51DE2310D5ADA73DBA13A4818401
        A1F35EB2AA41FCB1DFD051492FB8EBAB0EE57EE6ACAEA6D323CC905B455681CD
        A6285E2DB63F33E375B8B31FF17A55BF7293BF420C4B78014A8AF1EA0CEDC259
        6D92E8F8ADD418092A0D067F9E83F381E0E66B27B3D861ADA74B4E8D9A31B45C
        0D9D81C9F0A78568F0FDC8D17853D2D606C51C09854760D93C656374590C52E5
        30D64A2743DA7C8F7D9BD78202A5830E41FC7101193484F5CA1A09090182888E
        17682BDE55D6475574C6AA1FC23523220B3DB61D3A04B41E33348417DE9E4706
        27206A3A611A2FA1E34749F6820004E3F7872D8648485BE8B1EFF45900DA8FB6
        FF0FF133086DF0FD580E636C3720FCEBA32A7F118877FE06037E0DEDAC84119D
        28249973953C7BB91D2BE1214C48FBC013B5CD67ED30840C2F4D43E39290ECD5
        FC5E3DA047A475794AAF9A180CC828E12D1B95CF33B525F69A04D6E3246DB251
        AA0E819BA85B5345BD9EC6CE71D90BFC3448EE2084EEB6B484070DE393B4EEBD
        8957D6E3D9EB9708CB624E80B212D8BD19157CA5282A8E64D5899C633CD760C5
        E021E4865E119ACBA8344C2E50C41CAFAD48E1882E12A8C3352B3D800629128D
        7C8C193341B3D991ECD63330AAD90D8D68DF36E6E02EC5D5A881C8E8A91BD541
        0D75659597F8BA270C2E166932412C008BC939855FEFB51EF589102CDF355745
        51C720820B4F17C00351B1F0FC2BE8C1111831E4F8D7B0652D545CA5F91D06A6
        552A01105CFD818C67BA54771FE3AB236C9E6CDCECB57A2118A6040B59E4A62A
        AC0ED16E31556F0ADD6D72773C8D979853859A3EB70107ECEBD696C80219C1CA
        9734C34F1A0BED35BD98DA5E5919A0855DCFFC692481035189160C1D6EB17CBA
        1107AF523F4A2313460B57D0D5CBCAFF019C62C479C334CA860000000049454E
        44AE426082}
      Proportional = True
    end
    object BMenu: TButton
      AlignWithMargins = True
      Left = 5
      Top = 5
      Width = 19
      Height = 19
      Hint = 'Oculta/Mostrar  menu'
      Margins.Left = 5
      Margins.Top = 5
      Margins.Right = 5
      Margins.Bottom = 5
      Align = alLeft
      BiDiMode = bdLeftToRight
      ImageIndex = 3
      Images = IM16
      ParentBiDiMode = False
      TabOrder = 0
      OnClick = BMenuClick
    end
    object BVentanas: TButton
      AlignWithMargins = True
      Left = 34
      Top = 5
      Width = 19
      Height = 19
      Hint = 'Ventanas de la aplicacion'
      Margins.Left = 5
      Margins.Top = 5
      Margins.Right = 5
      Margins.Bottom = 5
      Align = alLeft
      BiDiMode = bdLeftToRight
      ImageIndex = 10
      Images = IM16
      ParentBiDiMode = False
      TabOrder = 1
      OnClick = BVentanasClick
    end
    object BSistema: TButton
      AlignWithMargins = True
      Left = 1033
      Top = 5
      Width = 19
      Height = 19
      Hint = 'Oculta/Mostrar  menu'
      Margins.Left = 5
      Margins.Top = 5
      Margins.Right = 5
      Margins.Bottom = 5
      Align = alRight
      BiDiMode = bdLeftToRight
      ImageIndex = 11
      Images = IM16
      ParentBiDiMode = False
      TabOrder = 2
      OnClick = BSistemaClick
    end
    object BAuxiliares: TButton
      AlignWithMargins = True
      Left = 63
      Top = 5
      Width = 19
      Height = 19
      Hint = 'Auxiliares'
      Margins.Left = 5
      Margins.Top = 5
      Margins.Right = 5
      Margins.Bottom = 5
      Align = alLeft
      BiDiMode = bdLeftToRight
      ImageIndex = 14
      Images = IM16
      ParentBiDiMode = False
      PopupMenu = PMAuxiliares
      TabOrder = 3
      OnClick = BAuxiliaresClick
    end
    object BImportador: TButton
      AlignWithMargins = True
      Top = 5
      Width = 19
      Height = 19
      Margins.Left = 5
      Margins.Top = 5
      Margins.Right = 5
      Margins.Bottom = 5
      Align = alLeft
      BiDiMode = bdLeftToRight
      ImageIndex = 14
      Images = IM16
      ParentBiDiMode = False
      PopupMenu = PMAuxiliares
      TabOrder = 3
      Left = 92
      Hint = 'Importador de Merge (módulos y listados)'
      ShowHint = True
      OnClick = BImportadorClick
    end
  end
  object StatusBar1: TStatusBar
    Left = 0
    Top = 593
    Width = 1057
    Height = 19
    Panels = <
      item
        Width = 400
      end
      item
        Width = 200
      end>
  end
  object SplitViewSistema: TSplitView
    Left = 1057
    Top = 29
    Width = 0
    Height = 564
    AnimationDelay = 0
    AnimationStep = 0
    Opened = False
    OpenedWidth = 231
    Placement = svpRight
    TabOrder = 4
    UseAnimation = False
    object PNLConfiguracion: TPanel
      Left = 0
      Top = 40
      Width = 0
      Height = 524
      Align = alClient
      AutoSize = True
      TabOrder = 0
      object PNLUsuario: TPanel
        Left = 1
        Top = 41
        Width = 229
        Height = 82
        Align = alTop
        TabOrder = 0
        DesignSize = (
          229
          82)
        object Label1: TLabel
          Left = 24
          Top = 10
          Width = 40
          Height = 15
          Alignment = taRightJustify
          Caption = 'Usuario'
        end
        object LClave: TLabel
          Left = 35
          Top = 32
          Width = 29
          Height = 15
          Alignment = taRightJustify
          Caption = 'Clave'
        end
        object EUsuario: TEdit
          Left = 70
          Top = 6
          Width = 143
          Height = 23
          Anchors = [akLeft, akTop, akRight]
          TabOrder = 0
        end
        object EClave: TEdit
          Left = 70
          Top = 29
          Width = 143
          Height = 23
          Anchors = [akLeft, akTop, akRight]
          PasswordChar = '*'
          TabOrder = 1
          OnKeyPress = EClaveKeyPress
        end
        object BSesion: TButton
          Left = 70
          Top = 53
          Width = 143
          Height = 25
          Anchors = [akLeft, akTop, akRight]
          Caption = 'Iniciar Sesion'
          TabOrder = 2
          OnClick = BSesionClick
        end
      end
      object PNLSesion: TPanel
        Left = 1
        Top = 123
        Width = 229
        Height = 157
        Align = alTop
        TabOrder = 1
        DesignSize = (
          229
          157)
        object LEmpresa: TLabel
          Left = 19
          Top = 11
          Width = 45
          Height = 15
          Alignment = taRightJustify
          Caption = 'Empresa'
        end
        object LEjercicio: TLabel
          Left = 20
          Top = 35
          Width = 44
          Height = 15
          Alignment = taRightJustify
          Caption = 'Ejercicio'
        end
        object LCanal: TLabel
          Left = 34
          Top = 58
          Width = 30
          Height = 15
          Alignment = taRightJustify
          Caption = 'Canal'
        end
        object LSerie: TLabel
          Left = 39
          Top = 83
          Width = 25
          Height = 15
          Alignment = taRightJustify
          Caption = 'Serie'
        end
        object LFechaTrabajo: TLabel
          Left = 5
          Top = 107
          Width = 59
          Height = 15
          Alignment = taRightJustify
          Caption = 'Fecha Trab.'
        end
        object CBEmpresa: TComboBox
          Left = 70
          Top = 6
          Width = 143
          Height = 23
          Anchors = [akLeft, akTop, akRight]
          TabOrder = 0
          OnChange = CBEmpresaChange
        end
        object CBEjercicio: TComboBox
          Left = 70
          Top = 30
          Width = 143
          Height = 23
          Anchors = [akLeft, akTop, akRight]
          TabOrder = 1
          OnChange = CBEjercicioChange
        end
        object CBCanal: TComboBox
          Left = 70
          Top = 54
          Width = 143
          Height = 23
          Anchors = [akLeft, akTop, akRight]
          TabOrder = 2
        end
        object CBSerie: TComboBox
          Left = 70
          Top = 78
          Width = 143
          Height = 23
          Anchors = [akLeft, akTop, akRight]
          TabOrder = 3
        end
        object DTPFechaTrabajo: TDateTimePicker
          Left = 70
          Top = 102
          Width = 122
          Height = 23
          Date = 45523.000000000000000000
          Time = 0.757375474539003300
          TabOrder = 4
        end
        object BModificarEntorno: TButton
          Left = 70
          Top = 127
          Width = 143
          Height = 25
          Anchors = [akLeft, akTop, akRight]
          Caption = 'Modificar Entorno'
          TabOrder = 5
          OnClick = BModificarEntornoClick
        end
      end
      object PNLConexion: TPanel
        Left = 1
        Top = 280
        Width = 229
        Height = 155
        Align = alTop
        TabOrder = 2
        DesignSize = (
          229
          155)
        object LBaseDatos: TLabel
          Left = 21
          Top = 11
          Width = 43
          Height = 15
          Alignment = taRightJustify
          Caption = 'B. Datos'
        end
        object LClaveBD: TLabel
          Left = 35
          Top = 57
          Width = 29
          Height = 15
          Alignment = taRightJustify
          Caption = 'Clave'
        end
        object LUsuarioBD: TLabel
          Left = 24
          Top = 35
          Width = 40
          Height = 15
          Alignment = taRightJustify
          Caption = 'Usuario'
        end
        object LRoldBD: TLabel
          Left = 47
          Top = 83
          Width = 17
          Height = 15
          Alignment = taRightJustify
          Caption = 'Rol'
        end
        object Label2: TLabel
          Left = 10
          Top = 106
          Width = 54
          Height = 15
          Alignment = taRightJustify
          Caption = 'Version FB'
        end
        object CBBaseDatos: TComboBox
          Left = 70
          Top = 6
          Width = 143
          Height = 23
          Anchors = [akLeft, akTop, akRight]
          ParentShowHint = False
          ShowHint = True
          TabOrder = 0
          OnChange = CBBaseDatosChange
        end
        object BConectar: TButton
          Left = 70
          Top = 126
          Width = 143
          Height = 25
          Anchors = [akLeft, akTop, akRight]
          Caption = 'Conectar'
          TabOrder = 5
          OnClick = BConectarClick
        end
        object EClaveBD: TEdit
          Left = 70
          Top = 54
          Width = 143
          Height = 23
          Anchors = [akLeft, akTop, akRight]
          PasswordChar = '*'
          TabOrder = 2
        end
        object EUsuarioBD: TEdit
          Left = 70
          Top = 30
          Width = 143
          Height = 23
          Anchors = [akLeft, akTop, akRight]
          TabOrder = 1
        end
        object ERolBD: TEdit
          Left = 70
          Top = 78
          Width = 143
          Height = 23
          Anchors = [akLeft, akTop, akRight]
          TabOrder = 3
        end
        object CBVersionFB: TComboBox
          Left = 70
          Top = 102
          Width = 143
          Height = 23
          Anchors = [akLeft, akTop, akRight]
          ItemIndex = 0
          TabOrder = 4
          Text = '2.5'
          Items.Strings = (
            '2.5'
            '3'
            '4'
            '5')
        end
      end
      object PNLIdioma: TPanel
        Left = 1
        Top = 1
        Width = 229
        Height = 40
        Align = alTop
        TabOrder = 3
        object LIdioma: TLabel
          Left = 1
          Top = 1
          Width = 227
          Height = 15
          Align = alTop
          Caption = 'Idioma'
          ExplicitWidth = 37
        end
        object CBIdioma: TComboBox
          Left = 1
          Top = 16
          Width = 227
          Height = 23
          Align = alTop
          TabOrder = 0
          OnChange = CBIdiomaChange
        end
      end
    end
    object PNLEstilo: TPanel
      Left = 0
      Top = 0
      Width = 0
      Height = 40
      Align = alTop
      TabOrder = 1
      object LEstilo: TLabel
        Left = 1
        Top = 1
        Width = 28
        Height = 15
        Align = alTop
        Caption = 'Estilo'
      end
      object CBEstilo: TComboBoxEx
        Left = 1
        Top = 16
        Width = 229
        Height = 24
        Align = alTop
        ItemsEx = <>
        TabOrder = 0
        OnChange = CBEstiloChange
      end
    end
  end
  object ALMain: TActionManager
    Images = IM16
    Left = 256
    Top = 200
    StyleName = 'Platform Default'
    object ATipoNCF: TAction
      Category = 'Latino'
      Caption = 'Tipos &NCF'
      Hint = 'Configuracion de Tipos de NCF'
    end
    object AFamilias: TAction
      Category = 'Almacenes'
      Caption = '&Familias'
      Hint = 'Mantenimiento de Familias de Art'#237'culos'
    end
    object AContaEstructura: TAction
      Category = 'Contabilidad'
      Caption = '&Estructura Contable Empresa'
      Hint = 
        'Configurar la estructura del plan de cuentas de la empresa ejerc' +
        'icio'
    end
    object AImprimeFacturas: TAction
      Category = 'Ventas'
      Caption = 'Lis&tar Facturas'
      Hint = 
        'Impresi'#243'n y envio por email masivo de facturas de clientes (Vent' +
        'as).'
    end
    object AFacturasProv: TAction
      Category = 'Compras'
      Caption = '&Facturas Proveedor'
      Hint = 'Mantenimiento de facturas de proveedores.'
    end
    object AProTareasMan: TAction
      Category = 'Produccion Plan'
      Caption = 'Tareas &Manuales'
      Hint = 'Mantenimiento de las tareas manuales.'
    end
    object AClientesPotencialesKri: TAction
      Category = 'Terceros'
      Caption = 'Clientes &Potenciales'
      Hint = 'Mantenimiento de clientes potenciales.'
    end
    object AContaCuentas: TAction
      Category = 'Contabilidad'
      Caption = '&Cuentas Contables'
      Hint = 'Mantenimiento de las cuentas contables de la empresa.'
    end
    object AContaGrupoCuentas: TAction
      Category = 'Contabilidad'
      Caption = '&Grupo de Cuentas'
      Hint = 'Agrupaciones de cuentas contables para terceros'
    end
    object AContaMovimientos: TAction
      Category = 'Contabilidad'
      Caption = '&Movimientos Contables'
      Hint = 'Ver ls movimientos contables de la empresa.'
    end
    object AContaConceptos: TAction
      Category = 'Auxiliares'
      Caption = 'Co&nceptos'
      Hint = 'Mantenimiento de Conceptos Contables '
    end
    object AImprimePedidos: TAction
      Category = 'Ventas'
      Caption = 'Listar &Pedidos'
      Hint = 'Impresi'#243'n masiva de pedidos de clientes. (Ventas).'
    end
    object AImprimeAlbaranes: TAction
      Category = 'Ventas'
      Caption = 'Listar &Albaranes'
      Hint = 'Impresi'#243'n  masiva de albaranes de clientes.'
    end
    object AContaExtracto: TAction
      Category = 'Contabilidad'
      Caption = 'Ex&tractos Contables'
      Hint = 'Consultas de cuentas contables. (Extractos).'
    end
    object AContaBorrador: TAction
      Category = 'Contabilidad'
      Caption = 'B&orrador Contable'
      Hint = 'Mantenimiento del borrador de contabilidad.'
    end
    object AContaDefBalances: TAction
      Category = 'Auxiliares'
      Caption = '&Balances'
      Hint = 'Definici'#243'n de balances contables'
    end
    object ANominasConstantes: TAction
      Category = 'Operarios'
      Caption = 'N'#243'minas del periodo'
      Hint = 'Mantenimiento de los Constantes de n'#243'minas'
    end
    object AFormasPago: TAction
      Category = 'Empresas'
      Caption = 'Formas Pago'
      Hint = 
        'mantenimiento de las formas de pago de la empresa y cuentas cont' +
        'ables asociadas.'
    end
    object AContaCuentasAnuales: TAction
      Category = 'Contabilidad'
      Caption = 'Cuentas &Anuales'
      Hint = 'Elaboraci'#243'n de las cuentas anuales de la empresa.'
    end
    object AContaDiario: TAction
      Category = 'Contabilidad'
      Caption = 'Listar &Diario Contable'
      Hint = 'Listado libro contable diario.'
    end
    object AContaSumYSaldos: TAction
      Category = 'Contabilidad'
      Caption = '&Sumas y Saldos'
      Hint = 'Listado de sumas y saldos.'
    end
    object AContaCierreYApertura: TAction
      Category = 'Contabilidad'
      Caption = '&Cierre Apertura'
      Hint = 'Cierre y apertura del ejercicio contable.'
    end
    object ARepUsuariosVentas: TAction
      Category = 'Ventas'
      Caption = 'Listado Personalizado Ventas'
      Hint = 'Reportes personalizado de ventas Report Smith'
    end
    object AContaPlantillas: TAction
      Category = 'Contabilidad'
      Caption = '&Plantillas Borrador'
      Hint = 'Plantillas de asientos contables para borrador.'
    end
    object AContaPGC: TAction
      Category = 'Contabilidad'
      Caption = 'Listar Plan General Contable'
      Hint = 'Listado del Plan General Contable de la empresa'
    end
    object AContaCuentasIVA: TAction
      Category = 'Impuestos'
      Caption = 'Cuen&tas IVA'
      Hint = 'Cuentas contables de IVA.'
    end
    object ATipoIva: TAction
      Category = 'Impuestos'
      Caption = '&Tipos IVA'
      Hint = 'Mantenimiento de los diversos Tipos de I.V.A.'
    end
    object AModoIva: TAction
      Category = 'Impuestos'
      Caption = '&Modos IVA'
      Hint = 'Mantenimiento de los diversos Modos de I.V.A.'
    end
    object ARegIVA: TAction
      Category = 'Impuestos'
      Caption = 'Registro de &IVA'
      Hint = 'Registro de IVA.'
    end
    object ASalir: TAction
      Category = 'Basico'
      Caption = '&Salir'
      Hint = 'Salir del programa.'
    end
    object AAcerca: TAction
      Category = 'Auxiliares'
      Caption = '&Acerca de...'
      Hint = 'Visualizar propiedades del sistema.'
    end
    object AUsuarios: TAction
      Category = 'Auxiliares'
      Caption = '&Usuarios'
      Hint = 'Mantenimiento y configuraci'#243'n de los usuarios.'
    end
    object AProvincias: TAction
      Category = 'Auxiliares'
      Caption = '&Provincias/Estados'
      Hint = 'Mantenimiento de Provincias/Estados'
    end
    object ALocalidades: TAction
      Category = 'Auxiliares'
      Caption = '&Localidades'
      Hint = 'Mantenimiento de las localidades, poblaciones, ciudades..'
    end
    object ACFGPrint: TAction
      Category = 'Auxiliares'
      Caption = '&Configurar Impresora'
      Hint = 'Configurar las impresoras asociadas al sistema.'
    end
    object AUbicaciones: TAction
      Category = 'Auxiliares'
      Caption = '&Dispositivos Acceso Sistema'
      Hint = 'Ordenadores y dispositivos que se conectan al sistema.'
    end
    object AEmpresas: TAction
      Category = 'Empresas'
      Caption = '&Empresas'
      Hint = 'Mantenimiento de empresas el sistema.'
    end
    object AMonedas: TAction
      Category = 'Auxiliares'
      Caption = '&Monedas Sistema'
      Hint = 'Mantenimiento de las monedas que se usaran en el sistema.'
    end
    object AContadores: TAction
      Category = 'Utilidades'
      Caption = 'C&ontadores'
      Hint = 'Mantenimiento de los contadores de la aplicaci'#243'n.'
    end
    object AConfig: TAction
      Category = 'Utilidades'
      Caption = '&Configuraci'#243'n'
      Hint = 'Configuraci'#243'n y utilidades de la aplicaci'#243'n.'
    end
    object ACambiaUser: TAction
      Category = 'Basico'
      Caption = 'Ca&mbiar Usuario'
      Hint = 'Cambiar de usuario sin cerrar la aplicaci'#243'n.'
      ShortCut = 49237
    end
    object ACambiarCanal: TAction
      Category = 'Basico'
      Caption = 'Cambio rapido de canal'
      Hint = 'Cambio rapido de canal'
      ShortCut = 49219
    end
    object ATerceros: TAction
      Category = 'Terceros'
      Caption = '&Terceros'
      Hint = 'Mantenimiento de los terceros.'
    end
    object ATerceros2: TAction
      Category = 'Terceros'
      Caption = '&Terceros (Ver. 2)'
      Hint = 'Mantenimiento de los terceros. (Ver. 2)'
    end
    object APaises: TAction
      Category = 'Auxiliares'
      Caption = '&Pa'#237'ses'
      Hint = 'Mantenimiento de Pa'#237'ses'
    end
    object ACanales: TAction
      Category = 'Auxiliares'
      Caption = '&Canales'
      Hint = 
        'Configuraci'#243'n de los canales o divisiones de las empresas el sis' +
        'tema.'
    end
    object AAlmacenes: TAction
      Category = 'Almacenes'
      Caption = '&Almacenes'
      Hint = 'Mantenimiento de Almacenes'
    end
    object ATarifas: TAction
      Category = 'Almacenes'
      Caption = '&Tarifas'
      Hint = 'Mantenimiento de Tarifas de Art'#237'culos'
    end
    object APropaga: TAction
      Category = 'Almacenes'
      Caption = '&Activar Tarifas'
      Hint = 'Activa las tarifas a las familias elegidas.'
    end
    object AArticulos: TAction
      Category = 'Almacenes'
      Caption = '&Articulos'
      Hint = 'Mantenimiento de Art'#237'culos'
    end
    object AMvStMan: TAction
      Category = 'Almacenes'
      Caption = '&Movimientos Manuales Stock'
      Hint = 'Movimientos manuales en almacenes.'
    end
    object APedidos: TAction
      Category = 'Ventas'
      Caption = '&Pedidos Clientes'
      Hint = 'Mantenimiento de pedidos de clientes (Ventas).'
    end
    object AAlbaranes: TAction
      Category = 'Ventas'
      Caption = '&Albaranes Clientes'
      Hint = 'Mantenimiento de albaranes de clientes. (Ventas).'
    end
    object AFacturas: TAction
      Category = 'Ventas'
      Caption = '&Facturas Clientes'
      Hint = 'Mantenimiento de facturas de clientes. (Ventas).'
    end
    object ACambioMonedas: TAction
      Category = 'Auxiliares'
      Caption = 'C&ambio Moneda'
      Hint = 'Mantenimiento de historico de los cambios entre monedas.'
    end
    object AClientes: TAction
      Category = 'Terceros'
      Caption = '&Clientes'
      Hint = 'Mantenimiento de los clientes.'
    end
    object AProveedores: TAction
      Category = 'Terceros'
      Caption = '&Proveedores'
      Hint = 'Mantenimiento de los proveedores.'
    end
    object AFondo: TAction
      Category = 'Basico'
      Caption = 'Ocultar &Fondo Pantalla'
      Hint = 'Ocultar / mostar fondo de pantalla.'
    end
    object AAcreedores: TAction
      Category = 'Terceros'
      Caption = 'Ac&reedores'
      Hint = 'Mantenimiento de los acreedores.'
    end
    object AAgentes: TAction
      Category = 'Terceros'
      Caption = 'A&gentes'
      Hint = 'Mantenimiento de los agentes. (Representantes/vendedores).'
    end
    object ACartera: TAction
      Category = 'Tesoreria'
      Caption = '&Cartera Cobros/Pagos'
      Hint = 'Mantenimiento de cartera de cobros y pagos.'
    end
    object AFormaPago: TAction
      Category = 'Auxiliares'
      Caption = '&Formas pago'
      Hint = 'Mantenimiento de formas de pago de todas las empresas.'
    end
    object AGenCanales: TAction
      Category = 'Empresas'
      Caption = '&Canales'
      Hint = 'Mantenimiento de los canales de la empresa.'
    end
    object AGenSeries: TAction
      Category = 'Empresas'
      Caption = '&Series'
      Hint = 'Mantenimiento de las series de la empresa.'
    end
    object AGenEjercicios: TAction
      Category = 'Empresas'
      Caption = '&Ejercicios'
      Hint = 'Mantenimiento de los ejercicios de la empresa activa.'
    end
    object AOfertas: TAction
      Category = 'Ventas'
      Caption = '&Ofertas Clientes'
      Hint = 'Mantenimiento de ofertas a clientes. (Ventas).'
    end
    object APropPedidos: TAction
      Category = 'Compras'
      Caption = 'Generar Propuesta &Compra'
      Hint = 'Propuestas de pedidos a proveedores.'
    end
    object APedidosProv: TAction
      Category = 'Compras'
      Caption = '&Pedidos Proveedor'
      Hint = 'Mantenimiento de pedidos a proveedores.'
    end
    object ARecepcionPedidos: TAction
      Category = 'Compras'
      Caption = '&Recibir Pedidos por L'#237'neas'
      Hint = 'Recepcionar los pedidos de los proveedores.'
    end
    object ABackup: TAction
      Category = 'Auxiliares'
      Caption = 'Copias Seguridad Base Datos'
      Hint = 'Copias de Seguridad y Mantenimiento de la Base de Datos'
    end
    object ASeries: TAction
      Category = 'Auxiliares'
      Caption = '&Series'
      Hint = 
        'Mantenimiento de las series (sucursales, tiendas,  tipos de fact' +
        'uraci'#243'n) del sistema.'
    end
    object ACampanyas: TAction
      Category = 'Empresas'
      Caption = '&Campa'#241'as'
      Hint = 'Mantenimiento de las campa'#241'as del ejercicio.'
    end
    object AFacAlbaranes: TAction
      Category = 'Ventas'
      Caption = 'F&acturar Albaranes'
      Hint = 'Facturaci'#243'n autom'#225'tica de albaranes de clientes.'
    end
    object AFacHistProcesos: TAction
      Category = 'Ventas'
      Caption = '&Hist'#243'rico Procesos Venta'
      Hint = 'Hist'#243'rico de procesos autom'#225'ticos de venta.'
    end
    object ABusqueda: TAction
      Category = 'Auxiliares'
      Caption = '&B'#250'squeda'
      Hint = 'Explotaci'#243'n de datos o b'#250'squeda entre tablas.'
    end
    object APeriodosSistema: TAction
      Category = 'Auxiliares'
      Caption = '&Per'#237'odos'
      Hint = 'Mantenimiento de los per'#237'odos de trabajo por empresa.'
    end
    object AGenPeriodos: TAction
      Category = 'Empresas'
      Caption = '&Periodos'
      Hint = 'Mantenimiento y definici'#243'n de periodos de la empresa.'
    end
    object AAmortizaciones: TAction
      Category = 'Inmovilizado'
      Caption = '&Amortizaciones'
      Hint = 'Control de inmovilizados y amortizaciones de activos'
    end
    object ASysCuentas: TAction
      Category = 'Auxiliares'
      Caption = '&Planes Contables'
      Hint = 
        'Mantenimiento de los planes contables generales para todo el sis' +
        'tema.'
    end
    object APerfiles: TAction
      Category = 'Auxiliares'
      Caption = 'P&erfiles Clientes'
      Hint = 'Mantenimiento de los perfiles de los clientes.'
    end
    object AAjustes: TAction
      Category = 'Utilidades'
      Caption = '&Actualizaciones'
      Hint = 'Visualiza las actualizaciones pasados a la base de datos.'
    end
    object ACentrosInventario: TAction
      Category = 'Inmovilizado'
      Caption = '&Centros Inventario'
      Hint = 'Mantenimiento de Centros de Inventario'
    end
    object ANewTarifas: TAction
      Category = 'Almacenes'
      Caption = '&Precios Tarifas Art'#237'culos '
      Hint = 'Mantenimiento de los precios de art'#237'culos por tarifa.'
    end
    object AAlbaranesProv: TAction
      Category = 'Compras'
      Caption = '&Albaranes Proveedor'
      Hint = 'Mantenimiento de albaranes de proveedores.'
    end
    object ALSTIVAListado: TAction
      Category = 'Impuestos'
      Caption = 'Listar &IVA'
      Hint = 'Listados de IVA.'
    end
    object APerfilesUsuario: TAction
      Category = 'Auxiliares'
      Caption = 'Per&files Usuario'
      Hint = 
        'Mantenimiento de los perfiles de acceso para los usuarios del si' +
        'stema.'
    end
    object ARemesas: TAction
      Category = 'Tesoreria'
      Caption = '&Remesas Recibos Pagares'
      Hint = 'Crear remesas SEPA de recibos y pagar'#233's a los bancos.'
    end
    object APregMayorCantidad: TAction
      Category = 'Contabilidad'
      Caption = 'Listar &Mayor Cantidad'
      Hint = 'Listado de mayor cantidad (347).'
    end
    object ALSTStockMinimo: TAction
      Category = 'Almacenes'
      Caption = 'Listar Stock Bajo M'#237'nimo'
      Hint = 'Listar los art'#237'culos con stocks bajo minimos.'
    end
    object ALSTDiarioStock: TAction
      Category = 'Almacenes'
      Caption = 'Listar Diario Stock'
      Hint = 'Listado del Diario de Stock (Movimientos almacenes).'
    end
    object AFacAlbaranesProv: TAction
      Category = 'Compras'
      Caption = 'Facturar &Albaranes'
      Hint = 'Facturaci'#243'n de Albaranes de Proveedor'
    end
    object AContaCuentasIRPF: TAction
      Category = 'Impuestos'
      Caption = 'Cuentas &IRPF'
      Hint = 'Cuentas de IRPF.'
    end
    object ATipoIrpf: TAction
      Category = 'Impuestos'
      Caption = 'Tipos I&RPF'
      Hint = 'Tipos I.R.P.F.'
    end
    object AEscandallo: TAction
      Category = 'Almacenes'
      Caption = 'Art'#237'culos &Virtuales'
      Hint = 
        'Mantenimiento de los art'#237'culos virtuales. (Escandallos comercial' +
        'es).'
    end
    object ABancos: TAction
      Category = 'Tesoreria'
      Caption = '&Bancos'
      Hint = 'Mantenimientos de bancos de la empresa.'
    end
    object ALSTStockResumido: TAction
      Category = 'Almacenes'
      Caption = 'Listar &Stock Resumido'
      Hint = 'Listado de stock por periodo (mes) resumido por almac'#233'n.'
    end
    object ALSTStockAlmacen: TAction
      Category = 'Almacenes'
      Caption = 'Listar Stocks &Almac'#233'n'
      Hint = 'Listado de stocks por almac'#233'n.'
      ShortCut = 49217
    end
    object AListarCartera: TAction
      Category = 'Tesoreria'
      Caption = 'Recibos &Pendientes Cuenta'
      Hint = 'Visualizaci'#243'n de recibos pendientes de compra y venta.'
    end
    object ADiarioIVA: TAction
      Category = 'Impuestos'
      Caption = 'Listar &Diario IVA'
      Hint = 'Listado del diario IVA.'
    end
    object ALSTInventario: TAction
      Category = 'Almacenes'
      Caption = 'Listar &Inventario Stock'
      Hint = 'Listado de inventario de stocks.'
    end
    object AAgrupacionPedidos: TAction
      Category = 'Ventas'
      Caption = '&Servir Pedidos por L'#237'neas'
      Hint = 
        'Servir pedidos de clientes por lineas. (Ventas). Generaci'#243'n de a' +
        'lbaranes o facturas.'
    end
    object AUnidades: TAction
      Category = 'Auxiliares'
      Caption = 'Unidades Medida'
      Hint = 'Mantenimiento de unidades de medida. (kilos, litros, sacos)'
    end
    object ARenumeraContabilidad: TAction
      Category = 'Contabilidad'
      Caption = '&Renumerar Asientos'
      Hint = 'Renumeraci'#243'n de los asientos contables del ejercicio.'
    end
    object AGenBancos: TAction
      Category = 'Auxiliares'
      Caption = '&Bancos'
      Hint = 'Mantenimiento de todos los bancos del sistema.'
    end
    object ARazones: TAction
      Category = 'Auxiliares'
      Caption = '&Tipos Razones Sociales'
      Hint = 
        'Mantenimiento de tipos de razones sociales de las empresas, pers' +
        'onas o entidades.'
    end
    object AFacturasAcr: TAction
      Category = 'Compras'
      Caption = 'Facturas &Acreedor'
      Hint = 'Mantenimiento de facturas de acreedores.'
    end
    object ACierraFacturas: TAction
      Category = 'Ventas'
      Caption = '&Cerrar Facturas Clientes'
      Hint = 
        'Cierre masivo de facturas para generar contabilidad, cartera y r' +
        'egistro de IVA.'
    end
    object ABalance: TAction
      Category = 'Contabilidad'
      Caption = 'Balance'
      Hint = 'Balance'
    end
    object ACuentasAnuales: TAction
      Category = 'Contabilidad'
      Caption = '&Cuentas Anuales'
      Hint = 'Confeccioar las cuentas anuales contables.'
    end
    object AAGrupaciones: TAction
      Category = 'Auxiliares'
      Caption = '&Agrupaciones'
      Hint = 
        'Mantenimiento de agrupaciones de clientes, art'#237'culos, proveedore' +
        's...'
    end
    object ATiposDir: TAction
      Category = 'Auxiliares'
      Caption = 'Tipos Direcci'#243'n'
      Hint = 'Tipos de direcci'#243'n de los terceros.'
    end
    object ATiposAcreedor: TAction
      Category = 'Auxiliares'
      Caption = 'Tipos A&creedor'
      Hint = 'Tipos de acreedores (7-Transportista)'
    end
    object AListador: TAction
      Category = 'Utilidades'
      Caption = '&Dise'#241'ar Informes'
      Hint = 'Configuraci'#243'n y dise'#241'o de informes.'
    end
    object AProyectos: TAction
      Category = 'Empresas'
      Caption = 'P&royectos'
      Hint = 'Mantenimiento de proyectos de la empresa activa.'
    end
    object ACodigosBarras: TAction
      Category = 'Auxiliares'
      Caption = 'Tipos C'#243'digos Barras'
      Hint = 'Tipos de c'#243'digos de barras.'
    end
    object ATiposEfectos: TAction
      Category = 'Auxiliares'
      Caption = 'Tipos &Efectos'
      Hint = 'Mantenimiento de tipos de efectos de pago y cobro.'
    end
    object APunteoAsientos: TAction
      Category = 'Contabilidad'
      Caption = '&Puntear Asientos'
      Hint = 'Punteo de asientos contables.'
    end
    object ATipoImpuestos: TAction
      Category = 'Impuestos'
      Caption = 'Tipo Impuestos'
      Hint = 'Mantenimiento de los diversos tipos de impuestos.'
    end
    object ARetEmpleados: TAction
      Category = 'Impuestos'
      Caption = 'Retenci'#243'n &Empleados'
      Hint = 'Mantenimiento de retenciones de empleados'
    end
    object ACondicionesProv: TAction
      Category = 'Almacenes'
      Caption = '&Condiciones Proveedores'
      Hint = 'Condiciones especiales de proveedores.'
    end
    object ATarifasProveedor: TAction
      Category = 'Almacenes'
      Caption = '&Tarifas Proveedor'
      Hint = 'Mantenimiento de tarifas de Proveedor.'
    end
    object APropagaEmpresa: TAction
      Category = 'Empresas'
      Caption = 'Propagaci'#243'n &Empresa'
      Hint = 
        'Mantenimiento de propagaci'#243'n de los datos de una empresa y un ca' +
        'nal a otro canal.'
    end
    object ASaldos: TAction
      Category = 'Contabilidad'
      Caption = 'Ver &Saldos Cuentas'
      Hint = 'Consultas predefinidas de saldos contables.'
    end
    object ACondAgentes: TAction
      Category = 'Almacenes'
      Caption = 'Con&diciones Agentes'
      Hint = 'Condiciones por agentes (Vendedores).'
    end
    object ACondAgeAgrup: TAction
      Category = 'Almacenes'
      Caption = 'Condi&ciones Agentes/Agrupaciones Cliente'
      Hint = 'Condiciones de agentes por agrupaci'#243'n de clientes.'
    end
    object ACondAgeCli: TAction
      Category = 'Almacenes'
      Caption = 'Cond&iciones Agentes/Clientes'
      Hint = 'Condiciones de agentes (vendedores)  por cliente.'
    end
    object AABCVentas: TAction
      Category = 'Ventas'
      Caption = 'Estad'#237'sticas ABC'#39's Ventas'
      Hint = 'Listado de las estad'#237'sticas ABC'#39's de ventas'
    end
    object AABCVentasKri: TAction
      Category = 'Ventas'
      Caption = 'Listar ABC Ventas  Albaranes'
      Hint = 'Listado ABC de ventas albaranes'
    end
    object ATercerosCuentas: TAction
      Category = 'Terceros'
      Caption = 'Cuentas Contables Terceros'
      Hint = 'Cuentas contables asociadas a un tercero para visualizar saldos.'
    end
    object AABCCompras: TAction
      Category = 'Compras'
      Caption = 'Listar ABC Compras'
      Hint = 'Listados ABC'#39's de compras'
    end
    object APCRecAgrupados: TAction
      Category = 'Tesoreria'
      Caption = 'C&obrar Pagar Agrupar Cartera'
      Hint = 'Cobrar pagar y agrupar recibos.'
    end
    object AAyudaenLinea: TAction
      Category = 'Utilidades'
      Caption = 'Ayuda L'#237'nea'
      Hint = 'Ayuda en l'#237'nea.'
      ShortCut = 16449
    end
    object APlazosGarantia: TAction
      Category = 'Auxiliares'
      Caption = '&Plazos Garant'#237'a'
      Hint = 'Mantenimiento de los plazos de las garant'#237'as.'
    end
    object AEscandalloProd: TAction
      Category = 'Produccion'
      Caption = '&Escandallo Producci'#243'n Simple'
      Hint = 'Mantenimiento de escandallos, despieces, ensamblados.'
    end
    object AOrdenProduccion: TAction
      Category = 'Produccion'
      Caption = '&Orden Producci'#243'n Simple'
      Hint = 'Mantenimiento de ordenes de producci'#243'n.'
    end
    object ANuevoRecibo: TAction
      Category = 'Tesoreria'
      Caption = 'Crear &Recibo Manual'
      Hint = 'Generar y contabilizar un nuevo recibo.'
    end
    object ACambiaFecha: TAction
      Category = 'Basico'
      Caption = 'Cambiar Fecha Trabajo'
      Hint = 'Cambia la fecha de trabajo.'
    end
    object AABCComprasKri: TAction
      Category = 'Compras'
      Caption = 'Listar ABC Compras por Albar'#225'n'
      Hint = 'Listado ABC'#39's de compras x Albaranes.'
    end
    object AFacAlbaranesProvDet: TAction
      Category = 'Compras'
      Caption = 'Facturar Albaranes por &L'#237'neas'
      Hint = 'Facturar las l'#237'neas de albaran de proveedores.'
    end
    object AListNecesidades: TAction
      Category = 'Produccion'
      Caption = '&Listar Necesidades'
      Hint = 'Listado de Necesidades'
    end
    object AMRP: TAction
      Category = 'Produccion'
      Caption = 'MRP'
      Hint = 'M.R.P.'
    end
    object AConfirming: TAction
      Category = 'Tesoreria'
      Caption = '&Confirming'
      Hint = 'Realizar un confirming de pagos al banco.'
    end
    object AAnticipos: TAction
      Category = 'Tesoreria'
      Caption = '&Anticipos Clientes Proveedores Acreedores'
      Hint = 'Creaci'#243'n de anticipos de clientes, proveedores y acreedores.'
    end
    object AModelo300: TAction
      Category = 'Impuestos'
      Caption = 'Modelo 300'
      Hint = 'Modelo 300'
    end
    object AModelo303: TAction
      Category = 'Impuestos'
      Caption = 'Modelo 303'
      Hint = 'Modelo 303'
    end
    object AModelo115: TAction
      Category = 'Impuestos'
      Caption = 'Modelo 115/180'
      Hint = 'Modelo 115/180'
    end
    object AModelo110: TAction
      Category = 'Impuestos'
      Caption = 'Modelo 110/111'
      Hint = 'Modelo 110/111'
    end
    object AModelo330: TAction
      Category = 'Impuestos'
      Caption = 'Modelo 330'
      Hint = 'Modelo 330'
    end
    object ATalones: TAction
      Category = 'Tesoreria'
      Caption = '&Talones'
      Hint = 'Confecci'#243'n de talones a proveedor o acreedor.'
    end
    object ATalonesCta: TAction
      Category = 'Tesoreria'
      Caption = 'Talones Cuentas Contables'
      Hint = 'Creaci'#243'n de talones por cuentas contables'
    end
    object ALSTDepositosActivos: TAction
      Category = 'Almacenes'
      Caption = 'Listar Depositos Activos'
      Hint = 'Listado de depositos activos.'
    end
    object ALSTFichaMargendeProductos: TAction
      Category = 'Almacenes'
      Caption = 'Listar Margenes Art'#237'culos'
      Hint = 'Listado de margenes por art'#237'culos.'
    end
    object AContaDefBalancesCAB: TAction
      Category = 'Auxiliares'
      Caption = 'Balances Contables &Cabeceras'
      Hint = 'Definici'#243'n de las cabeceras de los balances contables.'
    end
    object ACierraFac: TAction
      Category = 'Compras'
      Caption = 'Cerrar Facturas Proveedores'
      Hint = 'Cierra masivamente las facturas de compras.'
    end
    object AMuestraRecibos: TAction
      Category = 'Tesoreria'
      Caption = 'Ver Recibos Factura'
      Hint = 'Muestra los recibos de una factura.'
    end
    object ATraspaso: TAction
      Category = 'Empresas'
      Caption = 'Traspaso Entre Ejercicios'
      Hint = 
        'Procesos de traspasos de algunas cuentas de un ejercicio anterio' +
        'r al actual.'
    end
    object ALSTUnidadesPendientes: TAction
      Category = 'Almacenes'
      Caption = 'Listar Unidades Pendientes Servir'
      Hint = 'Listado de unidades (cantidades) pendientes de servir.'
    end
    object AModelo190: TAction
      Category = 'Impuestos'
      Caption = 'Listado Modelo 190'
      Hint = 'Modelo 190 - Listado'
    end
    object AModelo390: TAction
      Category = 'Impuestos'
      Caption = 'Modelo 390'
      Hint = 'Modelo 390'
    end
    object AExporta190: TAction
      Category = 'Impuestos'
      Caption = 'Exportaci'#243'n Modelo 190'
      Hint = 'Modelo 190 - Exportaci'#243'n datos.'
    end
    object ACierraTodas: TAction
      Category = 'Utilidades'
      Caption = '&Cerrar Ventanas'
      Hint = 'Cierra todas las ventanas abiertas.'
    end
    object AModelo340: TAction
      Category = 'Impuestos'
      Caption = 'Modelo 340'
      Hint = 'Modelo 340'
    end
    object AHistoricoPMP: TAction
      Category = 'Almacenes'
      Caption = '&Visualizar Hist'#243'rico Precios'
      Hint = 'Calcular u visualizar hist'#243'rico de precios.'
    end
    object APonderarDocs: TAction
      Category = 'Almacenes'
      Caption = 'Ponderar Documentos'
      Hint = 'Ponderar precios art'#237'culos seg'#250'n documentos.'
    end
    object AMonedasCuenta: TAction
      Category = 'Empresas'
      Caption = 'Monedas'
      Hint = 
        'Mantenimiento cuentas contables de las monedas para las diferenc' +
        'ias de cambio.'
    end
    object AAgrupacionFac: TAction
      Category = 'Ventas'
      Caption = 'Agru&paci'#243'n Facturas'
      Hint = 'Agrupaci'#243'n de facturas de clientes. (Ventas).'
    end
    object ACorreoEmpresa: TAction
      Category = 'Empresas'
      Caption = 'Envios &Correo Electr'#243'nico '
      Hint = 'Enviar eMails de forma masiva a varios terceros.'
    end
    object AEmpCanales: TAction
      Category = 'Empresas'
      Caption = 'E&mpresa, Ejercicio, Canal'
      Hint = 
        'Ver informaci'#243'n sobre la empresa, ejercicio y canal de la empres' +
        'a.'
    end
    object AAvisos: TAction
      Category = 'Basico'
      Caption = 'Notificar &Usuarios'
      Hint = 'Generar y ver notificaciones de los usuarios del sistema.'
    end
    object AClasesDirecciones: TAction
      Category = 'Auxiliares'
      Caption = 'Clases &Direcciones'
      Hint = 'Clases o tipos de direcciones, calles, avenidas, carreteras...'
    end
    object ACamMonCartera: TAction
      Category = 'Auxiliares'
      Caption = 'Cambiar Moneda Cartera'
      Hint = 'Cambia la moneda en los registros de cartera. (Cobros, pagos..)'
    end
    object ADuplicaEscandallo: TAction
      Category = 'Almacenes'
      Caption = 'Duplicar Escandallo'
      Hint = 'Duplica el escandallo'
    end
    object APagares: TAction
      Category = 'Tesoreria'
      Caption = '&Pagar'#233's'
      Hint = 'Creaci'#243'n de pagares cliente, proveedor, acreedor.'
    end
    object AConfINI: TAction
      Category = 'Utilidades'
      Caption = 'C&onfigurar Fichero INI'
      Hint = 'Configuraci'#243'n del fichero INI del usuario activo.'
    end
    object ARepUsuarioAlm: TAction
      Category = 'Almacenes'
      Caption = '&Listador Personalizado Almacenes'
      Hint = 'Reportes personalizables y efectuados por Report Smith-'
    end
    object ArepUsuarioCompras: TAction
      Category = 'Compras'
      Caption = 'Listados Personalizado Usuario'
      Hint = 'Listados personalizables Report Smith'
    end
    object ARepUsuarioConta: TAction
      Category = 'Contabilidad'
      Caption = 'Listador Personalizado Contabilidad'
      Hint = 'Listados personalizados Report Smith'
    end
    object ARepUsuariosTerceros: TAction
      Category = 'Terceros'
      Caption = '&Listador Personalizado Terceros'
      Hint = 'Listador reportes Report Smith'
    end
    object ATipoAsiento: TAction
      Category = 'Contabilidad'
      Caption = 'Tipos Asientos Contables'
      Hint = 'Mantenimiento y configuraci'#243'n de tipos de asientos contables.'
    end
    object AIncrementoPorcentual: TAction
      Category = 'Almacenes'
      Caption = 'Incremento Porcentual Tarifas'
      Hint = 'Incremento Porcentual de Tarifas'
    end
    object AContRecuperacion: TAction
      Category = 'Utilidades'
      Caption = '&Recuperar Contadores'
      Hint = 'Mantenimiento de los contadores una vez eliminados.'
    end
    object ATiposCalculo: TAction
      Category = 'Almacenes'
      Caption = 'Tipos &C'#225'lculo Tarifas'
      Hint = 'Mantenimiento de los tipos de c'#225'lculo para tarifas.'
    end
    object ACondicionesEspeciales: TAction
      Category = 'Almacenes'
      Caption = 'Condiciones &Especiales'
      Hint = 'Mantenimiento de condiciones especiales.'
    end
    object AMonedasMaestros: TAction
      Category = 'Utilidades'
      Caption = '&Monedas'
      Hint = 'Mantenimiento de monedas.'
    end
    object ALSTLotes: TAction
      Category = 'Almacenes'
      Caption = 'Listar Inventario Lotes'
      Hint = 'Listado de inventario por lotes.'
    end
    object ALSTLotesCompras: TAction
      Category = 'Almacenes'
      Caption = 'Listar Lotes Compras'
      Hint = 'Listado de lotes de las compras.'
    end
    object ALSTLotesVentas: TAction
      Category = 'Almacenes'
      Caption = 'Listar Lotes Ventas'
      Hint = 'Listado de lotes de las ventas.'
    end
    object ALSTLotesMovimientos: TAction
      Category = 'Almacenes'
      Caption = 'Listar Lotes Movimientos Manuales Stock'
      Hint = 'Listado de lotes de los movimientos manuales de stock.'
    end
    object AModelo347: TAction
      Category = 'Impuestos'
      Caption = 'Modelo 347'
      Hint = 'Modelo 347'
    end
    object AConfModelo110: TAction
      Category = 'Impuestos'
      Caption = 'Listado Modelo 110/111'
      Hint = 'Configuraci'#243'n R'#225'pida del Modelo 110/111'
    end
    object AConfModelo115: TAction
      Category = 'Impuestos'
      Caption = 'Listado Modelo 115'
      Hint = 'Configuraci'#243'n R'#225'pida del Modelo 115'
    end
    object AConfModelo190: TAction
      Category = 'Impuestos'
      Caption = 'Listado Modelo 190'
      Hint = 'Configuraci'#243'n R'#225'pida del Modelo 190'
    end
    object AConfModelo300: TAction
      Category = 'Impuestos'
      Caption = 'Listado Modelo 300'
      Hint = 'Configuraci'#243'n R'#225'pida del Modelo 300'
    end
    object AConfModelo303: TAction
      Category = 'Impuestos'
      Caption = 'Listado Modelo 303'
      Hint = 'Configuraci'#243'n R'#225'pida del Modelo 303'
    end
    object AConfModelo330: TAction
      Category = 'Impuestos'
      Caption = 'Listado Modelo 330'
      Hint = 'Configuraci'#243'n R'#225'pida del Modelo 330'
    end
    object AConfModelo347: TAction
      Category = 'Impuestos'
      Caption = 'Listado Modelo 347'
      Hint = 'Configuraci'#243'n R'#225'pida del Modelo 347'
    end
    object AContaDiarioPartido: TAction
      Category = 'Contabilidad'
      Caption = 'Libro Diario Partido'
      Hint = 'Libro Diario Partido'
    end
    object AArtProv: TAction
      Category = 'Compras'
      Caption = 'Compras A&rt'#237'culo Proveedor'
      Hint = 'Muestra los proveedores a los que se ha comprado un articulo.'
    end
    object AArtCli: TAction
      Category = 'Ventas'
      Caption = 'Ventas Clientes Art'#237'culo'
      Hint = 'Ver las ventas de clientes por art'#237'culo.'
    end
    object ALSTUnidPendRecibir: TAction
      Category = 'Almacenes'
      Caption = 'Listar Unidades Pendientes Recibir'
      Hint = 
        'Listado de unidades de art'#237'culos pendientes de recibir (compras)' +
        '.'
    end
    object AProcesosProd: TAction
      Category = 'Produccion'
      Caption = '&Procesos Producci'#243'n'
      Hint = 'Procesos de produccion'
    end
    object ATiposRedondeo: TAction
      Category = 'Almacenes'
      Caption = 'Tipos &Redondeo'
      Hint = 'Mantenimiento de los tipos de redondeo para c'#225'lculos de tarifa.'
    end
    object ARepUsuarioTesoreria: TAction
      Category = 'Tesoreria'
      Caption = 'Listador Personalizado Tesoreria'
      Hint = 'Listado personalizado Report Smith'
    end
    object ARepUsuarioProduccion: TAction
      Category = 'Produccion'
      Caption = 'Reportes Usuario Producci'#243'n Simple'
      Hint = 'Reportes Report Smith producci'#243'n simple.'
    end
    object AConsultaNroSerieKri: TAction
      Category = 'Almacenes'
      Caption = 'Consultar Numeros Serie'
      Hint = 'Consulta de los n'#250'meros de s'#233'rie.'
    end
    object AMantenimientoNroSerie: TAction
      Category = 'Almacenes'
      Caption = 'N'#250'meros Serie (Serializaci'#243'n)'
      Hint = 'Mantenimiento de los n'#250'meros de serie (serializaci'#243'n)'
    end
    object AImprimirEtiquetasKri: TAction
      Category = 'Ventas'
      Caption = 'Imprimir Etiquetas'
      Hint = 'Impresion de etiquetas.'
    end
    object AProrrateoCostes: TAction
      Category = 'Compras'
      Caption = '&Prorratear Costes Art'#237'culos'
      Hint = 'Prorrateos de los costes de compra a los art'#237'culos afectados.'
    end
    object APedidosVentaPendientes: TAction
      Category = 'Ventas'
      Caption = 'Listar Pedidos Venta Pendientes'
      Hint = 'Listado de pedidos de clientes (Ventas) pendientes.'
    end
    object APedidosCompraPendientes: TAction
      Category = 'Compras'
      Caption = 'Listar Pedidos Compra Pendientes'
      Hint = 'Listado de pedidos de compra pendientes de recibir.'
    end
    object AImagenes: TAction
      Category = 'Auxiliares'
      Caption = '&Im'#225'genes'
      Hint = 'Mantenimiento unificado de las im'#225'genes del sistema.'
    end
    object ALSTGeneraTmpInventarioKri: TAction
      Category = 'Almacenes'
      Caption = 'Generar Temporal Inventario'
      Hint = 'Genera Temporal de inventario para ReportSmith'
    end
    object ARiesgoBancos: TAction
      Category = 'Tesoreria'
      Caption = '&Listar Riesgos Bancos'
      Hint = 'Listado riesgos de bancos.'
    end
    object ARiesgoClientes: TAction
      Category = 'Tesoreria'
      Caption = 'Listar &Riesgos Clientes'
      Hint = 'Listado riesgos de clientes.'
    end
    object AAsignaBancoRemesa: TAction
      Category = 'Tesoreria'
      Caption = 'Asignar Banco &Remesa'
      Hint = 'Asignacion de banco a remesas.'
    end
    object AFacAlbaranesCliDet: TAction
      Category = 'Ventas'
      Caption = 'Facturar Albaranes por L'#237'neas'
      Hint = 'Facturaci'#243'n de las l'#237'neas de albaran de clientes. (Ventas).'
    end
    object ATransmisionesPatrimoniales: TAction
      Category = 'Ventas'
      Caption = 'Transmisiones Patrimoniales'
      Hint = 'Transmisiones patrimoniales y actos jur'#237'dicos documentados.'
    end
    object ASumasYSaldosKri: TAction
      Category = 'Contabilidad'
      Caption = 'Sumas y Saldos Consolidados'
      Hint = 'Genera tabla temporal para sumas y saldos.'
    end
    object AColoresTallas: TAction
      Category = 'Tallas'
      Caption = '&Colores'
      Hint = 'Mantenimiento de colores.'
    end
    object AGruposTallas: TAction
      Category = 'Tallas'
      Caption = '&Grupos Tallas'
      Hint = 'mantenimiento de grupos de tallas.'
    end
    object AModelosTallas: TAction
      Category = 'Tallas'
      Caption = '&Modelos'
      Hint = 'Mantenimientro de los modelos con talla y color.'
    end
    object ALSTStockTallas: TAction
      Category = 'Almacenes'
      Caption = 'Listar Stock Talla Resumido'
      Hint = 'Listado del stocks por tallas resumido.'
    end
    object AOrdenProduccionTallasKri: TAction
      Category = 'Produccion'
      Caption = 'Orden Produccion &Tallas'
      Hint = 'Orden de Produccion para Tallas y Colores'
    end
    object AEDI: TAction
      Category = 'Empresas'
      Caption = 'ED&I'
      Hint = 'Importaci'#243'n y exportacion de mensajes EDI'
    end
    object AAgrupacionDeAlbaranesKri: TAction
      Category = 'Ventas'
      Caption = 'Agrupar &Albaranes'
      Hint = 'Agrupaci'#243'n de los albaranes para facturar.'
    end
    object ACentroDeCostos: TAction
      Category = 'Auxiliares'
      Caption = 'Centros Costes'
      Hint = 'Mantenimiento de centros de coste del sistema.'
    end
    object ALstCentroCoste: TAction
      Category = 'Contabilidad'
      Caption = 'Listar Centro Coste'
      Hint = 'Listados de Centros de Coste'
    end
    object AIntrastat: TAction
      Category = 'Impuestos'
      Caption = '&Intrastat'
      Hint = 'Mantenimiento para generar el Intrastat.'
    end
    object AIntrastatCompras: TAction
      Category = 'Impuestos'
      Caption = 'Listar Intrastat Compras'
      Hint = 'Listado Intrastat Compras'
    end
    object AIntrastatVentas: TAction
      Category = 'Impuestos'
      Caption = 'Listar Intrastat &Ventas'
      Hint = 'Listado Intrastat Ventas.'
    end
    object ACierreStocks: TAction
      Category = 'Almacenes'
      Caption = 'Cierre Apertura &Stocks'
      Hint = 'Genera el cierre y la apertura de stocks.'
    end
    object ARegStocks: TAction
      Category = 'Almacenes'
      Caption = '&Regularizaci'#243'n Stocks (Inventarios)'
      Hint = 'Procesos de regularizaci'#243'n de los stocks por almac'#233'n.'
    end
    object AConfIntrastatCV: TAction
      Category = 'Impuestos'
      Caption = 'Listar Intrastat Compras / Ventas'
      Hint = 'Configuraci'#243'n R'#225'pida de Intrastat Compras/Ventas.'
    end
    object AExporta349: TAction
      Category = 'Impuestos'
      Caption = 'Exportar Modelo 349'
      Hint = 'Modelo 349 - Exportaci'#243'n Datos y Listado'
    end
    object ALotes: TAction
      Category = 'Almacenes'
      Caption = '&Lotes'
      Hint = 'Mantenimiento de Lotes. (Trazabilidad).'
    end
    object ALSTEstadisticasArt: TAction
      Category = 'Empresas'
      Caption = 'Estad'#237'sticas Agentes, Clientes, Proveedores'
      Hint = 'Estad'#237'sticas de agentes, clientes y proveedores.'
    end
    object APedFueraPlazo: TAction
      Category = 'Compras'
      Caption = 'Listar &Pedidos Fuera Plazo'
      Hint = 'Listado de los pedidos de compra que estan fuera de plazo.'
    end
    object ALoteSimple: TAction
      Category = 'Almacenes'
      Caption = 'Lote &Simple'
      Hint = 'Mantenimiento de Lotes Simples.'
    end
    object ACondicionesVenta: TAction
      Category = 'Almacenes'
      Caption = 'Condiciones &Especiales Venta'
      Hint = 'Mantenimiento de condiciones especiales de venta.'
    end
    object AAsistenteEmpresa: TAction
      Category = 'Empresas'
      Caption = '&Asistente Creaci'#243'n Nueva Empresa'
      Hint = 'Asistente para crear una nueva empresa.'
    end
    object AAsistenteEjercicio: TAction
      Category = 'Empresas'
      Caption = 'Asistente  Crear Nuevo Ejercicio'
      Hint = 
        'Asistente para la creaci'#243'n de un nuevo ejercicio. (Siguiente eje' +
        'rcicio).'
    end
    object ACondicionesCompra: TAction
      Category = 'Almacenes'
      Caption = 'Condiciones &Especiales Compra'
      Hint = 'Mantenimiento de condiciones especiales de compra.'
    end
    object AMatriculas: TAction
      Category = 'Auxiliares'
      Caption = '&Matr'#237'culas Transporte'
      Hint = 'Mantenimiento de los veh'#237'culos transporte. (Matriculas)'
    end
    object ANaturalezaMat: TAction
      Category = 'Auxiliares'
      Caption = '&Transportes Naturalezas Materiales'
      Hint = 
        'mantenimiento de tipos de naturaleza de los materiales para el t' +
        'ransporte.'
    end
    object APedFueraPlazoVentas: TAction
      Category = 'Ventas'
      Caption = 'Listar &Pedidos Fuera Plazo'
      Hint = 'Listado de pedidos fuera de plazo. (Ventas)'
    end
    object AIncidencias: TAction
      Category = 'Terceros'
      Caption = '&Incidencias'
      Hint = 
        'Mantenimiento de incidencias de clientes, proveedores, acreedore' +
        's, agentes.'
    end
    object AParamApuntes: TAction
      Category = 'Contabilidad'
      Caption = 'Configuraci'#243'n Apuntes Contables'
      Hint = 'Parametrizaci'#243'n de los apuntes contables.'
    end
    object AConfigTextos: TAction
      Category = 'Utilidades'
      Caption = 'Idioma &Textos Documentos'
      Hint = 
        'Configuraci'#243'n de los textos o labels de los documentos de compra' +
        ' y venta para los idiomas seg'#250'n clientes de los listados.'
    end
    object AFacCuotas: TAction
      Category = 'Ventas'
      Caption = 'Facturar Cuotas'
      Hint = 'Facturaci'#243'n de cuotas periodicas indicadas en los clientes.'
    end
    object AAlmacenesCalles: TAction
      Category = 'Ubicacion'
      Caption = 'Ubicaciones &Calles'
      Hint = 
        'Mantenimiento de calles dentro de las ubicaciones de los almacen' +
        'es.'
    end
    object AAlmacenesEstanterias: TAction
      Category = 'Ubicacion'
      Caption = 'Ubicaciones &Estanterias'
      Hint = 
        'Mantenimiento de las estanter'#237'as de las calles en las ubicacione' +
        's de almacenes.'
    end
    object AAlmacenesRepisas: TAction
      Category = 'Ubicacion'
      Caption = 'Ubicaciones &Repisas'
      Hint = 
        'Mantenimiento de las repisas en las estanterias de lso almacenes' +
        '.'
    end
    object AAlmacenesPosicion: TAction
      Category = 'Ubicacion'
      Caption = 'Ubicaciones &Posiciones'
      Hint = 'Mantenimiento de las posiciones en las repisas de los almacenes.'
    end
    object AEnvioReparto: TAction
      Category = 'Ventas'
      Caption = '&Enviar Repartir Albaranes'
      Hint = 
        'Creaci'#243'n y agrupaci'#243'n de albaranes para generar un registro de e' +
        'nv'#237'o o reparto.'
    end
    object AConfigAlmcen: TAction
      Category = 'Ubicacion'
      Caption = 'Configurar &Ubicaciones'
      Hint = 'Configuraci'#243'n de las ubicaciones de los almacenes.'
    end
    object AMovEntreUbicaciones: TAction
      Category = 'Ubicacion'
      Caption = 'Mover Articulos U&bicaciones'
      Hint = 'Movimientos manuales entre las ubicaciones'
    end
    object ALstStockPorUbicacion: TAction
      Category = 'Almacenes'
      Caption = 'Listar Stocks Ubicaci'#243'n'
      Hint = 'Listado de stocks por cada ubicaci'#243'n'
    end
    object ALstMovEntreUbicaciones: TAction
      Category = 'Almacenes'
      Caption = 'Listar Movimientos Ubicaciones'
      Hint = 'Listado de movimientos entre las ubicaciones de almacenes.'
    end
    object AFacturasDirectas: TAction
      Category = 'Ventas'
      Caption = 'Facturas Directas'
      Hint = 'Facturas Directas'
    end
    object ACaravanas: TAction
      Category = 'Almacenes'
      Caption = 'Cara&vanas'
      Hint = 'Caravanas'
    end
    object ATipoPortes: TAction
      Category = 'Empresas'
      Caption = '&Tipos Portes'
      Hint = 'Mantenimiento y configuraci'#243'n de tipos de portes.'
    end
    object ARangosPortes: TAction
      Category = 'Empresas'
      Caption = 'Rangos P&ortes'
      Hint = 'mantenimiento y configuraci'#243'n del rango en portes.'
    end
    object APromocionesVenta: TAction
      Category = 'Almacenes'
      Caption = '&Promociones Ventas'
      Hint = 'Mantenimiento de promociones para ventas.'
    end
    object APromocionesIndirectas: TAction
      Category = 'Almacenes'
      Caption = 'Promociones Indirectas'
      Hint = 'Mantenimiento de promociones indirectas'
    end
    object AOrdenPromocion: TAction
      Category = 'Auxiliares'
      Caption = '&Ordenes  Promociones'
      Hint = 
        'Ordenes en las que se aplicar'#225'n las promociones activas de la em' +
        'presa.'
    end
    object ATrazabilidadLotes: TAction
      Category = 'Almacenes'
      Caption = 'Listar Trazabilidad Lotes'
      Hint = 'Listado de la trazabilidad de los lotes.'
    end
    object AAsistenteTarifa: TAction
      Category = 'Empresas'
      Caption = 'Asistente  Importaci'#243'n Tarifas'
      Hint = 'Asistente para importar tarifas de tablas excel.'
    end
    object APropuestas: TAction
      Category = 'Compras'
      Caption = '&Propuestas Proveedor'
      Hint = 'Mantenimiento de propuestas de proveedores.'
    end
    object APropuestasConfirm: TAction
      Category = 'Compras'
      Caption = 'Propuestas &Compra Confirmadas'
      Hint = 
        'Propuestas de compras confirmadas y pendientes de pasar a pedido' +
        's.'
    end
    object AArtBultos: TAction
      Category = 'Almacenes'
      Caption = '&Bultos'
      Hint = 'Mantenimiento de los tipos de bultos.'
    end
    object AVentas: TAction
      Category = 'TPV'
      Caption = 'Ventas TPV'
      Hint = 'Ventas'
    end
    object ATicketsEdicion: TAction
      Category = 'TPV'
      Caption = 'Editar Tickets Venta'
      Hint = 'Editar los tickets de venta.'
    end
    object AVentasArticulos: TAction
      Category = 'TPV'
      Caption = 'Ver Ventas Art'#237'culos'
      Hint = 'Listado de ventas de art'#237'culos.'
    end
    object AFacturarTickets: TAction
      Category = 'TPV'
      Caption = 'Facturar Tickets TPV'
      Hint = 'Facturaci'#243'n de los tickets pendientes.'
    end
    object ACobros: TAction
      Category = 'TPV'
      Caption = 'Cobros'
      Hint = 'Cobros'
    end
    object ACobrosEdicion: TAction
      Category = 'TPV'
      Caption = 'Edici'#243'n Cobros'
      Hint = 'Edici'#243'n de Cobros'
    end
    object AGastos: TAction
      Category = 'TPV App'
      Caption = 'Gastos TPV'
      Hint = 'Gastos'
    end
    object ATicketsEdicionGastos: TAction
      Category = 'TPV App'
      Caption = 'Editar Tickets Gasto'
      Hint = 'Edici'#243'n de tickets de gasto'
    end
    object AFacturarTicketsGasto: TAction
      Category = 'TPV App'
      Caption = 'Facturar Tickets Gasto'
      Hint = 'Facturaci'#243'n de Tickets de Gasto'
    end
    object ASesion: TAction
      Category = 'TPV'
      Caption = '&Sesiones'
      Hint = 'Operar con las sesiones. (Abrir, cerrar).'
    end
    object ACajas: TAction
      Category = 'TPV'
      Caption = '&Cajas TPV'
      Hint = 'Operar con las cajas del TPV.'
    end
    object ATurnos: TAction
      Category = 'TPV'
      Caption = '&Turnos TPV'
      Hint = 'Operar con los turnos del TPV.'
    end
    object ATercerosTPV: TAction
      Category = 'TPV App'
      Caption = '&Terceros TPV'
      Hint = 'Mantenimiento de terceros en el TPV.'
    end
    object AClientesTPV: TAction
      Category = 'TPV App'
      Caption = '&Clientes TPV'
      Hint = 'mantenimiento de clientes en el TPV.'
    end
    object ACajasEmpresa: TAction
      Category = 'TPV'
      Caption = 'Cajas'
      Hint = 'Configurar las cajas de la empresa.'
    end
    object ACajasSistema: TAction
      Category = 'TPV App'
      Caption = '&Cajas TPV'
      Hint = 'Mantenimiento de las cajas del sistema.'
    end
    object AUsuariosTPV: TAction
      Category = 'TPV App'
      Caption = 'Usuario / Caja'
      Hint = 'Cambio de usuario por caja.'
    end
    object AEmpEjerCan: TAction
      Category = 'TPV App'
      Caption = '&Seleccionar Empresa Ejercicio...'
      Hint = 'Selecci'#243'n de la empresa, ejercicio, canal y serie.'
    end
    object AFondoTPV: TAction
      Category = 'TPV App'
      Caption = 'Ocultar Fondo'
      Hint = 'Ocultar o mostrar fondo de pantalla.'
    end
    object AConfiguracion: TAction
      Category = 'TPV App'
      Caption = '&Configuraci'#243'n'
      Hint = 'Configuraci'#243'n del sistema TPV'
    end
    object ATiposGasto: TAction
      Category = 'TPV App'
      Caption = 'Tipos Gastos'
      Hint = 'Mantenimiento de los tipos de gasto en el TPV.'
    end
    object AFormaPagoTpv: TAction
      Category = 'TPV App'
      Caption = 'Formas Pago'
      Hint = 'Configuraci'#243'n formas de pago en TPV.'
    end
    object APerfilesUsuarioTPV: TAction
      Category = 'TPV App'
      Caption = 'Perfiles Usuario TPV'
      Hint = 'Mantenimiento de perfiles de usuario para TPV'
    end
    object APedidosPendientes: TAction
      Category = 'Terceros'
      Caption = '&Pedidos Pendientes'
      Hint = 'Pedidos Pendientes'
    end
    object AAlbaranesPendientes: TAction
      Category = 'Terceros'
      Caption = '&Albaranes Pendientes'
      Hint = 'Albaranes pendientes.'
    end
    object AFiltroFacturas: TAction
      Category = 'Terceros'
      Caption = '&Filtrar Facturas'
      Hint = 'Filtro Facturas'
    end
    object APedidosPendientesProv: TAction
      Category = 'Terceros'
      Caption = '&Pedidos Pendientes Proveedor'
      Hint = 'Pedidos Pendientes Proveedor'
    end
    object AAlbaranesPendientesProv: TAction
      Category = 'Terceros'
      Caption = '&Albaranes Pendientes Proveedor'
      Hint = 'Albaranes Pendientes Proveedor'
    end
    object AFiltroFacturasProv: TAction
      Category = 'Terceros'
      Caption = 'Filtrar Facturas Proveedor'
      Hint = 'Filtro Facturas Proveedor'
    end
    object AFiltroFacturasAcr: TAction
      Category = 'Terceros'
      Caption = 'Filtrar Facturas &Acreedor'
      Hint = 'Filtro Facturas Acreedor'
    end
    object ADivisionesMaestros: TAction
      Category = 'Auxiliares'
      Caption = '&Divisiones'
      Hint = 'Maestro de Divisiones'
    end
    object AUsuariosWeb: TAction
      Category = 'Auxiliares'
      Caption = 'Usuarios &web'
      Hint = 
        'Mantenimiento de los usuarios que se conectaran a Delweb o Delpr' +
        'o'
    end
    object AHistoricoProcesosProv: TAction
      Category = 'Compras'
      Caption = '&Hist'#243'rico Procesos Compra'
      Hint = 'Hist'#243'rico de procesos autom'#225'ticos efectuados en compras'
    end
    object AAnaPlanesContables: TAction
      Category = 'Contabilidad Analitica'
      Caption = 'Planes contables anal'#237'ticos'
      Hint = 'Mantenimiento de los Planes Contables'
    end
    object AAnaCentrosCoste: TAction
      Category = 'Contabilidad Analitica'
      Caption = 'Centros Coste'
      Hint = 'Mantenimiento de los Centros de Coste'
    end
    object AAnaPlantillasImputacion: TAction
      Category = 'Contabilidad Analitica'
      Caption = 'Plantillas Imputaci'#243'n'
      Hint = 'Mantenimiento de las Plantillas de Imputaci'#243'n'
    end
    object AAnaImputacionesCostes: TAction
      Category = 'Contabilidad Analitica'
      Caption = 'Imputaciones'
      Hint = 'Imputaciones a Centros de Coste'
    end
    object AAnaExtracto: TAction
      Category = 'Contabilidad Analitica'
      Caption = 'Extractos'
      Hint = 'Consultas a los saldos de Centros de Coste'
    end
    object AAnaSumaYSaldos: TAction
      Category = 'Contabilidad Analitica'
      Caption = 'Suma y Saldos'
      Hint = 'Listado de Suma y Saldos Contabilidad Anal'#237'tica'
    end
    object AAnaAnalisisPresupuesto: TAction
      Category = 'Contabilidad Analitica'
      Caption = 'An'#225'lisis Presupuesto'
      Hint = 'An'#225'lisis Presupuesto Contabilidad Anal'#237'tica'
    end
    object AAnaPropagaEstructuras: TAction
      Category = 'Contabilidad Analitica'
      Caption = 'Propagaci'#243'n Estructuras Anal'#237'ticas'
      Hint = 'Propagar Estructuras'
    end
    object AAnaLstPlanContableAnalitico: TAction
      Category = 'Contabilidad Analitica'
      Caption = 'Plan Contable Anal'#237'tico'
      Hint = 'Listado de Plan Contable Anal'#237'tico'
    end
    object AUsuarioCambiaClave: TAction
      Category = 'Auxiliares'
      Caption = 'Cam&biar Clave Usuario'
      Hint = 'Cambio de la clave del usuario'
    end
    object AImportarAsientos: TAction
      Category = 'Contabilidad'
      Caption = '&Importar Asientos'
      Hint = 'Importar asientos de una contabilidad externa.'
    end
    object AExportarAsientos: TAction
      Category = 'Contabilidad'
      Caption = '&Exportar Asientos'
      Hint = 'Exportar asientos contables a otra contabilidad o a excel.'
    end
    object AExportarSaldos: TAction
      Category = 'Contabilidad'
      Caption = 'Exportar &Saldos Contables'
      Hint = 
        'Exportar saldos de la contabilidad de la empresa a otra contabil' +
        'idad o a excel.'
    end
    object AParamModelosHacienda: TAction
      Category = 'Impuestos'
      Caption = 'Parametros Modelos Hacienda'
      Hint = 'Parametros de configuraci'#243'n para los modelos de hacienda.'
    end
    object AOrdenesDePago: TAction
      Category = 'Tesoreria'
      Caption = '&Ordenes Pago CSB34'
      Hint = 'Ordenes De Pago para utilizar la norma CSB 34'
    end
    object ANorma43SLucia: TAction
      Category = 'Contabilidad'
      Caption = 'Importacion Norma 43 Santa Lucia'
      Hint = 'Importacion de ficheros con norma CSB 43 '
    end
    object ACRM: TAction
      Category = 'Terceros'
      Caption = 'CRM'
      Hint = 'C.R.M.'
    end
    object ASincronizarBasesKri: TAction
      Category = 'ECommerce'
      Caption = 'Sincronizar Bases Datos'
      Hint = 
        'Sincroniza: Terceros, Clientes, Proveedores, Familias, Articulos' +
        ' y Tarifas de Venta'
    end
    object ANorma43Kri: TAction
      Category = 'Contabilidad'
      Caption = 'Importacion Norma 43'
      Hint = 'Importacion de ficheros con norma CSB 43'
    end
    object AContaRectAsientos: TAction
      Category = 'Contabilidad'
      Caption = 'Rectificar Asientos Negativos'
      Hint = 'Rectificaci'#243'n de Asientos'
    end
    object AConfAlmacenes: TAction
      Category = 'Almacenes'
      Caption = '&Configurar Almacenes'
      Hint = 'Configuraci'#243'n de las estructura de los almacenes.'
    end
    object APreciosCosteKri: TAction
      Category = 'Almacenes'
      Caption = 'P&recios Coste'
      Hint = 'Precios de coste para valorar inventarios.'
    end
    object AEquivalencias: TAction
      Category = 'Auxiliares'
      Caption = '&Equivalencias Planes Contables'
      Hint = 'Gestionar equivalencias entre planes contables.'
    end
    object AModificaPGC: TAction
      Category = 'Contabilidad'
      Caption = 'Modificar PGC Empresa'
      Hint = 'Modifica el PGC de una Empresa-Ejercicio-Canal'
    end
    object AGestions: TAction
      Category = 'Auxiliares'
      Caption = '&Gestiones Contables'
      Hint = 
        'Tipos de gestiones contables para generar los asientos de la emp' +
        'resa.'
    end
    object ACambioEmpresaEjerCanal: TAction
      Category = 'Utilidades'
      Caption = '&Cambiar  Empresa-Ejercicio-Canal'
      Hint = 'Cambio de empresa-ejercicio-canal.'
    end
    object ATipoLineaVenta: TAction
      Category = 'Auxiliares'
      Caption = '&Tipos L'#237'nea Venta'
      Hint = 'Definici'#243'n de los tipos de l'#237'nea de venta'
    end
    object APedidoEntreAlmacenes: TAction
      Category = 'Almacenes'
      Caption = '&Pedido Entre Almacenes'
      Hint = 'Pedidos internos entre almacenes o entre tiendas.'
    end
    object ATraspasoPedCliAPedProv: TAction
      Category = 'Compras'
      Caption = 'Tras&pasar Pedidos Cliente Proveedor'
      Hint = 'Traspaso Pedidos de Cliente a Pedidos a Proveedor'
    end
    object ARecepcionWeb: TAction
      Category = 'ECommerce'
      Caption = 'Recepcionar Pedidos &Web'
      Hint = 'Recepci'#243'n de pedidos de proveedores desde la Web.'
    end
    object ATipoIncidenciaKri: TAction
      Category = 'Auxiliares'
      Caption = 'Tipos &Incidencia'
      Hint = 
        'Tipos de incidencias en clientes, proveedores, acreedores, agent' +
        'es..'
    end
    object AAlarmasIberfluidKri: TAction
      Category = 'Compras'
      Caption = 'Alarmas Iberfluid'
      Hint = 'Alarmas Iberfluid'
    end
    object AProcesosKri: TAction
      Category = 'Empresas'
      Caption = '&Lanzar Avisos'
      Hint = 'Procesos Autom'#225'ticos - Trepat'
    end
    object AIdiomasKri: TAction
      Category = 'Auxiliares'
      Caption = 'Configurar Impresi'#243'n &Idiomas'
      Hint = 
        'Configuraci'#243'n de los textos de los informes (facturas, pedidos, ' +
        'etc ) de los Idiomas del sistema.'
    end
    object AImportarDocumentos: TAction
      Category = 'ECommerce'
      Caption = 'Importar Documentos Excel'
      Hint = 'Importar documentos de venta con tablas excel.'
    end
    object AZonas: TAction
      Category = 'Auxiliares'
      Caption = '&Zonas'
      Hint = 'Mantenimiento de las zonas de los clientes.'
    end
    object APersonalUlises: TAction
      Category = 'Empresas'
      Caption = 'Personal Ulises'
      Hint = 'Interfaz Comunicaci'#243'n con Personal Ulises'
    end
    object ATransportistasSEUR: TAction
      Category = 'Empresas'
      Caption = 'Transportistas S&EUR'
      Hint = 'Configuraci'#243'n de datos para Transportistas SEUR'
    end
    object ATransportistasDHL: TAction
      Category = 'Empresas'
      Caption = 'Transportistas DHL'
      Hint = 'Configuraci'#243'n de datos para Transportistas DHL'
    end
    object ATransportistasIDRIL: TAction
      Category = 'Empresas'
      Caption = 'Transportista IDRIL (GLS)'
      Hint = 'Configuraci'#243'n de datos para Transportistas IDRIL (GLS)'
    end
    object ACrmAmbitos: TAction
      Category = 'CRM'
      Caption = '&'#193'mbitos'
      Hint = 'Mantenimiento de '#225'mbitos de los contactos.'
    end
    object ACrmEMails: TAction
      Category = 'CRM'
      Caption = 'Correos Electr'#243'nicos (E-Mails)'
      Hint = 'Mantenimiento de los correos electr'#243'nicos para envios masivos.'
    end
    object ACrmTipoAcciones: TAction
      Category = 'CRM'
      Caption = '&Tipo Acciones'
      Hint = 'mantenimiento de los tipos de acciones comerciales.'
    end
    object ACrmContactos: TAction
      Category = 'CRM'
      Caption = '&Contactos'
      Hint = 'Mantenimiento de los contactos del CRM.'
    end
    object ADisenarTicket: TAction
      Category = 'TPV'
      Caption = 'Dise'#241'ar &Ticket'
      Hint = 'Dise'#241'ador de informes de Ticket'
    end
    object ADisenarVale: TAction
      Category = 'TPV'
      Caption = 'Dise'#241'ar &Vale'
      Hint = 'Dise'#241'ador de informes de Vales'
    end
    object ADisenarTicketRecogida: TAction
      Category = 'TPV'
      Caption = 'Dise'#241'ar Ticket &Recogida'
      Hint = 'Dise'#241'ador de informes de Ticket de Recogida'
    end
    object ACrmConsultaAcciones: TAction
      Category = 'CRM'
      Caption = '&Seguimientos'
      Hint = 'Seguimiento de Acciones Comerciales'
    end
    object ACrmConfiguracion: TAction
      Category = 'CRM'
      Caption = '&Configuraci'#243'n CRM'
      Hint = 'Configuraci'#243'n de  los parametros del CRM.'
    end
    object ACrmOrigenRel: TAction
      Category = 'CRM'
      Caption = '&Origen Contacto'
      Hint = 'Mantenimiento de los origenes de los contactos.'
    end
    object ACrmImportarContactos: TAction
      Category = 'CRM'
      Caption = 'Importar Contactos'
      Hint = 'Importaci'#243'n masiva de contactos desde un excel.'
    end
    object AEstadisticas: TAction
      Category = 'Estadisticas'
      Caption = 'E&stad'#237'sticas Configurables'
      Hint = 'Mantenimiento de estad'#237'sticas configurables por periodos.'
    end
    object AIsoAccPreventiva: TAction
      Category = 'Produccion ISO'
      Caption = '&Acciones Preventivas'
      Hint = 'Mantenimiento acciones preventivas.'
    end
    object AIsoMantTAcc: TAction
      Category = 'Produccion ISO'
      Caption = '&Tipos Acciones'
      Hint = 'Mantenimiento tipo de los tipos de acciones.'
    end
    object AIsoPlanCapac: TAction
      Category = 'Produccion ISO'
      Caption = 'Plan &Capacitaci'#243'n'
      Hint = 'Mantenimiento planes de capacitaci'#243'n.'
    end
    object AIsoClassProv: TAction
      Category = 'Produccion ISO'
      Caption = 'Clasificaci'#243'n &Proveedores'
      Hint = 'Clasificaci'#243'n ABC de proveedores.'
    end
    object AIsoDevMat: TAction
      Category = 'Produccion ISO'
      Caption = 'Devoluci'#243'n &Material INC'
      Hint = 'Devoluci'#243'n de materiales con informe de con conformidad.'
    end
    object AIsoMantInformes: TAction
      Category = 'Produccion ISO'
      Caption = 'Informes No Conformidad (INC)'
      Hint = 'Mantenimiento de informes de no conformidad. (INC)'
    end
    object AIsoControlEquip: TAction
      Category = 'Produccion ISO'
      Caption = 'Control &Equipos Medici'#243'n'
      Hint = 'Control equipos de medici'#243'n.'
    end
    object AIsoPunteos: TAction
      Category = 'Produccion ISO'
      Caption = 'Punteos INC'
      Hint = 'Punteos y cierres de informes de no conformidades.'
    end
    object AIsoFirmas: TAction
      Category = 'Produccion ISO'
      Caption = '&Firmas ISO'
      Hint = 'Mantenimiento de firmas ISO.'
    end
    object AIsoCursos: TAction
      Category = 'Produccion ISO'
      Caption = '&Cursos Formaci'#243'n'
      Hint = 'mantenimiento de cursos formaci'#243'n.'
    end
    object AIsoPlanning: TAction
      Category = 'Produccion ISO'
      Caption = 'Planning Formaci'#243'n'
      Hint = 'Planning de formacion de los empleados.'
    end
    object AProEscandalloSF: TAction
      Category = 'Produccion Avanzada'
      Caption = '&Escandallos Producci'#243'n'
      Hint = 'Mantenimiento de escandallos, desglose, ensamblado, etc.'
    end
    object AProMarcajesOpe: TAction
      Category = 'Produccion Avanzada'
      Caption = 'Marcajes Operario &Tarea'
      Hint = 
        'mantenimiento de los marcajes de los operarios por el ID de la t' +
        'area.'
    end
    object AProDiario: TAction
      Category = 'Produccion Avanzada'
      Caption = 'Mostrar &Marcajes'
      Hint = 'Grid con los marcajes filtrados entre fechas, secciones.'
    end
    object AProOrden: TAction
      Category = 'Produccion Avanzada'
      Caption = '&Ordenes Producci'#243'n'
      Hint = 'Mantenimiento de las ordenes de producci'#243'n.Ordenes de Producci'#243'n'
    end
    object AProGestionOrd: TAction
      Category = 'Produccion Avanzada'
      Caption = 'Lanzar/Cerrar Ordenes Masiva'
      Hint = 'Ver estado, lanzar/cerrar las ordenes de producci'#243'n.'
    end
    object AProMarcajesMaq: TAction
      Category = 'Produccion Avanzada'
      Caption = 'M&arcajes M'#225'quinas'
      Hint = 'Mantenimiento marcajes de las m'#225'quina por el ID de la tarea.'
    end
    object AProMarcajesTe: TAction
      Category = 'Produccion Avanzada'
      Caption = 'Marcajes Trabajo &Externo'
      Hint = 'Mantenimiento marcajes de los trabajos externos.'
    end
    object AProMarcajesVa: TAction
      Category = 'Produccion Avanzada'
      Caption = 'Imputar Tareas &Varias'
      Hint = 
        'Mantenimiento de los marcajes varios a las tareas de las ordenes' +
        ' de producci'#243'n.'
    end
    object AProGenerarOrd: TAction
      Category = 'Produccion Avanzada'
      Caption = 'Generar Ordenes &Pedidos'
      Hint = 
        'Generar las Ordenes de producci'#243'n de los pedidos de los clientes' +
        '.'
    end
    object AProRecursosEmp: TAction
      Category = 'Produccion Avanzada'
      Caption = '&Recursos Producci'#243'n'
      Hint = 'Mantenimiento de los recursos de producci'#243'n.'
    end
    object AOpeCategoria: TAction
      Category = 'Operarios'
      Caption = '&Categorias Empleados'
      Hint = 'Mantenimiento categorias empleados, operarios.'
    end
    object AOpeCTrabajo: TAction
      Category = 'Operarios'
      Caption = '&Centros Trabajo'
      Hint = 'Mantenimiento de los centros de trabajo de los empleados.'
    end
    object AOpeDepartamento: TAction
      Category = 'Operarios'
      Caption = '&Departamentos'
      Hint = 'Mantenimiento de los departamentos que pertenecen los empleados.'
    end
    object AOpeSecciones: TAction
      Category = 'Operarios'
      Caption = '&Secciones'
      Hint = 'Mantenimiento secciones de trabajo.'
    end
    object AOpeTContrato: TAction
      Category = 'Operarios'
      Caption = '&Tipos Contrato'
      Hint = 'Mantenimiento Tipos de Contrato'
    end
    object AOpeEmpleados: TAction
      Category = 'Operarios'
      Caption = '&Empleados'
      Hint = 'Mantenimiento de empleados, operarios, mec'#225'nicos.'
    end
    object ANomina: TAction
      Category = 'Operarios'
      Caption = '&Importaci'#243'n N'#243'mina'
      Hint = 'Mantenimiento e importaci'#243'n de las n'#243'minas de los empleados.'
    end
    object AProMaquinas: TAction
      Category = 'Produccion Avanzada'
      Caption = 'M'#225'quinas'
      Hint = 'Mantenimiento de las m'#225'quinas para producci'#243'n.'
    end
    object AOpeImputaciones: TAction
      Category = 'Operarios'
      Caption = '&Imputaciones Costes Empleados'
      Hint = 'Mantenimiento imputaciones empleados.'
    end
    object AOpeTImputacion: TAction
      Category = 'Operarios'
      Caption = 'Tipos Imputaci'#243'n'
      Hint = 
        'Mantenimiento de los tipos imputacion para los costes de emplead' +
        'os.'
    end
    object AOpeCalendario: TAction
      Category = 'Operarios'
      Caption = '&Calendario Empresa'
      Hint = 'Mantenimiento de Calendario de la Empresa'
    end
    object AOpeCalendarioEmp: TAction
      Category = 'Operarios'
      Caption = 'Calendario &Empleado'
      Hint = 'Mantenimiento de Calendario de Empleado'
    end
    object ACalendarioZona: TAction
      Category = 'Operarios'
      Caption = 'Calendario &Zona'
      Hint = 'Mantenimiento de Calendario por Zona.'
    end
    object AProLstOrden: TAction
      Category = 'Produccion Avanzada'
      Caption = 'Listar Orden Producci'#243'n'
      Hint = 'Listado de luna ordenes de producci'#243'n.'
    end
    object AProLstEscandallo: TAction
      Category = 'Produccion Avanzada'
      Caption = 'Listar Escandallo'
      Hint = 'Listado de los datos de un escandallo.'
    end
    object AProMatInc: TAction
      Category = 'Produccion Avanzada'
      Caption = 'Incidencias Materiales'
      Hint = 
        'Mantenimiento de las ncid'#233'ncias de material en una orden de prod' +
        'ucci'#243'n.'
    end
    object AProTMaquina: TAction
      Category = 'Produccion Avanzada'
      Caption = '&Tipo M'#225'quina'
      Hint = 'Mantenimiento de los tipos de maquinas.'
    end
    object AProRecMarcajes: TAction
      Category = 'Produccion Avanzada'
      Caption = '&Recoger Marcajes Reloj'
      Hint = 'Proceso de recogida de marcajes ficheros externos.'
    end
    object AProFases: TAction
      Category = 'Produccion Avanzada'
      Caption = '&Fases Producci'#243'n'
      Hint = 'Mantenimiento de de las fases en escandallos y producci'#243'n.'
    end
    object AProTareas: TAction
      Category = 'Produccion Avanzada'
      Caption = '&Tareas Producci'#243'n'
      Hint = 
        'Mantenimiento de las tareas en los escandallos y las ordenes de ' +
        'producci'#243'n.'
    end
    object AProRecursos: TAction
      Category = 'Produccion Avanzada'
      Caption = '&Recursos Producci'#243'n'
      Hint = 'Mantenimiento de recuros en escandallos y ordenes de producci'#243'n.'
    end
    object AProLstMarcajes: TAction
      Category = 'Produccion Avanzada'
      Caption = 'Listar &Marcajes'
      Hint = 'Listado de los marcajes de producci'#243'n.'
    end
    object AProConfigMarcajes: TAction
      Category = 'Produccion Avanzada'
      Caption = 'Configurar Recogida Marcajes'
      Hint = 'Configuraci'#243'n de recogida de marcajes.'
    end
    object AOpeHorario: TAction
      Category = 'Operarios'
      Caption = '&Horarios'
      Hint = 'Mantenimiento de Horarios.'
    end
    object AProLstMontaje: TAction
      Category = 'Produccion Avanzada'
      Caption = 'Listar Hoja Montaje'
      Hint = 'Listado de de la hoja de montaje de la orden de producci'#243'n.'
    end
    object AProLstNecesidades: TAction
      Category = 'Produccion Avanzada'
      Caption = 'Listar Necesidades'
      Hint = 'Listado de las necesidades una orden de producci'#243'n.'
    end
    object AProUtillajes: TAction
      Category = 'Produccion Avanzada'
      Caption = '&Utillajes'
      Hint = 
        'Mantenimiento de los utillajes que se asocian a las tareas en la' +
        's ordenes de producci'#243'n.'
    end
    object AProLstHojaTrabajo: TAction
      Category = 'Produccion Avanzada'
      Caption = 'Listar Hoja Trabajo'
      Hint = 'Listado de las hojas de trabajo entre pedidos de clientes.'
    end
    object AProRelacionUds: TAction
      Category = 'Produccion Avanzada'
      Caption = '&Relaci'#243'n Unidades'
      Hint = 
        'Relaci'#243'n entre las unidades de stock y los consumos en las orden' +
        'es de producci'#243'n.'
    end
    object AProOfertasE: TAction
      Category = 'Produccion Avanzada'
      Caption = 'Escandallo &Ofertas'
      Hint = 
        'Mantenimiento de los escandallos tipo oferta. Ofertas Escandallo' +
        's'
    end
    object AProLstofertasE: TAction
      Category = 'Produccion Avanzada'
      Caption = 'Listar &Escandallo Oferta'
      Hint = 'Listado de los escandallos tipo oferta.'
    end
    object AProMarcajesOpeEsp: TAction
      Category = 'Produccion Avanzada'
      Caption = 'Marcaje Operario &Especial'
      Hint = 'Marcajes operario con creaci'#243'n de las tareas.'
    end
    object AProMarcajesMaqEsp: TAction
      Category = 'Produccion Avanzada'
      Caption = 'Marcaje &M'#225'quina Especial'
      Hint = 'Marcajes de las m'#225'quinas creando tareas.'
    end
    object AProPlanificar: TAction
      Category = 'Produccion Plan'
      Caption = '&Planificar'
      Hint = 'Creaci'#243'n de la planificaci'#243'n.'
    end
    object AProDeslanza: TAction
      Category = 'Produccion Plan'
      Caption = '&Deslanzar'
      Hint = 'Deslanzar'
    end
    object AProCabPlanificacion: TAction
      Category = 'Produccion Plan'
      Caption = 'Planificaciones'
      Hint = 'Mantenimiento tipos de planificaciones.'
    end
    object AProTipTareasMan: TAction
      Category = 'Produccion Plan'
      Caption = 'Tipos &Tareas Manuales'
      Hint = 'Tipos de tareas manuales.'
    end
    object AProEquivalArt: TAction
      Category = 'Produccion Avanzada'
      Caption = '&Equivalencia Art'#237'culos'
      Hint = 'Componentes, art'#237'culos equivalentes para los escandallos.'
    end
    object APauta_TipoControl: TAction
      Category = 'Produccion Pauta'
      Caption = 'Tipo &Control'
      Hint = 
        'Mantenimiento de los tipos de control o pauta en escandallos pro' +
        'ducci'#243'n.'
    end
    object APauta: TAction
      Category = 'Produccion Pauta'
      Caption = '&Pauta Escandallos'
      Hint = 
        'Pauta y comportamientos para fabricar piezas relacionada con los' +
        ' escandallos.'
    end
    object AObrObras: TAction
      Category = 'Obras'
      Caption = 'Mantenimiento &Obras'
      Hint = 'Mantenimiento de obras.'
    end
    object AObrPartidas: TAction
      Category = 'Obras'
      Caption = '&Partidas'
      Hint = 'Mantenimiento de partidas.'
    end
    object AObrPartidasPlantilla: TAction
      Category = 'Obras'
      Caption = 'Plantillas &Partidas'
      Hint = 'Plantillas de partidas.'
    end
    object AProDiagramaGantt: TAction
      Category = 'Produccion Plan'
      Caption = 'Diagrama &Gantt'
      Hint = 'Ver diagrama de gantt.'
    end
    object AProTipoMarcajes: TAction
      Category = 'Produccion Avanzada'
      Caption = 'Tipo Marcajes'
      Hint = 'Mantenimiento de los tipo de marcajes.'
    end
    object AProMarcajesBD: TAction
      Category = 'Produccion Avanzada'
      Caption = 'Marcajes &Directos BD'
      Hint = 
        'Ver, corregir los marcajes directos efectuados por porcesos exte' +
        'rnos a la base de datos.'
    end
    object AProDesTipoPieza: TAction
      Category = 'Produccion Despiece'
      Caption = '&Tipos Pieza'
      Hint = 'Mantenimiento los tipos de pieza.'
    end
    object AProDesTipoMat: TAction
      Category = 'Produccion Despiece'
      Caption = 'Tipos &Material'
      Hint = 'Mantenimiento de tipos material.'
    end
    object AProDesDespiece: TAction
      Category = 'Produccion Despiece'
      Caption = '&Despiece Producci'#243'n'
      Hint = 'Mantenimiento despiece de producci'#243'n.'
    end
    object ARecalcular: TAction
      Category = 'Produccion Avanzada'
      Caption = 'Rec'#225'lcular Reservas'
      Hint = 'Recacular las unidades reservadas de un art'#237'culo.'
    end
    object ADocumentos: TAction
      Category = 'Produccion Avanzada'
      Caption = 'Documentos &Adjuntos'
      Hint = 'Documentos adjuntos'
    end
    object AProLstMatEsc: TAction
      Category = 'Produccion Avanzada'
      Caption = 'Listar &Materiales Escandallo'
      Hint = 'Listado de los escandallos en la que interviene un material.'
    end
    object ALstNecEsc: TAction
      Category = 'Produccion Avanzada'
      Caption = 'Listar Necesidades Escandallo'
      Hint = 
        'Listado de ls necesidades de materia prima (componentes) de un e' +
        'scandallo.'
    end
    object AImagenesArticulos: TAction
      Category = 'Produccion Avanzada'
      Caption = '&Im'#225'genes Art'#237'culos'
      Hint = 'Ver grid con las imagenes de todos los art'#237'culos.'
    end
    object AArticulosAlmacenes: TAction
      Category = 'Produccion Avanzada'
      Caption = '&Art'#237'culos Stocks Im'#225'gen'
      Hint = 'Almacenes Articulos'
    end
    object AProPantMarcajes: TAction
      Category = 'Produccion Avanzada'
      Caption = 'Ver Marcajes'
      Hint = 'Ver Marcajes'
    end
    object AAgrupaRecEsc: TAction
      Category = 'Produccion Avanzada'
      Caption = 'Agrupaci'#243'n de Recurso por Escandallo'
      Hint = 'Agrupaci'#243'n de Recurso por Escandallo'
    end
    object AProUtiles: TAction
      Category = 'Produccion Avanzada'
      Caption = '&Configuraci'#243'n'
      Hint = #218'tiles'
    end
    object AProFormulas: TAction
      Category = 'Produccion Avanzada'
      Caption = 'F'#243'rmulas'
      Hint = 'F'#243'rmulas'
    end
    object APresencia: TAction
      Category = 'Control Presencia'
      Caption = '&Fichajes Empleados'
      Hint = 'Mantenimiento de los fichajes empleados.'
    end
    object APresenciaIncidencia: TAction
      Category = 'Control Presencia'
      Caption = '&Tipos Incidencias'
      Hint = 'Mantenimiento de los tipos de incidencias.'
    end
    object APresenciaDispositivo: TAction
      Category = 'Control Presencia'
      Caption = 'Dispositivos'
      Hint = 'Mantenimiento de los dispositivos de control de presencia'
    end
    object APresenciaTipoMarcaje: TAction
      Category = 'Control Presencia'
      Caption = 'Tipo Marcaje'
      Hint = 'Mantenimiento de tipo de marcajes de presencia'
    end
    object APresenciaDiario: TAction
      Category = 'Control Presencia'
      Caption = '&Diario Presencia'
      Hint = 'Ver marcajes empleados entre fechas.'
    end
    object AImportacionFichajesDePresencia: TAction
      Category = 'Control Presencia'
      Caption = '&Importar Fichajes de Presencia'
      Hint = 'Importacion de fichajes de presencia'
    end
    object ALstPresencia: TAction
      Category = 'Control Presencia'
      Caption = 'Listar &Presencia'
      Hint = 'Listado de marcajes empleados entre fechas.'
    end
    object AProTMaquinaRevision: TAction
      Category = 'Produccion Avanzada'
      Caption = 'Maquinas Revisi'#243'n'
      Hint = 'Maquinas Revisi'#243'n'
    end
    object AProTipoRevMaq: TAction
      Category = 'Produccion Avanzada'
      Caption = 'Tipo Revisiones &M'#225'quina'
      Hint = 'Tipo Revisiones M'#225'quina'
    end
    object ACambioIdioma: TAction
      Category = 'Auxiliares'
      Caption = 'Cambiar Idioma'
      Hint = 'Cambio de idioma de la aplicacion.'
    end
    object ATipoUnidadLogistica: TAction
      Category = 'Auxiliares'
      Caption = 'Tipo &Unidad Logistica'
      Hint = 'Configura los tipos de unidad logisticas de la empresa.'
    end
    object AHojaDePreparacion: TAction
      Category = 'Ventas'
      Caption = '&Hojas Preparaci'#243'n Pedidos'
      Hint = 'Crear las hoja de preparacion de pedidos para servir.'
    end
    object AAltaHojaDePreparacion: TAction
      Category = 'Ventas'
      Caption = 'Alta Hoja Preparaci'#243'n'
      Hint = 'Alta de hoja de preparaci'#243'n.'
    end
    object ACierreParcialOrden: TAction
      Category = 'Produccion Avanzada'
      Caption = 'Cierre Parcial'
      Hint = 'Cierre parcial de orden de producci'#243'n'
    end
    object AProtocolosDeVenta: TAction
      Category = 'Auxiliares'
      Caption = 'P&rotocolos Venta'
      Hint = 'Mantenimiento de protocolos de venta.'
    end
    object AProtocoloDeVentas: TAction
      Category = 'Almacenes'
      Caption = '&Protocolo Ventas'
      Hint = 'Mantenimiento de Protocolos de Venta'
    end
    object ADepartamento: TAction
      Category = 'Auxiliares'
      Caption = '&Departamentos'
      Hint = 'Mantinimiento de departamentos de la empresa.'
    end
    object ACrmTipoSeguimiento: TAction
      Category = 'CRM'
      Caption = 'Tipo Seguimiento'
      Hint = 'Mantenimiento de tipos de seguimientos comerciales.'
    end
    object ATipoUbicacion: TAction
      Category = 'Ubicacion'
      Caption = '&Tipo Ubicacion'
      Hint = 'Mantenimiento de los tipos de ubicaci'#243'n.'
    end
    object ASectorAlmacen: TAction
      Category = 'Almacenes'
      Caption = '&Sectores Almac'#233'n'
      Hint = 'Mantenimiento de Sectores de Almac'#233'n'
    end
    object ALstUbicaciones: TAction
      Category = 'Ubicacion'
      Caption = 'Listar Ubicaciones'
      Hint = 'Listado de Ubicaciones'
    end
    object AAlbaranesVentaPendientes: TAction
      Category = 'Ventas'
      Caption = 'Listar &Albaranes Venta Pendientes'
      Hint = 'Listado de albaranes de clientes pendientes. (Ventas).'
    end
    object ZASysNCF: TAction
      Category = 'Latino'
      Caption = 'Contadores NCF'
      Hint = 'Mantenimientos de contadores NCF.'
    end
    object ZATalones: TAction
      Category = 'Latino'
      Caption = '&Talones'
      Hint = 'Talones'
    end
    object ZADiarioVentas: TAction
      Category = 'Latino'
      Caption = 'Listar Diario Ventas'
      Hint = 'Listado de diario de ventas.'
    end
    object ZAVentasFamilia: TAction
      Category = 'Latino'
      Caption = '&Ventas Familia'
      Hint = 'Ventas por familia.'
    end
    object ZAIntereses: TAction
      Category = 'Latino'
      Caption = 'Intereses &Anticipos'
      Hint = 'Intereses en llos anticipos.'
    end
    object AListadoITBIS: TAction
      Category = 'Latino'
      Caption = 'Listar &ITBIS'
      Hint = 'Listado ITBIS (606-607).'
    end
    object ALSTTalones: TAction
      Category = 'Latino'
      Caption = 'Listar &Talones'
      Hint = 'Listado de Talones'
    end
    object ZARecibos: TAction
      Category = 'Latino'
      Caption = 'Recibos &Ingresos'
      Hint = 'Recibos para los ingresos.'
    end
    object AResponsableHojaDePreparacion: TAction
      Category = 'Ventas'
      Caption = 'Validaci'#243'n Hojas Preparaci'#243'n'
      Hint = 'Responsable hoja de preparacion.'
    end
    object AGruposIncoterm: TAction
      Category = 'Auxiliares'
      Caption = '&Grupos Incoterm'
      Hint = 'Mantenimiento de (Grupos Incoterm)'
    end
    object ACodigosIncoterm: TAction
      Category = 'Auxiliares'
      Caption = 'C&odigos Incoterm'
      Hint = 'Mantenimiento de (Codigos Incoterm).'
    end
    object AAsistenteImpIdiomaArticulos: TAction
      Category = 'Empresas'
      Caption = 'Asistente Importaci'#243'n Idiomas Articulos'
      Hint = 'Asistente de importaci'#243'n de idiomas de los articulos.'
    end
    object AProMarcajesMaqEspTurno: TAction
      Category = 'Produccion Avanzada'
      Caption = 'M'#225'quina Especial Turno'
      Hint = 'Marcajes de M'#225'quina Especial Turno'
    end
    object AProTurnos: TAction
      Category = 'Produccion Avanzada'
      Caption = 'Turnos'
      Hint = 'Turnos'
    end
    object AProCausas: TAction
      Category = 'Produccion Avanzada'
      Caption = 'Causas'
      Hint = 'Causas'
    end
    object AProDefecto: TAction
      Category = 'Produccion Avanzada'
      Caption = 'Defecto Material'
      Hint = 'Defecto Material'
    end
    object AProTiposDefecto: TAction
      Category = 'Produccion Avanzada'
      Caption = 'Tipos Defecto'
      Hint = 'Tipos Defecto'
    end
    object AIsoFichaTecnica: TAction
      Category = 'Produccion ISO'
      Caption = '&Ficha T'#233'cnica ISO'
      Hint = 'Mantenimiento de fichas t'#233'cnicas de los art'#237'culos.'
    end
    object AIsoNormativas: TAction
      Category = 'Produccion ISO'
      Caption = '&Normativas ISO'
      Hint = 'Mantenimientos de normativas ISO.'
    end
    object AIsoTipoEnsayo: TAction
      Category = 'Produccion ISO'
      Caption = '&Tipos Ensayo ISO'
      Hint = 'Mantenimiento de tipos de ensayos.'
    end
    object AIsoEnsayos: TAction
      Category = 'Produccion ISO'
      Caption = '&Ensayos ISO'
      Hint = 'Mantenimientos de ensayos ISO.'
    end
    object AImportarPedidos: TAction
      Category = 'ECommerce'
      Caption = 'Importar Pedidos Excel'
      Hint = 'Importar pedidos clientes desde tablas excel. (Ventas).'
    end
    object ATipoRetencion: TAction
      Category = 'Latino'
      Caption = 'Tipos &Retenci'#243'n'
      Hint = 'Tipos Retenci'#243'n'
    end
    object APlanMaestroProduccion: TAction
      Category = 'Produccion Avanzada'
      Caption = 'Plan Maestro Produccion'
      Hint = 'Plan maestro de produccion'
    end
    object ADiarioCostes: TAction
      Category = 'Contabilidad'
      Caption = '&Diario Costes'
      Hint = 'Ver el diarios de costes.'
    end
    object AGestionDeCobros: TAction
      Category = 'Tesoreria'
      Caption = 'Gestion de cobros/pagos'
      Hint = 'Gestion de cobros/pagos'
    end
    object AMaestros: TAction
      Category = 'Etiquetas'
      Caption = 'Datos Maestros'
      Hint = 'Datos Maestros'
    end
    object AOrdenes: TAction
      Category = 'Etiquetas'
      Caption = 'Ordenes'
      Hint = 'Ordenes'
    end
    object AEtiquetas: TAction
      Category = 'Etiquetas'
      Caption = 'Etiquetas'
      Hint = 'Etiquetas'
    end
    object APresupuestos: TAction
      Category = 'Etiquetas'
      Caption = 'Presupuestos'
      Hint = 'Presupuestos'
    end
    object ALstPresupuestos: TAction
      Category = 'Etiquetas'
      Caption = 'Listado Presupuestos'
      Hint = 'Listado Presupuestos'
    end
    object AMaquinas: TAction
      Category = 'Etiquetas'
      Caption = 'M'#225'quinas'
      Hint = 'M'#225'quinas'
    end
    object ADetalleMaq: TAction
      Category = 'Etiquetas'
      Caption = 'Detalle M'#225'quinas'
      Hint = 'Detalle de M'#225'quina'
    end
    object ATroqueles: TAction
      Category = 'Etiquetas'
      Caption = 'Troqueles'
      Hint = 'Troqueles'
    end
    object AEtiConstantes: TAction
      Category = 'Etiquetas'
      Caption = 'Configuraci'#243'n'
      Hint = 'Configuraci'#243'n'
    end
    object ATiposArticulo: TAction
      Category = 'Auxiliares'
      Caption = 'Tipos Art'#237'culo'
      Hint = 'Mantenimiento de tipos de art'#237'culo.'
    end
    object AMateriales: TAction
      Category = 'Auxiliares'
      Caption = '&Tipos Materiales'
      Hint = 'Mantenimiento de materiales de los art'#237'culos.'
    end
    object AColadas: TAction
      Category = 'Coladas'
      Caption = '&Coladas'
      Hint = 'Mantenimiento de coladas en el m'#243'dulo fundiciones de metal.'
    end
    object AReparaciones: TAction
      Category = 'Reparaciones'
      Caption = '&Reparaciones'
      Hint = 'Mantenimiento de reparaciones.'
    end
    object AMantConsumo: TAction
      Category = 'Reparaciones'
      Caption = '&Consumo'
      Hint = 'Mantenimiento consumo.'
    end
    object AZLstOfertas: TAction
      Category = 'Ventas'
      Caption = 'Listar &Ofertas'
      Hint = 'Listado de ofertas filtrado por estado y agrupacion'
    end
    object AGas: TAction
      Category = 'Gas'
      Caption = 'Ventas &Gas'
      Hint = 'Mantenimiento de m'#243'dulo de gas.'
    end
    object ATiposMoneda: TAction
      Category = 'Auxiliares'
      Caption = 'Tipos &Moneda'
      Hint = 'Mantenimiento de los tipos monedas.'
    end
    object AGasTanque: TAction
      Category = 'Gas'
      Caption = '&Tanque'
      Hint = 'Mantenimiento gas tanques.'
    end
    object AGasDispensador: TAction
      Category = 'Gas'
      Caption = '&Dispensadores'
      Hint = 'Mantenimiento dispensadores de gas.'
    end
    object AGasColaCamion: TAction
      Category = 'Gas'
      Caption = 'Colas &Cami'#243'n'
      Hint = 'Mantenimiento colas de camiones de gas.'
    end
    object AProSubsComponentes: TAction
      Category = 'Produccion Avanzada'
      Caption = 'Substituir Componentes'
      Hint = 'Substituci'#243'n de componetes de escandallo'
    end
    object ASincronizaIncidencias: TAction
      Category = 'ECommerce'
      Caption = 'Sincronizar Incidencias'
      Hint = 'Sincroniza las incidencias locales con las del servidor'
    end
    object ACompensacionRecibos: TAction
      Category = 'Tesoreria'
      Caption = 'Compe&nsar Recibos Terceros'
      Hint = 'Compensacion de recibos entre clientes proveedores. (Terceros).'
    end
    object AGasUtiles: TAction
      Category = 'Gas'
      Caption = '&Configuraci'#243'n Gas'
      Hint = 'Configuraci'#243'n de M'#243'dulo de gas.'
    end
    object ASerializacion: TAction
      Category = 'Almacenes'
      Caption = '&Serializaci'#243'n'
      Hint = 'mantenimiento de la serializacion de articulos'
    end
    object ADescargasGas: TAction
      Category = 'Gas'
      Caption = '&Descargas Gas'
      Hint = 'Descargas de gas.'
    end
    object ASincronizaTienda: TAction
      Category = 'ECommerce'
      Caption = 'Sincronizar Tienda PrestaShop'
      Hint = 'Sincroniza las tiendas en PrestaShop'
    end
    object ASincronizaTiendaWoocommerce: TAction
      Category = 'ECommerce'
      Caption = 'Sincronizar Tienda Woocommerce'
      Hint = 'Sincroniza las tiendas en Woocommerce'
    end
    object AVerificacionesImpuestos: TAction
      Category = 'Impuestos'
      Caption = '&Verificar Impuestos'
      Hint = 'Verificaciones impuestos.'
    end
    object ASeriesCliente: TAction
      Category = 'Reparaciones'
      Caption = '&Nro. Series Maquinas Cliente'
      Hint = 
        'Mantenimiento de Nros. de Series de las m'#225'quinas vendidas a clie' +
        'nte.'
    end
    object ACrmArticulos: TAction
      Category = 'CRM'
      Caption = 'Articulos CRM'
      Hint = 'Mantenimiento de los art'#237'culos del CRM.'
    end
    object ACrmMarcajes: TAction
      Category = 'CRM'
      Caption = 'Marcajes CRM'
      Hint = 'Marcajes'
    end
    object ACrmVentas: TAction
      Category = 'CRM'
      Caption = 'Marcajes Ventas'
      Hint = 'Mantenimiento de Marcajes Ventas'
    end
    object ACrmAcciones: TAction
      Category = 'CRM'
      Caption = '&Acciones Comerciales'
      Hint = 'Mantenimiento de las acciones comerciales'
    end
    object AIsoCertificadoAnalisis: TAction
      Category = 'Produccion ISO'
      Caption = '&Certificado An'#225'lisis ISO'
      Hint = 'mantenimientos de certificados de an'#225'lisis.'
    end
    object AImportarArticulosExcel: TAction
      Category = 'Almacenes'
      Caption = '&Importar Art'#237'culos Excel'
      Hint = 'Importar art'#237'culos desde tablas excel.'
    end
    object APrevisionTesoreria: TAction
      Category = 'Tesoreria'
      Caption = 'P&revisi'#243'n Tesoreria'
      Hint = 'Ver y configurar previsi'#243'n tesoreria. (Cobros/Pagos)'
    end
    object ACrmImportarLocalidades: TAction
      Category = 'CRM'
      Caption = 'Importar Localidades'
      Hint = 'Asistente para importar localidades, poblaciones.'
    end
    object ATipoColorTallas: TAction
      Category = 'Tallas'
      Caption = '&Tipo Color'
      Hint = 'Mantenimiento de tipos de color.'
    end
    object AParametrizacionTallas: TAction
      Category = 'Tallas'
      Caption = '&Parametros C'#243'digos Modelos'
      Hint = 'Parametrizaci'#243'n de los c'#243'digos de los modelos.'
    end
    object AProOrdTareaMat: TAction
      Category = 'Produccion Avanzada'
      Caption = 'Tareas Realizadas'
      Hint = 'Tareas Realizadas'
    end
    object AADRNaturalezaPeligro: TAction
      Category = 'Auxiliares'
      Caption = 'N&aturalezas Peligro'
      Hint = 'Mantenimiento de la naturalezas del peligro.'
    end
    object AADRMedidasProteccion: TAction
      Category = 'Auxiliares'
      Caption = '&Medidas Protecci'#243'n'
      Hint = 'Mantenimiento de las medidas de protecci'#243'n.'
    end
    object ALstMatPeligrosas: TAction
      Category = 'Auxiliares'
      Caption = 'Listar &Materias Peligrosas'
      Hint = 'Listado de materias peligrosas.'
    end
    object AListadoCuota: TAction
      Category = 'Ventas'
      Caption = 'Listar &Cuotas Clientes'
      Hint = 'Listado de cuotas de clientes. (Venbtas).'
    end
    object AControlPlazas: TAction
      Category = 'Almacenes'
      Caption = 'Control Pla&zas'
      Hint = 'Control de Plazas'
    end
    object AConsultaITBIS: TAction
      Category = 'Latino'
      Caption = 'Consulta  ITBIS'
      Hint = 'Consulta de ITBIS.'
    end
    object AConciliacionBancaria: TAction
      Category = 'Tesoreria'
      Caption = '&Conciliacion Bancaria'
      Hint = 'Conciliacion y punteo cobros en banco.'
    end
    object AAbreINI: TAction
      Category = 'Utilidades'
      Caption = 'Abrir INI'
      Hint = 'Abre y edita el fichero INI.'
    end
    object ATraspasoMulticanales: TAction
      Category = 'Latino'
      Caption = 'Traspasar &Multicanales'
      Hint = 'Proceso traspaso multicanal.'
    end
    object ZAModelos: TAction
      Category = 'T y C Auxiliares'
      Caption = '&Modelos TYC'
      Hint = 'Modelos'
    end
    object ZALonas: TAction
      Category = 'T y C Auxiliares'
      Caption = 'Tipos Lona'
      Hint = 'Tipos de lona.'
    end
    object ZALonasForma: TAction
      Category = 'T y C Auxiliares'
      Caption = 'Formas &Lona'
      Hint = 'Formas de Lona'
    end
    object ZARibetes: TAction
      Category = 'T y C Auxiliares'
      Caption = '&Ribetes'
      Hint = 'Ribetes'
    end
    object ZABambalinas: TAction
      Category = 'T y C Auxiliares'
      Caption = '&Bambalinas'
      Hint = 'Bambalinas'
    end
    object ZAModelosDet: TAction
      Category = 'T y C'
      Caption = '&Desglose Modelos'
      Hint = 'Detalles o desglose de los modelos.'
    end
    object ZAColores: TAction
      Category = 'T y C Auxiliares'
      Caption = '&Colores Perfiles'
      Hint = 'Colores de los perfiles.'
    end
    object ZAModelosFechas: TAction
      Category = 'T y C'
      Caption = 'Fechas &Servir Modelos'
      Hint = 'Fechas a servir de modelos.'
    end
    object ZATarifasModelos: TAction
      Category = 'T y C'
      Caption = 'Tarifas &Modelos'
      Hint = 'Tarifas de precios para de modelos TyC.'
    end
    object ZAPedidosEsp: TAction
      Category = 'T y C'
      Caption = 'Pedidos &Especiales'
      Hint = 'Entrada de pedidos especiales.'
    end
    object ZAPedidosEspTodos: TAction
      Category = 'T y C'
      Caption = '&Ver Pedidos Especiales'
      Hint = 'Ver los pedidos especiales.'
    end
    object AEquivalenciaColores: TAction
      Category = 'T y C Auxiliares'
      Caption = '&Equivalencia Colores Perfiles'
      Hint = 'Equivalencia colores perfiles.'
    end
    object ZADatosAuxiliares: TAction
      Category = 'T y C Auxiliares'
      Caption = 'Datos Auxiliares'
      Hint = 'Datos auxiliares.'
    end
    object ZATiposConfig: TAction
      Category = 'T y C Auxiliares'
      Caption = 'Tipos Configuraci'#243'n'
      Hint = 'Tipos de configuraci'#243'n.'
    end
    object ZAVerEstadoPedCli: TAction
      Category = 'T y C'
      Caption = '&Estado Pedidos Cliente'
      Hint = 'Ver estado de los pedidos por cliente.'
    end
    object ZAVerEstadoOrdenesCli: TAction
      Category = 'T y C'
      Caption = 'Ver &Estado Ordenes Cliente'
      Hint = 'Ver estado de ordenes por cliente.'
    end
    object ZAMarcajeManual: TAction
      Category = 'T y C'
      Caption = 'Marcajes &Manuales'
      Hint = 'Ver los marcajes manuales.'
    end
    object ZAPuestos: TAction
      Category = 'T y C Auxiliares'
      Caption = 'Puestos Lectores'
      Hint = 'Puestos para los lectores de c'#243'digos de barras.'
    end
    object ZAMarcajes: TAction
      Category = 'T y C'
      Caption = '&Marcajes'
      Hint = 'Marcajes'
    end
    object ZAImprimePedEspPdte: TAction
      Category = 'T y C Listados'
      Caption = 'Listar &Pedidos Especiales Pendientes'
      Hint = 'Imprimir Pedidos Especiales Pendientes'
    end
    object ZALstPedEntrega: TAction
      Category = 'T y C Listados'
      Caption = 'Listar Pedidos &Entrega'
      Hint = 'Listado de pedidos por entrega.'
    end
    object ZAArticulos: TAction
      Category = 'T y C'
      Caption = 'Visualizar Articulos'
      Hint = 'Visualizar Art'#237'culos'
    end
    object ZAPedidosAAlbaran: TAction
      Category = 'T y C'
      Caption = 'Pedidos &Albar'#225'n'
      Hint = 'Pasar pedidos a albar'#225'n y generar etiquetas.'
    end
    object ZAPedidosMalCerrados: TAction
      Category = 'T y C'
      Caption = 'Pedidos &Mal Cerrados'
      Hint = 'Ver pedidos que tienen las ordenes mal cerradas.'
    end
    object ZALstPedVenLin: TAction
      Category = 'T y C Listados'
      Caption = 'Listar &Ventas Pedidos Lineal'
      Hint = 'Ventas de pedidos por lineal.'
    end
    object ZATiposArticulos: TAction
      Category = 'T y C'
      Caption = 'Tipos &Art'#237'culo'
      Hint = 'Tipos de art'#237'culo toldos y cortina.'
    end
    object ZALstTiempoMarc: TAction
      Category = 'T y C'
      Caption = '&Ver Tiempos Marcaje Manual'
      Hint = 'Listado tiempos de marcajes manuales.'
    end
    object ZAMarcManDirecto: TAction
      Category = 'T y C'
      Caption = 'Marcajes Manuales &Directos'
      Hint = 'Marcajes manuales directos.'
    end
    object ZALstFechaPrevProv: TAction
      Category = 'T y C Listados'
      Caption = 'Listar &Pedidos Proveedor Fecha Prevista'
      Hint = 'Listados de los pedidos proveedor por fecha prevista.'
    end
    object ZAConfiguracion: TAction
      Category = 'T y C'
      Caption = 'Configuraci'#243'n TyC'
      Hint = 'Configuraci'#243'n toldos y cortinas.'
    end
    object ZAConsultarTarifasModelos: TAction
      Category = 'T y C'
      Caption = 'Consultar &Tarifas Modelos'
      Hint = 'Consultar tarifas modelos.'
    end
    object APedidosVentaPendientesTyC: TAction
      Category = 'T y C Listados'
      Caption = 'Listar Pedidos Ventas &Pendientes (TyC)'
      Hint = 'Listado de los pedidos de ventas pendientes (TyC).'
    end
    object AListadoDeUnidadesPendientesDeServirTyC: TAction
      Category = 'T y C Listados'
      Caption = 'Listar Unidades &Pendientes Servir (TyC)'
      Hint = 'Listado de unidades pendientes de servir (TyC).'
    end
    object AListadoDeStockMnimoTyC: TAction
      Category = 'T y C Listados'
      Caption = 'Listar Stock M'#237'nimo (TyC)'
      Hint = 'Listado de stock bajo m'#237'nimo (TyC)'
    end
    object ADespiece: TAction
      Category = 'Produccion Despiece'
      Caption = '&Despiece'
      Hint = 'Mantenimiento de despieces.'
    end
    object AImprimeRecibos: TAction
      Category = 'Tesoreria'
      Caption = 'Listar &Recibos'
      Hint = 'Listado de recibos.'
    end
    object AOfertasANDALplast: TAction
      Category = 'ANDALplast'
      Caption = 'Ofertas Inyecci'#243'n Pl'#225'stico'
      Hint = 'mantenimiento de ofertas inyecci'#243'n de p'#225'stico.'
    end
    object AMoldes: TAction
      Category = 'ANDALplast'
      Caption = '&Moldes'
      Hint = 'mantenimiento de moldes.'
    end
    object APostizos: TAction
      Category = 'ANDALplast'
      Caption = '&Postizos'
      Hint = 'mantenimiento de postizos'
    end
    object ALstCosteVentasMP: TAction
      Category = 'ANDALplast'
      Caption = 'Listar Coste Mercanc'#237'a Vendida'
      Hint = 'Listado de costes de la mercancia vendida.'
    end
    object ALstArticulosCliente: TAction
      Category = 'ANDALplast'
      Caption = 'Listar Articulos Cliente'
      Hint = 'Listado de los art'#237'culos de clientes'
    end
    object AGestionDocumentosPago: TAction
      Category = 'Tesoreria'
      Caption = '&Gesti'#243'n Documentos Pago'
      Hint = 'Gestion de documentos de pago.'
    end
    object AEnviarDatosPonys: TAction
      Category = 'ECommerce'
      Caption = 'Enviar Datos Web'
      Hint = 'Enviar datos a web (Ponys)'
    end
    object AGaleriaImagen: TAction
      Category = 'Auxiliares'
      Caption = '&Galeria Imagenes'
      Hint = 'Mantenimiento galeria de imagenes'
    end
    object AMarca: TAction
      Category = 'Auxiliares'
      Caption = '&Marcas Modelos'
      Hint = 'Mantenimiento de marcas asociadas a los modelos.'
    end
    object AGestionTareasProduccion: TAction
      Category = 'Produccion Avanzada'
      Caption = 'Gestion Tareas Produccion'
      Hint = 'Gestion Tareas Produccion'
    end
    object AExportacionEuroPastry: TAction
      Category = 'ECommerce'
      Caption = '&Exportacion EuroPastry'
      Hint = 'Proceso de exportaci'#243'n de las ventas a EuroPastry.'
    end
    object ADividirFacturas: TAction
      Category = 'Ventas'
      Caption = '&Dividir Facturas'
      Hint = 'Divide facturas entre canales.'
    end
    object AMemoriaContable: TAction
      Category = 'Contabilidad'
      Caption = 'Listar Memoria Contable'
      Hint = 'Listado de la memoria contable'
    end
    object ASincronizaTiendaMasYMasBarato: TAction
      Category = 'ECommerce'
      Caption = '&Sincronizar Tienda Mas y Mas Barato'
      Hint = 'Sincroniza Tienda Mas y Mas Barato'
    end
    object AHojaDeTrabajo: TAction
      Category = 'Produccion Avanzada'
      Caption = 'Hojas de Trabajo'
      Hint = 'Hojas de Trabajo'
    end
    object AFichaTecnica: TAction
      Category = 'Reparaciones'
      Caption = '&Ficha T'#233'cnica'
      Hint = 'Ficha tecnica de vehiculos.'
    end
    object AMarcas: TAction
      Category = 'Auxiliares'
      Caption = '&Marcas'
      Hint = 'Mantenimiento de marcas para modelos y art'#237'culos.'
    end
    object AExtraccionDatos: TAction
      Category = 'Empresas'
      Caption = 'Extracci'#243'n &Datos'
      Hint = 
        'Extraccion de datos de la las tablas de la base de datos mediant' +
        'e sentencias SQL.'
    end
    object ANecesidadMateraPrima: TAction
      Category = 'Produccion Plan'
      Caption = '&Necesidades Materia Prima'
      Hint = 'Necesidades materiales y recursos seg'#250'n pedidos de clientes.'
    end
    object AParteMovimiento: TAction
      Category = 'Ventas'
      Caption = 'Ver Parte Movimientos'
      Hint = 'Parte de Movimiento'
    end
    object APedidosPendientesProv2: TAction
      Category = 'Compras'
      Caption = 'Relaci'#243'n Pedidos Compra'
      Hint = 'Ver los pedidos pendientes de proveedor y reclamar.'
    end
    object ARecibosdeIngresosDesglosados: TAction
      Category = 'Latino'
      Caption = 'Recibos Ingresos &Desglosados'
      Hint = 'Recibos de ingresos desglosados.'
    end
    object ATipoModelo: TAction
      Category = 'T y C Auxiliares'
      Caption = 'Tipos Modelo TYC'
      Hint = 'Tipos de Modelo'
    end
    object ARepartirHorasProyecto: TAction
      Category = 'Ventas'
      Caption = 'Repartir Horas Proyecto'
      Hint = 'Repartir Horas Proyecto'
    end
    object AKitTallas: TAction
      Category = 'Tallas'
      Caption = '&Kits Tallas'
      Hint = 'Mantenimiento de los kit de las tallas y colores.'
    end
    object ASII: TAction
      Category = 'Impuestos'
      Caption = 'Suministro Inmediato &Informacion'
      Hint = 'Suministro Inmediato de Informacion.'
    end
    object ATipoIncidenciaMaq: TAction
      Category = 'Auxiliares'
      Caption = 'Tipo &Incidencia M'#225'quinas'
      Hint = 'T'#237'pos de incidencia m'#225'quinas. (Producci'#243'n).'
    end
    object ALSTIngresos: TAction
      Category = 'Tesoreria'
      Caption = 'Listar Ingresos'
      Hint = 'Listado de ingresos desglosados.'
    end
    object AImprimeCartaPortes: TAction
      Category = 'Ventas'
      Caption = 'Generar/Imprimir Carta Portes'
      Hint = 'Generar e imprimir la carta de portes.'
    end
    object AAlquileres: TAction
      Category = 'Ventas'
      Caption = 'Alquileres'
      Hint = 'Alquileres'
    end
    object AMuestraMenu: TAction
      Category = 'Basico'
      Caption = 'Oculta &Men'#250
      Hint = 'Muestra u oculta men'#250
    end
    object APeriodoFacturacion: TAction
      Category = 'Auxiliares'
      Caption = 'Periodo Fa&cturacion'
      Hint = 'Mantenimiento de periodos de facturacion'
    end
    object ASincronizacionTiendaPureWorks: TAction
      Category = 'ECommerce'
      Caption = 'Sincronizacion Tienda PureWorks'
      Hint = 'Sincronizacion Tienda PureWorks'
    end
    object AImportesMaximoPeriodo: TAction
      Category = 'Empresas'
      Caption = 'Importe Maximo Periodo'
      Hint = 'Importe Maximo Periodo'
    end
    object ATipoIncidenciaRep: TAction
      Category = 'Auxiliares'
      Caption = 'Tipo Incidencia &Reparacion'
      Hint = 'T'#237'pos de incidencia reparacion. (Producci'#243'n).'
    end
    object ARutasAgente: TAction
      Category = 'CRM'
      Caption = 'Rutas de Agente'
      Hint = 'Mantenimiento de rutas de agentes'
    end
    object ASesionCajaTurno: TAction
      Category = 'TPV'
      Caption = 'Sesi'#243'n-Caja-Turno'
      Hint = 'Mantenimiento de Sesion-Caja-Turno'
    end
    object AConfiguracionTPV: TAction
      Category = 'TPV'
      Caption = 'Configuraci'#243'n TPV'
      Hint = 'Parametros de configuracion de TPV'
    end
    object ARegistroFitosanitario: TAction
      Category = 'Terceros'
      Caption = 'Registro Fitosanitario'
      Hint = 'Mantenimiento de registro fitosanitario'
    end
    object APorcentajeFacturacion: TAction
      Category = 'TPV'
      Caption = '% Facturaci'#243'n'
      Hint = '% Facturacion'
    end
    object AOpeEstadoMarcajePedido: TAction
      Category = 'Operarios'
      Caption = '&Estado Marcaje Pedido'
      Hint = 'Estado Marcaje Pedido'
    end
    object ANumerosDeAutorizacion: TAction
      Category = 'Latino'
      Caption = 'Numeros de autorizaci'#243'n'
    end
    object AADRUNNumbers: TAction
      Category = 'Auxiliares'
      Caption = '&N'#250'meros UN'
      Hint = 'Numeros UN'
    end
    object AADRClases: TAction
      Category = 'Auxiliares'
      Caption = '&Clases ADR'
      Hint = 'Clases'
    end
    object AADRPackingGroups: TAction
      Category = 'Auxiliares'
      Caption = 'Grupos de &Embalaje'
      Hint = 'Grupos de Embalaje'
    end
    object AADRTunelCodes: TAction
      Category = 'Auxiliares'
      Caption = 'C'#243'digos de &T'#250'nel'
      Hint = 'C'#243'digos de T'#250'nel'
    end
    object AADRTipos: TAction
      Category = 'Auxiliares'
      Caption = 'T&ipos ADR'
      Hint = 'Tipos ADR'
    end
    object ATPVSincronizacion: TAction
      Category = 'TPV'
      Caption = 'Sincronizaci'#243'n'
      Hint = 'Sincronizaci'#243'n'
    end
    object ATPVConfigSincronizacion: TAction
      Category = 'TPV'
      Caption = 'Configuraci'#243'n sincronizaci'#243'n'
      Hint = 'Configuraci'#243'n sincronizaci'#243'n tpv'
    end
    object APedidosPendientesCli: TAction
      Category = 'Ventas'
      Caption = 'Relaci'#243'n Pedidos Venta'
      Hint = 'Relacion de Pedidos de Venta'
    end
    object AListarEtiquetas: TAction
      Category = 'Almacenes'
      Caption = 'Listar Etiquetas'
      Hint = 'Listar etiquetas de c'#243'digos de barras'
    end
    object ACuotasClientes: TAction
      Category = 'Ventas'
      Caption = 'Contratos Mantenimientos / Cuotas'
      Hint = 'Mantenimiento de Cuotas a Clientes, Mantinimientos y Contratos'
    end
    object AExportacionHelios: TAction
      Category = 'ECommerce'
      Caption = 'Exportacion Helios'
      Hint = 'Exportacion de stocks para Helios'
    end
    object AImportacionVending: TAction
      Category = 'ECommerce'
      Caption = 'Importacion Vending'
      Hint = 'Importacion de Maquinas Vending'
    end
    object AMaquinasVending: TAction
      Category = 'ECommerce'
      Caption = 'Maquinas &Vending'
      Hint = 'Mantenimiento de Maquinas Vending'
    end
    object AUbicacionesSimple: TAction
      Category = 'Auxiliares'
      Caption = 'Ubicaciones Simple'
      Hint = 'Ubicaciones Simple'
    end
    object ALstCalendarioLaboral: TAction
      Category = 'Control Presencia'
      Caption = 'Listar &Calendario Laboral'
      Hint = 'Listado del calendario laboral de empleados entre fechas'
    end
    object AAuditoria: TAction
      Category = 'Utilidades'
      Caption = '&Auditor'#237'a'
      Hint = 'Auditoria de datos'
    end
    object ACategoriaCliente: TAction
      Category = 'Terceros'
      Caption = '&Categorias de Cliente'
      Hint = 'Mantenimiento de Categorias de Cliente'
    end
    object AAsistenteImpClientes: TAction
      Category = 'Empresas'
      Caption = 'Asistente Importacion de Clientes'
      Hint = 'Asistente Importacion de Clientes'
    end
    object AAsistenteImpProveedores: TAction
      Category = 'Empresas'
      Caption = 'Asistente Importacion de Proveedores'
      Hint = 'Asistente Importacion de Proveedores'
    end
    object AAsistenteImpAcreedores: TAction
      Category = 'Empresas'
      Caption = 'Asistente Importacion de Acreedores'
      Hint = 'Asistente Importacion de Acreedores'
    end
    object AAsistenteImpArticulos: TAction
      Category = 'Empresas'
      Caption = 'Asistente Importacion de Articulos'
      Hint = 'Asistente Importacion de Articulos'
    end
    object ARefrescarImpresoras: TAction
      Category = 'Basico'
      Caption = 'Refrescar Lista'
      Hint = 'Refrescar Lista de Impresoras'
    end
    object APruebas: TAction
      Category = 'Utilidades'
      Caption = 'Pruebas'
      Hint = 'Fomrulario para pruebas de desarrollos'
    end
    object AExportacionTyrsa: TAction
      Category = 'ECommerce'
      Caption = 'Exportacion Tablas Tyrsa'
      Hint = 'Exportacion Tablas Tyrsa'
    end
    object AImportaListados: TAction
      Category = 'Listados Presonalizado'
      Caption = 'Importar Listado'
      Hint = 'Importar Listado'
    end
    object ANuevoGrupoListados: TAction
      Category = 'Listados Presonalizado'
      Caption = 'Crear nuevo grupo'
      Hint = 'Crear nuevo grupo'
    end
    object ARecalculaContabilidad: TAction
      Category = 'Contabilidad'
      Caption = 'Recalcula Contabilidad'
      Hint = 
        'Recalcula los saldos contables del ejercicio actual de toda la C' +
        'ontabilidad'
    end
    object AFiltroAlbaranesCompra: TAction
      Category = 'Compras'
      Caption = 'Filtro Albaranes de Compra'
      Hint = 'Filtro Albaranes de Compra'
    end
    object ARegiones: TAction
      Category = 'Auxiliares'
      Caption = '&Regiones'
      Hint = 'Mantenimiento de Regiones'
    end
    object APoblaciones: TAction
      Category = 'Auxiliares'
      Caption = '&Poblaciones'
      Hint = 'Mantenimiento de poblaciones'
    end
    object AImportacionDlivery: TAction
      Category = 'ECommerce'
      Caption = 'Importacion Dlivery'
      Hint = 'Importacion de datos de Dlivery'
    end
    object AImportacionMulty: TAction
      Category = 'ECommerce'
      Caption = 'Importacion Multy'
      Hint = 'Importacion Multy'
    end
    object ACrmAsuntos: TAction
      Category = 'CRM'
      Caption = 'Asuntos'
      Hint = 'Mantenimiento de Asuntos CRM'
    end
    object AAtributos: TAction
      Category = 'Almacenes'
      Caption = 'Mantenimiento de Atributos'
      Hint = 'Mantenimiento de Atributos para combinaciones'
    end
    object ASincronizacionEginer: TAction
      Category = 'ECommerce'
      Caption = 'Sincronizacion Eginer'
      Hint = 'Sincronizacion Eginer'
    end
    object ASIILROE: TAction
      Category = 'Impuestos'
      Caption = 'LROE - Libro Registro Operaciones Economicas'
      Hint = 'LROE - Libro Registro Operaciones Economicas'
    end
    object AVerifactu: TAction
      Category = 'Impuestos'
      Caption = 'Verifactu'
      Hint = 'Verifactu'
    end
    object ATipoImpuestoAdicional: TAction
      Category = 'Impuestos'
      Caption = 'Tipo Impuesto Adicional'
      Hint = 'Mantenimiento de Tipos de Impuesto Adicional'
    end
    object ASIICertificadoDigital: TAction
      Category = 'ImpuestosChile'
      Caption = 'Certificado digital'
      Hint = 'Certificado digital para SII'
    end
    object ASIIFolios: TAction
      Category = 'ImpuestosChile'
      Caption = 'Folios'
      Hint = 'Folios para SII'
    end
    object ASIIUrlEndpoint: TAction
      Category = 'Impuestos'
      Caption = 'Url Endpoint'
      Hint = 'Url de enlace con SII'
    end
    object AArtModGenero: TAction
      Category = 'Tallas'
      Caption = 'G&enero'
      Hint = 'Mantenimiento de generos.'
    end
    object AArtModTemporada: TAction
      Category = 'Tallas'
      Caption = 'Temp&orada'
      Hint = 'Mantenimiento de temporadas.'
    end
    object AAsistenteImpModelos: TAction
      Category = 'Empresas'
      Caption = 'Asistente Importacion de Modelos'
      Hint = 'Asistente Importacion de Modelos'
    end
    object AListarCuadreCaja: TAction
      Category = 'Tesoreria'
      Caption = 'Listar c&uadre caja'
      Hint = 'Listar cuadre caja'
    end
    object ATiposBulto: TAction
      Category = 'Auxiliares'
      Caption = 'Tipos Bulto'
      Hint = 'Mantenimiento de tipos de bulto.'
    end
    object AReestablecerConexionesWEB: TAction
      Category = 'Utilidades'
      Caption = 'Reestablecer Conexiones WEB'
      Hint = 'Reestablecer Conexiones WEB'
    end
    object ATipoReparacion: TAction
      Category = 'Reparaciones'
      Caption = 'Tipo Reparacion'
      Hint = 'Mantenimiento de tipos de reparacion'
    end
    object ATipoActuacion: TAction
      Category = 'Reparaciones'
      Caption = 'Tipo Actuacion'
      Hint = 'Mantenimineto de tipos de actuacion'
    end
    object AServirPedidosVenta: TAction
      Category = 'Ventas'
      Caption = 'Servir Pedidos'
      Hint = 
        'Servir pedidos de clientes. (Ventas). Generaci'#243'n de albaranes o ' +
        'facturas.'
    end
    object AEnvioDTE: TAction
      Category = 'ImpuestosChile'
      Caption = 'DTE &Ventas'
      Hint = 'Envio de factura electronica'
    end
    object APrevisionDeCuentas: TAction
      Category = 'Contabilidad'
      Caption = 'Prevision de cuentas'
      Hint = 'Prevision de cuentas'
    end
    object ADatosTecnicos: TAction
      Category = 'Produccion Avanzada'
      Caption = 'Datos Tecnicos'
      Hint = 'Datos Tecnicos'
    end
    object ARefrescarBandejas: TAction
      Category = 'Basico'
      Caption = 'Refrescar Lista'
      Hint = 'Refrescar Lista de Bandejas de la Impresoras'
    end
    object ACilindros: TAction
      Category = 'Etiquetas'
      Caption = 'Cilindros'
      Hint = 'Mantenimiento de Cilindros de Etiquetas'
    end
    object AEstadisitcasComparadas: TAction
      Category = 'Estadisticas'
      Caption = 'Estadisitcas Comparadas'
      Hint = 'Estadisitcas Comparadas'
    end
    object AEstadisticaTubosParis: TAction
      Category = 'Estadisticas'
      Caption = 'Estadisticas Tubos Paris'
      Hint = 'Estadisticas Tubos Paris'
    end
    object ANominas: TAction
      Category = 'Operarios'
      Caption = 'N'#243'minas'
      Hint = 'Mantenimiento de las n'#243'minas de los empleados.'
    end
    object ANominasConceptos: TAction
      Category = 'Operarios'
      Caption = 'Conceptos N'#243'minas'
      Hint = 'Mantenimiento de los Conceptos de n'#243'minas'
    end
    object ARHPersona: TAction
      Category = 'Operarios'
      Caption = 'Personas'
      Hint = 'Mantenimiento de  Personas'
    end
    object AEtiColor: TAction
      Category = 'Etiquetas'
      Caption = 'Etiquetas Color'
      Hint = 'Mantenimiento de Color de Etiquetas'
    end
    object AEtiAnilox: TAction
      Category = 'Etiquetas'
      Caption = 'Etiquetas Anilox'
      Hint = 'Mantenimiento de Anilox de Etiquetas'
    end
    object AAgrupacionOfertas: TAction
      Category = 'Ventas'
      Caption = 'Servir Ofertas por L'#237'neas'
      Hint = 'Servir Ofertas por L'#237'neas'
    end
    object ARCVCompra: TAction
      Category = 'ImpuestosChile'
      Caption = 'DTE &Compras'
      Hint = 'RCV Compra'
    end
    object AAsistenteImpStockMinMax: TAction
      Category = 'Empresas'
      Caption = 'Asistente Importacion Stock Min./Max.'
      Hint = 'Asistente Importacion de Stock Min./Max.'
    end
    object AEmpresasChile: TAction
      Category = 'Terceros'
      Caption = 'Empresas de Chile'
      Hint = 'Empresas de Chile'
    end
    object AIncidenciasMarcajes: TAction
      Category = 'Produccion Avanzada'
      Caption = 'Incidencias Marcajes'
      Hint = 'Incidencias Marcajes'
    end
    object ASIIConfCorreos: TAction
      Category = 'ImpuestosChile'
      Caption = 'Conf. Correos'
      Hint = 'Configuracion de correo de envio y rececpcion SII'
    end
    object AProTareasExternas: TAction
      Category = 'Produccion Avanzada'
      Caption = 'Tareas Externas'
      Hint = 'Tareas Externas'
    end
    object AGenerarFacturasElectronicasES: TAction
      Category = 'Ventas'
      Caption = 'Generar Facturas Electronicas'
      Hint = 'Generacion Masiva de Facturas Electronicas'
    end
    object ASIITipoDTE: TAction
      Category = 'ImpuestosChile'
      Caption = 'SII Tipo DTE'
      Hint = 'Configuracion de Tipos de DTE'
    end
    object AEscandalloGarantias: TAction
      Category = 'Produccion Avanzada'
      Caption = 'Escandallo Garantias'
      Hint = 'Mantenimiento de Escandallo de Garantias'
    end
    object AAsignacionGarantias: TAction
      Category = 'Produccion Avanzada'
      Caption = 'Asignacion de Garantias'
      Hint = 'Asignacion de Garantias'
    end
    object ANominasConceptosCHL: TAction
      Category = 'Operarios'
      Caption = 'Conceptos N'#243'minas'
      Hint = 'Mantenimiento de los Conceptos de n'#243'minas (Chile)'
    end
    object ANominasPlantilla: TAction
      Category = 'Operarios'
      Caption = 'Plantillas N'#243'minas'
      Hint = 'Plantillas para exportar Nominas'
    end
    object AJornada: TAction
      Category = 'Operarios'
      Caption = 'Jornadas, Horas, '#193'reas, C Costos'
      Hint = 'Mantenimiento Jornadas, Horas, Centros de Costos'
    end
    object ARecepcionFichaTecnica: TAction
      Category = 'Reparaciones'
      Caption = 'Recepciones'
      Hint = 'Recepcion de elemento a reparar'
    end
    object AMotivosAbono: TAction
      Category = 'Auxiliares'
      Caption = 'Motivos Abono'
      Hint = 'Mantenimiento de Motivos de Abono'
    end
    object AModelo592: TAction
      Category = 'Impuestos'
      Caption = 'Modelo 592 - Impuesto envases de plastino no reutilizables'
      Hint = 'Modelo 592 - Impuesto envases de plastino no reutilizables'
    end
    object APrecioReposicion: TAction
      Category = 'Almacenes'
      Caption = 'Precio Reposicion'
      Hint = 'Mantenimiento de Precio de Reposicion'
    end
    object AGamasPrecioReposicion: TAction
      Category = 'Almacenes'
      Caption = 'Gamas Precio de Reposicion'
      Hint = 'Mantenimiento de Gamas Precio de Reposicion'
    end
    object ADashboard: TAction
      Category = 'Empresas'
      Caption = 'Dashboard'
      Hint = 'Panel de moniturizacion de empresa'
    end
    object ABrevo: TAction
      Category = 'ECommerce'
      Caption = 'Brevo'
      Hint = 'Mantenimiento de Contactos y Listas Brevo'
    end
    object AAdjuntos: TAction
      Category = 'Utilidades'
      Caption = 'Adjuntos'
      Hint = 'Archivos Adjuntos'
    end
    object AImportarEscProduccion: TAction
      Category = 'Produccion Avanzada'
      Caption = 'Importar Esc. Produccion'
      Hint = 'Importar Esc. Produccion'
    end
    object AComoNosConocieron: TAction
      Category = 'Auxiliares'
      Caption = 'Como &Nos Conocieron'
      Hint = 'Mantenimientos de Como Nos Conocieron'
    end
    object AImportacionTarifasTyC: TAction
      Category = 'T y C'
      Caption = 'Importacion Tarifas T. y C.'
      Hint = 'Importacion de TarifasToldos y Cortinas'
    end
    object ASincronizacionSkrit: TAction
      Category = 'ECommerce'
      Caption = 'Sincronizacion Skrit'
      Hint = 'Sincronizacion de Albaranes de compra SKIRT'
    end
    object ASincronizacionColon: TAction
      Category = 'ECommerce'
      Caption = 'Sincronizacion Colon'
      Hint = 'Sincronizacion de Albaranes de compra Colon'
    end
    object AECFVentas: TAction
      Category = 'Impuestos'
      Caption = 'ECF Ventas'
      Hint = 'ECF Ventas'
    end
    object ADGIIConfiguracionEnvio: TAction
      Category = 'Impuestos'
      Caption = 'Configuraci'#243'n env'#237'o'
    end
    object APresentacionesHacienda: TAction
      Category = 'Impuestos'
      Caption = 'Presentaciones'
      Hint = 'Presentaciones a Hacienda'
    end
    object AEstadisticasSimples: TAction
      Category = 'Estadisticas'
      Caption = 'Estadisticas Simples'
      Hint = 'Estadisticas Simples'
    end
    object ADiarioReparaciones: TAction
      Category = 'Reparaciones'
      Caption = 'Diario de Reparaciones'
      Hint = 'Diario de Reparaciones'
    end
    object ASincronizacionTyC: TAction
      Category = 'ECommerce'
      Caption = 'Sincronizacion Toldos y Cortinas'
      Hint = 'Sincronizacion Toldos y Cortinas'
    end
    object AECFCompras: TAction
      Category = 'Impuestos'
      Caption = 'ECF Compras'
      Hint = 'ECF Compras'
    end
    object ASMSPubli: TAction
      Category = 'Utilidades'
      Caption = 'Configuracion SMS Publi'
      Hint = 'Configuracion SMS Publi'
    end
    object ADivilo: TAction
      Category = 'Tesoreria'
      Caption = 'Divilo'
      Hint = 'Mantenimiento y punteo de cobros Divilo'
    end
    object APresenciaFichar: TAction
      Category = 'Control Presencia'
      Caption = 'Fichar Presencia'
      Hint = 'Fichar registro de Presencia'
    end
    object AConfigServidoresCorreo: TAction
      Category = 'Utilidades'
      Caption = 'Configuracion de servidores de correo'
    end
    object ASincronizacionHubSpot: TAction
      Category = 'ECommerce'
      Caption = 'Sincronizacion HubSpot'
      Hint = 'Sincronizacion HubSpot'
    end
    object AAgenda: TAction
      Category = 'Utilidades'
      Caption = 'Acceso a la agenda'
      Hint = 'Acceso a la agenda'
    end
    object ACaracteristicasArticulo: TAction
      Category = 'Auxiliares'
      Caption = 'Caracteristicas Articulo'
    end
    object AEstadisticasKombat: TAction
      Category = 'Estadisticas'
      Caption = 'Estadisticas Kombat'
      Hint = 'Estadisticas Kombat'
    end
  end
  object Imagenes: TImageList
    Height = 32
    Width = 32
    Left = 256
    Top = 64
    Bitmap = {
      494C01010C001800040020002000FFFFFFFFFF10FFFFFFFFFFFFFFFF424D3600
      0000000000003600000028000000800000008000000001002000000000000000
      0100000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000FF38FF38FF9EFF9EFF9DFF9DFF38FF38000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000FF2BFF2BFFFAFFFAFFB3FFB3FFB4FFB4FFFAFFFAFF2BFF2B0000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000FF7FFF7FFFCEFFCE0000000000000000FFCEFFCEFF7FFF7F0000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000FF6FFF6FFFE3FFE3FF0FFF0FFF0FFF0FFFE4FFE4FF6FFF6F0000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFF000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000FF0FFF0FFFD8FFD8FFF6FFF6FFF6FFF6FFD8FFD8FF0FFF0F0000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFF000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000FF07FF07FFB6FFB6FFB6FFB6FF07FF07000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFF000000000000000000000000000000000000000000000000000000000000
      0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFF000000000000000000000000000000000000000000000000FF23FF23FFB8
      FFB8FFE7FFE7FFB3FFB3FF1FFF1F000000000000000000000000000000000000
      0000000000000000000000000000FFA3FFA3FFA3FFA300000000000000000000
      00000000000000000000000000000000000000000000FF1FFF1FFFB4FFB4FFE7
      FFE7FFB8FFB8FF23FF2300000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFF000000000000000000000000000000000000000000000000000000000000
      0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFF000000000000000000000000000000000000000000000000FFCBFFCBFFBF
      FFBFFF5EFF5EFFC5FFC5FFC1FFC1000000000000000000000000000000000000
      0000000000000000000000000000FFA3FFA3FFA3FFA300000000000000000000
      00000000000000000000000000000000000000000000FFC1FFC1FFC5FFC5FF5E
      FF5EFFBFFFBFFFCBFFCB00000000000000000000000000000000000000000000
      00000000000000000000FF49FF49FFE2FFE2FFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFE2FFE2FF48FF48000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFF0000000000000000FFFFFFFFFFFFFFFFFFFFFFFF000000000000
      00000000000000000000000000000000000000000000FFFFFFFFFFFFFFFFFFFF
      FFFF000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FF09FF09FFFFFFFFFF3F
      FF3F00000000FF49FF49FFFCFFFCFF03FF030000000000000000000000000000
      0000000000000000000000000000FFA3FFA3FFA3FFA300000000000000000000
      000000000000000000000000000000000000FF03FF03FFFCFFFCFF49FF490000
      0000FF3FFF3FFFFFFFFFFF09FF09000000000000000000000000000000000000
      00000000000000000000FFE3FFE3FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFE2FFE2000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFF0000000000000000FFFFFFFFFFFFFFFFFFFFFFFF000000000000
      00000000000000000000000000000000000000000000FFFFFFFFFFFFFFFFFFFF
      FFFF000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000FFE0FFE0FF9B
      FF9BFF2AFF2AFFA3FFA3FFFDFFFDFF74FF74FF07FF0700000000000000000000
      0000000000000000000000000000FFA3FFA3FFA3FFA300000000000000000000
      0000000000000000000000000000FF07FF07FF74FF74FFFDFFFDFFA3FFA3FF2A
      FF2AFF9BFF9BFFE0FFE000000000000000000000000000000000000000000000
      00000000000000000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFF000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000FF41FF41FFEA
      FFEAFFFFFFFFFFE5FFE5FF89FF89FFEFFFEFFFDEFFDEFF58FF58FF01FF010000
      0000000000000000000000000000FFA3FFA3FFA3FFA300000000000000000000
      000000000000FF01FF01FF57FF57FFDEFFDEFFEFFFEFFF89FF89FFE6FFE6FFFF
      FFFFFFE9FFE9FF41FF4100000000000000000000000000000000000000000000
      00000000000000000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFF000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000FF03
      FF03FF1BFF1BFF02FF0200000000FF13FF13FF90FF90FFF9FFF9FFC8FFC8FF3C
      FF3C000000000000000000000000FFA3FFA3FFA3FFA300000000000000000000
      0000FF3BFF3BFFC8FFC8FFFAFFFAFF91FF91FF13FF1300000000FF02FF02FF1B
      FF1BFF03FF030000000000000000000000000000000000000000000000000000
      00000000000000000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFF000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FF25FF25FFACFFACFFFE
      FFFEFFADFFADFF25FF25FF1AFF1AFFC4FFC4FFC4FFC4FF1AFF1AFF24FF24FFAC
      FFACFFFEFFFEFFADFFADFF25FF25000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFF000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000FF3C
      FF3CFFC8FFC8FFF9FFF9FFF0FFF0FFD8FFD8FFD8FFD8FFF0FFF0FFF9FFF9FFC8
      FFC8FF3CFF3C0000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFF000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FFFFFFFFFFFFFFFFFFFF
      FFFF000000000000000000000000000000000000000000000000000000000000
      0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFF000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000FF01FF01FF99FF99FFD9FFD9FF03FF03FF03FF03FFD9FFD9FF9AFF9AFF01
      FF01000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000FFFFFFFFFFFFFFFFFFFFFFFF000000000000000000000000000000000000
      0000FFFFFFFFFFFFFFFFFFFFFFFF000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FFFFFFFFFFFFFFFFFFFF
      FFFF000000000000000000000000000000000000000000000000000000000000
      0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFF000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000FF01FF01FF9BFF9BFFD8FFD8FF03FF03FF03FF03FFD9FFD9FF9CFF9CFF01
      FF01000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000FFFFFFFFFFFFFFFFFFFFFFFF000000000000000000000000000000000000
      0000FFFFFFFFFFFFFFFFFFFFFFFF000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FFFFFFFFFFFFFFFFFFFF
      FFFF000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000FF3C
      FF3CFFC8FFC8FFFAFFFAFFF0FFF0FFD7FFD7FFD8FFD8FFF1FFF1FFF9FFF9FFC8
      FFC8FF3CFF3C0000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFF000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FFFFFFFFFFFFFFFFFFFF
      FFFF000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FF25FF25FFADFFADFFFE
      FFFEFFADFFADFF25FF25FF1AFF1AFFC5FFC5FFC5FFC5FF1AFF1AFF24FF24FFAC
      FFACFFFEFFFEFFACFFACFF25FF25000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFF000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000FF02
      FF02FF1BFF1BFF02FF0200000000FF13FF13FF90FF90FFF9FFF9FFC8FFC8FF3C
      FF3C000000000000000000000000FFA3FFA3FFA3FFA300000000000000000000
      0000FF3BFF3BFFC8FFC8FFF9FFF9FF90FF90FF13FF1300000000FF02FF02FF1B
      FF1BFF02FF020000000000000000000000000000000000000000000000000000
      00000000000000000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFF000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000FF41FF41FFE8
      FFE8FFFFFFFFFFE5FFE5FF89FF89FFEFFFEFFFDEFFDEFF58FF58FF01FF010000
      0000000000000000000000000000FFA3FFA3FFA3FFA300000000000000000000
      000000000000FF01FF01FF57FF57FFDEFFDEFFEFFFEFFF89FF89FFE6FFE6FFFF
      FFFFFFE8FFE8FF41FF4100000000000000000000000000000000000000000000
      00000000000000000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFE2FFE2000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFF000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000FFE0FFE0FF9B
      FF9BFF2BFF2BFFA4FFA4FFFDFFFDFF74FF74FF07FF0700000000000000000000
      0000000000000000000000000000FFA3FFA3FFA3FFA300000000000000000000
      0000000000000000000000000000FF07FF07FF74FF74FFFDFFFDFFA3FFA3FF2B
      FF2BFF9CFF9CFFE0FFE000000000000000000000000000000000000000000000
      00000000000000000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFE3FFE3FF49FF49000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFF000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FFFFFFFFFFFFFFFFFFFF
      FFFF000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FF09FF09FFFFFFFFFF3E
      FF3E00000000FF49FF49FFFCFFFCFF03FF030000000000000000000000000000
      0000000000000000000000000000FFA3FFA3FFA3FFA300000000000000000000
      000000000000000000000000000000000000FF03FF03FFFCFFFCFF48FF480000
      0000FF3FFF3FFFFFFFFFFF09FF09000000000000000000000000000000000000
      00000000000000000000FFE3FFE3FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF80FF800000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000FFFFFFFFFFFFFFFFFFFFFFFF000000000000000000000000000000000000
      0000FFFFFFFFFFFFFFFFFFFFFFFF000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FFFFFFFFFFFFFFFFFFFF
      FFFF000000000000000000000000000000000000000000000000000000000000
      0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFF000000000000000000000000000000000000000000000000FFCBFFCBFFBE
      FFBEFF5DFF5DFFC5FFC5FFC1FFC1000000000000000000000000000000000000
      0000000000000000000000000000FFA3FFA3FFA3FFA300000000000000000000
      00000000000000000000000000000000000000000000FFC1FFC1FFC4FFC4FF5D
      FF5DFFBFFFBFFFCBFFCB00000000000000000000000000000000000000000000
      00000000000000000000FF4AFF4AFFE3FFE3FFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFEEFFEEFF71FF71000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000FFFFFFFFFFFFFFFFFFFFFFFF000000000000000000000000000000000000
      0000FFFFFFFFFFFFFFFFFFFFFFFF000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FFFFFFFFFFFFFFFFFFFF
      FFFF000000000000000000000000000000000000000000000000000000000000
      0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFF000000000000000000000000000000000000000000000000FF24FF24FFB9
      FFB9FFE7FFE7FFB5FFB5FF1FFF1F000000000000000000000000000000000000
      0000000000000000000000000000FFA3FFA3FFA3FFA300000000000000000000
      00000000000000000000000000000000000000000000FF1FFF1FFFB5FFB5FFE7
      FFE7FFB9FFB9FF23FF2300000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFF000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FFFFFFFFFFFFFFFFFFFF
      FFFF000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000FF07FF07FFB6FFB6FFB6FFB6FF07FF07000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFF000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000FF0FFF0FFFD8FFD8FFF7FFF7FFF6FFF6FFD8FFD8FF0FFF0F0000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFF000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000FF6FFF6FFFE3FFE3FF10FF10FF10FF10FFE4FFE4FF6FFF6F0000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFF000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000FF7FFF7FFFCDFFCD0000000000000000FFCEFFCEFF7FFF7F0000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000FF2BFF2BFFFAFFFAFFB2FFB2FFB3FFB3FFFAFFFAFF2BFF2B0000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000FF39FF39FF9EFF9EFF9EFF9EFF39FF39000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000FF5F
      FF5FFF77FF77FF77FF77FF77FF77FF77FF77FF77FF77FF77FF77FF77FF77FF77
      FF77FF77FF77FF77FF77FF77FF77FF77FF77FF77FF77FF77FF77FF77FF77FF77
      FF77FF77FF77FF77FF77FF77FF77FF77FF77FF77FF77FF77FF77FF77FF77FF77
      FF77FF5FFF5F0000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000FFC3
      FFC3FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFC3FFC30000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000FFA6
      FFA6FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFA4FFA40000000000000000000000000000000000000000000000000000
      000000000000FFC3FFC3FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFC2FFC20000
      000000000000FFC3FFC3FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFC2FFC20000
      000000000000FFC3FFC3FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFC2FFC20000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000FF5A
      FF5AFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFF58FF580000000000000000000000000000000000000000000000000000
      000000000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000
      000000000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000
      000000000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000FF06
      FF06FFD2FFD2FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFD1
      FFD1FF06FF060000000000000000000000000000000000000000000000000000
      000000000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000
      000000000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000
      000000000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FFEEFFEEFFFFFFFFFFFF
      FFFFFFFFFFFFFF0BFF0B00000000FFECFFECFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFECFFEC00000000FF0CFF0CFFFF
      FFFFFFFFFFFFFFFFFFFFFFEEFFEE000000000000000000000000000000000000
      0000FF27FF27FFE6FFE6FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFE5FFE5FF26
      FF26000000000000000000000000000000000000000000000000000000000000
      000000000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000
      000000000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000
      000000000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000FF07FF07FF07FF0700000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FFC6FFC6FFFFFFFFFFFF
      FFFFFFFFFFFFFF28FF2800000000FFC2FFC2FFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFC1FFC100000000FF2AFF2AFFFF
      FFFFFFFFFFFFFFFFFFFFFFC5FFC5000000000000000000000000000000000000
      000000000000FF1EFF1EFFC3FFC3FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFC1FFC1FF1EFF1E0000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000
      000000000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000
      000000000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000FF07FF07FF48
      FF48FF96FF96FFCFFFCFFFF7FFF7FFFFFFFFFFFFFFFFFFF7FFF7FFCFFFCFFF96
      FF96FF47FF47FF07FF0700000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FF58FF58FFFFFFFFFFFF
      FFFFFFFFFFFFFF6FFF6F00000000FF54FF54FFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF53FF5300000000FF71FF71FFFF
      FFFFFFFFFFFFFFFFFFFFFF57FF57000000000000000000000000000000000000
      00000000000000000000FF01FF01FF59FF59FFD0FFD0FFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFD0FFD0FF58FF58FF01FF01000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000FFC5FFC5FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFB5FFB50000
      000000000000FFC5FFC5FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFC3FFC30000
      000000000000FFC5FFC5FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFC3FFC30000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FF1BFF1BFF8FFF8FFFF2FFF2FFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFF1FFF1FF8EFF8EFF1AFF1A0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000FF7EFF7EFFFC
      FFFCFFFFFFFFFFDDFFDDFF07FF07FF01FF01FF8EFF8EFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF8DFF8DFF01FF01FF08FF08FFDFFFDFFFFF
      FFFFFFFCFFFCFF7DFF7D00000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FF44FF44FFBEFFBEFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFEFFFEFFB8FFB8FF44FF44000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000FF25FF25FFEFFFEFFFFFFFFFFF7AFF7A0000
      0000000000000000000000000000FFFFFFFFFFFFFFFF00000000000000000000
      000000000000FF1CFF1CFFF3FFF3FFFFFFFFFF48FF4800000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000FF0EFF0EFF91FF91FFF8FFF8FFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF8FFF8FF90FF90FF0EFF0E000000000000
      000000000000000000000000000000000000000000000000000000000000FF33
      FF33FFB3FFB3FFFEFFFEFF9BFF9BFF01FF0100000000FF56FF56FFE1FFE1FFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFE1FFE1FF55FF5500000000FF01FF01FF9CFF9CFFFEFFFEFFB3
      FFB3FF33FF330000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000FF43
      FF43FFF4FFF4FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF3
      FFF3FF39FF390000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FF46FF46FFFCFFFCFFFDFFFDFF4B
      FF4B000000000000000000000000FFFFFFFFFFFFFFFF00000000000000000000
      000000000000FFAAFFAAFFFFFFFFFFA9FFA90000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000FF4DFF4DFFE3FFE3FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFF9FFF9FF9FFF9FFF54FF54FF31FF31FF31FF31FF55FF55FFA0FFA0FFF9
      FFF9FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFE4FFE4FF4FFF4F0000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000FF39FF39FFE4FFE4FFA1FFA1FF0BFF0B00000000FF06FF06FF65
      FF65FFE0FFE0FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFE0
      FFE0FF65FF65FF06FF0600000000FF0BFF0BFFA2FFA2FFE4FFE4FF38FF380000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000FFD6FFD6FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFD6
      FFD6000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FF7CFF7CFFFFFFFFFFEE
      FFEEFF24FF240000000000000000FFFFFFFFFFFFFFFF00000000000000000000
      0000FF43FF43FFFFFFFFFFF5FFF5FF1FFF1F0000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000FF04
      FF04FF8CFF8CFFFEFFFEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFC5
      FFC5FF21FF21000000000000000000000000000000000000000000000000FF22
      FF22FFC7FFC7FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF90
      FF90FF05FF050000000000000000000000000000000000000000000000000000
      00000000000000000000FF6BFF6BFFFFFFFFFFE0FFE0FF60FF60FF04FF040000
      0000FF0CFF0CFFB9FFB9FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFB8FFB8FF0C
      FF0C00000000FF04FF04FF60FF60FFE0FFE0FFFFFFFFFF6AFF6A000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000FFD6FFD6FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFD6
      FFD6000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000FF49FF49FFE3FFE3FFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFE2FFE2FF48FF4800000000000000000000
      0000000000000000000000000000000000000000000000000000FF0FFF0FFFBD
      FFBDFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFBEFFBEFF07
      FF07000000000000000000000000000000000000000000000000000000000000
      0000FF07FF07FFC0FFC0FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFC0FFC0FF11FF1100000000000000000000000000000000000000000000
      000000000000FF02FF02FFB6FFB6FFFFFFFFFFFFFFFFFFFFFFFFFFB8FFB8FF01
      FF0100000000FF42FF42FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF42FF420000
      0000FF01FF01FFB9FFB9FFFFFFFFFFFFFFFFFFFFFFFFFFB6FFB6FF02FF020000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000FF02
      FF02FFDFFFDFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFDE
      FFDEFF02FF020000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000FFE3FFE3FFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFE2FFE200000000000000000000
      00000000000000000000000000000000000000000000FF15FF15FFD0FFD0FFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFFFEFFF15FF150000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000FF17FF17FFF1FFF1FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFD5FFD5FF19FF19000000000000000000000000000000000000
      000000000000FF55FF55FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFBFFFBFF1C
      FF1C00000000FF5EFF5EFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF5EFF5E0000
      0000FF1CFF1CFFFBFFFBFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF53FF530000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000FF02FF02FFA6
      FFA6FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFA1FFA1FF01FF0100000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000FFFFFFFFFFFFFFFF00000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000FFFFFFFFFFFFFFFF00000000000000000000
      000000000000000000000000000000000000FF0FFF0FFFCFFFCFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF82FF82000000000000
      000000000000FF0BFF0BFF93FF93FFE9FFE9FFE9FFE9FF92FF92FF0BFF0B0000
      00000000000000000000FF84FF84FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFD7FFD7FF15FF150000000000000000000000000000
      0000FF05FF05FFD7FFD7FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF8CFF8C0000
      0000FF29FF29FFF5FFF5FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF5FFF5FF27
      FF2700000000FF8CFF8CFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFD6FFD6FF05
      FF05000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000FF6BFF6BFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFF63FF6300000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000FFFFFFFFFFFFFFFF00000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000FFFFFFFFFFFFFFFF00000000000000000000
      000000000000000000000000000000000000FF41FF41FFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF30FF30000000000000
      000000000000FFA6FFA6FFE1FFE1FF60FF60FF60FF60FFE1FFE1FFA5FFA50000
      00000000000000000000FF32FF32FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF41FF410000000000000000000000000000
      0000FF2BFF2BFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFE5FFE5FF05FF05FF02
      FF02FFA4FFA4FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFA3
      FFA3FF02FF02FF06FF06FFE6FFE6FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF2B
      FF2B000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FF02FF02FFE4FFE4FFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFE4FFE4FF03FF03000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000FFFFFFFFFFFFFFFF0000000000000000FFC3
      FFC3FFC2FFC20000000000000000FFC3FFC3FFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFC2FFC20000000000000000FFFFFFFFFFFFFFFF00000000000000000000
      00000000000000000000000000000000000000000000FF77FF77FFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFFFEFF08FF08000000000000
      0000FF11FF11FFFEFFFEFF41FF410000000000000000FF43FF43FFFEFFFEFF10
      FF100000000000000000FF09FF09FFFEFFFEFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFF75FF75000000000000000000000000000000000000
      0000FF0EFF0EFFFCFFFCFFFFFFFFFFFFFFFFFFFFFFFFFF9FFF9F00000000FF57
      FF57FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFF55FF5500000000FFA0FFA0FFFFFFFFFFFFFFFFFFFFFFFFFFFCFFFCFF0E
      FF0E000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FF3AFF3AFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFF37FF37000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000FFFFFFFFFFFFFFFF0000000000000000FFC5
      FFC5FFC3FFC30000000000000000FFC3FFC3FFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFC3FFC30000000000000000FFFFFFFFFFFFFFFF00000000000000000000
      0000000000000000000000000000000000000000000000000000FF65FF65FFFB
      FFFBFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFCFFFCFF04FF04000000000000
      0000FF21FF21FFFFFFFFFF25FF250000000000000000FF26FF26FFFFFFFFFF20
      FF200000000000000000FF04FF04FFFCFFFCFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFBFFFBFF63FF6300000000000000000000000000000000000000000000
      0000FF34FF34FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF95FF9500000000FF50
      FF50FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFF50FF5000000000FF95FF95FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF34
      FF34000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FF5BFF5BFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFF5BFF5B000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000FFFFFFFFFFFFFFFF00000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000FFFFFFFFFFFFFFFF00000000000000000000
      000000000000000000000000000000000000000000000000000000000000FF4C
      FF4CFFF3FFF3FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF21FF21000000000000
      0000FF01FF01FFD9FFD9FFA8FFA8FF09FF09FF09FF09FFA9FFA9FFD9FFD9FF01
      FF010000000000000000FF20FF20FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF3
      FFF3FF4AFF4A0000000000000000000000000000000000000000000000000000
      0000FF2FFF2FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFA2FFA200000000FF50
      FF50FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFF51FF5100000000FFA1FFA1FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF2D
      FF2D000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FF66FF66FFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFF66FF66000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000FFFFFFFFFFFFFFFF00000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000FFFFFFFFFFFFFFFF00000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000FF28FF28FFD2FFD2FFFFFFFFFFFFFFFFFFFFFFFFFF68FF68000000000000
      000000000000FF34FF34FFE4FFE4FFF9FFF9FFF9FFF9FFE3FFE3FF34FF340000
      00000000000000000000FF63FF63FFFFFFFFFFFFFFFFFFFFFFFFFFCFFFCFFF27
      FF27000000000000000000000000000000000000000000000000000000000000
      0000FF07FF07FFEEFFEEFFFFFFFFFFFFFFFFFFFFFFFFFF86FF8600000000FF75
      FF75FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFF77FF7700000000FF86FF86FFFFFFFFFFFFFFFFFFFFFFFFFFEEFFEEFF06
      FF06000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FF66FF66FFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFF66FF66000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000FFFFFFFFFFFFFFFF0000000000000000FFC3
      FFC3FFC2FFC20000000000000000FFC3FFC3FFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFC2FFC20000000000000000FFFFFFFFFFFFFFFF00000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000FF08FF08FF81FF81FFF8FFF8FFFFFFFFFFD2FFD2FF04FF040000
      00000000000000000000FF0CFF0CFF47FF47FF47FF47FF0CFF0C000000000000
      000000000000FF02FF02FFCCFFCCFFFFFFFFFFF7FFF7FF7EFF7EFF07FF070000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000FF58FF58FFE6FFE6FFFFFFFFFFFFFFFFFF93FF9300000000FF5A
      FF5AFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFF62FF6200000000FF95FF95FFFFFFFFFFFFFFFFFFE5FFE5FF57FF570000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FF66FF66FFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFF66FF66000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000FFFFFFFFFFFFFFFF0000000000000000FFC5
      FFC5FFC3FFC30000000000000000FFC3FFC3FFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFC3FFC30000000000000000FFFFFFFFFFFFFFFF00000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000FF24FF24FFA1FFA1FFFBFFFBFF81FF810000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000FF79FF79FFFBFFFBFFA0FFA0FF23FF2300000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000FF12FF12FFBCFFBCFFF5FFF5FFA2FFA200000000FF23
      FF23FFFDFFFDFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFA
      FFFAFF1AFF1A00000000FFA5FFA5FFF5FFF5FFBBFFBBFF12FF12000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FF64FF64FFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFF64FF64000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000FFFFFFFFFFFFFFFF00000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000FFFFFFFFFFFFFFFF00000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FF22FF22FF80FF80FF50
      FF50000000000000000000000000000000000000000000000000000000000000
      0000FF4DFF4DFF7FFF7FFF21FF21000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000FF8CFF8CFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFD2FFD2FF55
      FF55000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FF52FF52FFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFF4FFF4F000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000FFFFFFFFFFFFFFFF00000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000FFFFFFFFFFFFFFFF00000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000FF01FF01000000000000000000000000000000000000000000000000FF01
      FF01000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000FF01FF01FF67FF67FFCDFFCDFFF5FFF5FFEBFFEBFF91FF91FF03FF030000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FF1BFF1BFFFEFFFEFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFEFFFEFF1CFF1C000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000FFB5FFB5FFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFB3FFB300000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000FFE3FFE3FFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFE2FFE200000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000FF27FF27FFF0
      FFF0FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFEFFFEFFF25FF2500000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000FF4BFF4BFFE4FFE4FFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFE3FFE3FF49FF4900000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000FF3C
      FF3CFFEBFFEBFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFE9
      FFE9FF3BFF3B0000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000FF15FF15FF8AFF8AFFDFFFDFFFFFFFFFFFFFFFFFFFDEFFDEFF89FF89FF14
      FF14000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000FF08FF08FF08FF0800000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFF0000000000000000000000000000000000000000FFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000FFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFF0000000000000000000000000000000000000000000000000000
      00000000000000000000FFFFFFFFFFFFFFFF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFFFFFFFFFFFF000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFF0000000000000000000000000000000000000000FFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000FFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFF0000000000000000000000000000000000000000000000000000
      00000000000000000000FFFFFFFFFFFFFFFF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFFFFFFFFFFFF000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFF0000000000000000000000000000000000000000FFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000FFFF
      FFFFFFFFFFFF0000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000FFFFFFFFFFFF
      FFFF00000000000000000000000000000000000000000000000000000000FFFF
      FFFFFFFFFFFF0000000000000000000000000000000000000000000000000000
      00000000000000000000FFFFFFFFFFFFFFFF0000000000000000FFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFF0000000000000000FFFFFFFFFFFFFFFF000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFF0000000000000000000000000000000000000000FFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000FFFF
      FFFFFFFFFFFF0000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000FFFFFFFFFFFF
      FFFF00000000000000000000000000000000000000000000000000000000FFFF
      FFFFFFFFFFFF0000000000000000000000000000000000000000000000000000
      00000000000000000000FFFFFFFFFFFFFFFF0000000000000000FFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFF0000000000000000FFFFFFFFFFFFFFFF000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFF0000000000000000000000000000000000000000FFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000FFFF
      FFFFFFFFFFFF0000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000FFFFFFFFFFFF
      FFFF00000000000000000000000000000000000000000000000000000000FFFF
      FFFFFFFFFFFF0000000000000000000000000000000000000000000000000000
      00000000000000000000FFFFFFFFFFFFFFFF0000000000000000FFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFF0000000000000000FFFFFFFFFFFFFFFF000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFF0000000000000000000000000000000000000000FFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000FFFF
      FFFFFFFFFFFF0000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000FFFFFFFFFFFF
      FFFF00000000000000000000000000000000000000000000000000000000FFFF
      FFFFFFFFFFFF0000000000000000000000000000000000000000000000000000
      00000000000000000000FFFFFFFFFFFFFFFF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFFFFFFFFFFFF000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFF0000000000000000000000000000000000000000FFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000FFFF
      FFFFFFFFFFFF0000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000FFFFFFFFFFFF
      FFFF00000000000000000000000000000000000000000000000000000000FFFF
      FFFFFFFFFFFF0000000000000000000000000000000000000000000000000000
      00000000000000000000FFFFFFFFFFFFFFFF0000000000000000FFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFF0000000000000000FFFFFFFFFFFFFFFF000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000FFFF
      FFFFFFFFFFFF0000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000FFFFFFFFFFFF
      FFFF00000000000000000000000000000000000000000000000000000000FFFF
      FFFFFFFFFFFF0000000000000000000000000000000000000000000000000000
      00000000000000000000FFFFFFFFFFFFFFFF0000000000000000FFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFF0000000000000000FFFFFFFFFFFFFFFF000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000FFFF
      FFFFFFFFFFFF0000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000FFFFFFFFFFFF
      FFFF00000000000000000000000000000000000000000000000000000000FFFF
      FFFFFFFFFFFF0000000000000000000000000000000000000000000000000000
      00000000000000000000FFFFFFFFFFFFFFFF0000000000000000FFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFF0000000000000000FFFFFFFFFFFFFFFF000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000FFFF
      FFFFFFFFFFFF0000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000FFFFFFFFFFFF
      FFFF00000000000000000000000000000000000000000000000000000000FFFF
      FFFFFFFFFFFF0000000000000000000000000000000000000000000000000000
      00000000000000000000FFFFFFFFFFFFFFFF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFFFFFFFFFFFF000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000FFFF
      FFFFFFFFFFFF0000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000FFFFFFFFFFFF
      FFFF00000000000000000000000000000000000000000000000000000000FFFF
      FFFFFFFFFFFF0000000000000000000000000000000000000000000000000000
      00000000000000000000FFFFFFFFFFFFFFFF0000000000000000FFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFF0000000000000000FFFFFFFFFFFFFFFF000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000FFFFFFFF0000000000000000FFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFF0000000000000000FFFFFFFF000000000000
      000000000000000000000000000000000000000000000000000000000000FFFF
      FFFFFFFFFFFF0000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000FFFFFFFFFFFF
      FFFF00000000000000000000000000000000000000000000000000000000FFFF
      FFFFFFFFFFFF0000000000000000000000000000000000000000000000000000
      00000000000000000000FFFFFFFFFFFFFFFF0000000000000000FFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFF0000000000000000FFFFFFFFFFFFFFFF000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000
      0000000000000000000000000000000000000000000000000000000000000000
      0000FFFFFFFFFFFFFFFFFFFFFFFF0000000000000000FFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFF0000000000000000FFFFFFFFFFFFFFFFFFFFFFFF0000
      000000000000000000000000000000000000000000000000000000000000FFFF
      FFFFFFFFFFFF0000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000FFFFFFFFFFFF
      FFFF00000000000000000000000000000000000000000000000000000000FFFF
      FFFFFFFFFFFF0000000000000000000000000000000000000000000000000000
      00000000000000000000FFFFFFFFFFFFFFFF0000000000000000FFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFF0000000000000000FFFFFFFFFFFFFFFF000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000FFFFFFFFFFFFFFFFFFFFFFFF0000000000000000FFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFF0000000000000000FFFFFFFFFFFFFFFFFFFFFFFF000000000000
      000000000000000000000000000000000000000000000000000000000000FFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFF0000000000000000000000000000000000000000000000000000
      00000000000000000000FFFFFFFFFFFFFFFF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFFFFFFFFFFFF000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000FFFFFFFFFFFFFFFFFFFFFFFF0000000000000000FFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFF0000000000000000FFFFFFFFFFFFFFFFFFFFFFFF00000000000000000000
      000000000000000000000000000000000000000000000000000000000000FFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFF0000000000000000000000000000000000000000000000000000
      00000000000000000000FFFFFFFFFFFFFFFF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFFFFFFFFFFFF000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000FFFFFFFFFFFFFFFFFFFFFFFF000000000000
      0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000
      000000000000FFFFFFFFFFFFFFFFFFFFFFFF0000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000FFFF
      FFFFFFFFFFFF0000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000FFFF
      FFFFFFFFFFFF0000000000000000000000000000000000000000000000000000
      00000000000000000000FFFFFFFFFFFFFFFF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFFFFFFFFFFFF000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFFFFFFFFFFFFFFFFFFFF0000
      000000000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000000000
      0000FFFFFFFFFFFFFFFFFFFFFFFF000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000FFFF
      FFFFFFFFFFFF0000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000FFFF
      FFFFFFFFFFFF0000000000000000000000000000000000000000000000000000
      00000000000000000000FFFFFFFFFFFFFFFF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFFFFFFFFFFFF000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FFFFFFFFFFFFFFFFFFFF
      FFFF0000000000000000FFFFFFFFFFFFFFFFFFFFFFFF0000000000000000FFFF
      FFFFFFFFFFFFFFFFFFFF00000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000FFFF
      FFFFFFFFFFFF0000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000FFFF
      FFFFFFFFFFFF0000000000000000000000000000000000000000000000000000
      00000000000000000000FFFFFFFFFFFFFFFF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFFFFFFFFFFFF000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000FFFFFFFFFFFF
      FFFFFFFFFFFF0000000000000000FFFFFFFF0000000000000000FFFFFFFFFFFF
      FFFFFFFFFFFF0000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000FFFF
      FFFFFFFFFFFF0000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000FFFF
      FFFFFFFFFFFF0000000000000000000000000000000000000000000000000000
      00000000000000000000FFFFFFFFFFFFFFFF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFFFFFFFFFFFF000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000FFFF
      FFFFFFFFFFFFFFFFFFFF000000000000000000000000FFFFFFFFFFFFFFFFFFFF
      FFFF000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000FFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFF0000000000000000000000000000000000000000000000000000
      00000000000000000000FFFFFFFFFFFFFFFF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFFFFFFFFFFFF000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000FFFFFFFFFFFFFFFFFFFFFFFF00000000FFFFFFFFFFFFFFFFFFFFFFFF0000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000FFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFF0000000000000000000000000000000000000000000000000000
      00000000000000000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000FFFFFFFFFFFFFFFFFFFFFFFF00000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFF000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000FFFFFFFF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFF000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFF000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000424D3E000000000000003E000000
      2800000080000000800000000100010000000000000800000000000000000000
      000000000000000000000000FFFFFF0000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFC3FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF81FFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFF99FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF81FFFFFFFFFFFF000000F
      FFFFFFFFFFF81FFFFFFFFFFFF000000FFFFFFFFFFFFC3FFFFFFFFFFFF000000F
      F000000FC1FE7F83FFFFFFFFF000000FF000000FC1FE7F83FC00003FF0063F8F
      FFFFFFFF88FE7F11FC00003FF0063F8FFFFFFFFFC07E7E03FC00003FF000000F
      FFFFFFFFC01E7803FC00003FF000000FFFFFFFFFE20E7047FC00003FF000000F
      FFFFFFFFFF8001FFFC00003FF000000FFFFFFFFFFFE007FFFC00003FF001FF8F
      F000000FFFF00FFFFC00003FF1F1FF8FF000000FFFF00FFFFC00003FF1F1FF8F
      FFFFFFFFFFE007FFFC00003FF001FF8FFFFFFFFFFF8001FFFC00003FF000000F
      FFFFFFFFE20E7047FC00003FF000000FFFFFFFFFC01E7803FC00003FF000000F
      FFFFFFFFC07E7E03FC00003FF001FF8FFFFFFFFF88FE7F11FC00FFFFF1F1FF8F
      F000000FC1FE7F83FC01FFFFF1F1FF8FF000000FC1FE7F83FFFFFFFFF001FF8F
      FFFFFFFFFFFC3FFFFFFFFFFFF000000FFFFFFFFFFFF81FFFFFFFFFFFF000000F
      FFFFFFFFFFF81FFFFFFFFFFFF000000FFFFFFFFFFFF99FFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFF81FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFC3FFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFE0000007FFFFFFFFFFFFFFFFFFFFFFFF
      E0000007FFFFFFFFFFFFFFFFFFFFFFFFE0000007F818181FFFFFFFFFFFFFFFFF
      E0000007F818181FFFFFFFFFFFFFFFFFE0000007F818181FFFFFFFFF82000041
      F000000FF818181FFFFE7FFF82000041F800001FF818181FFFC003FF82000041
      FC00003FF818181FFF0000FFC0000003FF8001FFFE1E787FFC00003FE0800107
      FFE007FFFF0E78FFF800001FF840021FFFF00FFFFF8670FFE007E007FC10083F
      FFF00FFFFE00007FC00FF003F808101FFFE007FFFE00007F801FF801F808101F
      FFC003FFFE7FFE7F00381C00F010080FFFC003FFFE7FFE7F00381C00F000000F
      FF8001FFFE66067F80318C01F020040FFF8001FFFE66067FC0318C03F020040F
      FF8001FFFE7FFE7FE0300C07F020040FFF8001FFFE7FFE7FF0381C0FF020040F
      FF8001FFFE66067FF81C381FF820041FFF8001FFFE66067FFE1FF87FFC20043F
      FF8001FFFE7FFE7FFF8FF1FFFFF00FFFFF8001FFFE7FFE7FFFF7EFFFFFF01FFF
      FF8001FFFE00007FFFFFFFFFFFFFFFFFFFC003FFFE00007FFFFFFFFFFFFFFFFF
      FFC003FFFE00007FFFFFFFFFFFFFFFFFFFE007FFFFFFFFFFFFFFFFFFFFFFFFFF
      FFF00FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFE7FFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFC00003FFFFFFFFFFFFFFFFFFFFFFFFFFC00003F
      FFFFFFFFFE07C0FFE0000007FCFFFF3FFFFFFFFFFE07C0FFE0000007FCFFFF3F
      F800001FFE07C0FFE7FFCFE7FCC0033FF800001FFE07C0FFE7FFCFE7FCC0033F
      F800001FFE07C0FFE7FFCFE7FCC0033FFFFFFFFFFE07C0FFE7FFCFE7FCFFFF3F
      FFFFFFFFFE07C0FFE7FFCFE7FCC0033FFFFFFFFFFE0000FFE7FFCFE7FCC0033F
      FFFFFFFFFE0000FFE7FFCFE7FCC0033FFFFFFFFFFE0000FFE7FFCFE7FCFFFF3F
      F800001FFE0000FFE7FFCFE7FCC0033FF800001FFB0001BFE7FFCFE7FCC0033F
      F800001FF180031FE7FFCFE7FCC0033FFFFFFFFFF8C0063FE0000007FCFFFF3F
      FFFFFFFFFC600C7FE0000007FCFFFF3FFFFFFFFFFE3018FFE7FFFFE7FCFFFF3F
      FFFFFFFFFF1831FFE7FFFFE7FCFFFF3FFFFFFFFFFF8C63FFE7FFFFE7FCFFFF3F
      F800001FFFC6C7FFE7FFFFE7FCFFFF3FF800001FFFE38FFFE0000007FCFFFF3F
      F800001FFFF11FFFE0000007FC00003FFFFFFFFFFFF83FFFFFFFFFFFFC00003F
      FFFFFFFFFFFC7FFFFFFFFFFFFFF00FFFFFFFFFFFFFFEFFFFFFFFFFFFFFF00FFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFF00FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00000000000000000000000000000000
      000000000000}
  end
  object IM16: TImageList
    ColorDepth = cd32Bit
    DrawingStyle = dsTransparent
    Left = 257
    Top = 132
    Bitmap = {
      494C010115001800040010001000FFFFFFFF2110FFFFFFFFFFFFFFFF424D3600
      0000000000003600000028000000400000006000000001002000000000000060
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000E1E1E200D9D9DA00D9D9DA00D9D9DA00DADADB00F7F7F7000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000005386D0003778DA002174F0002271ED004876C300ECECEC000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000007A9AC7003780F3002E7DF400FCFCFC00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000E8E8E9002868D6002667DC002764D5002863D600295FD1007A809000FDFD
      FD00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000FEFEFE006181
      B500236EE7006483B500EFF1F200F3F3F300F6F6F700849BC6002864D7004364
      A400ECECEC000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000002873E3002174
      F300D9DADC00AEAEAD00C8C7C700D2D1D000CECDCC00AFAEAE00CBCBCB002767
      DB002965D500E6E6E60000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000002B7BF2005B7A
      A800F1F1F100D3D3D200E5E4E400EAE9E800E8E7E700D1D0CF00A1A1A1009BAD
      CE002669DF00A3A6AB0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000003480F2007788
      A000E0E4EB003680F1002C77EB00EDECEC005594F5002C7AF1002C6DE000C9D2
      E200246CE400959AA10000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000003D84F3007A89
      A200E0E4EB003981F1002E79EB00F0F0EF005796F5002F7CF1002E6EE000C8D2
      E2002370EA00959AA30000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000093A9CD00498CF4007C8B
      A200E7E7E900E9E9E800F5F5F500F4F4F300F3F2F200E5E4E400BFBFBF00C8D3
      E3002174F1002173EF0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000E1E7EF00F1F2
      F500E8E9E900EAEAEA00F7F7F700F6F6F600F6F5F500E7E7E600C0C0BF00FBFC
      FD00DFE4EE00EFF0F40000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000EDEDEE00E6E6E600F7F7F700F9F8F800F8F8F800E4E4E400C2C2C2000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000D3D3D200E8E8E800F3F3F300EEEEEE00D2D2D200AAAAAA000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000F6F6F600BABABA00D1D1D100FEFEFE00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000007070707555555555555
      5555555555555555555555555555555555555555555555555555555555555555
      5555555555555555555507070707000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000414141415555
      5555555555555555555555555555555555555555555555555555555555555555
      5555555555554141414100000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000014141414FFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFF141414140000000000000000000000002C2C2C2C6F6F
      6F6F2F2F2F2F0000000000000000000000000000000000000000000000002C2C
      2C2C707070702F2F2F2F00000000000000000000000000000000ACACACAC4444
      4444444444444444444444444444444444444444444444444444444444444444
      444444444444ACACACAC00000000000000000000000000000000F3F3F3F3FFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFF3F3F3F300000000000000000000000014141414FFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFF1414141400000000000000002E2E2E2EE7E7E7E78C8C
      8C8CE7E7E7E7545454540000000000000000000000000000000053535353E7E7
      E7E78C8C8C8CE8E8E8E82D2D2D2D000000000000000000000000A3A3A3A30000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000A3A3A3A300000000000000000000000000000000FFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFF00000000000000000000000014141414FFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFE3E3E3E38C8C8C8CFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFF141414140000000000000000727272728B8B8B8B0000
      00002D2D2D2DE5E5E5E552525252000000000000000052525252E6E6E6E62D2D
      2D2D000000008C8C8C8C72727272000000000000000000000000A3A3A3A30000
      000000000000000000000000000000000000000000006F6F6F6F000000000000
      000000000000A3A3A3A300000000000000000000000000000000FFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFF00000000000000000000000014141414FFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFCFCFCFCB2B2B2B259595959EAEA
      EAEAFFFFFFFFFFFFFFFF1414141400000000000000002F2F2F2FE7E7E7E72D2D
      2D2D000000002D2D2D2DE6E6E6E65252525252525252E6E6E6E62E2E2E2E0000
      00002D2D2D2DE6E6E6E630303030000000000000000000000000A3A3A3A30000
      00007B7B7B7BAAAAAAAAAAAAAAAAAAAAAAAA22222222A3A3A3A3080808087474
      747400000000A3A3A3A3000000000000000000000000E4E4E4E4FFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFE6E6E6E6000000000000000014141414FFFFFFFFFFFF
      FFFF7F7F7F7FBBBBBBBBA3A3A3A36666666670707070D1D1D1D11D1D1D1D2D2D
      2D2DEAEAEAEAFFFFFFFF1414141400000000000000000000000055555555E5E5
      E5E52C2C2C2C000000002E2E2E2EE6E6E6E6E8E8E8E82F2F2F2F000000002E2E
      2E2EE6E6E6E65454545400000000000000000000000000000000A3A3A3A30000
      00000000000000000000000000000000000000000000A3A3A3A3000000000000
      000000000000A3A3A3A3000000000000000000000000FFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFF000000000000000014141414FFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFDDDDDDDD1D1D
      1D1D2D2D2D2DEAEAEAEA1A1A1A1A000000000000000000000000000000005454
      5454E5E5E5E52C2C2C2C000000002E2E2E2EE6E6E6E6515151512F2F2F2FE7E7
      E7E7595959590000000000000000000000000000000000000000A3A3A3A30000
      0000323232324444444444444444444444440E0E0E0EA3A3A3A3030303033030
      303000000000A3A3A3A3000000000000000000000000FFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFF000000000000000014141414FFFFFFFFFFFF
      FFFF7F7F7F7FBBBBBBBBA3A3A3A366666666666666666666666675757575D5D5
      D5D51D1D1D1D2D2D2D2DABABABAB0B0B0B0B0000000000000000000000000000
      000056565656E4E4E4E42A2A2A2A000000002F2F2F2FE6E6E6E6EEEEEEEEAFAF
      AFAF1C1C1C1C0000000000000000000000000000000000000000A3A3A3A30000
      00004040404055555555555555555555555514141414A3A3A3A3050505053F3F
      3F3F00000000A3A3A3A3000000000000000000000000FFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFF000000000000000014141414FFFFFFFFFFFF
      FFFFF1F1F1F1F7F7F7F7F5F5F5F5EEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEF1F1
      F1F1DDDDDDDD1D1D1D1D4E4E4E4EB3B3B3B30000000000000000000000000000
      00000000000056565656E4E4E4E429292929000000002F2F2F2F919191919C9C
      9C9CE9E9E9E95454545400000000000000000000000000000000A3A3A3A30000
      00000000000000000000000000000000000000000000A3A3A3A3000000000000
      000000000000A3A3A3A300000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000014141414FFFFFFFFFFFF
      FFFF7F7F7F7FBBBBBBBBA3A3A3A3666666666666666666666666666666667F7F
      7F7FFFFFFFFFDDDDDDDDE1E1E1E1EBEBEBEB0000000000000000000000000000
      00000000000040404040EBEBEBEBE4E4E4E42828282800000000050505055858
      58582A2A2A2AE7E7E7E717171717000000000000000000000000A3A3A3A30000
      00007B7B7B7BAAAAAAAAAAAAAAAAAAAAAAAA23232323A3A3A3A3080808087474
      747400000000A3A3A3A300000000000000000000000000000000FFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFF00000000000000000000000014141414FFFFFFFFFFFF
      FFFFE2E2E2E2F0F0F0F0EBEBEBEBDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDE2E2
      E2E2FFFFFFFFFFFFFFFF85858585373737370000000000000000000000000000
      000041414141E9E9E9E93F3F3F3F878787879191919103030303AAAAAAAAF6F6
      F6F680808080A6A6A6A658585858000000000000000000000000A3A3A3A30000
      00000000000000000000000000000000000000000000A3A3A3A3000000000000
      000000000000A3A3A3A300000000000000000000000000000000FFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFF00000000000000000000000014141414FFFFFFFFFFFF
      FFFF8D8D8D8DC3C3C3C3ADADADAD777777777777777777777777777777778D8D
      8D8DFFFFFFFFFFFFFFFF141414140000000000000000000000007B7B7B7BEEEE
      EEEEF8F8F8F83F3F3F3F00000000666666669999999975757575E8E8E8E81F1F
      1F1FD2D2D2D2E9E9E9E96A6A6A6A000000000000000000000000A3A3A3A30000
      00001717171722222222222222222222222206060606A3A3A3A3000000001616
      161600000000A3A3A3A300000000000000000000000000000000FFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFF00000000000000000000000014141414FFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFF14141414000000000000000021212121EAEAEAEA4D4D
      4D4DF3F3F3F3000000000000000022222222E8E8E8E82B2B2B2BBABABABAA4A4
      A4A418181818CCCCCCCC21212121000000000000000000000000A3A3A3A30000
      00005B5B5B5B7777777777777777777777771D1D1D1DA0A0A0A0070707075959
      595900000000A3A3A3A300000000000000000000000000000000FFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFF00000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000014141414FFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFF14141414000000000000000065656565E6E6E6E6EAEA
      EAEA7D7D7D7D0000000000000000000000005F5F5F5FE8E8E8E8A2A2A2A2FAFA
      FAFAA4A4A4A40505050500000000000000000000000000000000A3A3A3A30000
      000000000000000000000000000000000000000000000A0A0A0A000000000000
      000000000000A3A3A3A300000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000014141414FFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFF14141414000000000000000000000000646464642121
      2121000000000000000000000000000000000000000021212121666666666E6E
      6E6E282828280000000000000000000000000000000000000000ACACACAC4444
      4444444444444444444444444444444444444444444444444444444444444444
      444444444444ACACACAC00000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000007070707555555555555
      5555555555555555555555555555555555555555555555555555555555555555
      5555555555555555555507070707000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000414141415555
      5555555555555555555555555555555555555555555555555555555555555555
      5555555555554141414100000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000002828282877777777777777777777
      7777777777777777777777777777777777777777777777777777777777777777
      7777777777777777777777777777050505050000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000011111111ABABABAB1D1D1D1D000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000575757576F6F6F6F93939393FFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFF0B0B0B0B0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000001111
      1111CBCBCBCBFFFFFFFFABABABAB000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000003A3A3A3AF9F9F9F9F9F9F9F939393939000000000000
      00000000000000000000000000000000000057575757BCBCBCBCCDCDCDCDFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFF0C0C0C0C0000000000000000000000000000
      00000000000000000000000000000000000000000000000000000F0F0F0FC9C9
      C9C9FFFFFFFFCECECECE12121212000000000000000000000000000000000E0E
      0E0E2D2D2D2D44444444555555555555555553535353414141412D2D2D2D0D0D
      0D0D000000000000000000000000000000000000000000000000000000000000
      0000000000000000000055555555FFFFFFFFFFFFFFFF55555555000000000000
      00000000000000000000000000000000000057575757FFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFF0B0B0B0B0000000000000000000000000202
      020256565656ABABABABCECECECEB9B9B9B97D7D7D7D25252525CBCBCBCBFFFF
      FFFFCACACACA1010101000000000000000000000000000000000141414145C5C
      5C5C8A8A8A8AAEAEAEAEC7C7C7C7D8D8D8D8DDDDDDDDDDDDDDDDD8D8D8D8C3C3
      C3C38F8F8F8F3636363600000000000000000000000000000000000000000000
      000000000000000000001E1E1E1EA4A4A4A4A4A4A4A41D1D1D1D000000000000
      00000000000000000000000000000000000057575757FFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFF0C0C0C0C000000000000000010101010BEBE
      BEBEF8F8F8F8A5A5A5A5797979798A8A8A8ADADADADAFFFFFFFFFFFFFFFFC9C9
      C9C9101010100000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000057575757FFFFFFFFFFFFFFFFFFFF
      FFFF4C4C4C4C2222222222222222222222222222222222222222222222222222
      222222222222F2F2F2F2FFFFFFFF0D0D0D0D0000000000000000B7B7B7B7DADA
      DADA24242424000000000000000000000000040404048C8C8C8CFFFFFFFF3737
      3737000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000070707074F4F4F4F4F4F4F4F07070707000000000000
      00000000000000000000000000000000000057575757FFFFFFFFFFFFFFFFFFFF
      FFFFD6D6D6D6CCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCC
      CCCCCCCCCCCCFCFCFCFCFFFFFFFF0D0D0D0D0000000046464646FBFBFBFB2B2B
      2B2B000000000000000000000000000000000000000001010101B8B8B8B8ACAC
      ACAC000000000000000000000000000000000000000000000000272727278383
      8383AFAFAFAFC3C3C3C3CCCCCCCCCCCCCCCCBFBFBFBFA9A9A9A98D8D8D8D6767
      6767383838380707070700000000000000000000000000000000000000000000
      000000000000000000004F4F4F4FFFFFFFFFFFFFFFFF4F4F4F4F000000000000
      00000000000000000000000000000000000057575757FFFFFFFFFFFFFFFFFFFF
      FFFF838383836666666666666666666666666666666666666666666666666666
      666666666666F6F6F6F6FFFFFFFF0E0E0E0E0000000095959595BABABABA0000
      00000000000000000000000000000000000000000000000000004B4B4B4BFAFA
      FAFA0B0B0B0B0000000000000000000000000000000000000000000000000000
      00001B1B1B1B40404040585858586C6C6C6C777777776F6F6F6F646464645050
      5050323232320C0C0C0C00000000000000000000000000000000000000000000
      000000000000000000004F4F4F4FFFFFFFFFFFFFFFFF4F4F4F4F000000000000
      00000000000000000000000000000000000057575757FFFFFFFFFFFFFFFFFFFF
      FFFFADADADAD9999999999999999999999999999999999999999999999999999
      999999999999F9F9F9F9FFFFFFFF0E0E0E0E00000000B1B1B1B1959595950000
      000000000000000000000000000000000000000000000000000026262626FFFF
      FFFF232323230000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000070707074F4F4F4F4F4F4F4F07070707000000000000
      00000000000000000000000000000000000057575757FFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFF0E0E0E0E000000009F9F9F9FADADADAD0000
      00000000000000000000000000000000000000000000000000003E3E3E3EFEFE
      FEFE101010100000000000000000000000000000000000000000000000000101
      0101151515152828282833333333333333332828282814141414010101010000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000057575757FFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFF0E0E0E0E000000005B5B5B5BF3F3F3F31515
      15150000000000000000000000000000000000000000000000009A9A9A9ACACA
      CACA000000000000000000000000000000000000000000000000282828288585
      8585B9B9B9B9DEDEDEDEF2F2F2F2FFFFFFFFFFFFFFFFF4F4F4F4DCDCDCDCA8A8
      A8A8535353530707070700000000000000000000000000000000000000000000
      000000000000000000001D1D1D1DA4A4A4A4A4A4A4A41D1D1D1D000000000000
      00000000000000000000000000000000000057575757FFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFDBDBDBDBAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
      AAAAACACACACFFFFFFFFFFFFFFFF0F0F0F0F0000000005050505D6D6D6D6BABA
      BABA0B0B0B0B0000000000000000000000000000000059595959FCFCFCFC4B4B
      4B4B000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000055555555FFFFFFFFFFFFFFFF55555555000000000000
      00000000000000000000000000000000000023232323E2E2E2E2FFFFFFFFFFFF
      FFFFFFFFFFFF92929292B7B7B7B7AEAEAEAE9E9E9E9EDDDDDDDDDDDDDDDDDDDD
      DDDD60606060FFFFFFFFFFFFFFFF10101010000000000000000026262626E1E1
      E1E1DCDCDCDC717171714545454556565656A9A9A9A9FDFDFDFD787878780000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000003A3A3A3AF9F9F9F9F9F9F9F939393939000000000000
      0000000000000000000000000000000000000000000019191919CCCCCCCCFFFF
      FFFFFFFFFFFF92929292D3D3D3D35050505012121212FFFFFFFFFFFFFFFFFFFF
      FFFF6E6E6E6EFFFFFFFFFFFFFFFF0F0F0F0F0000000000000000000000001313
      13138B8B8B8BE0E0E0E0FFFFFFFFF5F5F5F5B7B7B7B740404040000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000000B0B0B0BB2B2
      B2B2FFFFFFFF92929292D3D3D3D35050505012121212FFFFFFFFFFFFFFFFFFFF
      FFFF6E6E6E6EFFFFFFFFFFFFFFFF101010100000000000000000000000000000
      0000000000000000000002020202000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000303
      0303737373734E4E4E4E717171717C7C7C7C7878787888888888888888888888
      88883A3A3A3A8888888888888888090909090000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000003D3D3D3D3434343400000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000001919
      191A6666666C0202020300000000000000000000000000000000020202036666
      666C1919191A0000000000000000000000000000000057575757BBBBBBBBBBBB
      BBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBB
      BBBBBBBBBBBBBBBBBBBB56565656000000000000000000000000000000000000
      0000000000000000000041414141FAFAFAFAF3F3F3F338383838000000000000
      00000000000000000000000000000000000000000000000000002B2B2B2C6D6D
      6D7470707077707070776F6F6F76626262664545454700000000000000000000
      00000000000000000000000000000000000000000000000000001919191AC5C5
      C5DAFFFFFFFF939393A302020203000000000000000002020203939393A3FFFF
      FFFFC5C5C5DA1919191A000000000000000000000000B6B6B6B6FFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFB6B6B6B6000000000000000000000000000000000000
      0000000000000000000080808080FFFFFFFFFFFFFFFFDADADADA000000000000
      0000000000000000000000000000000000000000000000000000D6D6D6E8FFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF8B8B8B997D7D7D887D7D
      7D887D7D7D883F3F3F40000000000000000000000000000000006767676DFFFF
      FFFFFFFFFFFFFFFFFFFF939393A30202020302020203939393A3FFFFFFFFFFFF
      FFFFFFFFFFFF6666666C000000000000000000000000B7B7B7B7FFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFB7B7B7B7000000000000000000000000000000000000
      0000000000000000000080808080FFFFFFFFFFFFFFFFA3A3A3A3000000000000
      0000000000000000000000000000000000000000000000000000989898AAFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFE5E5E5F2B6B6B6CCB6B6B6CCB6B6
      B6CCDDDDDDECDBDBDBEB00000000000000000000000000000000020202039393
      93A3FFFFFFFFFFFFFFFFFFFFFFFF939393A3939393A3FFFFFFFFFFFFFFFFFFFF
      FFFF939393A302020203000000000000000000000000B7B7B7B7FFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFB7B7B7B7000000000000000000000000000000000000
      0000000000000000000080808080FFFFFFFFFFFFFFFFF7F7F7F71E1E1E1E0000
      0000000000000000000000000000000000000000000000000000080808098181
      818DE1E1E1F0FFFFFFFFEDEDEDF6E1E1E1F0D1D1D1E4717171795C5C5C608989
      8996F5F5F5FA8A8A8A9700000000000000000000000000000000000000000202
      0203929292A2FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF9797
      97A90303030400000000000000000000000000000000B7B7B7B7FFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFB7B7B7B7000000000000000000000000000000000000
      0000000000000000000080808080FFFFFFFFFFFFFFFFD9D9D9D90A0A0A0A0000
      0000000000000000000000000000000000000000000000000000000000000000
      0000181818197070707836363637181818198D8D8D9CD4D4D4E6F3F3F3F9BDBD
      BDD36969696F0101010200000000000000000000000000000000000000000000
      000002020203929292A2FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF979797A90303
      03040000000000000000000000000000000000000000B7B7B7B7FFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFB7B7B7B7000000000000000000000000000000000000
      0000000000001B1B1B1BC4C4C4C4FFFFFFFFFFFFFFFFC3C3C3C31B1B1B1B0000
      0000000000000000000000000000000000000000000000000000000000001515
      1516D6D6D6E8FFFFFFFFFBFBFBFD51515154000000004E4E4E507676767E2828
      2829000000000000000000000000000000000000000000000000000000000000
      000002020203919191A1FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF969696A80303
      03040000000000000000000000000000000000000000B7B7B7B7FFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFB7B7B7B7000000000000000000000000000000000000
      000013131313DEDEDEDEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFDDDDDDDD1212
      1212000000000000000000000000000000000000000000000000000000005E5E
      5E62FFFFFFFFFFFFFFFFFFFFFFFFA2A2A2B663636368FDFDFDFED4D4D4E6E7E7
      E7F31C1C1C1D0000000000000000000000000000000000000000000000000202
      0203919191A1FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF9696
      96A80303030400000000000000000000000000000000B7B7B7B7FFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFB7B7B7B7000000000000000000000000000000000000
      00007F7F7F7FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF7D7D
      7D7D000000000000000000000000000000000000000000000000000000004646
      4648FFFFFFFFFFFFFFFFFFFFFFFF8D8D8D9BA5A5A5B9969696A706060607EFEF
      EFF75F5F5F630000000000000000000000000000000000000000020202039393
      93A3FFFFFFFFFFFFFFFFFFFFFFFF939393A3939393A3FFFFFFFFFFFFFFFFFFFF
      FFFF939393A402020203000000000000000000000000B7B7B7B7FFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFB7B7B7B7000000000000000000000000000000000000
      0000B4B4B4B4FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFB3B3
      B3B3000000000000000000000000000000000000000000000000000000000000
      000185858591E3E3E3F1ACACACC21919191A86868692D5D5D5E78A8A8A97FFFF
      FFFF3A3A3A3B00000000000000000000000000000000000000006767676DFFFF
      FFFFFFFFFFFFFFFFFFFF939393A30202020302020203939393A3FFFFFFFFFFFF
      FFFFFFFFFFFF6767676D0000000000000000000000003D3D3D3D555555555555
      5555555555555555555555555555555555555555555555555555555555555555
      555555555555555555553D3D3D3D000000000000000000000000000000000000
      0000A7A7A7A7FFFFFFFFFFFFFFFF3C3C3C3C3D3D3D3DFFFFFFFFFFFFFFFFA5A5
      A5A5000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000010101011959595A6BFBFBFD46C6C
      6C730000000000000000000000000000000000000000000000001919191AC5C5
      C5DAFFFFFFFF939393A302020203000000000000000002020203939393A3FFFF
      FFFFC5C5C5DA1919191A000000000000000000000000B6B6B6B6BDBDBDBDBEBE
      BEBEBEBEBEBEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFB6B6B6B6000000000000000000000000000000000000
      000042424242FEFEFEFEFFFFFFFF3A3A3A3A3C3C3C3CFFFFFFFFFEFEFEFE4141
      4141000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000001919
      191A6767676D0202020300000000000000000000000000000000020202036666
      666C1919191A000000000000000000000000000000005A5A5A5AB2B2B2B2B2B2
      B2B2B2B2B2B2BBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBB
      BBBBBBBBBBBBBBBBBBBB58585858000000000000000000000000000000000000
      00000000000076767676FBFBFBFBFFFFFFFFFFFFFFFFFAFAFAFA757575750000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000002A2A2A2A727272727171717129292929000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000003A3A3A3B03030304000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000303
      0304505050522E2E2E2F00000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000020202030000
      00004D4D4D4FFFFFFFFF55555558000000007373737B989898AA989898AA9898
      98AA989898AA989898AA989898AA989898AA989898AA989898AA404040420000
      00000000000000000000000000000000000050505053525252550C0C0C0D4040
      4042525252555252525552525255525252555252525552525255525252555252
      5255404040420C0C0C0D52525255505050530000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000008787
      8794FFFFFFFFF9F9F9FC2F2F2F30000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000939393A45050
      5053ADADADC3E5E5E5F210101011000000005A5A5A5DFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFE1E1E1F0141414150000
      000000000000000000000000000000000000C5C5C5DAFFFFFFFF3B3B3B3C9494
      94A5FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFF939393A43C3C3C3DFFFFFFFFC3C3C3D80000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000A2A2
      A2B6FFFFFFFFFFFFFFFF505050520000000000000000050505067D7D7D88D3D3
      D3E5D7D7D7E97070707720202021A1A1A1B4E3E3E3F18A8A8A97989898AAF1F1
      F1F8FFFFFFFF939393A421212122020202030000000087878794FFFFFFFFFFFF
      FFFFFDFDFDFEE7E7E7F3FFFFFFFFFFFFFFFFE3E3E3F1555555588C8C8C9A9898
      98AA989898AA989898AA989898AA7373737B43434345DFDFDFED939393A32525
      2526D3D3D3E5FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFD0D0
      D0E324242425939393A4DFDFDFED414141430000000000000000000000000000
      000000000000000000000000000000000000000000000000000025252526D9D9
      D9EAACACACC2868686930303030400000000000000007D7D7D88FFFFFFFFFFFF
      FFFFFFFFFFFF62626266C0C0C0D6FFFFFFFFFFFFFFFF989898AA989898AAFFFF
      FFFFFFFFFFFFFFFFFFFFE0E0E0EF242424250000000000000000353535364E4E
      4E5008080809000000001919191A5959595C55555558B5B5B5CBFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFF55555558000000000F0F0F108181818D7373
      737B1010101178787880E7E7E7F3FFFFFFFFFFFFFFFFE5E5E5F27777777F0F0F
      0F107474747C8080808B0E0E0E0F000000000000000000000000000000000000
      0000000000000000000000000000000000000000000014141415C5C5C5DA7070
      70770000000000000000000000000000000000000000D3D3D3E5FFFFFFFFFFFF
      FFFFFFFFFFFF50505052FFFFFFFFFFFFFFFFFFFFFFFF989898AA989898AAFFFF
      FFFFFFFFFFFFC9C9C9DD2929292A000000000000000000000000000000005555
      5558B0B0B0C5C6C6C6DB9A9A9AAC36363637ACACACC2F1F1F1F8B9B9B9CFBABA
      BAD1F5F5F5FAF7F7F7FB787878800000000000000000000000001F1F1F20FFFF
      FFFFB9B9B9CF1C1C1C1D47474749FFFFFFFFFFFFFFFF464646481C1C1C1DB9B9
      B9CFFFFFFFFF1F1F1F20000000000000000000000000000000005C5C5C607D7D
      7D87151515160000000000000000000000000B0B0B0CB6B6B6CC868686930000
      00000000000000000000000000000000000000000000FFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFF52525255FFFFFFFFFFFFFFFFFFFFFFFF989898AA989898AAFFFF
      FFFFB0B0B0C5151515160000000000000000000000000000000079797982ABAB
      ABC13939393A181818195858585BD0D0D0E340404042111111120B0B0B0C0505
      0506151515161919191A00000000000000000000000000000000969696A7FFFF
      FFFFFBFBFBFD3B3B3B3C70707078FFFFFFFFFFFFFFFF707070773B3B3B3CFBFB
      FBFDFFFFFFFF959595A600000000000000000000000042424244FFFFFFFFFFFF
      FFFFB7B7B7CD7D7D7D887D7D7D887D7D7D88AEAEAEC49B9B9BAD020202030000
      00000000000000000000000000000000000000000000FFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFF52525255FFFFFFFFFFFFFFFFFFFFFFFF989898AB989898AA9191
      91A1060606070000000000000000000000000000000026262627EDEDEDF66A6A
      6A706262626662626266626262669090909FB6B6B6CC5E5E5E62C3C3C3D8C0C0
      C0D69F9F9FB21C1C1C1D00000000000000000000000000000000D7D7D7E9FFFF
      FFFF9B9B9BAE24242425E5E5E5F2FFFFFFFFFFFFFFFFE3E3E3F1232323249D9D
      9DAFFFFFFFFFD6D6D6E800000000000000000000000042424244FFFFFFFFFFFF
      FFFFB7B7B7CD7D7D7D887D7D7D887D7D7D88AEAEAEC49B9B9BAD020202030000
      00000000000000000000000000000000000000000000FFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFF52525255FFFFFFFFFFFFFFFFFFFFFFFFCCCCCCE0474747494040
      4042000000000000000000000000000000000000000061616165FFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF12121213000000000000
      00004D4D4D4FB9B9B9CF06060607000000000000000000000000E5E5E5F2FFFF
      FFFF8D8D8D9B4B4B4B4DFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF4A4A4A4C8C8C
      8C9AFFFFFFFFE5E5E5F2000000000000000000000000000000005D5D5D617D7D
      7D88161616170000000000000000000000000B0B0B0CB6B6B6CC868686930000
      00000000000000000000000000000000000000000000D3D3D3E5FFFFFFFFFFFF
      FFFFFFFFFFFF4A4A4A4CFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF8484
      849000000000000000000000000000000000000000005A5A5A5EFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFBFBFBFD45454547A6A6A6BBA6A6
      A6BBA6A6A6BBDDDDDDEC51515154000000000000000000000000ABABABC1FFFF
      FFFF868686925959595CFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF5A5A5A5D8686
      8692FFFFFFFFABABABC000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000014141415C5C5C5DA6F6F
      6F7600000000000000000000000000000000000000001E1E1E1F525252555252
      5255525252551B1B1B1C3A3A3A3B5252525552525255525252554D4D4D4F0707
      0708000000000000000000000000000000000000000017171718E3E3E3F1FFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF9F9F9FB284848490FFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFF707070770000000000000000000000000B0B0B0C8585
      85916D6D6D7427272728F9F9F9FCFFFFFFFFFFFFFFFFF3F3F3F9272727286D6D
      6D74848484900A0A0A0B00000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000025252526D9D9
      D9EAACACACC2868686920303030400000000000000000000000047474749CFCF
      CFE2CFCFCFE246464648000000008181818DE3E3E3F1ABABABC1161616170000
      000000000000000000000000000000000000000000000000000054545457EFEF
      EFF7FFFFFFFFFFFFFFFFFFFFFFFFC7C7C7DC42424244E9E9E9F4FFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFF4A4A4A4C000000000000000000000000000000000000
      0000000000000000000050505052A2A2A2B79D9D9DAF21212122000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000A2A2
      A2B6FFFFFFFFFFFFFFFF50505052000000000000000000000000D0D0D0E3FFFF
      FFFFFFFFFFFFCFCFCFE238383839FFFFFFFFFFFFFFFFFFFFFFFF8181818D0000
      0000000000000000000000000000000000000000000000000000000000002828
      28298181818D949494A56F6F6F760A0A0A0BA9A9A9BEFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFB0B0B0C602020203000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000008787
      8794FFFFFFFFF9F9F9FC2F2F2F30000000000000000000000000D0D0D0E3FFFF
      FFFFFFFFFFFFCFCFCFE238383839FFFFFFFFFFFFFFFFFFFFFFFF8181818D0000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000017171718949494A5E1E1E1F0D1D1
      D1E48A8A8A980E0E0E0F00000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000404
      0405515151542F2F2F30000000000000000000000000000000004848484AD0D0
      D0E3D0D0D0E347474749000000008282828EE3E3E3F1ACACACC2171717180000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000001313131356565656060606060000000000000000010101015050
      50501E1E1E1E0000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FFFFFFFF999999999999
      999999999999999999999999999999999999999999999999999999999999FFFF
      FFFF000000000000000000000000000000000000000000000000000000000000
      00000000000099999999FFFFFFFF64646464000000000000000043434343FFFF
      FFFFB9B9B9B90000000000000000000000000000000000000000C7C7C7DEFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFC7C7C7DE00000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FFFFFFFF000000000000
      0000000000000000000000000000000000000000000000000000000000003333
      3333FFFFFFFF0000000000000000000000000000000000000000000000000000
      00000000000042424242ADADADAD21212121000000000000000012121212A7A7
      A7A7575757570000000000000000000000000000000000000000F9F9F9FCFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFF7F7F7FB00000000000000000000000072727272ABABABABABAB
      ABABABABABABABABABABABABABABABABABABABABABABABABABABABABABABABAB
      ABABABABABABABABABAB727272720000000000000000FFFFFFFF000000000000
      0000000000000000000000000000000000000000000000000000000000003333
      33331F1F1F1F1C1C1C1C00000000000000000000000000000000000000000000
      0000000000001111111133333333333333333333333333333333333333333333
      3333171717170000000000000000000000000000000000000000959595B0FFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFF959595AF00000000000000000000000072727272ABABABABABAB
      ABABABABABABABABABABABABABABABABABABABABABABABABABABABABABABABAB
      ABABABABABABABABABAB727272720000000000000000FFFFFFFF000000000000
      0000000000000000000000000000000000000000000000000000000000003333
      333300000000D3D3D3D300000000000000000000000000000000000000000000
      00002C2C2C2CF2F2F2F2FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFF9F9F9F94141414100000000000000000000000000000000080808097777
      778BE7E7E7F3FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFE7E7
      E7F37777778A0808080900000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FFFFFFFF000000000000
      0000000000000000000000000000000000000000000000000000000000003333
      3333000000009999999900000000000000000000000000000000000000000000
      000090909090FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFAAAAAAAA00000000000000000000000000000000000000000000
      00000707070842424246707070808686869E8686869E70707080424242460707
      0708000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FFFFFFFF000000000000
      0000000000000000000000000000000000000000000000000000000000003333
      3333000000009999999900000000000000000000000000000000000000000000
      0000DADADADAFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFEEEEEEEE03030303000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000072727272ABABABABABAB
      ABABABABABABABABABABABABABABABABABABABABABABABABABABABABABABABAB
      ABABABABABABABABABAB7272727200000000B5B5B5B5FFFFFFFF000000000000
      0000000000000000000000000000000000000000000000000000000000003333
      33331D1D1D1DFFFFFFFF00000000000000000000000000000000000000002727
      2727FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFF37373737000000000000000000000000000000000000
      00000000000000000000030303043838383B3737373A03030304000000000000
      0000000000000000000000000000000000000000000072727272ABABABABABAB
      ABABABABABABABABABABABABABABABABABABABABABABABABABABABABABABABAB
      ABABABABABABABABABAB727272720000000098989898FFFFFFFF000000000000
      000026262626FFFFFFFFFFFFFFFFFFFFFFFF0C0C0C0C00000000000000003333
      3333FFFFFFFF00000000FFFFFFFF000000000000000000000000000000007272
      7272FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFF7C7C7C7C000000000000000000000000000000000000
      0000000000000C0C0C0DAEAEAEC9FFFFFFFFFFFFFFFFADADADC80B0B0B0C0000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FFFFFFFF000000000000
      000000000000000000000000000000000000000000000000000000000000FFFF
      FFFF000000000000000000000000FFFFFFFF000000000000000000000000BDBD
      BDBDFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFC1C1C1C1000000000000000000000000000000000000
      0000000000006B6B6B7AFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF6A6A6A790000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000024242424E9E9E9E97E7E
      7E7EECECECEC33333333333333333333333333333333E8E8E8E833333333FFFF
      FFFF00000000000000000A0A0A0A0404040400000000000000000E0E0E0EF8F8
      F8F8BBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBB
      BBBBBBBBBBBBBBBBBBBB95959595000000000000000000000000000000000000
      0000000000008484849CFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF8484849C0000
      0000000000000000000000000000000000000000000072727272ABABABABABAB
      ABABABABABABABABABABABABABABABABABABABABABABABABABABABABABABABAB
      ABABABABABABABABABAB7272727200000000000000000000000029292929C1C1
      C1C18282828211111111000000000000000000000000A7A7A7A7000000007070
      7070FFFFFFFF00000000FFFFFFFF00000000000000000000000054545454C8C8
      C8C8000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000051515158FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF4F4F4F560000
      0000000000000000000000000000000000000000000072727272ABABABABABAB
      ABABABABABABABABABABABABABABABABABABABABABABABABABABABABABABABAB
      ABABABABABABABABABAB72727272000000000000000000000000000000000000
      0000FFFFFFFFF1F1F1F1070707072C2C2C2CEDEDEDED0000000043434343B5B5
      B5B599999999FFFFFFFF00000000000000000202020222222222ADADADAD7D7D
      7D7D000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000006C6C6C7BD3D3D3E6D3D3D3E66A6A6A79000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000A4A4A4A494949494FFFFFFFF1D1D1D1D484848480000
      0000000000000000000000000000000000004C4C4C4CEEEEEEEEC7C7C7C71414
      1414000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000051515151000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000424D3E000000000000003E000000
      2800000040000000600000000100010000000000000300000000000000000000
      000000000000000000000000FFFFFF00FFFF000000000000F81F000000000000
      F81F000000000000FC3F000000000000F00F000000000000C007000000000000
      C003000000000000C003000000000000C003000000000000C003000000000000
      8003000000000000C003000000000000F01F000000000000F81F000000000000
      FC3F000000000000FFFF000000000000FFFF8001FFFFC003FFFF8001C7E3C003
      C003800183C1DFFBC00380019189DFBBC00380018811D00B80018001C423DFBB
      80018001E207D00B80018000F107D00B80018000F883DFBBFFFF8000F841D00B
      C0038000F001DFBBC0038001C201D02BC00380018601D00BC3FF80018703DFBB
      FFFF8001CF87C003FFFF8001FFFFC003FFFFFFFFFFFF0000FFF1FFFFFFFF0000
      FFE1FFFFFC3F0000FFC1E00FFC3F0000E003C003FC3F0000C007FFFFFFFF0000
      C70FFFFFFC3F00008F8FC003FC3F00009FC7F003FC3F00009FC7FFFFFC3F0000
      9FC7E01FFFFF00008FCFC003FC3F0000878FFFFFFC3F0000C01FFFFFFC3F0000
      E03FFFFFFFFF0000FDFFFFFFFFFF000000000000FFFFFFFF00000000FFFFFE7F
      000000008001FC3F000000008001FC3F000000008001FC3F000000008001FC1F
      000000008001FC1F000000008001F81F000000008001F00F000000008001F00F
      000000008001F00F000000008001F00F000000008001F00F000000008001F81F
      00000000FFFFFC3F00000000FFFFFFFF00000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000FFFFFFFF0000FFFFFFFFF8C70000FFFF
      800FF8C70000FFFFBFE7F8C700008001BFE3F80700008001BFEBF0030000FFFF
      BFEBF0030000FFFFBFEBF001000080013FE3E001000080013065E0010000FFFF
      BFEEE0010000FFFF800CC00100008001C3A5CFFF00008001F0430FFF0000FFFF
      FC1F0FFF0000FFFFFFBFFFFF0000FFFF00000000000000000000000000000000
      000000000000}
  end
  object PMAuxiliares: TPopupMenu
    Images = IM16
    Left = 448
    Top = 152
    object Ayuda1: TMenuItem
      Caption = 'Ayuda'
      object Ayuda2: TMenuItem
        Caption = 'Ayuda'
      end
      object Acercade1: TMenuItem
        Caption = 'Acerca de..'
        OnClick = Acercade1Click
      end
    end
  end
  object ALAuxiliares: TActionList
    Left = 448
    Top = 88
  end
end
