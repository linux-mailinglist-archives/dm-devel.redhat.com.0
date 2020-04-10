Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com [205.139.110.120])
	by mail.lfdr.de (Postfix) with ESMTP id 2D7101A4291
	for <lists+dm-devel@lfdr.de>; Fri, 10 Apr 2020 08:38:17 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1586500696;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 references:references:list-id:list-help:list-unsubscribe:
	 list-subscribe:list-post; bh=Uho0iN2kCMEDPnOApVU6vA/Y+Gvo0z0qr4WYzfALG/U=;
	b=KAB1a+nNplr/9rvCWB+Il/LlqGwIILzvH0kHGvEk6uCz66oiEi+uOU2o2JkcFF4XuAWaLX
	7RENk+nKNDUZBUCBZ5Xv+b+MUo3d9JDuriv2WtEuXdGZ4iMzabsoH9/RcT/fulnDa2E6fG
	NHsZ6dFiNmXBbMjwwdMKP9Z9aouoWfk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-346-XOaR7WItMqaU0pONQ6arYQ-1; Fri, 10 Apr 2020 02:38:13 -0400
X-MC-Unique: XOaR7WItMqaU0pONQ6arYQ-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 7B62D13F9;
	Fri, 10 Apr 2020 06:38:06 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 3A7359DD9E;
	Fri, 10 Apr 2020 06:38:04 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 4E2E19307D;
	Fri, 10 Apr 2020 06:37:54 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 03A6bdW4028288 for <dm-devel@listman.util.phx.redhat.com>;
	Fri, 10 Apr 2020 02:37:39 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 2B37A2024517; Fri, 10 Apr 2020 06:37:39 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast02.extmail.prod.ext.rdu2.redhat.com [10.11.55.18])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 267BE2017EA3
	for <dm-devel@redhat.com>; Fri, 10 Apr 2020 06:37:34 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 86BF58007D2
	for <dm-devel@redhat.com>; Fri, 10 Apr 2020 06:37:34 +0000 (UTC)
Received: from esa6.hgst.iphmx.com (esa6.hgst.iphmx.com [216.71.154.45])
	(Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-416-t7-6h2M9Pw-MZ3OtWQBL6g-1; Fri, 10 Apr 2020 02:37:30 -0400
X-MC-Unique: t7-6h2M9Pw-MZ3OtWQBL6g-1
IronPort-SDR: tIz7/g17+HzMn8Ul6/dcNXWKvrGT3009Romdl44LMj5cJQqJnjblNH5f+0Zk2lQlaasaXeRgLN
	NouYac2sWBvp1eyMiMwz6phwczST7jIPhmTI5cAZrX5UNCBol+it519i3QsZxF89qxwPUX3qSW
	Hoammi6VWFKfmpH1yJ0gybHi8lvx/T0+Ej3tvbVW3CFnFt6tRIi625RQoU7GpHOQIhdhzLq7BU
	18RNNpthuVxt2ahXxuN2kcA+HebrWnUDM98EnoUZMenbDDgAa3k5g4YimhTR3o0T9NZFVDorEk
	zWg=
X-IronPort-AV: E=Sophos;i="5.72,364,1580745600"; d="scan'208";a="136474377"
Received: from mail-dm6nam12lp2169.outbound.protection.outlook.com (HELO
	NAM12-DM6-obe.outbound.protection.outlook.com) ([104.47.59.169])
	by ob1.hgst.iphmx.com with ESMTP; 10 Apr 2020 14:37:29 +0800
Received: from BY5PR04MB6900.namprd04.prod.outlook.com (2603:10b6:a03:229::20)
	by BY5PR04MB6390.namprd04.prod.outlook.com (2603:10b6:a03:1e2::16)
	with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2900.17;
	Fri, 10 Apr 2020 06:37:27 +0000
Received: from BY5PR04MB6900.namprd04.prod.outlook.com
	([fe80::b574:3071:da2f:7606]) by
	BY5PR04MB6900.namprd04.prod.outlook.com
	([fe80::b574:3071:da2f:7606%5]) with mapi id 15.20.2900.015;
	Fri, 10 Apr 2020 06:37:27 +0000
From: Damien Le Moal <Damien.LeMoal@wdc.com>
To: Hannes Reinecke <hare@suse.de>, Mike Snitzer <snitzer@redhat.com>
Thread-Topic: [PATCH 01/11] dm-zoned: store zone id within the zone structure
	and kill dmz_id()
Thread-Index: AQHWDjp6sgqkt6Zco0mTZobz2qqM7Q==
Date: Fri, 10 Apr 2020 06:37:26 +0000
Message-ID: <BY5PR04MB69007B6D7B177B226272C72DE7DE0@BY5PR04MB6900.namprd04.prod.outlook.com>
References: <20200409064527.82992-1-hare@suse.de>
	<20200409064527.82992-2-hare@suse.de>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [129.253.182.57]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: f4cc68f8-1850-4a5e-cd47-08d7dd19a2c4
x-ms-traffictypediagnostic: BY5PR04MB6390:
x-microsoft-antispam-prvs: <BY5PR04MB6390AC89A9ECE51A76CA4D59E7DE0@BY5PR04MB6390.namprd04.prod.outlook.com>
wdcipoutbound: EOP-TRUE
x-ms-oob-tlc-oobclassifiers: OLM:107;
x-forefront-prvs: 0369E8196C
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
	IPV:NLI; SFV:NSPM; H:BY5PR04MB6900.namprd04.prod.outlook.com;
	PTR:; CAT:NONE; SFTY:;
	SFS:(10019020)(4636009)(346002)(136003)(376002)(396003)(39860400002)(366004)(66446008)(66476007)(66556008)(64756008)(33656002)(66946007)(86362001)(76116006)(8676002)(81156014)(5660300002)(478600001)(8936002)(52536014)(55016002)(4326008)(30864003)(316002)(54906003)(7696005)(9686003)(26005)(2906002)(6506007)(71200400001)(186003)(53546011)(110136005);
	DIR:OUT; SFP:1102;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 2PXUf6nx141gmxoqm6UjLaz7y25LnhgdA+mspJBiGnzwnmVjRYE09KsFlhMPP+vqMzY77K0DfYtcCpT4zfNw/HUa0fNz8Wu5OQ96Ql85xc1J04VojB9qdLMCY8aobPUasSuAzDVwBj6kUtKljvID2YzKcTA6MxX+4xmyR4H1keAhMHn49y9TFiOwOlmhyFGQtttpKblylHm4YHl4v8BiEE1bHpuHw9Y4783Iw4QKqUdDB9KaiZI5SESVVq/v60nXJqf3XgpR41rwH21XWXMBrOwyP0Uc7dZsYXgNckp98bvL/iMy4OAdfhy9iM220dwf56WQwSss86Swyr49kqkmJiwuY/enaPoKFDOUW9tSm1Xjl7K+M5dfFvmJMX9Eyq7YkmKcINl1nNurSTeH0ju+kGvvU/M7nomZ6lp3SavvFxwMmNqb72k386B0+sAdcqwV
x-ms-exchange-antispam-messagedata: 4wdmtEZgxNtD9g5p2ko8HDQ+i1wruHfXh9HCob0h5WagS47gaRDTi9LvEBm7kOejWduFk8BNAGHUXuAeh+2dMQ2DsrniN8aNMUy4As+uoYG/apAC/MrBeryv1sBfDdfCnzjAgc9iBkHnCPkiUDwPXA==
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f4cc68f8-1850-4a5e-cd47-08d7dd19a2c4
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Apr 2020 06:37:26.9080 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: DL4YJNiGqEA06n4lIA0a3lyzAIs8Ly3KrJNOaMPDbCrAguKBdHPO+WtOWwsSZHBbsbh2XepVmOLRxw/sFaM/aA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR04MB6390
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 03A6bdW4028288
X-loop: dm-devel@redhat.com
Cc: Bob Liu <bob.liu@oracle.com>, "dm-devel@redhat.com" <dm-devel@redhat.com>
Subject: Re: [dm-devel] [PATCH 01/11] dm-zoned: store zone id within the
 zone structure and kill dmz_id()
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

On 2020/04/09 15:45, Hannes Reinecke wrote:
> Instead of calculating the zone index by the offset within the
> zone array store the index within the structure itself. With that
> the helper dmz_id() is pointless and can be replaced with accessing
> the ->id value directly.

Looks good. Although the kbuild robot complained that you forgot to change the
dmz_id() use in some dmz_dev_warn() calls :)

> 
> Signed-off-by: Hannes Reinecke <hare@suse.de>
> ---
>  drivers/md/dm-zoned-metadata.c | 40 +++++++++++++++-------------------
>  drivers/md/dm-zoned-reclaim.c  | 17 +++++++--------
>  drivers/md/dm-zoned-target.c   |  6 ++---
>  drivers/md/dm-zoned.h          |  4 +++-
>  4 files changed, 31 insertions(+), 36 deletions(-)
> 
> diff --git a/drivers/md/dm-zoned-metadata.c b/drivers/md/dm-zoned-metadata.c
> index c8787560fa9f..1993eeb26bc1 100644
> --- a/drivers/md/dm-zoned-metadata.c
> +++ b/drivers/md/dm-zoned-metadata.c
> @@ -187,19 +187,14 @@ struct dmz_metadata {
>  /*
>   * Various accessors
>   */
> -unsigned int dmz_id(struct dmz_metadata *zmd, struct dm_zone *zone)
> -{
> -	return ((unsigned int)(zone - zmd->zones));
> -}
> -
>  sector_t dmz_start_sect(struct dmz_metadata *zmd, struct dm_zone *zone)
>  {
> -	return (sector_t)dmz_id(zmd, zone) << zmd->dev->zone_nr_sectors_shift;
> +	return (sector_t)zone->id << zmd->dev->zone_nr_sectors_shift;
>  }
>  
>  sector_t dmz_start_block(struct dmz_metadata *zmd, struct dm_zone *zone)
>  {
> -	return (sector_t)dmz_id(zmd, zone) << zmd->dev->zone_nr_blocks_shift;
> +	return (sector_t)zone->id << zmd->dev->zone_nr_blocks_shift;
>  }
>  
>  unsigned int dmz_nr_zones(struct dmz_metadata *zmd)
> @@ -1119,6 +1114,7 @@ static int dmz_init_zone(struct blk_zone *blkz, unsigned int idx, void *data)
>  
>  	INIT_LIST_HEAD(&zone->link);
>  	atomic_set(&zone->refcount, 0);
> +	zone->id = idx;
>  	zone->chunk = DMZ_MAP_UNMAPPED;
>  
>  	switch (blkz->type) {
> @@ -1246,7 +1242,7 @@ static int dmz_update_zone(struct dmz_metadata *zmd, struct dm_zone *zone)
>  		ret = -EIO;
>  	if (ret < 0) {
>  		dmz_dev_err(zmd->dev, "Get zone %u report failed",
> -			    dmz_id(zmd, zone));
> +			    zone->id);
>  		dmz_check_bdev(zmd->dev);
>  		return ret;
>  	}
> @@ -1270,7 +1266,7 @@ static int dmz_handle_seq_write_err(struct dmz_metadata *zmd,
>  		return ret;
>  
>  	dmz_dev_warn(zmd->dev, "Processing zone %u write error (zone wp %u/%u)",
> -		     dmz_id(zmd, zone), zone->wp_block, wp);
> +		     zone->id, zone->wp_block, wp);
>  
>  	if (zone->wp_block < wp) {
>  		dmz_invalidate_blocks(zmd, zone, zone->wp_block,
> @@ -1309,7 +1305,7 @@ static int dmz_reset_zone(struct dmz_metadata *zmd, struct dm_zone *zone)
>  				       dev->zone_nr_sectors, GFP_NOIO);
>  		if (ret) {
>  			dmz_dev_err(dev, "Reset zone %u failed %d",
> -				    dmz_id(zmd, zone), ret);
> +				    zone->id, ret);
>  			return ret;
>  		}
>  	}
> @@ -1757,8 +1753,7 @@ struct dm_zone *dmz_get_chunk_buffer(struct dmz_metadata *zmd,
>  	}
>  
>  	/* Update the chunk mapping */
> -	dmz_set_chunk_mapping(zmd, dzone->chunk, dmz_id(zmd, dzone),
> -			      dmz_id(zmd, bzone));
> +	dmz_set_chunk_mapping(zmd, dzone->chunk, dzone->id, bzone->id);
>  
>  	set_bit(DMZ_BUF, &bzone->flags);
>  	bzone->chunk = dzone->chunk;
> @@ -1810,7 +1805,7 @@ struct dm_zone *dmz_alloc_zone(struct dmz_metadata *zmd, unsigned long flags)
>  		atomic_dec(&zmd->unmap_nr_seq);
>  
>  	if (dmz_is_offline(zone)) {
> -		dmz_dev_warn(zmd->dev, "Zone %u is offline", dmz_id(zmd, zone));
> +		dmz_dev_warn(zmd->dev, "Zone %u is offline", zone->id);
>  		zone = NULL;
>  		goto again;
>  	}
> @@ -1852,7 +1847,7 @@ void dmz_map_zone(struct dmz_metadata *zmd, struct dm_zone *dzone,
>  		  unsigned int chunk)
>  {
>  	/* Set the chunk mapping */
> -	dmz_set_chunk_mapping(zmd, chunk, dmz_id(zmd, dzone),
> +	dmz_set_chunk_mapping(zmd, chunk, dzone->id,
>  			      DMZ_MAP_UNMAPPED);
>  	dzone->chunk = chunk;
>  	if (dmz_is_rnd(dzone))
> @@ -1880,7 +1875,7 @@ void dmz_unmap_zone(struct dmz_metadata *zmd, struct dm_zone *zone)
>  		 * Unmapping the chunk buffer zone: clear only
>  		 * the chunk buffer mapping
>  		 */
> -		dzone_id = dmz_id(zmd, zone->bzone);
> +		dzone_id = zone->bzone->id;
>  		zone->bzone->bzone = NULL;
>  		zone->bzone = NULL;
>  
> @@ -1942,7 +1937,7 @@ static struct dmz_mblock *dmz_get_bitmap(struct dmz_metadata *zmd,
>  					 sector_t chunk_block)
>  {
>  	sector_t bitmap_block = 1 + zmd->nr_map_blocks +
> -		(sector_t)(dmz_id(zmd, zone) * zmd->zone_nr_bitmap_blocks) +
> +		(sector_t)(zone->id * zmd->zone_nr_bitmap_blocks) +
>  		(chunk_block >> DMZ_BLOCK_SHIFT_BITS);
>  
>  	return dmz_get_mblock(zmd, bitmap_block);
> @@ -2022,7 +2017,7 @@ int dmz_validate_blocks(struct dmz_metadata *zmd, struct dm_zone *zone,
>  	unsigned int n = 0;
>  
>  	dmz_dev_debug(zmd->dev, "=> VALIDATE zone %u, block %llu, %u blocks",
> -		      dmz_id(zmd, zone), (unsigned long long)chunk_block,
> +		      zone->id, (unsigned long long)chunk_block,
>  		      nr_blocks);
>  
>  	WARN_ON(chunk_block + nr_blocks > zone_nr_blocks);
> @@ -2052,7 +2047,7 @@ int dmz_validate_blocks(struct dmz_metadata *zmd, struct dm_zone *zone,
>  		zone->weight += n;
>  	else {
>  		dmz_dev_warn(zmd->dev, "Zone %u: weight %u should be <= %u",
> -			     dmz_id(zmd, zone), zone->weight,
> +			     zone->id, zone->weight,
>  			     zone_nr_blocks - n);
>  		zone->weight = zone_nr_blocks;
>  	}
> @@ -2102,7 +2097,7 @@ int dmz_invalidate_blocks(struct dmz_metadata *zmd, struct dm_zone *zone,
>  	unsigned int n = 0;
>  
>  	dmz_dev_debug(zmd->dev, "=> INVALIDATE zone %u, block %llu, %u blocks",
> -		      dmz_id(zmd, zone), (u64)chunk_block, nr_blocks);
> +		      zone->id, (u64)chunk_block, nr_blocks);
>  
>  	WARN_ON(chunk_block + nr_blocks > zmd->dev->zone_nr_blocks);
>  
> @@ -2132,7 +2127,7 @@ int dmz_invalidate_blocks(struct dmz_metadata *zmd, struct dm_zone *zone,
>  		zone->weight -= n;
>  	else {
>  		dmz_dev_warn(zmd->dev, "Zone %u: weight %u should be >= %u",
> -			     dmz_id(zmd, zone), zone->weight, n);
> +			     zone->id, zone->weight, n);
>  		zone->weight = 0;
>  	}
>  
> @@ -2378,7 +2373,7 @@ static void dmz_cleanup_metadata(struct dmz_metadata *zmd)
>  int dmz_ctr_metadata(struct dmz_dev *dev, struct dmz_metadata **metadata)
>  {
>  	struct dmz_metadata *zmd;
> -	unsigned int i, zid;
> +	unsigned int i;
>  	struct dm_zone *zone;
>  	int ret;
>  
> @@ -2419,9 +2414,8 @@ int dmz_ctr_metadata(struct dmz_dev *dev, struct dmz_metadata **metadata)
>  		goto err;
>  
>  	/* Set metadata zones starting from sb_zone */
> -	zid = dmz_id(zmd, zmd->sb_zone);
>  	for (i = 0; i < zmd->nr_meta_zones << 1; i++) {
> -		zone = dmz_get(zmd, zid + i);
> +		zone = dmz_get(zmd, zmd->sb_zone->id + i);
>  		if (!dmz_is_rnd(zone))
>  			goto err;
>  		set_bit(DMZ_META, &zone->flags);
> diff --git a/drivers/md/dm-zoned-reclaim.c b/drivers/md/dm-zoned-reclaim.c
> index e7ace908a9b7..7f57c4299a2f 100644
> --- a/drivers/md/dm-zoned-reclaim.c
> +++ b/drivers/md/dm-zoned-reclaim.c
> @@ -80,7 +80,7 @@ static int dmz_reclaim_align_wp(struct dmz_reclaim *zrc, struct dm_zone *zone,
>  	if (ret) {
>  		dmz_dev_err(zrc->dev,
>  			    "Align zone %u wp %llu to %llu (wp+%u) blocks failed %d",
> -			    dmz_id(zmd, zone), (unsigned long long)wp_block,
> +			    zone->id, (unsigned long long)wp_block,
>  			    (unsigned long long)block, nr_blocks, ret);
>  		dmz_check_bdev(zrc->dev);
>  		return ret;
> @@ -196,8 +196,8 @@ static int dmz_reclaim_buf(struct dmz_reclaim *zrc, struct dm_zone *dzone)
>  
>  	dmz_dev_debug(zrc->dev,
>  		      "Chunk %u, move buf zone %u (weight %u) to data zone %u (weight %u)",
> -		      dzone->chunk, dmz_id(zmd, bzone), dmz_weight(bzone),
> -		      dmz_id(zmd, dzone), dmz_weight(dzone));
> +		      dzone->chunk, bzone->id, dmz_weight(bzone),
> +		      dzone->id, dmz_weight(dzone));
>  
>  	/* Flush data zone into the buffer zone */
>  	ret = dmz_reclaim_copy(zrc, bzone, dzone);
> @@ -235,8 +235,8 @@ static int dmz_reclaim_seq_data(struct dmz_reclaim *zrc, struct dm_zone *dzone)
>  
>  	dmz_dev_debug(zrc->dev,
>  		      "Chunk %u, move data zone %u (weight %u) to buf zone %u (weight %u)",
> -		      chunk, dmz_id(zmd, dzone), dmz_weight(dzone),
> -		      dmz_id(zmd, bzone), dmz_weight(bzone));
> +		      chunk, dzone->id, dmz_weight(dzone),
> +		      bzone->id, dmz_weight(bzone));
>  
>  	/* Flush data zone into the buffer zone */
>  	ret = dmz_reclaim_copy(zrc, dzone, bzone);
> @@ -287,8 +287,7 @@ static int dmz_reclaim_rnd_data(struct dmz_reclaim *zrc, struct dm_zone *dzone)
>  
>  	dmz_dev_debug(zrc->dev,
>  		      "Chunk %u, move rnd zone %u (weight %u) to seq zone %u",
> -		      chunk, dmz_id(zmd, dzone), dmz_weight(dzone),
> -		      dmz_id(zmd, szone));
> +		      chunk, dzone->id, dmz_weight(dzone), szone->id);
>  
>  	/* Flush the random data zone into the sequential zone */
>  	ret = dmz_reclaim_copy(zrc, dzone, szone);
> @@ -403,12 +402,12 @@ static int dmz_do_reclaim(struct dmz_reclaim *zrc)
>  	if (ret) {
>  		dmz_dev_debug(zrc->dev,
>  			      "Metadata flush for zone %u failed, err %d\n",
> -			      dmz_id(zmd, rzone), ret);
> +			      rzone->id, ret);
>  		return ret;
>  	}
>  
>  	dmz_dev_debug(zrc->dev, "Reclaimed zone %u in %u ms",
> -		      dmz_id(zmd, rzone), jiffies_to_msecs(jiffies - start));
> +		      rzone->id, jiffies_to_msecs(jiffies - start));
>  	return 0;
>  }
>  
> diff --git a/drivers/md/dm-zoned-target.c b/drivers/md/dm-zoned-target.c
> index 44e30a7de8b9..7268e0af9e17 100644
> --- a/drivers/md/dm-zoned-target.c
> +++ b/drivers/md/dm-zoned-target.c
> @@ -180,7 +180,7 @@ static int dmz_handle_read(struct dmz_target *dmz, struct dm_zone *zone,
>  	dmz_dev_debug(dmz->dev, "READ chunk %llu -> %s zone %u, block %llu, %u blocks",
>  		      (unsigned long long)dmz_bio_chunk(dmz->dev, bio),
>  		      (dmz_is_rnd(zone) ? "RND" : "SEQ"),
> -		      dmz_id(dmz->metadata, zone),
> +		      zone->id,
>  		      (unsigned long long)chunk_block, nr_blocks);
>  
>  	/* Check block validity to determine the read location */
> @@ -317,7 +317,7 @@ static int dmz_handle_write(struct dmz_target *dmz, struct dm_zone *zone,
>  	dmz_dev_debug(dmz->dev, "WRITE chunk %llu -> %s zone %u, block %llu, %u blocks",
>  		      (unsigned long long)dmz_bio_chunk(dmz->dev, bio),
>  		      (dmz_is_rnd(zone) ? "RND" : "SEQ"),
> -		      dmz_id(dmz->metadata, zone),
> +		      zone->id,
>  		      (unsigned long long)chunk_block, nr_blocks);
>  
>  	if (dmz_is_rnd(zone) || chunk_block == zone->wp_block) {
> @@ -357,7 +357,7 @@ static int dmz_handle_discard(struct dmz_target *dmz, struct dm_zone *zone,
>  
>  	dmz_dev_debug(dmz->dev, "DISCARD chunk %llu -> zone %u, block %llu, %u blocks",
>  		      (unsigned long long)dmz_bio_chunk(dmz->dev, bio),
> -		      dmz_id(zmd, zone),
> +		      zone->id,
>  		      (unsigned long long)chunk_block, nr_blocks);
>  
>  	/*
> diff --git a/drivers/md/dm-zoned.h b/drivers/md/dm-zoned.h
> index 884c0e586082..30781646741a 100644
> --- a/drivers/md/dm-zoned.h
> +++ b/drivers/md/dm-zoned.h
> @@ -87,6 +87,9 @@ struct dm_zone {
>  	/* Zone activation reference count */
>  	atomic_t		refcount;
>  
> +	/* Zone id */
> +	unsigned int		id;
> +
>  	/* Zone write pointer block (relative to the zone start block) */
>  	unsigned int		wp_block;
>  
> @@ -176,7 +179,6 @@ void dmz_lock_flush(struct dmz_metadata *zmd);
>  void dmz_unlock_flush(struct dmz_metadata *zmd);
>  int dmz_flush_metadata(struct dmz_metadata *zmd);
>  
> -unsigned int dmz_id(struct dmz_metadata *zmd, struct dm_zone *zone);
>  sector_t dmz_start_sect(struct dmz_metadata *zmd, struct dm_zone *zone);
>  sector_t dmz_start_block(struct dmz_metadata *zmd, struct dm_zone *zone);
>  unsigned int dmz_nr_chunks(struct dmz_metadata *zmd);
> 


-- 
Damien Le Moal
Western Digital Research



--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

