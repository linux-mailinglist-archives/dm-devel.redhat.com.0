Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
	by mail.lfdr.de (Postfix) with ESMTP id 5E1D51CD223
	for <lists+dm-devel@lfdr.de>; Mon, 11 May 2020 08:55:46 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1589180145;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 references:references:list-id:list-help:list-unsubscribe:
	 list-subscribe:list-post; bh=0FhRJztBCzjjSqkM+2677ey0Wf//I0TOmdPu6RNJx5Y=;
	b=UTc7wYWlA6HgbUDBx7dtGZhgwivVtwDxY2gNqG/JGMTCW6GPn5cmijWvj5VcMMcOeSL8OW
	/wCyhJ14nFwFfEZLrsbn89tZNk309g+GTGos+vgYioXC61MWUjChpiR5AoxmjgMGSpjiSX
	WxtmamJY4frFUK4KpLnPwDzC5M+3lnY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-197-GK0JWy5xOMWo_X92FThL7A-1; Mon, 11 May 2020 02:55:41 -0400
X-MC-Unique: GK0JWy5xOMWo_X92FThL7A-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 736D6107ACCD;
	Mon, 11 May 2020 06:55:35 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 179D91001920;
	Mon, 11 May 2020 06:55:32 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id EFAFB4E561;
	Mon, 11 May 2020 06:55:27 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 04B6tHkN024132 for <dm-devel@listman.util.phx.redhat.com>;
	Mon, 11 May 2020 02:55:17 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id B93B92166B28; Mon, 11 May 2020 06:55:17 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast04.extmail.prod.ext.rdu2.redhat.com [10.11.55.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id B48C02157F24
	for <dm-devel@redhat.com>; Mon, 11 May 2020 06:55:14 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 77586101A526
	for <dm-devel@redhat.com>; Mon, 11 May 2020 06:55:14 +0000 (UTC)
Received: from esa2.hgst.iphmx.com (esa2.hgst.iphmx.com [68.232.143.124])
	(Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-359-P5V9m47UPFasno9MUGxKgw-1; Mon, 11 May 2020 02:55:08 -0400
X-MC-Unique: P5V9m47UPFasno9MUGxKgw-1
IronPort-SDR: kzRe7RSL70eEidTGtjdWGl7oP3Fg0NWIpz0Xv8enfy/SbgkwkEusneS/l4vb+PsZ0Q4CFdX7Nu
	zHuKUJVknwwQlqD7dxR/DaIFj4m5Kf7MmKlzzjnlToBI/pO1TcSaQeI+VXllSltXSOtm3e8xta
	MV0ZEBJW1fOdkupCdl97vsEdklMVTpaKnHBZ4VGS3pc48w6pFDyJD8l42ur6Mrxrz7aVxlcCVc
	OBDfg0U2oqzqTLGmngMlWDKnxkUuRDv0szkis7VZ8RD2qQr1EN6PSgPwgUlrdVaahb+pARa6sP
	3vQ=
X-IronPort-AV: E=Sophos;i="5.73,378,1583164800"; d="scan'208";a="240066856"
Received: from mail-dm6nam11lp2176.outbound.protection.outlook.com (HELO
	NAM11-DM6-obe.outbound.protection.outlook.com) ([104.47.57.176])
	by ob1.hgst.iphmx.com with ESMTP; 11 May 2020 14:55:25 +0800
Received: from BY5PR04MB6900.namprd04.prod.outlook.com (2603:10b6:a03:229::20)
	by BY5PR04MB6278.namprd04.prod.outlook.com (2603:10b6:a03:1eb::14)
	with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2979.26;
	Mon, 11 May 2020 06:55:04 +0000
Received: from BY5PR04MB6900.namprd04.prod.outlook.com
	([fe80::b574:3071:da2f:7606]) by
	BY5PR04MB6900.namprd04.prod.outlook.com
	([fe80::b574:3071:da2f:7606%6]) with mapi id 15.20.2979.033;
	Mon, 11 May 2020 06:55:04 +0000
From: Damien Le Moal <Damien.LeMoal@wdc.com>
To: Hannes Reinecke <hare@suse.de>, Mike Snitzer <snitzer@redhat.com>
Thread-Topic: [PATCHv5 00/14] dm-zoned: metadata version 2
Thread-Index: AQHWJRechFCM8ZarfEqHZb3tednc9w==
Date: Mon, 11 May 2020 06:55:04 +0000
Message-ID: <BY5PR04MB69009A2DBA8782E65AF7B6D8E7A10@BY5PR04MB6900.namprd04.prod.outlook.com>
References: <20200508090332.40716-1-hare@suse.de>
	<BY5PR04MB6900138C0F78196D0F81BF07E7A10@BY5PR04MB6900.namprd04.prod.outlook.com>
	<1e68571f-0205-93c8-e535-a472c1a7b5d8@suse.de>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [129.253.182.57]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 45bae500-1ceb-420c-13a8-08d7f5783c0e
x-ms-traffictypediagnostic: BY5PR04MB6278:
x-microsoft-antispam-prvs: <BY5PR04MB6278CCC7F8A31BB65FD60917E7A10@BY5PR04MB6278.namprd04.prod.outlook.com>
wdcipoutbound: EOP-TRUE
x-ms-oob-tlc-oobclassifiers: OLM:6108;
x-forefront-prvs: 04004D94E2
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: LHcq05f7aYd3dq4vYdE0Ab4yBWtV1sMNw3XG4lT/156YIUN+OFTxoaNQkpauz7vQ9pNYsgXrGluXDCs+BBHZO3K3RciZuitWFvTkGHjq6qmbRhN52saIQi5zDccQzN0IGYYhBQ9SjnxI49FoTPhclF3x2FLLy5O4YrLxa/sHB/Mrz+DGfWYXCu1C1xgyEsd49x0Y6iBqxEWEhQyYFbsdoaag9qiZDSo7J0s02diDlgP8x6O+OpeezBf42PUzHQhPxauM9fulRMycIkkOCiYbjoRwfPYrT2o+utzfTR32PXLutZUn+pvD5dd5ANmBsneckxKl0RV3lyl/Rdee0luBbpnzxi7iLruNPi9WALH1gw0p2J3K/GbLQCtAqBIqc4UjcyjbJSfrMDrSX+kcoYvfpbExHZ0h6VlR0JRz9isGAck+VVPfTc1blKKhCui5IjcLgONkshp9Qdk/HVbVUck37NW/oE06g0mWPOmUaKYKLJi1eyuVf+TrzDXXCW7gT1zO29NTMNN4K+oXpZ79eeWEm2k0CFZlZTImgFCYFkfSd9fVhFfirGiTmm5rm2UdTlp6
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
	IPV:NLI; SFV:NSPM; H:BY5PR04MB6900.namprd04.prod.outlook.com;
	PTR:; CAT:NONE; SFTY:;
	SFS:(4636009)(136003)(346002)(366004)(376002)(39860400002)(396003)(33430700001)(8676002)(8936002)(33656002)(110136005)(54906003)(52536014)(33440700001)(316002)(2906002)(5660300002)(71200400001)(76116006)(9686003)(86362001)(186003)(26005)(55016002)(53546011)(7696005)(66476007)(4326008)(66446008)(66556008)(478600001)(6506007)(64756008)(66946007)(21314003);
	DIR:OUT; SFP:1102;
x-ms-exchange-antispam-messagedata: s3T3UVzOasWUCLYbJfMRKQv8sc0mzM5dQ2/rsIoELd8uw5/QJQx+zdhibbKJw4SeAJJFGGcJJ4HGJqBf0dbmO8eXdNi5Sd7i24+G6SHzYwsTtWVeedpBt37mDIrQDutal7Ys7OFP2cSSpqFDtBC9UomAxdONGsH7B/IG1tF1o8oPEJQ8a3+dvhsLAPmIwY54OT+sXRQUa/S3nrXtLKC5UiGfdPlj/VQ81zTllhfT7Q0MejkCcghDYnEBqmBwudtRKx98Oomyau4QflzQcoC9HmigImaP8jwMCBxa7yIyLdIRznRVISfPGFCD7LEcWE0G1gYKBVHTY+Q/r2En9NcYcaGf9kVV2OnEvO5nsZhA4hSR6lEdbMTebGvKcWq1KlOKJDe3OasZLkwAFAb2LQcWSkfb6A3mTgUGMb/FNvMHUvrNCN14ikdaHT2h28N3JYTgNXB4GskHB3GGrBY17TSSX2XA36HHXRq/IdGTKHeJU3RMsl3ZsseoW3XDomJ24zCw
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 45bae500-1ceb-420c-13a8-08d7f5783c0e
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 May 2020 06:55:04.7027 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: OfepCC/NaSBl/R44gTjKovkcQW+bkagSxsbYFxqLzCLvLEOtHvrZ1aRtCDoPZ7Dc1o2ONY55GwgLAGcWIfiQag==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR04MB6278
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 04B6tHkN024132
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

On 2020/05/11 15:31, Hannes Reinecke wrote:
> On 5/11/20 4:46 AM, Damien Le Moal wrote:
>> On 2020/05/08 18:03, Hannes Reinecke wrote:
>>> Hi all,
>>>
>>> this patchset adds a new metadata version 2 for dm-zoned, which brings the
>>> following improvements:
>>>
>>> - UUIDs and labels: Adding three more fields to the metadata containing
>>>    the dm-zoned device UUID and label, and the device UUID. This allows
>>>    for an unique identification of the devices, so that several dm-zoned
>>>    sets can coexist and have a persistent identification.
>>> - Extend random zones by an additional regular disk device: A regular
>>>    block device can be added together with the zoned block device, providing
>>>    additional (emulated) random write zones. With this it's possible to
>>>    handle sequential zones only devices; also there will be a speed-up if
>>>    the regular block device resides on a fast medium. The regular block device
>>>    is placed logically in front of the zoned block device, so that metadata
>>>    and mapping tables reside on the regular block device, not the zoned device.
>>> - Tertiary superblock support: In addition to the two existing sets of metadata
>>>    another, tertiary, superblock is written to the first block of the zoned
>>>    block device. This superblock is for identification only; the generation
>>>    number is set to '0' and the block itself it never updated. The addition
>>>    metadate like bitmap tables etc are not copied.
>>>
>>> To handle this, some changes to the original handling are introduced:
>>> - Zones are now equidistant. Originally, runt zones were ignored, and
>>>    not counted when sizing the mapping tables. With the dual device setup
>>>    runt zones might occur at the end of the regular block device, making
>>>    direct translation between zone number and sector/block number complex.
>>>    For metadata version 2 all zones are considered to be of the same size,
>>>    and runt zones are simply marked as 'offline' to have them ignored when
>>>    allocating a new zone.
>>> - The block number in the superblock is now the global number, and refers to
>>>    the location of the superblock relative to the resulting device-mapper
>>>    device. Which means that the tertiary superblock contains absolute block
>>>    addresses, which needs to be translated to the relative device addresses
>>>    to find the referenced block.
>>>
>>> There is an accompanying patchset for dm-zoned-tools for writing and checking
>>> this new metadata.
>>>
>>> As usual, comments and reviews are welcome.
>>
>> I gave this series a good round of testing. See the attached picture for the
>> results. The test is this:
>> 1) Setup dm-zoned
>> 2) Format and mount with mkfs.ext4 -E packed_meta_blocks=1 /dev/mapper/xxx
>> 3) Create file random in size between 1 and 4MB and measure user seen throughput
>> over 100 files.
>> 3) Run that for 2 hours
>>
>> I ran this over a 15TB SMR drive single drive setup, and on the same drive + a
>> 500GB m.2 ssd added.
>>
>> For the single drive case, the usual 3 phases can be seen: start writing at
>> about 110MB/s, everything going to conventional zones (note conv zones are in
>> the middle of the disk, hence the low-ish throughput). Then after about 400s,
>> reclaim kicks in and the throughput drops to 60-70 MB/s. As reclaim cannot keep
>> up under this heavy write workload, performance drops to 20-30MB/s after 800s.
>> All good, without any idle time for reclaim to do its job, this is all expected.
>>
>> For the dual drive case, things are more interesting:
>> 1) The first phase is longer as overall, there is more conventional space (500G
>> ssd + 400G on SMR drive). So we see the SSD speed first (~425MB/s), then the
>> drive speed (100 MB/s), slightly lower than the single drive case toward the end
>> as reclaim triggers.
>> 2) Some recovery back to ssd speed, then a long phase at half the speed of the
>> ssd as writes go to ssd and reclaim is running moving data out of the ssd onto
>> the disk.
>> 3) Then a long phase at 25MB/s due to SMR disk reclaim.
>> 4) back up to half the ssd speed.
>>
>> No crashes, no data corruption, all good. But is does look like we can improve
>> on performance further by preventing using the drive conventional zones as
>> "buffer" zones. If we let those be the final resting place of data, the SMR disk
>> only reclaim would not kick in and hurt performance as seen here. That I think
>> can all be done on top of this series though. Let's get this in first.
>>
> Thanks for the data! That indeed is very interesting; guess I'll do some 
> tests here on my setup, too.
> (And hope it doesn't burn my NVDIMM ...)
> 
> But, guess what, I had the some thoughts; we should be treating the 
> random zones more like sequential zones in a two-disk setup.
> So guess I'll be resurrecting the idea from my very first patch and 
> implement 'cache' zones in addition to the existing 'random' and 
> 'sequential' zones.

Yes, exactly. With that, reclaim can be modified simply to work only on cache
zones and do not touch random zones. That will also work nicely for both single
and dual drive setups, with the difference that single drive will have no random
zones (all conventional zones will be cache zones).

With that, we could also play with intelligent zone allocation on the SMR drive
to try to put data that is most susceptible to change in random zones. Doing so,
we can do update in-place after the first reclaim of a cache zone into a random
zone and reduce overall reclaim overhead.

> But, as you said, that'll be a next series of patches.
> 
> What program did you use as a load generator?
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

