Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com [205.139.110.120])
	by mail.lfdr.de (Postfix) with ESMTP id 15DFB1B341D
	for <lists+dm-devel@lfdr.de>; Wed, 22 Apr 2020 02:43:09 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1587516189;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 references:references:list-id:list-help:list-unsubscribe:
	 list-subscribe:list-post; bh=//4Yj43o8SADJ8bJRGfn9ZrphR1CmKRmxTbJpQD/DLs=;
	b=e8uFxDv/Qa+Xzlb2xtSkXM1sRxdUGe14w0BLX22g1eOQiQH1JNN7zTeb524FN2fm0TJcIJ
	1X/ALxFNshCLIUwgTw7YBsUwwhd9EoUDyPTT4GZ6Jhpoops+qlpIdrrZBBmyK2ZxI4s1Cv
	7GewM4byRWl+JMb7fmYTCfxjhVxL1Co=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-494-fd5Mr0KmPk2USlE6pRMSgQ-1; Tue, 21 Apr 2020 20:43:06 -0400
X-MC-Unique: fd5Mr0KmPk2USlE6pRMSgQ-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 9ABC9107ACC7;
	Wed, 22 Apr 2020 00:42:59 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 28630B3A6D;
	Wed, 22 Apr 2020 00:42:55 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 0450D1809567;
	Wed, 22 Apr 2020 00:42:42 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 03M0gQT0020959 for <dm-devel@listman.util.phx.redhat.com>;
	Tue, 21 Apr 2020 20:42:26 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 73DEFF103F; Wed, 22 Apr 2020 00:42:26 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast05.extmail.prod.ext.rdu2.redhat.com [10.11.55.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 6F3CAF18B6
	for <dm-devel@redhat.com>; Wed, 22 Apr 2020 00:42:20 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id AEBAC800297
	for <dm-devel@redhat.com>; Wed, 22 Apr 2020 00:42:20 +0000 (UTC)
Received: from esa5.hgst.iphmx.com (esa5.hgst.iphmx.com [216.71.153.144])
	(Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-13-CAsk1vsLNQy0_cMTbC8dYQ-1; Tue, 21 Apr 2020 20:42:18 -0400
X-MC-Unique: CAsk1vsLNQy0_cMTbC8dYQ-1
IronPort-SDR: 1Ju3NEx6nadbfCg1ykOuUTJ3As1C3v7qoFP4lJZls0yffOG9RsG9fXObWSsKBR+XUejcYu0g/k
	UmnWheIhD7W/osNmseBiU7UuhkfC8Gn+7Iejl3q/CEEEitbLcWxhVu6ClfI+c48tKTFpeRdN/O
	sdWHs6GvO5U8gZY3Lp4+76jtVIq5q3JxEOUZL6IoKIR98VyNq3Km6cgBol/NJzWZVrMlP/6+K8
	0r28rSKblTSioYDnO+vtFd0Bqi2sm9aAQZCW92kO5KSc7uiExiVedPezGV51vsEPgM8eHtybTK
	UoE=
X-IronPort-AV: E=Sophos;i="5.72,412,1580745600"; d="scan'208";a="136145632"
Received: from mail-dm6nam12lp2177.outbound.protection.outlook.com (HELO
	NAM12-DM6-obe.outbound.protection.outlook.com) ([104.47.59.177])
	by ob1.hgst.iphmx.com with ESMTP; 22 Apr 2020 08:42:17 +0800
Received: from BY5PR04MB6900.namprd04.prod.outlook.com (2603:10b6:a03:229::20)
	by BY5PR04MB6834.namprd04.prod.outlook.com (2603:10b6:a03:22d::13)
	with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2921.29;
	Wed, 22 Apr 2020 00:42:15 +0000
Received: from BY5PR04MB6900.namprd04.prod.outlook.com
	([fe80::b574:3071:da2f:7606]) by
	BY5PR04MB6900.namprd04.prod.outlook.com
	([fe80::b574:3071:da2f:7606%6]) with mapi id 15.20.2921.030;
	Wed, 22 Apr 2020 00:42:15 +0000
From: Damien Le Moal <Damien.LeMoal@wdc.com>
To: Hannes Reinecke <hare@suse.de>, Mike Snitzer <snitzer@redhat.com>
Thread-Topic: [PATCHv4 00/13] dm-zoned: metadata version 2
Thread-Index: AQHWFvuwFXY3Vrmxwk+EGdTsMIMjfQ==
Date: Wed, 22 Apr 2020 00:42:14 +0000
Message-ID: <BY5PR04MB6900F17110FEBC850C8E6806E7D20@BY5PR04MB6900.namprd04.prod.outlook.com>
References: <20200420100824.124618-1-hare@suse.de>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [199.255.47.8]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 46ab5c1d-870a-4fde-fb44-08d7e65600cb
x-ms-traffictypediagnostic: BY5PR04MB6834:
x-microsoft-antispam-prvs: <BY5PR04MB6834CC30C5E478EBA53CCAF9E7D20@BY5PR04MB6834.namprd04.prod.outlook.com>
wdcipoutbound: EOP-TRUE
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-forefront-prvs: 03818C953D
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
	IPV:NLI; SFV:NSPM; H:BY5PR04MB6900.namprd04.prod.outlook.com;
	PTR:; CAT:NONE; SFTY:;
	SFS:(10019020)(4636009)(346002)(136003)(366004)(396003)(39860400002)(376002)(478600001)(8676002)(55016002)(33656002)(71200400001)(66556008)(52536014)(66446008)(64756008)(66946007)(66476007)(81156014)(9686003)(2906002)(316002)(8936002)(4326008)(110136005)(54906003)(76116006)(7696005)(5660300002)(91956017)(6506007)(53546011)(86362001)(186003)(26005);
	DIR:OUT; SFP:1102;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: hCOG2b2n4Ly0E/W7r0LqXnoHZEmsl/db+1JWp1f+AUmIjBa1P6jztXFbYjf69A0sCMftX3Xx0nlBjnR/2xYfHCe99GC+S2ZXrNEspz8YKvxXgRMhxNtB7t1eomdU0hOy28/iV8VY3xqMOFbWWXVN2POgqMywwF4+d4HfdldZfZan29VkwTpjFi+UGRd/ElGmNR2uaRQtqVXyQu5pLq3MAyfUIgmjQcWGIF/NlZbC3QHiGjdHlbcxutctmAqt4ENht8imAgfZTjTYIpBrxrGtxUNKq0acmsdrzuKcCF7qBaWnVbNT2IDv5UWRPGL92FhgITaTdJRDfEm1cWKDPfHbDhrT9kumIIiPPTypXocuDk0P3EXTijFSK+0K3kZmas35MRKBkWJ8dAtCIEgIlBHypHK5m8qWDfOMF+PCdTuEJ9CQFqGsyuRWd+9szjPQkXih
x-ms-exchange-antispam-messagedata: SGAh+i7uPVvUGDCRATm77p8yahfJQd1H2+oKTwzFCKywzrD0kEI5EVvRul0tn+/+PHqeVIMc1e+eQlzLheu97b4vZ4LCCwgZXTR1eTxZUvza4o887qq6rsZAgJ3aVIBNeBRv5lC1OtoNcdDRCf9IWA==
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 46ab5c1d-870a-4fde-fb44-08d7e65600cb
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Apr 2020 00:42:14.9336 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: IKen76xKBFAIj+iIUDmIM2yRuP1GQv+3Q13YX3eu836aEzQSJgwF/RNoxYG93wyrOcwoJV99H/vhIkR/w69y/Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR04MB6834
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 03M0gQT0020959
X-loop: dm-devel@redhat.com
Cc: Bob Liu <bob.liu@oracle.com>, "dm-devel@redhat.com" <dm-devel@redhat.com>
Subject: Re: [dm-devel] [PATCHv4 00/13] dm-zoned: metadata version 2
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

On 2020/04/20 19:08, Hannes Reinecke wrote:
> Hi all,
> 
> this patchset adds a new metadata version 2 for dm-zoned, which brings the
> following improvements:
> - UUIDs and labels: Adding three more fields to the metadata containing
>   the dm-zoned device UUID and label, and the device UUID. This allows
>   for an unique identification of the devices, so that several dm-zoned
>   sets can coexist and have a persistent identification.
> - Extend random zones by an additional regular disk device: A regular
>   block device can be added together with the zoned block device, providing
>   additional (emulated) random write zones. With this it's possible to
>   handle sequential zones only devices; also there will be a speed-up if
>   the regular block device resides on a fast medium. The regular block device
>   is placed logically in front of the zoned block device, so that metadata
>   and mapping tables reside on the regular block device, not the zoned device.
> - Tertiary superblock support: In addition to the two existing sets of metadata
>   another, tertiary, superblock is written to the first block of the zoned
>   block device. This superblock is for identification only; the generation
>   number is set to '0' and the block itself it never updated. The additional
>   metadate like bitmap tables etc are not copied.
> 
> To handle this, some changes to the original handling are introduced:
> - Zones are now equidistant. Originally, runt zones were ignored, and
>   not counted when sizing the mapping tables. With the dual device setup
>   runt zones might occur at the end of the regular block device, making
>   direct translation between zone number and sector/block number complex.
>   For metadata version 2 all zones are considered to be of the same size,
>   and runt zones are simply marked as 'offline' to have them ignored when
>   allocating a new zone.
> - The block number in the superblock is now the global number, and refers to
>   the location of the superblock relative to the resulting device-mapper
>   device. Which means that the tertiary superblock contains absolute block
>   addresses, which needs to be translated to the relative device addresses
>   to find the referenced block.
> 
> There is an accompanying patchset for dm-zoned-tools for writing and checking
> this new metadata.
> 
> As usual, comments and reviews are welcome.

Not forgetting this, just late reviewing. At a glance, I think this is all good,
but I would like have another good round of review and to run it through our
dm-zoned tests :) Will do that today or tomorrow.

Thanks !


> 
> Changes to v3:
> - Reorder devices such that the regular device is always at position 0,
>   and the zoned device is always at position 1.
> - Split off dmz_dev_is_dying() into a separate patch
> - Include reviews from Damien
> 
> Changes to v2:
> - Kill dmz_id()
> - Include reviews from Damien
> - Sanitize uuid handling as suggested by John Dorminy
> 
> 
> Hannes Reinecke (13):
>   dm-zoned: add 'status' and 'message' callbacks
>   dm-zoned: store zone id within the zone structure and kill dmz_id()
>   dm-zoned: use array for superblock zones
>   dm-zoned: store device in struct dmz_sb
>   dm-zoned: move fields from struct dmz_dev to dmz_metadata
>   dm-zoned: introduce dmz_metadata_label() to format device name
>   dm-zoned: Introduce dmz_dev_is_dying() and dmz_check_dev()
>   dm-zoned: remove 'dev' argument from reclaim
>   dm-zoned: replace 'target' pointer in the bio context
>   dm-zoned: use dmz_zone_to_dev() when handling metadata I/O
>   dm-zoned: add metadata logging functions
>   dm-zoned: ignore metadata zone in dmz_alloc_zone()
>   dm-zoned: metadata version 2
> 
>  drivers/md/dm-zoned-metadata.c | 658 +++++++++++++++++++++++++++++++----------
>  drivers/md/dm-zoned-reclaim.c  |  88 +++---
>  drivers/md/dm-zoned-target.c   | 331 +++++++++++++--------
>  drivers/md/dm-zoned.h          |  33 ++-
>  4 files changed, 780 insertions(+), 330 deletions(-)
> 


-- 
Damien Le Moal
Western Digital Research



--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

