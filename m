Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-delivery-1.mimecast.com [207.211.31.120])
	by mail.lfdr.de (Postfix) with ESMTP id 2BA721A0509
	for <lists+dm-devel@lfdr.de>; Tue,  7 Apr 2020 04:51:39 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1586227898;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 references:references:list-id:list-help:list-unsubscribe:
	 list-subscribe:list-post; bh=tDaGRhcfcc2SZGBG/vqta6gtkxG1j3YzcssOOpalK0k=;
	b=hK7F6W2BbpWMK8/YbXCARxHXN4dd0bWqMVMZkv5Ggl54oEyFDpwEA7vaj3YRAmA0p3L7Ab
	eDDu5Kb7EaufWNVTTguw9ppusMWQ4021ATO2GlT2rwpxbEijvXnyjhuMFo7iigptupm37v
	290U0IR8/MRNzN41sFdItWCp+9BiwiQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-437-EdrE9j9qN1eccpe-vEoLMg-1; Mon, 06 Apr 2020 22:51:35 -0400
X-MC-Unique: EdrE9j9qN1eccpe-vEoLMg-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D0C0A18CA240;
	Tue,  7 Apr 2020 02:51:28 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 58C3562697;
	Tue,  7 Apr 2020 02:51:23 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 43E7F1809567;
	Tue,  7 Apr 2020 02:51:17 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 0372p5Hu002434 for <dm-devel@listman.util.phx.redhat.com>;
	Mon, 6 Apr 2020 22:51:06 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id CA7D510D16BB; Tue,  7 Apr 2020 02:51:05 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast01.extmail.prod.ext.rdu2.redhat.com [10.11.55.17])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id C377010D16CC
	for <dm-devel@redhat.com>; Tue,  7 Apr 2020 02:51:02 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id BE4FB8F2532
	for <dm-devel@redhat.com>; Tue,  7 Apr 2020 02:51:02 +0000 (UTC)
Received: from esa5.hgst.iphmx.com (esa5.hgst.iphmx.com [216.71.153.144])
	(Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-180-5MZd2_g-NLKfty6lQyQVLA-1; Mon, 06 Apr 2020 22:51:00 -0400
X-MC-Unique: 5MZd2_g-NLKfty6lQyQVLA-1
IronPort-SDR: xbsRD8EYIiBQOwFzXkez3nwhbF9xZNklVQFYbP2K5jSgVfGbYWzPQwM14b9LC5vg0KSRy39JGR
	SJF1VsgN3zYJfTqLEFKSfiL7RwX7h6/2bAqLgSL17DPWNHwYSckfxcEJUvgk5fbWJbFZiASS22
	FRi4kImecZCVMvPIFsRtNeXfqx5p0PnQLih874PrEIx4hZ90yrHR+PEEGhlC6zXH2qFysUFeso
	tYUeZVOQQPYF42ro6q3AWrgZyKJB6b1X5uj0HdOLQfK6om061TaXy7GRUVMdSDUaxcXhgH+sND
	Qeo=
X-IronPort-AV: E=Sophos;i="5.72,353,1580745600"; d="scan'208";a="135051562"
Received: from mail-mw2nam10lp2100.outbound.protection.outlook.com (HELO
	NAM10-MW2-obe.outbound.protection.outlook.com) ([104.47.55.100])
	by ob1.hgst.iphmx.com with ESMTP; 07 Apr 2020 10:50:59 +0800
Received: from BY5PR04MB6900.namprd04.prod.outlook.com (2603:10b6:a03:229::20)
	by BY5PR04MB7025.namprd04.prod.outlook.com (2603:10b6:a03:22f::17)
	with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2878.20;
	Tue, 7 Apr 2020 02:50:55 +0000
Received: from BY5PR04MB6900.namprd04.prod.outlook.com
	([fe80::d9cc:93c6:19f5:200c]) by
	BY5PR04MB6900.namprd04.prod.outlook.com
	([fe80::d9cc:93c6:19f5:200c%3]) with mapi id 15.20.2878.018;
	Tue, 7 Apr 2020 02:50:55 +0000
From: Damien Le Moal <Damien.LeMoal@wdc.com>
To: Hannes Reinecke <hare@suse.de>, Mike Snitzer <snitzer@redhat.com>
Thread-Topic: [PATCH 07/11] dm-zoned: use device as argument for bio handler
	functions
Thread-Index: AQHWDECUHM6HuQLAvkC/ObGi4Nb9uA==
Date: Tue, 7 Apr 2020 02:50:55 +0000
Message-ID: <BY5PR04MB6900E10F1AC0AE05C370BF6FE7C30@BY5PR04MB6900.namprd04.prod.outlook.com>
References: <20200406143505.133271-1-hare@suse.de>
	<20200406143505.133271-8-hare@suse.de>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [129.253.182.57]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: fbb104c4-efd6-42cf-6a21-08d7da9e7e67
x-ms-traffictypediagnostic: BY5PR04MB7025:
x-microsoft-antispam-prvs: <BY5PR04MB702544C7F9F92992DF1FFAD8E7C30@BY5PR04MB7025.namprd04.prod.outlook.com>
wdcipoutbound: EOP-TRUE
x-ms-oob-tlc-oobclassifiers: OLM:119;
x-forefront-prvs: 036614DD9C
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
	IPV:NLI; SFV:NSPM; H:BY5PR04MB6900.namprd04.prod.outlook.com;
	PTR:; CAT:NONE; SFTY:;
	SFS:(10019020)(4636009)(346002)(366004)(136003)(376002)(39860400002)(396003)(110136005)(54906003)(81156014)(478600001)(53546011)(6506007)(7696005)(8676002)(26005)(316002)(30864003)(86362001)(2906002)(81166006)(8936002)(33656002)(76116006)(186003)(5660300002)(64756008)(66946007)(66476007)(55016002)(9686003)(4326008)(52536014)(66446008)(66556008)(71200400001);
	DIR:OUT; SFP:1102;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: Rn8u4jXQOST3RJ9zbuRFR6xNhCBtcuJcA8CBLvYgYhjKs3ETUU3x0OO4uyw+/baykx1RUyM8RWh/G/GOVkEJ0xfDp/1CxEgOvNGyksy32WMOWr1ywIAU0L6co4jXJC1enrYUB9+sw/6TYbE74qjdLvwcJJju2iD8da4UIzMQchGbGJ7xWA8usH4+ADvya0sy7IeEv2mEWHaPHx1tLiVVfzrdMul6OMXNj577MHDoz2iqInNbhCVaGFMytYd8KYmKFe/HLLF+RH4kfzUQCpA+7xRTY17HcEQbaxUvHUiHuFFYfuqjBnYvYT8ZEv7Bpur2Int87RKqR0i5RaHz1XdIqYWNnjlLg8g3yWlRcxICojbt3bGYyuddOX+SF4QVFSJWoPs6NRjdRD5gnpifWXrJzptXrOC1LOKqI3XHLjf5iGM2/VNvVfMrGqVWiMSjteUs
x-ms-exchange-antispam-messagedata: tMPWfpQn8dNqHNVgsCmSAhr2X+aolvwKV8f4Ft6/IzReVPU9b1lDj4lC5ap2lCzsTSGMG3w3HniY6NaTaYBRwumVRm2QZEp+4osnJyk/kT2j63CEguYTxhh7Z893s46I822qjFi8S6eir/BuBbc1IA==
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fbb104c4-efd6-42cf-6a21-08d7da9e7e67
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Apr 2020 02:50:55.5254 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Zufu7tItbX0J+fRqt/HHv9Ctozd+HXHQm1DXXmvhYZScQziCSpKyLJ2WHQ/xnwlqFe2vg1Kd4L31sOLN+sue4A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR04MB7025
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 0372p5Hu002434
X-loop: dm-devel@redhat.com
Cc: Bob Liu <bob.liu@oracle.com>, "dm-devel@redhat.com" <dm-devel@redhat.com>
Subject: Re: [dm-devel] [PATCH 07/11] dm-zoned: use device as argument for
 bio handler functions
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

On 2020/04/07 3:24, Hannes Reinecke wrote:
> Instead of having each function to reference the device for
> themselves add it as an argument to the function.
> And replace the 'target' pointer in the bio context with the
> device pointer.
> 
> Signed-off-by: Hannes Reinecke <hare@suse.de>
> ---
>  drivers/md/dm-zoned-target.c | 88 +++++++++++++++++++++---------------
>  1 file changed, 52 insertions(+), 36 deletions(-)
> 
> diff --git a/drivers/md/dm-zoned-target.c b/drivers/md/dm-zoned-target.c
> index 02ee0ca1f0b0..8ed6d9f2df25 100644
> --- a/drivers/md/dm-zoned-target.c
> +++ b/drivers/md/dm-zoned-target.c
> @@ -17,7 +17,7 @@
>   * Zone BIO context.
>   */
>  struct dmz_bioctx {
> -	struct dmz_target	*target;
> +	struct dmz_dev		*dev;
>  	struct dm_zone		*zone;
>  	struct bio		*bio;
>  	refcount_t		ref;
> @@ -71,6 +71,11 @@ struct dmz_target {
>   */
>  #define DMZ_FLUSH_PERIOD	(10 * HZ)
>  
> +struct dmz_dev *dmz_sect_to_dev(struct dmz_target *dmz, sector_t sect)
> +{
> +	return &dmz->dev[0];
> +}

I do not get it. Regardless of the chunk sector specified, always returning the
first device seems wrong. If the sector belongs to a chunk mapped to a zone on
the second device, things will break, no ?

> +
>  /*
>   * Target BIO completion.
>   */
> @@ -81,7 +86,7 @@ static inline void dmz_bio_endio(struct bio *bio, blk_status_t status)
>  	if (status != BLK_STS_OK && bio->bi_status == BLK_STS_OK)
>  		bio->bi_status = status;
>  	if (bio->bi_status != BLK_STS_OK)
> -		bioctx->target->dev->flags |= DMZ_CHECK_BDEV;
> +		bioctx->dev->flags |= DMZ_CHECK_BDEV;
>  
>  	if (refcount_dec_and_test(&bioctx->ref)) {
>  		struct dm_zone *zone = bioctx->zone;
> @@ -114,18 +119,20 @@ static void dmz_clone_endio(struct bio *clone)
>   * Issue a clone of a target BIO. The clone may only partially process the
>   * original target BIO.
>   */
> -static int dmz_submit_bio(struct dmz_target *dmz, struct dm_zone *zone,
> -			  struct bio *bio, sector_t chunk_block,
> -			  unsigned int nr_blocks)
> +static int dmz_submit_bio(struct dmz_target *dmz, struct dmz_dev *dev,
> +			  struct dm_zone *zone, struct bio *bio,
> +			  sector_t chunk_block, unsigned int nr_blocks)

dev could be inferred from the zone with dmz_zone_to_dev(), no ?

>  {
> -	struct dmz_bioctx *bioctx = dm_per_bio_data(bio, sizeof(struct dmz_bioctx));
> +	struct dmz_bioctx *bioctx =
> +		dm_per_bio_data(bio, sizeof(struct dmz_bioctx));
>  	struct bio *clone;
>  
>  	clone = bio_clone_fast(bio, GFP_NOIO, &dmz->bio_set);
>  	if (!clone)
>  		return -ENOMEM;
>  
> -	bio_set_dev(clone, dmz->dev->bdev);
> +	bio_set_dev(clone, dev->bdev);
> +	bioctx->dev = dev;
>  	clone->bi_iter.bi_sector =
>  		dmz_start_sect(dmz->metadata, zone) + dmz_blk2sect(chunk_block);
>  	clone->bi_iter.bi_size = dmz_blk2sect(nr_blocks) << SECTOR_SHIFT;
> @@ -162,8 +169,8 @@ static void dmz_handle_read_zero(struct dmz_target *dmz, struct bio *bio,
>  /*
>   * Process a read BIO.
>   */
> -static int dmz_handle_read(struct dmz_target *dmz, struct dm_zone *zone,
> -			   struct bio *bio)
> +static int dmz_handle_read(struct dmz_target *dmz, struct dmz_dev *dev,
> +			   struct dm_zone *zone, struct bio *bio)

Same comment as above.

>  {
>  	struct dmz_metadata *zmd = dmz->metadata;
>  	sector_t chunk_block = dmz_chunk_block(zmd, dmz_bio_block(bio));
> @@ -178,7 +185,7 @@ static int dmz_handle_read(struct dmz_target *dmz, struct dm_zone *zone,
>  		return 0;
>  	}
>  
> -	dmz_dev_debug(dmz->dev, "READ chunk %llu -> %s zone %u, block %llu, %u blocks",
> +	dmz_dev_debug(dev, "READ chunk %llu -> %s zone %u, block %llu, %u blocks",
>  		      (unsigned long long)dmz_bio_chunk(zmd, bio),
>  		      (dmz_is_rnd(zone) ? "RND" : "SEQ"),
>  		      dmz_id(zmd, zone),

DMDEBUG to print the label ? or we could also have dmz_dev_debug() print format
changed to something like: "%s (%s): ...", label_name, dev->bdev_name

> @@ -218,7 +225,8 @@ static int dmz_handle_read(struct dmz_target *dmz, struct dm_zone *zone,
>  		if (nr_blocks) {
>  			/* Valid blocks found: read them */
>  			nr_blocks = min_t(unsigned int, nr_blocks, end_block - chunk_block);
> -			ret = dmz_submit_bio(dmz, rzone, bio, chunk_block, nr_blocks);
> +			ret = dmz_submit_bio(dmz, dev, rzone, bio,
> +					     chunk_block, nr_blocks);
>  			if (ret)
>  				return ret;
>  			chunk_block += nr_blocks;
> @@ -238,6 +246,7 @@ static int dmz_handle_read(struct dmz_target *dmz, struct dm_zone *zone,
>   * in place.
>   */
>  static int dmz_handle_direct_write(struct dmz_target *dmz,
> +				   struct dmz_dev *dev,

Use dmz_zone_to_dev() ?

>  				   struct dm_zone *zone, struct bio *bio,
>  				   sector_t chunk_block,
>  				   unsigned int nr_blocks)
> @@ -250,7 +259,7 @@ static int dmz_handle_direct_write(struct dmz_target *dmz,
>  		return -EROFS;
>  
>  	/* Submit write */
> -	ret = dmz_submit_bio(dmz, zone, bio, chunk_block, nr_blocks);
> +	ret = dmz_submit_bio(dmz, dev, zone, bio, chunk_block, nr_blocks);
>  	if (ret)
>  		return ret;
>  
> @@ -271,6 +280,7 @@ static int dmz_handle_direct_write(struct dmz_target *dmz,
>   * Called with @zone write locked.
>   */
>  static int dmz_handle_buffered_write(struct dmz_target *dmz,
> +				     struct dmz_dev *dev,
>  				     struct dm_zone *zone, struct bio *bio,
>  				     sector_t chunk_block,
>  				     unsigned int nr_blocks)
> @@ -288,7 +298,7 @@ static int dmz_handle_buffered_write(struct dmz_target *dmz,
>  		return -EROFS;
>  
>  	/* Submit write */
> -	ret = dmz_submit_bio(dmz, bzone, bio, chunk_block, nr_blocks);
> +	ret = dmz_submit_bio(dmz, dev, bzone, bio, chunk_block, nr_blocks);

Yes, I think it would be far better to use dmz_zone_to_dev() instead of passing
directly dev. That will avoid bugs like passing a wrong dev for a zone or wrong
zone for a dev.

>  	if (ret)
>  		return ret;
>  
> @@ -306,8 +316,8 @@ static int dmz_handle_buffered_write(struct dmz_target *dmz,
>  /*
>   * Process a write BIO.
>   */
> -static int dmz_handle_write(struct dmz_target *dmz, struct dm_zone *zone,
> -			    struct bio *bio)
> +static int dmz_handle_write(struct dmz_target *dmz, struct dmz_dev *dev,
> +			    struct dm_zone *zone, struct bio *bio)

Same comment about using dmz_zone_to_dev().

>  {
>  	struct dmz_metadata *zmd = dmz->metadata;
>  	sector_t chunk_block = dmz_chunk_block(zmd, dmz_bio_block(bio));
> @@ -316,7 +326,7 @@ static int dmz_handle_write(struct dmz_target *dmz, struct dm_zone *zone,
>  	if (!zone)
>  		return -ENOSPC;
>  
> -	dmz_dev_debug(dmz->dev, "WRITE chunk %llu -> %s zone %u, block %llu, %u blocks",
> +	dmz_dev_debug(dev, "WRITE chunk %llu -> %s zone %u, block %llu, %u blocks",
>  		      (unsigned long long)dmz_bio_chunk(zmd, bio),
>  		      (dmz_is_rnd(zone) ? "RND" : "SEQ"),
>  		      dmz_id(zmd, zone),
> @@ -328,21 +338,23 @@ static int dmz_handle_write(struct dmz_target *dmz, struct dm_zone *zone,
>  		 * and the BIO is aligned to the zone write pointer:
>  		 * direct write the zone.
>  		 */
> -		return dmz_handle_direct_write(dmz, zone, bio, chunk_block, nr_blocks);
> +		return dmz_handle_direct_write(dmz, dev, zone, bio,
> +					       chunk_block, nr_blocks);
>  	}
>  
>  	/*
>  	 * This is an unaligned write in a sequential zone:
>  	 * use buffered write.
>  	 */
> -	return dmz_handle_buffered_write(dmz, zone, bio, chunk_block, nr_blocks);
> +	return dmz_handle_buffered_write(dmz, dev, zone, bio,
> +					 chunk_block, nr_blocks);
>  }
>  
>  /*
>   * Process a discard BIO.
>   */
> -static int dmz_handle_discard(struct dmz_target *dmz, struct dm_zone *zone,
> -			      struct bio *bio)
> +static int dmz_handle_discard(struct dmz_target *dmz, struct dmz_dev *dev,
> +			      struct dm_zone *zone, struct bio *bio)
>  {
>  	struct dmz_metadata *zmd = dmz->metadata;
>  	sector_t block = dmz_bio_block(bio);
> @@ -357,7 +369,7 @@ static int dmz_handle_discard(struct dmz_target *dmz, struct dm_zone *zone,
>  	if (dmz_is_readonly(zone))
>  		return -EROFS;
>  
> -	dmz_dev_debug(dmz->dev, "DISCARD chunk %llu -> zone %u, block %llu, %u blocks",
> +	dmz_dev_debug(dev, "DISCARD chunk %llu -> zone %u, block %llu, %u blocks",
>  		      (unsigned long long)dmz_bio_chunk(zmd, bio),
>  		      dmz_id(zmd, zone),
>  		      (unsigned long long)chunk_block, nr_blocks);
> @@ -382,6 +394,7 @@ static void dmz_handle_bio(struct dmz_target *dmz, struct dm_chunk_work *cw,
>  {
>  	struct dmz_bioctx *bioctx = dm_per_bio_data(bio, sizeof(struct dmz_bioctx));
>  	struct dmz_metadata *zmd = dmz->metadata;
> +	struct dmz_dev *dev;
>  	struct dm_zone *zone;
>  	int ret;
>  
> @@ -394,11 +407,6 @@ static void dmz_handle_bio(struct dmz_target *dmz, struct dm_chunk_work *cw,
>  
>  	dmz_lock_metadata(zmd);
>  
> -	if (dmz->dev->flags & DMZ_BDEV_DYING) {
> -		ret = -EIO;
> -		goto out;
> -	}
> -
>  	/*
>  	 * Get the data zone mapping the chunk. There may be no
>  	 * mapping for read and discard. If a mapping is obtained,
> @@ -413,23 +421,30 @@ static void dmz_handle_bio(struct dmz_target *dmz, struct dm_chunk_work *cw,
>  
>  	/* Process the BIO */
>  	if (zone) {
> +		dev = dmz_zone_to_dev(zmd, zone);
>  		dmz_activate_zone(zone);
>  		bioctx->zone = zone;
> +	} else
> +		dev = dmz_sect_to_dev(dmz, bio->bi_iter.bi_sector);
> +
> +	if (dev->flags & DMZ_BDEV_DYING) {
> +		ret = -EIO;
> +		goto out;
>  	}
>  
>  	switch (bio_op(bio)) {
>  	case REQ_OP_READ:
> -		ret = dmz_handle_read(dmz, zone, bio);
> +		ret = dmz_handle_read(dmz, dev, zone, bio);
>  		break;
>  	case REQ_OP_WRITE:
> -		ret = dmz_handle_write(dmz, zone, bio);
> +		ret = dmz_handle_write(dmz, dev, zone, bio);
>  		break;
>  	case REQ_OP_DISCARD:
>  	case REQ_OP_WRITE_ZEROES:
> -		ret = dmz_handle_discard(dmz, zone, bio);
> +		ret = dmz_handle_discard(dmz, dev, zone, bio);
>  		break;
>  	default:
> -		dmz_dev_err(dmz->dev, "Unsupported BIO operation 0x%x",
> +		dmz_dev_err(dev, "Unsupported BIO operation 0x%x",
>  			    bio_op(bio));
>  		ret = -EIO;
>  	}
> @@ -621,14 +636,14 @@ static int dmz_map(struct dm_target *ti, struct bio *bio)
>  {
>  	struct dmz_target *dmz = ti->private;
>  	struct dmz_metadata *zmd = dmz->metadata;
> -	struct dmz_dev *dev = dmz->dev;
>  	struct dmz_bioctx *bioctx = dm_per_bio_data(bio, sizeof(struct dmz_bioctx));
>  	sector_t sector = bio->bi_iter.bi_sector;
>  	unsigned int nr_sectors = bio_sectors(bio);
> +	struct dmz_dev *dev = dmz_sect_to_dev(dmz, sector);
>  	sector_t chunk_sector;
>  	int ret;
>  
> -	if (dmz_bdev_is_dying(dmz->dev))
> +	if (dmz_bdev_is_dying(dev))
>  		return DM_MAPIO_KILL;
>  
>  	dmz_dev_debug(dev, "BIO op %d sector %llu + %u => chunk %llu, block %llu, %u blocks",
> @@ -647,7 +662,7 @@ static int dmz_map(struct dm_target *ti, struct bio *bio)
>  		return DM_MAPIO_KILL;
>  
>  	/* Initialize the BIO context */
> -	bioctx->target = dmz;
> +	bioctx->dev = NULL;
>  	bioctx->zone = NULL;
>  	bioctx->bio = bio;
>  	refcount_set(&bioctx->ref, 1);
> @@ -669,7 +684,7 @@ static int dmz_map(struct dm_target *ti, struct bio *bio)
>  	/* Now ready to handle this BIO */
>  	ret = dmz_queue_chunk_work(dmz, bio);
>  	if (ret) {
> -		dmz_dev_debug(dmz->dev,
> +		dmz_dev_debug(dev,
>  			      "BIO op %d, can't process chunk %llu, err %i\n",
>  			      bio_op(bio), (u64)dmz_bio_chunk(zmd, bio),
>  			      ret);
> @@ -926,11 +941,12 @@ static void dmz_io_hints(struct dm_target *ti, struct queue_limits *limits)
>  static int dmz_prepare_ioctl(struct dm_target *ti, struct block_device **bdev)
>  {
>  	struct dmz_target *dmz = ti->private;
> +	struct dmz_dev *dev = dmz_sect_to_dev(dmz, 0);
>  
> -	if (!dmz_check_bdev(dmz->dev))
> +	if (!dmz_check_bdev(dev))
>  		return -EIO;
>  
> -	*bdev = dmz->dev->bdev;
> +	*bdev = dev->bdev;
>  
>  	return 0;
>  }
> 


-- 
Damien Le Moal
Western Digital Research



--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

