 With Temp As (
        Select
            Sh.Shipment_Id,
            Sh.Kn_Com_Ref,
            Sh.Is_Dang_Good,
            Sh.Packages,
            Sh.Gross_Weight,
            Sh.Volume,
            Sh.From_Location,
            Sh.To_Location,
            Sh.Shipment_Type_Name,
            Sh.Last_Update,
            Sh_Stat.Status_Type_Name,
            Sh_Stat.Status_Timestamp,
            Sh_Stat.Sender,
            Sh_Stat.Status_Location,
            Rank() Over(
                Partition By Sh.Shipment_Id
                Order By
                    Sh_Stat.Status_Timestamp Desc
            ) Rnk
        From
            Shipment          Sh,
            Shipment_Status   Sh_Stat
        Where
            Sh.Shipment_Id = Sh_Stat.Shipment_Id
            And Sh.Is_Active = Sh_Stat.Is_Active
            And Sh.Is_Active = 'Y'
            And Sh.To_Location <> Sh_Stat.Status_Location
            And Sh_Stat.Status_Type_Code = '1300'
            And From_Location Like ( 'DE%' )
            And To_Location Like ( 'US%' )
            And Sh_Stat.Status_Type_Code Not In (
                Select
                    Sh_Stat.Status_Type_Code
                From
                    Shipment_Status Sh_Stat1
                Where
                    Sh_Stat1.Shipment_Id = Sh_Stat.Shipment_Id
                    And Sh_Stat1.Status_Type_Code In (
                        '1400',
                        '3000',
                        '9900'
                    )
            )
    )
    Select
        Shipment_Id,
        Kn_Com_Ref,
        Is_Dang_Good,
        Packages,
        Gross_Weight,
        Volume,
        From_Location,
        To_Location,
        Shipment_Type_Name,
        Last_Update,
        Status_Type_Name,
        Status_Timestamp,
        Sender,
        Status_Location
    From
        Temp
    Where
        Rnk = 1;
        