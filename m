Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
	by mail.lfdr.de (Postfix) with ESMTP id 92F471D2351
	for <lists+dm-devel@lfdr.de>; Thu, 14 May 2020 01:59:09 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1589414348;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 references:references:list-id:list-help:list-unsubscribe:
	 list-subscribe:list-post; bh=vctdgzpqNyMrA70MGZKqDAa/JtJcNavIq7sEDfe5/W8=;
	b=O5AjNCcgrJjTF0sxg0skixemLl217x2x4rNdgzwdajjpQlB1MKRxmY61xTDGINyW8IC4wg
	Te0Z3Tw75kHVBk7pMqoo1kSaq67MviCyggaWiXgmtGec+NQPSakbq4o60JXTFsIwBGFTrj
	1EGN4N4cziRkCbj3Dr5tMaPIqTkI4ak=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-447-eYpoBCq8MOuw7tJqEvYcVw-1; Wed, 13 May 2020 19:59:06 -0400
X-MC-Unique: eYpoBCq8MOuw7tJqEvYcVw-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E5A63107ACCA;
	Wed, 13 May 2020 23:58:57 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id AE0D81001B2B;
	Wed, 13 May 2020 23:58:54 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 7A2AE4CAB0;
	Wed, 13 May 2020 23:58:44 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 04DNuZUe010718 for <dm-devel@listman.util.phx.redhat.com>;
	Wed, 13 May 2020 19:56:35 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 7CB9711F4A5; Wed, 13 May 2020 23:56:35 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast02.extmail.prod.ext.rdu2.redhat.com [10.11.55.18])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 742E212F76A
	for <dm-devel@redhat.com>; Wed, 13 May 2020 23:56:32 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id A88928007AC
	for <dm-devel@redhat.com>; Wed, 13 May 2020 23:56:32 +0000 (UTC)
Received: from esa4.hgst.iphmx.com (esa4.hgst.iphmx.com [216.71.154.42])
	(Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-336-25TcCe_IPjqmfYyLNaWhwQ-1; Wed, 13 May 2020 19:56:26 -0400
X-MC-Unique: 25TcCe_IPjqmfYyLNaWhwQ-1
IronPort-SDR: 9mfUTrlR9PzSyhBNbTgd8LrrYnFrAZ9IcriOTvYvRY8kjwWYVOQp2oWh+4gJ+2YPcTyQrGAJ4C
	Yx9UOZK3PbBji2OHEo/JkZhPmJxByUZ15aQ3IO88j1t7CU5Og+UJ/5Gm2HNNpIGj8HP+EqGDC5
	510jE35ooQ+Wlo9LzNILLqVMcIsGH8vlrhD5lgTYTeLfx8YQkhs7BYi67hAFrmek0lJKrPotDL
	wIrerqk4Vf+qgtFKg+IiPTtpFbID+ZF+P1FvfZQj/W4/rnwisn1KhJY2c6rP6QdCNPk+f7j3WP
	WLY=
X-IronPort-AV: E=Sophos;i="5.73,389,1583164800"; d="scan'208";a="137625383"
Received: from mail-dm6nam10lp2109.outbound.protection.outlook.com (HELO
	NAM10-DM6-obe.outbound.protection.outlook.com) ([104.47.58.109])
	by ob1.hgst.iphmx.com with ESMTP; 14 May 2020 07:56:24 +0800
Received: from BY5PR04MB6900.namprd04.prod.outlook.com (2603:10b6:a03:229::20)
	by BY5PR04MB6756.namprd04.prod.outlook.com (2603:10b6:a03:225::13)
	with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3000.20;
	Wed, 13 May 2020 23:56:23 +0000
Received: from BY5PR04MB6900.namprd04.prod.outlook.com
	([fe80::b574:3071:da2f:7606]) by
	BY5PR04MB6900.namprd04.prod.outlook.com
	([fe80::b574:3071:da2f:7606%6]) with mapi id 15.20.3000.016;
	Wed, 13 May 2020 23:56:23 +0000
From: Damien Le Moal <Damien.LeMoal@wdc.com>
To: Hannes Reinecke <hare@suse.de>, Mike Snitzer <snitzer@redhat.com>, "Martin
	K . Petersen" <martin.petersen@oracle.com>
Thread-Topic: [PATCHv5 00/14] dm-zoned: metadata version 2
Thread-Index: AQHWJRechFCM8ZarfEqHZb3tednc9w==
Date: Wed, 13 May 2020 23:56:23 +0000
Message-ID: <BY5PR04MB690002ABF208B084607B6971E7BF0@BY5PR04MB6900.namprd04.prod.outlook.com>
References: <20200508090332.40716-1-hare@suse.de>
	<BY5PR04MB6900138C0F78196D0F81BF07E7A10@BY5PR04MB6900.namprd04.prod.outlook.com>
	<BY5PR04MB6900C76141ABD428F42C1840E7A10@BY5PR04MB6900.namprd04.prod.outlook.com>
	<2553e593-795d-6aed-f983-e990a283e2ff@suse.de>
	<BY5PR04MB6900C84D00585D3560D4C51AE7A10@BY5PR04MB6900.namprd04.prod.outlook.com>
	<BY5PR04MB690020AE68E7A20EA8BFED0DE7A10@BY5PR04MB6900.namprd04.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [129.253.182.57]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 7065f9aa-43bc-41d1-94dd-08d7f7993de0
x-ms-traffictypediagnostic: BY5PR04MB6756:
x-microsoft-antispam-prvs: <BY5PR04MB6756BF3CD2AE34C53F9E76C0E7BF0@BY5PR04MB6756.namprd04.prod.outlook.com>
wdcipoutbound: EOP-TRUE
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-forefront-prvs: 0402872DA1
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: d8ee44Af7R8kWH5u+RQ33FBnqbvmc0IdYNK33pUJpqvEM835w/foCIFMu7Cf3VeDKeQenflldSQ9l9yRbrBwb6J+Wsv8tLeVbh8aCAuR+q3Z7v9rg0UNVGOgFqzVfGL1eM9paJXsV97pThhvJdn4v/V3+azlihPKducgdGMHKIDkKFoGY96AIOFsvs/h9h8fVUktxnGqNmFDMaG4kP+Go5JZ8adJavn3R1X18+cvLSWnV4UvVM3U6Mmh2y6UXEXJwOhKp0IBafuLGH80CFN+Sy+eCdxBNdpAWJFsuU4ephDaYrurkN5+D+qlzmXMxWAhZLbiQjNUn7QFroQ6bynB6LKWNfqxBEvOny+ejkMGXZM/miftZrkO2iT/LX++cD/P7u1HCQA9/0KoNlFn7YOCEAzv5QGD6jtgoc17kjtxljz1slAmuhqr4LHDzYtqbOHW
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
	IPV:NLI; SFV:NSPM; H:BY5PR04MB6900.namprd04.prod.outlook.com;
	PTR:; CAT:NONE; SFTY:;
	SFS:(4636009)(136003)(376002)(366004)(346002)(396003)(39860400002)(2906002)(186003)(8936002)(33656002)(5660300002)(52536014)(71200400001)(26005)(478600001)(4326008)(55016002)(316002)(7696005)(66446008)(110136005)(54906003)(53546011)(64756008)(66946007)(6506007)(76116006)(86362001)(9686003)(66556008)(8676002)(66476007);
	DIR:OUT; SFP:1102;
x-ms-exchange-antispam-messagedata: S2pgsln7DmzqESc1AWZ43ie/r5xSRVnqo4Ng1Ltjex97YZIGvidyT0Ng1J0/tAkBrN3FnDd7JW2UZTogsW0uRMOOto6dT0lheLn446ikXQgD4BLbBq8Xv0VMSDfacMIsVTxLd2zXnhv9ueCEISYXQFgF20wkdsAcBKYmnerGgLJniSPnkJiJ/d6G7k2uxKwMWf8SSq73exW7woVy+ZVrZPEqBjallCBcBf0BDu6NfX5y1L90Whg9R8sw4FU7iiHSC3bbmDHzNsRHHnOvPp9gMQLpZXQTa+nSxuNhhoQq99hYBRftktM8OOMq0GNNjKqoDh1UA81QGylX55J4nFWMeeU228Ms0gGnG/j7QnP0OxX4rmcLLFt2oVAzb4nwrzPJ/ugX++4iB2pUdBUqgBp30ZgFj9tE9KDDv9SZsESK/Ny2HFhYTDP+XE13Ha0P8t8Jd6xIlQXzeGJEOda3xKqHmA4nIxqGNDsnnO8EpxVOhUESECKB4SW2e4eAOapkKlQg
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7065f9aa-43bc-41d1-94dd-08d7f7993de0
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 May 2020 23:56:23.4796 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: d4L0Gp+HZz5nwaQw5XF81WUAVvKHGw5PPeFTpUjcGQ6imIi4pxZKQ7n0725S6KDTdzC+rzsu2LoDl8yepKmjqQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR04MB6756
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 04DNuZUe010718
X-loop: dm-devel@redhat.com
Cc: Bob Liu <bob.liu@oracle.com>, "dm-devel@redhat.com" <dm-devel@redhat.com>
Subject: Re: [dm-devel] [PATCHv5 00/14] dm-zoned: metadata version 2
X-BeenThere: dm-devel@redhat.com
X-Mailman-Version: 2.1.12
Precedence: junk
List-Id: device-mapper development <dm-devel.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/options/dm-devel>,
	<mailto:dm-devel-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/dm-devel>
List-Post: <mailto:dm-devel@redhat.com>
List-Help: <mailto:dm-devel-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/dm-devel>,
	<mailto:dm-devel-request@redhat.com?subject=subscribe>
Sender: dm-devel-bounces@redhat.com
Errors-To: dm-devel-bounces@redhat.com
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Adding Martin.

On 2020/05/11 22:23, Damien Le Moal wrote:
> On 2020/05/11 20:46, Damien Le Moal wrote:
>> On 2020/05/11 20:25, Hannes Reinecke wrote:
>>> On 5/11/20 12:55 PM, Damien Le Moal wrote:
>>>> On 2020/05/11 11:46, Damien Le Moal wrote:
>>>>> Mike,
>>>>>
>>>>> I am still seeing the warning:
>>>>>
>>>>> [ 1827.839756] device-mapper: table: 253:1: adding target device sdj caused an
>>>>> alignment inconsistency: physical_block_size=4096, logical_block_size=4096,
>>>>> alignment_offset=0, start=0
>>>>> [ 1827.856738] device-mapper: table: 253:1: adding target device sdj caused an
>>>>> alignment inconsistency: physical_block_size=4096, logical_block_size=4096,
>>>>> alignment_offset=0, start=0
>>>>> [ 1827.874031] device-mapper: table: 253:1: adding target device sdj caused an
>>>>> alignment inconsistency: physical_block_size=4096, logical_block_size=4096,
>>>>> alignment_offset=0, start=0
>>>>> [ 1827.891086] device-mapper: table: 253:1: adding target device sdj caused an
>>>>> alignment inconsistency: physical_block_size=4096, logical_block_size=4096,
>>>>> alignment_offset=0, start=0
>>>>>
>>>>> when mixing 512B sector and 4KB sector devices. Investigating now.
>>>>
>>>>
>>>> OK. Figured that one out: the 500GB SSD I am using for the regular device is
>>>> 976773168 512B sectors capacity, that is, not a multiple of the 256MB zone size,
>>>> and not even a multiple of 4K. This causes the creation of a 12MB runt zone of
>>>> 24624 sectors, which is ignored. But the start sector of the second device in
>>>> the dm-table remains 976773168, so not aligned on 4K. This causes
>>>> bdev_stack_limits to return an error and the above messages to be printed.
>>>>
>>>> So I think we need to completely ignore the eventual "runt" zone of the regular
>>>> device so that everything aligns correctly. This will need changes in both
>>>> dmzadm and dm-zoned.
>>>>
>>>> Hannes, I can hack something on top of your series. Or can you resend with that
>>>> fixed ?
>>>>
>>>>
>>>>
>>>>
>>> Does this one help?
>>
>> Nope. Same warning.
>>
>>>
>>> diff --git a/drivers/md/dm-zoned-target.c b/drivers/md/dm-zoned-target.c
>>> index ea43f6892ced..5daca82b5ec7 100644
>>> --- a/drivers/md/dm-zoned-target.c
>>> +++ b/drivers/md/dm-zoned-target.c
>>> @@ -1041,13 +1041,17 @@ static int dmz_iterate_devices(struct dm_target *ti,
>>>   {
>>>          struct dmz_target *dmz = ti->private;
>>>          unsigned int zone_nr_sectors = dmz_zone_nr_sectors(dmz->metadata);
>>> +       unsigned int nr_zones;
>>>          sector_t capacity;
>>>          int r;
>>>
>>> -       capacity = dmz->dev[0].capacity & ~(zone_nr_sectors - 1);
>>> +       nr_zones = DIV_ROUND_DOWN(dmz->dev[0].capacity, zone_nr_sectors);
>>> +       capacity = nr_zones * zone_nr_sectors;
>>
>> 	capacity = round_down(dmz->dev[0].capacity, zone_nr_sectors);
>>
>> is simpler :)
>>
>> In any case, your change does seem to do anything here. Before and after, the
>> capacity is rounded down to full zones, excluding the last runt zone. I think it
>> is to do with the table entry start offset given on DM start by dmzadm...
>>
>>
>>>          r = fn(ti, dmz->ddev[0], 0, capacity, data);
>>>          if (!r && dmz->ddev[1]) {
>>> -               capacity = dmz->dev[1].capacity & ~(zone_nr_sectors - 1);
>>> +               nr_zones = DIV_ROUND_DOWN(dmz->dev[1.capacity,
>>> +                                                  zone_nr_sectors));
>>> +               capacity = nr_zones * zone_nr_sectors;
>>>                  r = fn(ti, dmz->ddev[1], 0, capacity, data);
>>>          }
>>>          return r;
>>>
>>> Cheers,
> 
> The failure of bdev_stack_limits() generating the warning is due to the io_opt
> limit not being compatible with the physical blocks size... Nothing to do with
> zone start/runt zones.
> 
> The problem is here:
> 
> 	/* Optimal I/O a multiple of the physical block size? */
>         if (t->io_opt & (t->physical_block_size - 1)) {
>                 t->io_opt = 0;
>                 t->misaligned = 1;
>                 ret = -1;
>         }
> 
> For the ssd (t), I have io_opt at 512 and the physical block size at 4096,
> changed due to the satcking from the device real 512 phys block to the smr disk
> phys block. The SMR disk io_opt is 0, so the ssd io_opt remains unchaged at 512.
> And we end up with the misaligned trigger since 512 & 4095 = 512...
> 
> I do not understand clearly yet... I wonder why the io_opt for the SMR drive is
> not 4096, same as the physical sector size.

I investigated this and here is what I found out:

When the dual drive setup is started, dm_calculate_queue_limits() is called and
ti->type->iterate_devices(ti, dm_set_device_limits, &ti_limits) executed.

In dm-zoned, the iterate device method executes dm_set_device_limits() twice,
once for each drive of the setup.

The drives I am using are an M.2 SSD with a phys sector size of 512B and an
optimal IO size set to 512. The SMR drive has a phys sector size of 4K and the
optimal IO size set to 0, the drive does not report any value, not uncommon for
HDDs.

The result of bdev_stack_limits() execution from dm_set_device_limits() gives a
DM device phys sector of 4K, no surprise. The io_opt limit though end up being
512 = lcm(0, 512). That results in this condition to trigger:

	/* Optimal I/O a multiple of the physical block size? */
        if (t->io_opt & (t->physical_block_size - 1)) {
                t->io_opt = 0;
                t->misaligned = 1;
                ret = -1;
        }

since 512 & (4096 - 1) is not 0...

It looks to me like we should either have io_opt always be at least the phys
sector size, or change the limit stacking io_opt handling. I am not sure which
approach is best... Thoughts ?

Martin,

Any idea why the io_opt limit is not set to the physical block size when the
drive does not report an optimal transfer length ? Would it be bad to set that
value instead of leaving it to 0 ?

-- 
Damien Le Moal
Western Digital Research



--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

