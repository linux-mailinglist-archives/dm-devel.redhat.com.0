Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
	by mail.lfdr.de (Postfix) with ESMTP id 0C1771A73CB
	for <lists+dm-devel@lfdr.de>; Tue, 14 Apr 2020 08:39:08 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1586846348;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 references:references:list-id:list-help:list-unsubscribe:
	 list-subscribe:list-post; bh=WTyM2TAV1uv9iF9QVtdNSSjIR5Cferwg9giVZOMapXI=;
	b=K2gRpH++vW/cKx2bwPP0MtxkObbWRU+oaclmFlVkR6d70BFO7hBPIXv00nos4f67NbbdYC
	1EcLzN4xje5D1I1UDKUS3xO+o6khxB58XXJO4W6NGrHTKRuJZoyVtIOd9VX0qmLxJBzVLd
	HUnvxhLdNwoNTmpMH3ERRW27XGacO0c=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-205-4Sz17dL9OjuxkFNT5pEWXQ-1; Tue, 14 Apr 2020 02:39:05 -0400
X-MC-Unique: 4Sz17dL9OjuxkFNT5pEWXQ-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 940828018AC;
	Tue, 14 Apr 2020 06:38:59 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 3D5059F9A4;
	Tue, 14 Apr 2020 06:38:59 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id B756A93068;
	Tue, 14 Apr 2020 06:38:57 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 03E6bjfO005272 for <dm-devel@listman.util.phx.redhat.com>;
	Tue, 14 Apr 2020 02:37:45 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id B0E3D2028CD5; Tue, 14 Apr 2020 06:37:45 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast02.extmail.prod.ext.rdu2.redhat.com [10.11.55.18])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id AB15420267F2
	for <dm-devel@redhat.com>; Tue, 14 Apr 2020 06:37:43 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 2C8DF8007D0
	for <dm-devel@redhat.com>; Tue, 14 Apr 2020 06:37:43 +0000 (UTC)
Received: from esa6.hgst.iphmx.com (esa6.hgst.iphmx.com [216.71.154.45])
	(Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-86-niT2ZxkJNq-30TP-ktLOqw-1; Tue, 14 Apr 2020 02:37:37 -0400
X-MC-Unique: niT2ZxkJNq-30TP-ktLOqw-1
IronPort-SDR: O5UxpG4xrIoBDgs1OBPYjWzoEHWcBuRGEaHDlZK/ESnJNCAMtgAEesHE69/uyVcHNfz+yNjJhc
	Wnb+nZ2/QwB2fnze09BZ5LFrpf1SmU/LR9yzdxZJNRiNe0jEnFLVa/HI1rOvVxby9LLK7tY64J
	lF2cJvgkVXeQchQbTDWknJm+8F7binsVxEUiOLT5yD7hmOjAB63u877JyYLBDt5S4OvvVsmkgt
	PquYBebaHKCzq/JSSmtbdGKyy3nm0fHA4kQzr26aytReq47QzaOSYT0Myvq1cCux1TlHnj5IJs
	QGg=
X-IronPort-AV: E=Sophos;i="5.72,381,1580745600"; d="scan'208";a="136711650"
Received: from mail-bn7nam10lp2109.outbound.protection.outlook.com (HELO
	NAM10-BN7-obe.outbound.protection.outlook.com) ([104.47.70.109])
	by ob1.hgst.iphmx.com with ESMTP; 14 Apr 2020 14:37:36 +0800
Received: from BY5PR04MB6900.namprd04.prod.outlook.com (2603:10b6:a03:229::20)
	by BY5PR04MB6519.namprd04.prod.outlook.com (2603:10b6:a03:1d5::7)
	with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2900.26;
	Tue, 14 Apr 2020 06:37:33 +0000
Received: from BY5PR04MB6900.namprd04.prod.outlook.com
	([fe80::b574:3071:da2f:7606]) by
	BY5PR04MB6900.namprd04.prod.outlook.com
	([fe80::b574:3071:da2f:7606%5]) with mapi id 15.20.2900.028;
	Tue, 14 Apr 2020 06:37:33 +0000
From: Damien Le Moal <Damien.LeMoal@wdc.com>
To: Hannes Reinecke <hare@suse.de>, Mike Snitzer <snitzer@redhat.com>
Thread-Topic: [PATCH 06/11] dm-zoned: remove 'dev' argument from reclaim
Thread-Index: AQHWDjp6ZKX4rcXjzUO8GT29UfUPOA==
Date: Tue, 14 Apr 2020 06:37:33 +0000
Message-ID: <BY5PR04MB6900FEA91E3FFC617A885F25E7DA0@BY5PR04MB6900.namprd04.prod.outlook.com>
References: <20200409064527.82992-1-hare@suse.de>
	<20200409064527.82992-7-hare@suse.de>
	<BY5PR04MB69009A34D81599FF8208A014E7DE0@BY5PR04MB6900.namprd04.prod.outlook.com>
	<9a5ae1d5-4769-c1fa-2a52-f1f8fd6b25e0@suse.de>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [129.253.182.57]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 08ebaf38-bf68-405c-2bf0-08d7e03e504d
x-ms-traffictypediagnostic: BY5PR04MB6519:
x-microsoft-antispam-prvs: <BY5PR04MB65190454B2F4A619875AD1C5E7DA0@BY5PR04MB6519.namprd04.prod.outlook.com>
wdcipoutbound: EOP-TRUE
x-ms-oob-tlc-oobclassifiers: OLM:264;
x-forefront-prvs: 0373D94D15
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
	IPV:NLI; SFV:NSPM; H:BY5PR04MB6900.namprd04.prod.outlook.com;
	PTR:; CAT:NONE; SFTY:;
	SFS:(10019020)(4636009)(366004)(7696005)(110136005)(53546011)(9686003)(33656002)(498600001)(26005)(81156014)(54906003)(4326008)(55016002)(66446008)(66556008)(64756008)(66476007)(6506007)(186003)(86362001)(8936002)(66946007)(71200400001)(8676002)(76116006)(91956017)(5660300002)(2906002)(52536014);
	DIR:OUT; SFP:1102;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: ivIeEMkf3m/LPH8YSCOaY0wikz2CP+gKvTb5F3UtdBywaXwJBzcgw2aC2pqFPjTGAVZ2Rq4LxBDIvwMtCXFDLF+sfMUdxspoXdPlU/d8JwAkYeMDcgog8lRhVOJa35fOXWcgu216io1QW6bCqolK3Ry8Rv1I6sgYPsDazBg/BetLioTNfXlx0Ez0GdAazrikCHKtzyD6ZcwapA44HiPWMboZj3qHZJRZ9rlKfckl3Lp/nb6oC2Rv3wP82C2xZQ1FzYwdwcFaM5XS9OrxxdECd5GxVDPP+C0Hp5E+LLY2A5uul0glYufdLfpatx8WGIRbT10uAziRJ8T+WtmYrU1RXtzoZQCKKzZthMDkvxVwDLlrqH6acE2zDKqd4XAyV1B4ZBxzy/ZtfOGCBGKnieZreXNOlywiqPqbowD37ktqlxjHSUOUwv9CYXRpEOs88gVu
x-ms-exchange-antispam-messagedata: +gS5YBeUTYxIpQ1rg5PsIsRfveXTgBmy2tiyWdwZN7ya4se3KNprKGe3GlRkkzzL9VJVsxHLqySFb4YsYueqoM/jbdwBWWPYc19MZYtR+7xclpNKryL3peQTR1GnkryTfebieQY+Un6hC9JBddsWRg==
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 08ebaf38-bf68-405c-2bf0-08d7e03e504d
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Apr 2020 06:37:33.4121 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: k412MwidM/Vhvqar5f01nUvdS45iBiyDafwByCGMUPinFuLDYIYxUeBRLgwvMxocxRNTOuyRJ6/vbjSXL42ivQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR04MB6519
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 03E6bjfO005272
X-loop: dm-devel@redhat.com
Cc: Bob Liu <bob.liu@oracle.com>, "dm-devel@redhat.com" <dm-devel@redhat.com>
Subject: Re: [dm-devel] [PATCH 06/11] dm-zoned: remove 'dev' argument from
	reclaim
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On 2020/04/14 15:34, Hannes Reinecke wrote:
> On 4/10/20 8:43 AM, Damien Le Moal wrote:
>> On 2020/04/09 15:45, Hannes Reinecke wrote:
>>> Use the dmz_zone_to_dev() mapping function to remove the
>>> 'dev' argument from reclaim.
>>>
>>> Signed-off-by: Hannes Reinecke <hare@suse.de>
>>> ---
>>>   drivers/md/dm-zoned-metadata.c |  5 +++
>>>   drivers/md/dm-zoned-reclaim.c  | 63 +++++++++++++++++-----------------
>>>   drivers/md/dm-zoned-target.c   |  2 +-
>>>   drivers/md/dm-zoned.h          |  4 ++-
>>>   4 files changed, 41 insertions(+), 33 deletions(-)
>>>
>>> diff --git a/drivers/md/dm-zoned-metadata.c b/drivers/md/dm-zoned-metadata.c
>>> index 7cda48683c0b..cd4a8093da24 100644
>>> --- a/drivers/md/dm-zoned-metadata.c
>>> +++ b/drivers/md/dm-zoned-metadata.c
>>> @@ -267,6 +267,11 @@ const char *dmz_metadata_label(struct dmz_metadata *zmd)
>>>   	return (const char *)zmd->devname;
>>>   }
>>>   
>>> +bool dmz_check_dev(struct dmz_metadata *zmd)
>>> +{
>>> +	return dmz_check_bdev(&zmd->dev[0]);
>>> +}
>>> +
>>>   /*
>>>    * Lock/unlock mapping table.
>>>    * The map lock also protects all the zone lists.
>>> diff --git a/drivers/md/dm-zoned-reclaim.c b/drivers/md/dm-zoned-reclaim.c
>>> index 699c4145306e..102e0686542a 100644
>>> --- a/drivers/md/dm-zoned-reclaim.c
>>> +++ b/drivers/md/dm-zoned-reclaim.c
>>> @@ -13,7 +13,6 @@
>>>   
>>>   struct dmz_reclaim {
>>>   	struct dmz_metadata     *metadata;
>>> -	struct dmz_dev		*dev;
>>>   
>>>   	struct delayed_work	work;
>>>   	struct workqueue_struct *wq;
>>> @@ -59,6 +58,7 @@ static int dmz_reclaim_align_wp(struct dmz_reclaim *zrc, struct dm_zone *zone,
>>>   				sector_t block)
>>>   {
>>>   	struct dmz_metadata *zmd = zrc->metadata;
>>> +	struct dmz_dev *dev = dmz_zone_to_dev(zmd, zone);
>>>   	sector_t wp_block = zone->wp_block;
>>>   	unsigned int nr_blocks;
>>>   	int ret;
>>> @@ -74,15 +74,15 @@ static int dmz_reclaim_align_wp(struct dmz_reclaim *zrc, struct dm_zone *zone,
>>>   	 * pointer and the requested position.
>>>   	 */
>>>   	nr_blocks = block - wp_block;
>>> -	ret = blkdev_issue_zeroout(zrc->dev->bdev,
>>> +	ret = blkdev_issue_zeroout(dev->bdev,
>>>   				   dmz_start_sect(zmd, zone) + dmz_blk2sect(wp_block),
>>>   				   dmz_blk2sect(nr_blocks), GFP_NOIO, 0);
>>>   	if (ret) {
>>> -		dmz_dev_err(zrc->dev,
>>> +		dmz_dev_err(dev,
>>>   			    "Align zone %u wp %llu to %llu (wp+%u) blocks failed %d",
>>>   			    zone->id, (unsigned long long)wp_block,
>>>   			    (unsigned long long)block, nr_blocks, ret);
>>> -		dmz_check_bdev(zrc->dev);
>>> +		dmz_check_bdev(dev);
>>>   		return ret;
>>>   	}
>>>   
>>> @@ -116,7 +116,7 @@ static int dmz_reclaim_copy(struct dmz_reclaim *zrc,
>>>   			    struct dm_zone *src_zone, struct dm_zone *dst_zone)
>>>   {
>>>   	struct dmz_metadata *zmd = zrc->metadata;
>>> -	struct dmz_dev *dev = zrc->dev;
>>> +	struct dmz_dev *src_dev, *dst_dev;
>>>   	struct dm_io_region src, dst;
>>>   	sector_t block = 0, end_block;
>>>   	sector_t nr_blocks;
>>> @@ -130,13 +130,17 @@ static int dmz_reclaim_copy(struct dmz_reclaim *zrc,
>>>   	else
>>>   		end_block = dmz_zone_nr_blocks(zmd);
>>>   	src_zone_block = dmz_start_block(zmd, src_zone);
>>> +	src_dev = dmz_zone_to_dev(zmd, src_zone);
>>>   	dst_zone_block = dmz_start_block(zmd, dst_zone);
>>> +	dst_dev = dmz_zone_to_dev(zmd, dst_zone);
>>>   
>>>   	if (dmz_is_seq(dst_zone))
>>>   		set_bit(DM_KCOPYD_WRITE_SEQ, &flags);
>>>   
>>>   	while (block < end_block) {
>>> -		if (dev->flags & DMZ_BDEV_DYING)
>>> +		if (src_dev->flags & DMZ_BDEV_DYING)
>>> +			return -EIO;
>>> +		if (dst_dev->flags & DMZ_BDEV_DYING)
>>>   			return -EIO;
>>>   
>>>   		/* Get a valid region from the source zone */
>>> @@ -156,11 +160,11 @@ static int dmz_reclaim_copy(struct dmz_reclaim *zrc,
>>>   				return ret;
>>>   		}
>>>   
>>> -		src.bdev = dev->bdev;
>>> +		src.bdev = src_dev->bdev;
>>>   		src.sector = dmz_blk2sect(src_zone_block + block);
>>>   		src.count = dmz_blk2sect(nr_blocks);
>>>   
>>> -		dst.bdev = dev->bdev;
>>> +		dst.bdev = dst_dev->bdev;
>>>   		dst.sector = dmz_blk2sect(dst_zone_block + block);
>>>   		dst.count = src.count;
>>>   
>>> @@ -194,10 +198,10 @@ static int dmz_reclaim_buf(struct dmz_reclaim *zrc, struct dm_zone *dzone)
>>>   	struct dmz_metadata *zmd = zrc->metadata;
>>>   	int ret;
>>>   
>>> -	dmz_dev_debug(zrc->dev,
>>> -		      "Chunk %u, move buf zone %u (weight %u) to data zone %u (weight %u)",
>>> -		      dzone->chunk, bzone->id, dmz_weight(bzone),
>>> -		      dzone->id, dmz_weight(dzone));
>>> +	DMDEBUG("(%s): Chunk %u, move buf zone %u (weight %u) to data zone %u (weight %u)",
>>> +		dmz_metadata_label(zmd),
>>> +		dzone->chunk, bzone->id, dmz_weight(bzone),
>>> +		dzone->id, dmz_weight(dzone));
>>>   
>>>   	/* Flush data zone into the buffer zone */
>>>   	ret = dmz_reclaim_copy(zrc, bzone, dzone);
>>> @@ -233,10 +237,10 @@ static int dmz_reclaim_seq_data(struct dmz_reclaim *zrc, struct dm_zone *dzone)
>>>   	struct dmz_metadata *zmd = zrc->metadata;
>>>   	int ret = 0;
>>>   
>>> -	dmz_dev_debug(zrc->dev,
>>> -		      "Chunk %u, move data zone %u (weight %u) to buf zone %u (weight %u)",
>>> -		      chunk, dzone->id, dmz_weight(dzone),
>>> -		      bzone->id, dmz_weight(bzone));
>>> +	DMDEBUG("(%s): Chunk %u, move data zone %u (weight %u) to buf zone %u (weight %u)",
>>> +		dmz_metadata_label(zmd),
>>> +		chunk, dzone->id, dmz_weight(dzone),
>>> +		bzone->id, dmz_weight(bzone));
>>>   
>>>   	/* Flush data zone into the buffer zone */
>>>   	ret = dmz_reclaim_copy(zrc, dzone, bzone);
>>> @@ -285,9 +289,9 @@ static int dmz_reclaim_rnd_data(struct dmz_reclaim *zrc, struct dm_zone *dzone)
>>>   	if (!szone)
>>>   		return -ENOSPC;
>>>   
>>> -	dmz_dev_debug(zrc->dev,
>>> -		      "Chunk %u, move rnd zone %u (weight %u) to seq zone %u",
>>> -		      chunk, dzone->id, dmz_weight(dzone), szone->id);
>>> +	DMDEBUG("(%s): Chunk %u, move rnd zone %u (weight %u) to seq zone %u",
>>> +		dmz_metadata_label(zmd),
>>> +		chunk, dzone->id, dmz_weight(dzone), szone->id);
>>>   
>>>   	/* Flush the random data zone into the sequential zone */
>>>   	ret = dmz_reclaim_copy(zrc, dzone, szone);
>>> @@ -343,6 +347,7 @@ static int dmz_do_reclaim(struct dmz_reclaim *zrc)
>>>   	struct dmz_metadata *zmd = zrc->metadata;
>>>   	struct dm_zone *dzone;
>>>   	struct dm_zone *rzone;
>>> +	struct dmz_dev *dev;
>>>   	unsigned long start;
>>>   	int ret;
>>>   
>>> @@ -352,7 +357,7 @@ static int dmz_do_reclaim(struct dmz_reclaim *zrc)
>>>   		return PTR_ERR(dzone);
>>>   
>>>   	start = jiffies;
>>> -
>>> +	dev = dmz_zone_to_dev(zmd, dzone);
>>>   	if (dmz_is_rnd(dzone)) {
>>>   		if (!dmz_weight(dzone)) {
>>>   			/* Empty zone */
>>> @@ -400,14 +405,14 @@ static int dmz_do_reclaim(struct dmz_reclaim *zrc)
>>>   
>>>   	ret = dmz_flush_metadata(zrc->metadata);
>>>   	if (ret) {
>>> -		dmz_dev_debug(zrc->dev,
>>> -			      "Metadata flush for zone %u failed, err %d\n",
>>> -			      rzone->id, ret);
>>> +		DMDEBUG("(%s): Metadata flush for zone %u failed, err %d\n",
>>> +			dmz_metadata_label(zmd), rzone->id, ret);
>>>   		return ret;
>>>   	}
>>>   
>>> -	dmz_dev_debug(zrc->dev, "Reclaimed zone %u in %u ms",
>>> -		      rzone->id, jiffies_to_msecs(jiffies - start));
>>> +	DMDEBUG("(%s): Reclaimed zone %u in %u ms",
>>> +		dmz_metadata_label(zmd),
>>> +		rzone->id, jiffies_to_msecs(jiffies - start));
>>>   	return 0;
>>>   }
>>>   
>>> @@ -455,9 +460,6 @@ static void dmz_reclaim_work(struct work_struct *work)
>>>   	unsigned int p_unmap_rnd;
>>>   	int ret;
>>>   
>>> -	if (dmz_bdev_is_dying(zrc->dev))
>>> -		return;
>>> -
>>
>> Why do you remove this ? We should not try to start reclaim if the device is
>> alreaady marked as dying.

Ah. Yes, of course. We could simplify though: any one of the 2 device marked as
dying equal a dying dmzoned target. We do not need to know which drive.

>>
> Because when moving to several devices we wouldn't know which device to 
> check at this point.
> But we could replace it with dmz_check_dev() like I did below.
> 
> Will be updating it for the next round.
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

