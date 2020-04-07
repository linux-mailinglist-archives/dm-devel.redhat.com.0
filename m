Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-delivery-1.mimecast.com [205.139.110.120])
	by mail.lfdr.de (Postfix) with ESMTP id EB95D1A04E8
	for <lists+dm-devel@lfdr.de>; Tue,  7 Apr 2020 04:32:20 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1586226739;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 references:references:list-id:list-help:list-unsubscribe:
	 list-subscribe:list-post; bh=q5XpNq65LRaCO1CWHznNDiHVPJYqdd561mq/tz8Cqys=;
	b=Z+peVDZ9E+SGd8JC6BuGfAuefIqXZXxjM0LgULVIVRDmP/RpLSnv7gDzOy2ua0r6s99DIa
	wuqJg2yQe2EievpFpSi4Tqx3ONWfkeSm2PVECKA6qBfdTlcFRwgLou09HqP32XJS0Rj6Wa
	fCvq3xoOkIB9gKefJm+ABda1d42L5XM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-410-kojwVwwVMky0cvKSBdSwEw-1; Mon, 06 Apr 2020 22:32:16 -0400
X-MC-Unique: kojwVwwVMky0cvKSBdSwEw-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 6224C107ACC4;
	Tue,  7 Apr 2020 02:32:10 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 8F63B60BE2;
	Tue,  7 Apr 2020 02:32:09 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 7AC5938A1;
	Tue,  7 Apr 2020 02:32:06 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 0372VxuR001305 for <dm-devel@listman.util.phx.redhat.com>;
	Mon, 6 Apr 2020 22:31:59 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 8AA40D0B3C; Tue,  7 Apr 2020 02:31:59 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast04.extmail.prod.ext.rdu2.redhat.com [10.11.55.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 859EBD0B30
	for <dm-devel@redhat.com>; Tue,  7 Apr 2020 02:31:55 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id BF8E91019E0D
	for <dm-devel@redhat.com>; Tue,  7 Apr 2020 02:31:55 +0000 (UTC)
Received: from esa1.hgst.iphmx.com (esa1.hgst.iphmx.com [68.232.141.245])
	(Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-364-CNUO1BaOPby73voZaC86oQ-1; Mon, 06 Apr 2020 22:31:53 -0400
X-MC-Unique: CNUO1BaOPby73voZaC86oQ-1
IronPort-SDR: XBNW90zvPz4POpoQmVAk1X19AlOefyT79Wk3cHe/FeEEm2EynSVCuuZgSsX2HHuTNE80ZlxdWC
	6u7Vy+8bNfEqRal/sf7NvJfabfLS4sLdqSvuGTyXZMAIAALjfbOT35UvaT4kwk1+59rt/3eC6g
	3eCfVXV5QlKbKwY98FdUjtflLVvlzkMXEsWFnEQq8mC3JpNONyqXZ3bPFInzPlQVXLz7lDg0sQ
	p7VSC6LHeUqezJ8RS9qJEXvVCvojOpv+LIA63bRUhcR8GA2FRVrKNGCq6HWJTg0AflgiA7tCEd
	Aks=
X-IronPort-AV: E=Sophos;i="5.72,353,1580745600"; d="scan'208";a="243273808"
Received: from mail-bn8nam12lp2177.outbound.protection.outlook.com (HELO
	NAM12-BN8-obe.outbound.protection.outlook.com) ([104.47.55.177])
	by ob1.hgst.iphmx.com with ESMTP; 07 Apr 2020 10:31:51 +0800
Received: from BY5PR04MB6900.namprd04.prod.outlook.com (2603:10b6:a03:229::20)
	by BY5PR04MB6295.namprd04.prod.outlook.com (2603:10b6:a03:1f2::13)
	with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2878.15;
	Tue, 7 Apr 2020 02:31:50 +0000
Received: from BY5PR04MB6900.namprd04.prod.outlook.com
	([fe80::d9cc:93c6:19f5:200c]) by
	BY5PR04MB6900.namprd04.prod.outlook.com
	([fe80::d9cc:93c6:19f5:200c%3]) with mapi id 15.20.2878.018;
	Tue, 7 Apr 2020 02:31:50 +0000
From: Damien Le Moal <Damien.LeMoal@wdc.com>
To: Hannes Reinecke <hare@suse.de>, Mike Snitzer <snitzer@redhat.com>
Thread-Topic: [PATCH 06/11] dm-zoned: remove 'dev' argument from reclaim
Thread-Index: AQHWDDicZcdIE+I26EuLLRn/ZYVzcg==
Date: Tue, 7 Apr 2020 02:31:50 +0000
Message-ID: <BY5PR04MB6900FB3F974F3C3BB9A0C69BE7C30@BY5PR04MB6900.namprd04.prod.outlook.com>
References: <20200406143505.133271-1-hare@suse.de>
	<20200406143505.133271-7-hare@suse.de>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [129.253.182.57]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 0c7ddc7b-86a0-49b5-1303-08d7da9bd3c5
x-ms-traffictypediagnostic: BY5PR04MB6295:
x-microsoft-antispam-prvs: <BY5PR04MB629563FAC363407FCEC92C84E7C30@BY5PR04MB6295.namprd04.prod.outlook.com>
wdcipoutbound: EOP-TRUE
x-ms-oob-tlc-oobclassifiers: OLM:1091;
x-forefront-prvs: 036614DD9C
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
	IPV:NLI; SFV:NSPM; H:BY5PR04MB6900.namprd04.prod.outlook.com;
	PTR:; CAT:NONE; SFTY:;
	SFS:(10019020)(4636009)(39850400004)(396003)(366004)(346002)(376002)(136003)(2906002)(81156014)(186003)(9686003)(86362001)(55016002)(4326008)(66946007)(26005)(66446008)(54906003)(7696005)(33656002)(316002)(5660300002)(71200400001)(64756008)(76116006)(110136005)(8936002)(81166006)(52536014)(66476007)(8676002)(53546011)(66556008)(478600001)(6506007);
	DIR:OUT; SFP:1102;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: /0oYJMWMyoWGrsvdA6xUKr91JM+LA0ErmrbRYCVPuSYK5hFFPtWHkh7z1rpkfgonBiVhZyFyxy5x4cvJMQym4zJT0tta/m3uXqtH4tW0/TqAK0WuEFu+SC4RKOEapLzCRlKtnH11OsZ2qdT1uTsdOHA+BWzOpkG8BrPZB1B+YT0nD00WsSy+BA3qa+jY9959ApXeRot6JMxW321TUplNZsGGXJse4jUDQUDOEuJ5VMyL0bDmD1YGnW7kIHfXLq0W5eMylvBtsI2U80/IVDQsSJibtqW8pytIE5aPVwgGL+68ebcJxcaRRRtPfUoPZBFf5jtJdAEUFVkWeJCwSyXfSMfnQuVTdoEOlfledtxnEaqJCbRYsA6nOfIRgo2m4oQQEMdzRJMek4Rw2vqT8PtYCzz9BIz/s7YW6rrTzwE5gWNtjlcqOBc3VvAjq7lL2j1Y
x-ms-exchange-antispam-messagedata: iwaqlNaPrx+OS7CX6w4rnG1Fs/47T/EU9CfWmPRf/7y6zSSpDDIS6gRofIHMiAIDSfn0n4uba4Ba1BcrfjyHq9Sm/IZ2t7q4uvx01zaJmplz8g77qU+azLsVbK+aF4T9mLGdgzrCL6upHgZ5i5osog==
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0c7ddc7b-86a0-49b5-1303-08d7da9bd3c5
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Apr 2020 02:31:50.2395 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: /Op60Tnpi38zvTfvD0dSEvIFvt97eiSK5OVwvaq6VKVSeN2bCQtn2JNQMMXacVtuRKSr9D9M0NMoaMR2JJCJrg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR04MB6295
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 0372VxuR001305
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On 2020/04/07 2:27, Hannes Reinecke wrote:
> Use the dmz_zone_to_dev() mapping function to remove the
> 'dev' argument from reclaim.
> 
> Signed-off-by: Hannes Reinecke <hare@suse.de>
> ---
>  drivers/md/dm-zoned-metadata.c |  5 ++++
>  drivers/md/dm-zoned-reclaim.c  | 44 ++++++++++++++++++----------------
>  drivers/md/dm-zoned-target.c   |  2 +-
>  drivers/md/dm-zoned.h          |  4 +++-
>  4 files changed, 33 insertions(+), 22 deletions(-)
> 
> diff --git a/drivers/md/dm-zoned-metadata.c b/drivers/md/dm-zoned-metadata.c
> index f7ae57e78230..9919aa6210c1 100644
> --- a/drivers/md/dm-zoned-metadata.c
> +++ b/drivers/md/dm-zoned-metadata.c
> @@ -272,6 +272,11 @@ const char *dmz_metadata_label(struct dmz_metadata *zmd)
>  	return (const char *)zmd->devname;
>  }
>  
> +bool dmz_check_dev(struct dmz_metadata *zmd)
> +{
> +	return dmz_check_bdev(&zmd->dev[0]);
> +}
> +
>  /*
>   * Lock/unlock mapping table.
>   * The map lock also protects all the zone lists.
> diff --git a/drivers/md/dm-zoned-reclaim.c b/drivers/md/dm-zoned-reclaim.c
> index c46159b6fc46..b41ef358210f 100644
> --- a/drivers/md/dm-zoned-reclaim.c
> +++ b/drivers/md/dm-zoned-reclaim.c
> @@ -13,7 +13,6 @@
>  
>  struct dmz_reclaim {
>  	struct dmz_metadata     *metadata;
> -	struct dmz_dev		*dev;
>  
>  	struct delayed_work	work;
>  	struct workqueue_struct *wq;
> @@ -59,6 +58,7 @@ static int dmz_reclaim_align_wp(struct dmz_reclaim *zrc, struct dm_zone *zone,
>  				sector_t block)
>  {
>  	struct dmz_metadata *zmd = zrc->metadata;
> +	struct dmz_dev *dev = dmz_zone_to_dev(zmd, zone);
>  	sector_t wp_block = zone->wp_block;
>  	unsigned int nr_blocks;
>  	int ret;
> @@ -74,15 +74,15 @@ static int dmz_reclaim_align_wp(struct dmz_reclaim *zrc, struct dm_zone *zone,
>  	 * pointer and the requested position.
>  	 */
>  	nr_blocks = block - wp_block;
> -	ret = blkdev_issue_zeroout(zrc->dev->bdev,
> +	ret = blkdev_issue_zeroout(dev->bdev,
>  				   dmz_start_sect(zmd, zone) + dmz_blk2sect(wp_block),
>  				   dmz_blk2sect(nr_blocks), GFP_NOIO, 0);
>  	if (ret) {
> -		dmz_dev_err(zrc->dev,
> +		dmz_dev_err(dev,
>  			    "Align zone %u wp %llu to %llu (wp+%u) blocks failed %d",
>  			    dmz_id(zmd, zone), (unsigned long long)wp_block,
>  			    (unsigned long long)block, nr_blocks, ret);
> -		dmz_check_bdev(zrc->dev);
> +		dmz_check_bdev(dev);
>  		return ret;
>  	}
>  
> @@ -116,7 +116,7 @@ static int dmz_reclaim_copy(struct dmz_reclaim *zrc,
>  			    struct dm_zone *src_zone, struct dm_zone *dst_zone)
>  {
>  	struct dmz_metadata *zmd = zrc->metadata;
> -	struct dmz_dev *dev = zrc->dev;
> +	struct dmz_dev *src_dev, *dst_dev;
>  	struct dm_io_region src, dst;
>  	sector_t block = 0, end_block;
>  	sector_t nr_blocks;
> @@ -130,13 +130,17 @@ static int dmz_reclaim_copy(struct dmz_reclaim *zrc,
>  	else
>  		end_block = dmz_zone_nr_blocks(zmd);
>  	src_zone_block = dmz_start_block(zmd, src_zone);
> +	src_dev = dmz_zone_to_dev(zmd, src_zone);
>  	dst_zone_block = dmz_start_block(zmd, dst_zone);
> +	dst_dev = dmz_zone_to_dev(zmd, dst_zone);
>  
>  	if (dmz_is_seq(dst_zone))
>  		set_bit(DM_KCOPYD_WRITE_SEQ, &flags);
>  
>  	while (block < end_block) {
> -		if (dev->flags & DMZ_BDEV_DYING)
> +		if (src_dev->flags & DMZ_BDEV_DYING)
> +			return -EIO;
> +		if (dst_dev->flags & DMZ_BDEV_DYING)
>  			return -EIO;
>  
>  		/* Get a valid region from the source zone */
> @@ -156,11 +160,11 @@ static int dmz_reclaim_copy(struct dmz_reclaim *zrc,
>  				return ret;
>  		}
>  
> -		src.bdev = dev->bdev;
> +		src.bdev = src_dev->bdev;
>  		src.sector = dmz_blk2sect(src_zone_block + block);
>  		src.count = dmz_blk2sect(nr_blocks);
>  
> -		dst.bdev = dev->bdev;
> +		dst.bdev = dst_dev->bdev;
>  		dst.sector = dmz_blk2sect(dst_zone_block + block);
>  		dst.count = src.count;
>  
> @@ -192,9 +196,10 @@ static int dmz_reclaim_buf(struct dmz_reclaim *zrc, struct dm_zone *dzone)
>  	struct dm_zone *bzone = dzone->bzone;
>  	sector_t chunk_block = dzone->wp_block;
>  	struct dmz_metadata *zmd = zrc->metadata;
> +	struct dmz_dev *dev = dmz_zone_to_dev(zmd, dzone);
>  	int ret;
>  
> -	dmz_dev_debug(zrc->dev,
> +	dmz_dev_debug(dev,
>  		      "Chunk %u, move buf zone %u (weight %u) to data zone %u (weight %u)",
>  		      dzone->chunk, dmz_id(zmd, bzone), dmz_weight(bzone),
>  		      dmz_id(zmd, dzone), dmz_weight(dzone));
> @@ -231,9 +236,10 @@ static int dmz_reclaim_seq_data(struct dmz_reclaim *zrc, struct dm_zone *dzone)
>  	unsigned int chunk = dzone->chunk;
>  	struct dm_zone *bzone = dzone->bzone;
>  	struct dmz_metadata *zmd = zrc->metadata;
> +	struct dmz_dev *dev = dmz_zone_to_dev(zmd, dzone);
>  	int ret = 0;
>  
> -	dmz_dev_debug(zrc->dev,
> +	dmz_dev_debug(dev,
>  		      "Chunk %u, move data zone %u (weight %u) to buf zone %u (weight %u)",
>  		      chunk, dmz_id(zmd, dzone), dmz_weight(dzone),
>  		      dmz_id(zmd, bzone), dmz_weight(bzone));
> @@ -276,6 +282,7 @@ static int dmz_reclaim_rnd_data(struct dmz_reclaim *zrc, struct dm_zone *dzone)
>  	unsigned int chunk = dzone->chunk;
>  	struct dm_zone *szone = NULL;
>  	struct dmz_metadata *zmd = zrc->metadata;
> +	struct dmz_dev *dev = dmz_zone_to_dev(zmd, dzone);
>  	int ret;
>  
>  	/* Get a free sequential zone */
> @@ -285,7 +292,7 @@ static int dmz_reclaim_rnd_data(struct dmz_reclaim *zrc, struct dm_zone *dzone)
>  	if (!szone)
>  		return -ENOSPC;
>  
> -	dmz_dev_debug(zrc->dev,
> +	dmz_dev_debug(dev,
>  		      "Chunk %u, move rnd zone %u (weight %u) to seq zone %u",
>  		      chunk, dmz_id(zmd, dzone), dmz_weight(dzone),
>  		      dmz_id(zmd, szone));
> @@ -344,6 +351,7 @@ static int dmz_do_reclaim(struct dmz_reclaim *zrc)
>  	struct dmz_metadata *zmd = zrc->metadata;
>  	struct dm_zone *dzone;
>  	struct dm_zone *rzone;
> +	struct dmz_dev *dev;
>  	unsigned long start;
>  	int ret;
>  
> @@ -353,7 +361,7 @@ static int dmz_do_reclaim(struct dmz_reclaim *zrc)
>  		return PTR_ERR(dzone);
>  
>  	start = jiffies;
> -
> +	dev = dmz_zone_to_dev(zmd, dzone);
>  	if (dmz_is_rnd(dzone)) {
>  		if (!dmz_weight(dzone)) {
>  			/* Empty zone */
> @@ -401,13 +409,13 @@ static int dmz_do_reclaim(struct dmz_reclaim *zrc)
>  
>  	ret = dmz_flush_metadata(zrc->metadata);
>  	if (ret) {
> -		dmz_dev_debug(zrc->dev,
> +		dmz_dev_debug(dev,
>  			      "Metadata flush for zone %u failed, err %d\n",
>  			      dmz_id(zmd, rzone), ret);
>  		return ret;
>  	}
>  
> -	dmz_dev_debug(zrc->dev, "Reclaimed zone %u in %u ms",
> +	dmz_dev_debug(dev, "Reclaimed zone %u in %u ms",
>  		      dmz_id(zmd, rzone), jiffies_to_msecs(jiffies - start));

In patch 5, you changed dmz_dev_debug() to use DMDEBUG() to print the label. It
may be good to do the same here to have the label, but also add the bdev name
reclaim acted on ? Not super important though.

>  	return 0;
>  }
> @@ -456,9 +464,6 @@ static void dmz_reclaim_work(struct work_struct *work)
>  	unsigned int p_unmap_rnd;
>  	int ret;
>  
> -	if (dmz_bdev_is_dying(zrc->dev))
> -		return;
> -
>  	if (!dmz_should_reclaim(zrc)) {
>  		mod_delayed_work(zrc->wq, &zrc->work, DMZ_IDLE_PERIOD);
>  		return;
> @@ -491,7 +496,7 @@ static void dmz_reclaim_work(struct work_struct *work)
>  	if (ret) {
>  		DMDEBUG("(%s): Reclaim error %d\n",
>  			dmz_metadata_label(zmd), ret);
> -		if (!dmz_check_bdev(zrc->dev))
> +		if (!dmz_check_dev(zmd))
>  			return;
>  	}
>  
> @@ -501,7 +506,7 @@ static void dmz_reclaim_work(struct work_struct *work)
>  /*
>   * Initialize reclaim.
>   */
> -int dmz_ctr_reclaim(struct dmz_dev *dev, struct dmz_metadata *zmd,
> +int dmz_ctr_reclaim(struct dmz_metadata *zmd,
>  		    struct dmz_reclaim **reclaim)
>  {
>  	struct dmz_reclaim *zrc;
> @@ -511,7 +516,6 @@ int dmz_ctr_reclaim(struct dmz_dev *dev, struct dmz_metadata *zmd,
>  	if (!zrc)
>  		return -ENOMEM;
>  
> -	zrc->dev = dev;
>  	zrc->metadata = zmd;
>  	zrc->atime = jiffies;
>  
> diff --git a/drivers/md/dm-zoned-target.c b/drivers/md/dm-zoned-target.c
> index c2c3aa090f97..02ee0ca1f0b0 100644
> --- a/drivers/md/dm-zoned-target.c
> +++ b/drivers/md/dm-zoned-target.c
> @@ -835,7 +835,7 @@ static int dmz_ctr(struct dm_target *ti, unsigned int argc, char **argv)
>  	mod_delayed_work(dmz->flush_wq, &dmz->flush_work, DMZ_FLUSH_PERIOD);
>  
>  	/* Initialize reclaim */
> -	ret = dmz_ctr_reclaim(dev, dmz->metadata, &dmz->reclaim);
> +	ret = dmz_ctr_reclaim(dmz->metadata, &dmz->reclaim);
>  	if (ret) {
>  		ti->error = "Zone reclaim initialization failed";
>  		goto err_fwq;
> diff --git a/drivers/md/dm-zoned.h b/drivers/md/dm-zoned.h
> index f7df7f67e404..808ffbef0da3 100644
> --- a/drivers/md/dm-zoned.h
> +++ b/drivers/md/dm-zoned.h
> @@ -176,11 +176,13 @@ void dmz_lock_flush(struct dmz_metadata *zmd);
>  void dmz_unlock_flush(struct dmz_metadata *zmd);
>  int dmz_flush_metadata(struct dmz_metadata *zmd);
>  const char *dmz_metadata_label(struct dmz_metadata *zmd);
> +bool dmz_check_dev(struct dmz_metadata *zmd);
>  
>  unsigned int dmz_id(struct dmz_metadata *zmd, struct dm_zone *zone);
>  sector_t dmz_start_sect(struct dmz_metadata *zmd, struct dm_zone *zone);
>  sector_t dmz_start_block(struct dmz_metadata *zmd, struct dm_zone *zone);
>  unsigned int dmz_nr_chunks(struct dmz_metadata *zmd);
> +struct dmz_dev *dmz_zone_to_dev(struct dmz_metadata *zmd, struct dm_zone *zone);
>  
>  #define DMZ_ALLOC_RND		0x01
>  #define DMZ_ALLOC_RECLAIM	0x02
> @@ -252,7 +254,7 @@ int dmz_merge_valid_blocks(struct dmz_metadata *zmd, struct dm_zone *from_zone,
>  /*
>   * Functions defined in dm-zoned-reclaim.c
>   */
> -int dmz_ctr_reclaim(struct dmz_dev *dev, struct dmz_metadata *zmd,
> +int dmz_ctr_reclaim(struct dmz_metadata *zmd,
>  		    struct dmz_reclaim **zrc);
>  void dmz_dtr_reclaim(struct dmz_reclaim *zrc);
>  void dmz_suspend_reclaim(struct dmz_reclaim *zrc);
> 

Apart from the nit above, looks good.

Reviewed-by: Damien Le Moal <damien.lemoal@wdc.com>

-- 
Damien Le Moal
Western Digital Research



--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

