Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com [205.139.110.120])
	by mail.lfdr.de (Postfix) with ESMTP id 3BE601CD8CA
	for <lists+dm-devel@lfdr.de>; Mon, 11 May 2020 13:47:19 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1589197638;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 references:references:list-id:list-help:list-unsubscribe:
	 list-subscribe:list-post; bh=Ihh8dNgmOyJwYEpHDjS3dg0D/rjIMDmQR65Ku8tT1Jw=;
	b=HMU4/mdoNmB5ccAI7s2SxnFGbcOEF9mC6UOKkwNqvyd14Ksgy4Be814GJDBTVElwjT1V41
	324JDvGFMmWtn3NpgPhJJLDXI/HMNbjls9LRwkF4El3LcOW1+cKhbe7d/YfUJjy061xWUO
	XutjB0HlfRr3ltOJgUS3o09R78GEUd8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-162-kJJHRqSwNwqV3hbJ1tFMnw-1; Mon, 11 May 2020 07:47:16 -0400
X-MC-Unique: kJJHRqSwNwqV3hbJ1tFMnw-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D25B419057A0;
	Mon, 11 May 2020 11:47:09 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 9DF7B6C794;
	Mon, 11 May 2020 11:47:07 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id EF6511809543;
	Mon, 11 May 2020 11:47:01 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 04BBkq52020140 for <dm-devel@listman.util.phx.redhat.com>;
	Mon, 11 May 2020 07:46:53 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id B783720A8DCD; Mon, 11 May 2020 11:46:52 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast05.extmail.prod.ext.rdu2.redhat.com [10.11.55.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id B2D8A2026FFE
	for <dm-devel@redhat.com>; Mon, 11 May 2020 11:46:48 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id BF6A7833B49
	for <dm-devel@redhat.com>; Mon, 11 May 2020 11:46:48 +0000 (UTC)
Received: from esa1.hgst.iphmx.com (esa1.hgst.iphmx.com [68.232.141.245])
	(Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-210-AMgW_PXAPpy6t9csjqzcZw-1; Mon, 11 May 2020 07:46:46 -0400
X-MC-Unique: AMgW_PXAPpy6t9csjqzcZw-1
IronPort-SDR: IgkLCOCvhtKO4NqQOT9bgLzV6RuvKWdwSgVKPrZoVRvnmetx9rJe37yn2NmNV3xX103d2/H1lc
	0LSftMzQtlkGp+SCI+ugaEBGCx73s4srGoFqmtQHmjFeFohMDCU9ArBbu7ltrgom/+BPXj0Igw
	VoxZGGVKApPRxH31tmwhQzFaGikZLLnN+NbLAtuoN1E1p4tabQYDD/eUqqhmrlZ2nr51MuyEko
	EDAMZsrrmATYf6wUZTs2PWE8EFdExTXeP640xWQMaN/l0iaw/Aq09BN+aDeiLWvos8Fj41rB/D
	Jao=
X-IronPort-AV: E=Sophos;i="5.73,379,1583164800"; d="scan'208";a="246315435"
Received: from mail-mw2nam10lp2108.outbound.protection.outlook.com (HELO
	NAM10-MW2-obe.outbound.protection.outlook.com) ([104.47.55.108])
	by ob1.hgst.iphmx.com with ESMTP; 11 May 2020 19:46:44 +0800
Received: from BY5PR04MB6900.namprd04.prod.outlook.com (2603:10b6:a03:229::20)
	by BY5PR04MB6801.namprd04.prod.outlook.com (2603:10b6:a03:222::22)
	with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2979.28;
	Mon, 11 May 2020 11:46:44 +0000
Received: from BY5PR04MB6900.namprd04.prod.outlook.com
	([fe80::b574:3071:da2f:7606]) by
	BY5PR04MB6900.namprd04.prod.outlook.com
	([fe80::b574:3071:da2f:7606%6]) with mapi id 15.20.2979.033;
	Mon, 11 May 2020 11:46:44 +0000
From: Damien Le Moal <Damien.LeMoal@wdc.com>
To: Hannes Reinecke <hare@suse.de>, Mike Snitzer <snitzer@redhat.com>
Thread-Topic: [PATCHv5 00/14] dm-zoned: metadata version 2
Thread-Index: AQHWJRechFCM8ZarfEqHZb3tednc9w==
Date: Mon, 11 May 2020 11:46:43 +0000
Message-ID: <BY5PR04MB6900C84D00585D3560D4C51AE7A10@BY5PR04MB6900.namprd04.prod.outlook.com>
References: <20200508090332.40716-1-hare@suse.de>
	<BY5PR04MB6900138C0F78196D0F81BF07E7A10@BY5PR04MB6900.namprd04.prod.outlook.com>
	<BY5PR04MB6900C76141ABD428F42C1840E7A10@BY5PR04MB6900.namprd04.prod.outlook.com>
	<2553e593-795d-6aed-f983-e990a283e2ff@suse.de>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [129.253.182.57]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: f7f0cce3-71ff-40a4-e0b6-08d7f5a0fa66
x-ms-traffictypediagnostic: BY5PR04MB6801:
x-microsoft-antispam-prvs: <BY5PR04MB6801511F008857400C0D498CE7A10@BY5PR04MB6801.namprd04.prod.outlook.com>
wdcipoutbound: EOP-TRUE
x-ms-oob-tlc-oobclassifiers: OLM:7691;
x-forefront-prvs: 04004D94E2
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 8Qn3j9MZJQBWm99vOcEoNdLB0gcPfZyBv02yJhivEkU7IE/kwGgW5Esx/PwwVREv+NgycCa84q8n0souKizXJn6YFjJorgcpQwi0udcERfv765UM51PgnVUDoyxHAKUvSawavijiiY1NmW/tGZU7luw9PFpgOJRDG+kXJznFFVwAQTcVRPvfNRO5rw1sWRpcQdoKNNxNuN4jU8Bbygurb1YSEgGsKNODNB7X9ej/qt5QHh/TaWKKs0jem1++8G3q45Fb5wtcdQeTYiPkeV/GIZrwytZzxNnksisNWmS7RNFWsRyywptFM/RdVKgnac4CJETcub2gJWMQXd1VBEIRH01cN25Mrb1Mvp5I4p6WUmaQ9xwhdfpUmINp4NekEv8iSejuKMwUks6s9bZ5NApKhn0Fta/klKf9jjkaV1qnRIFNnzaf1WPbfrOnNwD3YUOBETutJ1EnXHTBq0lC+jD/E/R0JxNZlD2YMLdcUabXLcuFWEy8HSo9O5y0uchmQQsZcIIHrM1GjomLHRP5qDIr1A==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
	IPV:NLI; SFV:NSPM; H:BY5PR04MB6900.namprd04.prod.outlook.com;
	PTR:; CAT:NONE; SFTY:;
	SFS:(4636009)(396003)(366004)(39860400002)(136003)(346002)(376002)(33430700001)(8676002)(7696005)(478600001)(2906002)(55016002)(76116006)(26005)(4326008)(9686003)(186003)(53546011)(8936002)(6506007)(52536014)(33440700001)(5660300002)(54906003)(110136005)(86362001)(33656002)(316002)(66556008)(66476007)(66946007)(66446008)(64756008)(71200400001);
	DIR:OUT; SFP:1102;
x-ms-exchange-antispam-messagedata: cr4EjtJoWEFhW4LgaNVSLiyup4r8o0yzRNTpexF++jl1b98aNz6gUmbneK+rb9YG6ljGhU4BhN7XnomNvw4fM01WRCSItjcPcWzZyVafxGvpyZ0256hXCu4Kse7gTIVW/LOuc85xXgmGr0B49/r/MPPoxvWOT8tmCciZmEtYkf62VC6FKKzv853wDmGnqhw/NA7b7OvqMsJN76lsGEcK+jVYjueWEWaro+UidHOqbIp5X9cpK4m5CdkIAM2NaHTGCU+lEssUz5D/FhH367GcsleOfv82/tmX8xCElC5uOOjMem+bT4FVYVSl5A+BVUU1gWHBtEDB0e8PSSNxK3xsnVsi+Ea0fJgc9R5ezCVBSxSir/BIHxk4EYWKwwroQ3ltRCk58jRJP/JgUENBpmZ57vruNPI5v3LLaeliBaEGfGTSbYVcPaKgA6rvQDBQTTMYcnms0spMZlck1D3zRHzcbwxvMPG3RVlrI7hJnUFuwwWPEtoeQ/9Nb1GyNJb8VTqM
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f7f0cce3-71ff-40a4-e0b6-08d7f5a0fa66
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 May 2020 11:46:43.9200 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: hfrX4pmnOWugI+ua9MccTODj+btxeIVFJ9icktqGP63meKrCtDrZ1oNHy8lV/Hd8zBie7iUVPlXQR2mlayiE2w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR04MB6801
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 04BBkq52020140
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On 2020/05/11 20:25, Hannes Reinecke wrote:
> On 5/11/20 12:55 PM, Damien Le Moal wrote:
>> On 2020/05/11 11:46, Damien Le Moal wrote:
>>> Mike,
>>>
>>> I am still seeing the warning:
>>>
>>> [ 1827.839756] device-mapper: table: 253:1: adding target device sdj caused an
>>> alignment inconsistency: physical_block_size=4096, logical_block_size=4096,
>>> alignment_offset=0, start=0
>>> [ 1827.856738] device-mapper: table: 253:1: adding target device sdj caused an
>>> alignment inconsistency: physical_block_size=4096, logical_block_size=4096,
>>> alignment_offset=0, start=0
>>> [ 1827.874031] device-mapper: table: 253:1: adding target device sdj caused an
>>> alignment inconsistency: physical_block_size=4096, logical_block_size=4096,
>>> alignment_offset=0, start=0
>>> [ 1827.891086] device-mapper: table: 253:1: adding target device sdj caused an
>>> alignment inconsistency: physical_block_size=4096, logical_block_size=4096,
>>> alignment_offset=0, start=0
>>>
>>> when mixing 512B sector and 4KB sector devices. Investigating now.
>>
>>
>> OK. Figured that one out: the 500GB SSD I am using for the regular device is
>> 976773168 512B sectors capacity, that is, not a multiple of the 256MB zone size,
>> and not even a multiple of 4K. This causes the creation of a 12MB runt zone of
>> 24624 sectors, which is ignored. But the start sector of the second device in
>> the dm-table remains 976773168, so not aligned on 4K. This causes
>> bdev_stack_limits to return an error and the above messages to be printed.
>>
>> So I think we need to completely ignore the eventual "runt" zone of the regular
>> device so that everything aligns correctly. This will need changes in both
>> dmzadm and dm-zoned.
>>
>> Hannes, I can hack something on top of your series. Or can you resend with that
>> fixed ?
>>
>>
>>
>>
> Does this one help?

Nope. Same warning.

> 
> diff --git a/drivers/md/dm-zoned-target.c b/drivers/md/dm-zoned-target.c
> index ea43f6892ced..5daca82b5ec7 100644
> --- a/drivers/md/dm-zoned-target.c
> +++ b/drivers/md/dm-zoned-target.c
> @@ -1041,13 +1041,17 @@ static int dmz_iterate_devices(struct dm_target *ti,
>   {
>          struct dmz_target *dmz = ti->private;
>          unsigned int zone_nr_sectors = dmz_zone_nr_sectors(dmz->metadata);
> +       unsigned int nr_zones;
>          sector_t capacity;
>          int r;
> 
> -       capacity = dmz->dev[0].capacity & ~(zone_nr_sectors - 1);
> +       nr_zones = DIV_ROUND_DOWN(dmz->dev[0].capacity, zone_nr_sectors);
> +       capacity = nr_zones * zone_nr_sectors;

	capacity = round_down(dmz->dev[0].capacity, zone_nr_sectors);

is simpler :)

In any case, your change does seem to do anything here. Before and after, the
capacity is rounded down to full zones, excluding the last runt zone. I think it
is to do with the table entry start offset given on DM start by dmzadm...


>          r = fn(ti, dmz->ddev[0], 0, capacity, data);
>          if (!r && dmz->ddev[1]) {
> -               capacity = dmz->dev[1].capacity & ~(zone_nr_sectors - 1);
> +               nr_zones = DIV_ROUND_DOWN(dmz->dev[1.capacity,
> +                                                  zone_nr_sectors));
> +               capacity = nr_zones * zone_nr_sectors;
>                  r = fn(ti, dmz->ddev[1], 0, capacity, data);
>          }
>          return r;
> 
> Cheers,
> 
> Hannes
> 


-- 
Damien Le Moal
Western Digital Research



--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

