Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
	by mail.lfdr.de (Postfix) with ESMTP id D62FF1E54EF
	for <lists+dm-devel@lfdr.de>; Thu, 28 May 2020 06:20:38 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1590639637;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=SDJF1XMVYUppu8DvxRdzS2GqV+krBGiIoSzS3u1TonA=;
	b=LE6wDSvywS+K+LzoQDEHKk8JHQWXcZN99tQmLhMrbFEqH2VJRDuKRs2HVgHuN7h1w47hbd
	lAV3UZNH2oaHaaTFVGUVU4PIzJzu0dZTCvoNKfphr9N3pvO5W4gc7yYXl3xUbjO7BUxZ3f
	Kc2KtaevwLY83Dq57HzsNVokZzqe+zk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-273-o-dWHED-Pmuk6bLZVhcsfQ-1; Thu, 28 May 2020 00:20:35 -0400
X-MC-Unique: o-dWHED-Pmuk6bLZVhcsfQ-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 501E38014D7;
	Thu, 28 May 2020 04:20:30 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 6613310013D7;
	Thu, 28 May 2020 04:20:29 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 91BFF4ED9B;
	Thu, 28 May 2020 04:20:27 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 04S4KN2D003491 for <dm-devel@listman.util.phx.redhat.com>;
	Thu, 28 May 2020 00:20:23 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 1528E11701D3; Thu, 28 May 2020 04:20:23 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast06.extmail.prod.ext.rdu2.redhat.com [10.11.55.22])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 101AF11701CF
	for <dm-devel@redhat.com>; Thu, 28 May 2020 04:20:20 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 2F1B818A6664
	for <dm-devel@redhat.com>; Thu, 28 May 2020 04:20:20 +0000 (UTC)
Received: from esa3.hgst.iphmx.com (esa3.hgst.iphmx.com [216.71.153.141])
	(Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-28-47QJYZY6PL6PNNfzpb1N1A-1; Thu, 28 May 2020 00:20:15 -0400
X-MC-Unique: 47QJYZY6PL6PNNfzpb1N1A-1
IronPort-SDR: UMDr6JLC4QNgtfoMdWE/zsapU2EuD5uMSkHi1IUfAEBrCHY8etFNKL9t6uO+oZ42AuQY4w70mQ
	X863BhgatVNSAxPEWhN985sn+O3oANjIvMEPZ0ejNCbvqmXErFnKelRqBFt4IhiRI9Ha+NyeK0
	kxUPXMKCRqknWeHD9c+E4+tGE3uTCRQWXn4XoECmaiPJ30LCc5N/jhNX0tnhATha+RVg0OsT2J
	pKPiwpSAeJoBFI7APnd6wgZABevyChsd3u2AGIzVXbtabhL2Qke5T3h4vOr++Y0aWP+zJZVG9N
	gX8=
X-IronPort-AV: E=Sophos;i="5.73,443,1583164800"; d="scan'208";a="143005762"
Received: from mail-co1nam04lp2051.outbound.protection.outlook.com (HELO
	NAM04-CO1-obe.outbound.protection.outlook.com) ([104.47.45.51])
	by ob1.hgst.iphmx.com with ESMTP; 28 May 2020 12:20:06 +0800
Received: from CY4PR04MB3751.namprd04.prod.outlook.com (2603:10b6:903:ec::14)
	by CY4PR04MB0777.namprd04.prod.outlook.com (2603:10b6:903:e2::11)
	with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3045.19;
	Thu, 28 May 2020 04:20:05 +0000
Received: from CY4PR04MB3751.namprd04.prod.outlook.com
	([fe80::c593:f271:eebe:ac7]) by CY4PR04MB3751.namprd04.prod.outlook.com
	([fe80::c593:f271:eebe:ac7%9]) with mapi id 15.20.3021.029;
	Thu, 28 May 2020 04:20:05 +0000
From: Damien Le Moal <Damien.LeMoal@wdc.com>
To: "snitzer@redhat.com" <snitzer@redhat.com>, "hare@suse.de" <hare@suse.de>
Thread-Topic: [PATCHv2 00/15] dm-zoned: multi-device support
Thread-Index: AQHWM+882UBu6/wvek2L4SlOBin6Dqi78RiAgAD1jwA=
Date: Thu, 28 May 2020 04:20:05 +0000
Message-ID: <7b6bfa146c5ea2684d20dda7b0920d21fd0a1820.camel@wdc.com>
References: <20200527062225.72849-1-hare@suse.de>
	<20200527134110.GB19310@redhat.com>
In-Reply-To: <20200527134110.GB19310@redhat.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.36.2 (3.36.2-1.fc32)
x-originating-ip: [2400:2411:43c0:6000:62d1:16e6:ecb1:d604]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 1ecf728b-9262-416b-21a8-08d802be666c
x-ms-traffictypediagnostic: CY4PR04MB0777:
x-microsoft-antispam-prvs: <CY4PR04MB0777C2557A346DDDEDDEEA26E78E0@CY4PR04MB0777.namprd04.prod.outlook.com>
wdcipoutbound: EOP-TRUE
x-ms-oob-tlc-oobclassifiers: OLM:3826;
x-forefront-prvs: 0417A3FFD2
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 2AHXUbV53CPhYQDrhXh15EQiMWim2J3OmVLS/hW/o6CqeoHIZOzqbgWD2OPL5GpVjHndUYNAhGFuxAYTi4PwsLo7IgV3Q0et+oAUi8eznBMnLs+vxpqAZqWeIzhZZppDrI/LfBNf305FuiqDyAhCNV9KLd+fPOKMaGfFIGgMWFF4JbrANwys+5e//hK86JvaIv5/E2Ag99WzhEnMf3UxxaJbibsKPT1Km8Umw/TLVSRDQtnOPr374AuwoGCzz5w0gKY3VLmD3RnjbC6gHKzCSFP1AtdHvBVYOlcGcfQ6d+hH6SXnm+J2ngSNhjT2q82FYCcMkfUpeMl4z58cipj+tA==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
	IPV:NLI; SFV:NSPM; H:CY4PR04MB3751.namprd04.prod.outlook.com;
	PTR:; CAT:NONE; SFTY:;
	SFS:(4636009)(136003)(346002)(376002)(39860400002)(396003)(366004)(4326008)(64756008)(66556008)(91956017)(66446008)(76116006)(66476007)(66946007)(2616005)(6506007)(5660300002)(8676002)(71200400001)(6486002)(8936002)(478600001)(186003)(2906002)(6512007)(86362001)(110136005)(316002)(83380400001)(36756003);
	DIR:OUT; SFP:1102;
x-ms-exchange-antispam-messagedata: CgPmRKjj6Ow7Jpdl9PjpqNKRS5omDjivXd7L+niUIhb9WSEF7dsEaprlU3YmfpTnA4S14/M0AL1x1Sef/YYBoSvegY2tGsw0LWdCgpHTqBrMLB3lQ+r2zhDqdco+JhlWC2fDMz13bfyV99N5Pg+SfSB5QUxkIY5SGw/lkSrfnpJ8OOYUL/3zkW4bzmgS+uVnoGQkmxn7NY7R0u3vl3a89RE5BHwi7Ur9RU5GIzmlLFQXHjkMitltjfewcWZOTi94k7mSPlNAXPGHLiGqggEF6mBWUz2Yb8fY+wcAoDyUHxDW9V5Ra9bB8QpYX+nXrHo1OYfK1Gz2VKykRKT/1IVHpV4wZU1kbBqOQxe9b6RYrS1OzVYr0Av1nLBhM4ycKJbkb2BdyALo08cINAnQIs/lB5f4bb3PMUHOhvG+0smtZYwYzvscGQcWTY30PZ5cWS/Uxl/tMHuzVV6QEp7/x0L9dVAUzilRmCO5czI7f47/ros/ylPAc+UTzwqgTG96ypFzaQuEXW/QKne8VDrR1Q+ZGJHe2BLMzL1b2W/kV+ZqAL5FzU1SgDR7FbkO14ogYinG
x-ms-exchange-transport-forked: True
Content-ID: <4A262ECE94DC6846909F5A033B05032F@namprd04.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1ecf728b-9262-416b-21a8-08d802be666c
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 May 2020 04:20:05.6500 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: TgotPbhgkdRRK3zRyLObiXq/Hk8/gT4EkZxY8QSJPLPC6S1bDfHA2AuzPapy17m7d+Ry+pzrob5GOiC6muinWQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR04MB0777
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
X-MIME-Autoconverted: from base64 to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 04S4KN2D003491
X-loop: dm-devel@redhat.com
Cc: "dm-devel@redhat.com" <dm-devel@redhat.com>
Subject: Re: [dm-devel] [PATCHv2 00/15] dm-zoned: multi-device support
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

On Wed, 2020-05-27 at 09:41 -0400, Mike Snitzer wrote:
> On Wed, May 27 2020 at  2:22am -0400,
> Hannes Reinecke <hare@suse.de> wrote:
> 
> > Hi all,
> > 
> > here's the second version of my patchset to support multiple zoned
> > drives with dm-zoned.
> > This patchset:
> > - Converts the zone array to using xarray for better scalability
> > - Separates out shared structures into per-device structure
> > - Enforce drive-locality for allocating and reclaiming zones
> > - Lifts the restriction of 2 devices to handle an arbitrary number
> >   of drives.
> > 
> > This gives me a near-perfect scalability by increasing the write
> > speed from 150MB/s (for a cache and one zoned drive) to 300MB/s
> > (for a cache and two zoned drives).
> > 
> > Changes to v1:
> > - Include reviews from Damien
> > - Reshuffle patches
> > 
> > Hannes Reinecke (15):
> >   dm-zoned: add debugging message for reading superblocks
> >   dm-zoned: secondary superblock must reside on the same devices than
> >     primary superblock
> >   dm-zoned: improve logging messages for reclaim
> >   dm-zoned: add a 'reserved' zone flag
> >   dm-zoned: convert to xarray
> >   dm-zoned: temporary superblock for tertiary devices
> >   dm-zoned: add device pointer to struct dm_zone
> >   dm-zoned: add metadata pointer to struct dmz_dev
> >   dm-zoned: allocate dm devices dynamically
> >   dm-zoned: per-device reclaim
> >   dm-zoned: move random and sequential zones into struct dmz_dev
> >   dm-zoned: support arbitrary number of devices
> >   dm-zoned: allocate zone by device index
> >   dm-zoned: select reclaim zone based on device index
> >   dm-zoned: prefer full zones for reclaim
> > 
> >  drivers/md/dm-zoned-metadata.c | 448 ++++++++++++++++++++++++-----------------
> >  drivers/md/dm-zoned-reclaim.c  |  95 +++++----
> >  drivers/md/dm-zoned-target.c   | 169 ++++++++++------
> >  drivers/md/dm-zoned.h          |  77 ++++---
> >  4 files changed, 481 insertions(+), 308 deletions(-)
> 
> Would you still like to wait until the 5.9 merge window?
> 
> Or would you prefer to see these changes land for 5.8 so as to limit the
> variants of related code that needs to be supported?
> 
> If you and Damien are OK with 5.8 (and testing backs that up) then I
> should be able to get it to land.

Yes, it would be nice to have all the recent changes under dm-zoned V2.
I just reviewed Hannes V2 series and I am running tests right now. So
far so good. Will send results by the end of my day.

What is your deadline for a final series to make it to 5.8 ? This end
of week ? If Hannes has time to rework another round, we should be good
then.

Thanks.

> 
> Let me know, thanks.
> Mike
> 

-- 
Damien Le Moal
Western Digital Research

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

