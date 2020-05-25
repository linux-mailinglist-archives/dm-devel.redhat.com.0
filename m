Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
	by mail.lfdr.de (Postfix) with ESMTP id 298161E048E
	for <lists+dm-devel@lfdr.de>; Mon, 25 May 2020 04:01:38 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1590372097;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 references:references:list-id:list-help:list-unsubscribe:
	 list-subscribe:list-post; bh=qwaCgWdtVUzmU3Sydfszde/ZNf7dqgZMwcvDgjef9hE=;
	b=didpMHAl7iSAZvkRS5VWr+VYjN8dtdX2eFM5wiSxdIOJoTj5T9QkhswVQzpyvq6++j7aP5
	7fIHdfwpLRPqr18BSRd27FpLmWQ7Xng4U9H/e5EIytFecPkqqQBAEY3BUZ5OetL+svo2oe
	Zu+9KcDx3azlUMTWnKjZrUq3YzMpQfQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-153-8n76E6zFNbKDJ7nKMvvF9g-1; Sun, 24 May 2020 22:01:34 -0400
X-MC-Unique: 8n76E6zFNbKDJ7nKMvvF9g-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 45404872FE0;
	Mon, 25 May 2020 02:01:25 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id EA06A5D788;
	Mon, 25 May 2020 02:01:22 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 7A5FA54D29;
	Mon, 25 May 2020 02:01:18 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 04P21CTR030561 for <dm-devel@listman.util.phx.redhat.com>;
	Sun, 24 May 2020 22:01:13 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 8BEC62026E1C; Mon, 25 May 2020 02:01:12 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast02.extmail.prod.ext.rdu2.redhat.com [10.11.55.18])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 5DB372029F62
	for <dm-devel@redhat.com>; Mon, 25 May 2020 02:01:09 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 8D8028007D4
	for <dm-devel@redhat.com>; Mon, 25 May 2020 02:01:08 +0000 (UTC)
Received: from esa3.hgst.iphmx.com (esa3.hgst.iphmx.com [216.71.153.141])
	(Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-54-263MXAG-MlCzo8210NQwAA-1; Sun, 24 May 2020 22:01:04 -0400
X-MC-Unique: 263MXAG-MlCzo8210NQwAA-1
IronPort-SDR: 2q5D9deaHvprjDGE15J4iFM+ymIMOWIrYntiED4TTjp4SzElqxSZTfmkkFueUavelqhgbB8Qpb
	bs5zkwIBnohmsK1WJv456tcidIDnvV8aeDizfOuS4jJZ3p1T/5ai3IMfCviwNJGiYNjcPxDhK0
	iNwZxzlHQ5vAibXeNx56cv0pvpV8y6WtEPOS7xEGMQQaY13ijuhr4BBqOE4btqMgqDiSDypqTv
	ewG7D0LWu6QF/0wyWkT90/70ydcr2WNQtW59Jv+MXltreW2IAUSaeOzLRuP1bpa6D4kA+6NY9J
	rAw=
X-IronPort-AV: E=Sophos;i="5.73,431,1583164800"; d="scan'208";a="142761734"
Received: from mail-sn1nam02lp2052.outbound.protection.outlook.com (HELO
	NAM02-SN1-obe.outbound.protection.outlook.com) ([104.47.36.52])
	by ob1.hgst.iphmx.com with ESMTP; 25 May 2020 10:01:04 +0800
Received: from CY4PR04MB3751.namprd04.prod.outlook.com (2603:10b6:903:ec::14)
	by CY4PR04MB0200.namprd04.prod.outlook.com (2603:10b6:903:3a::20)
	with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3021.26;
	Mon, 25 May 2020 02:01:01 +0000
Received: from CY4PR04MB3751.namprd04.prod.outlook.com
	([fe80::c593:f271:eebe:ac7]) by CY4PR04MB3751.namprd04.prod.outlook.com
	([fe80::c593:f271:eebe:ac7%9]) with mapi id 15.20.3021.029;
	Mon, 25 May 2020 02:01:01 +0000
From: Damien Le Moal <Damien.LeMoal@wdc.com>
To: Hannes Reinecke <hare@suse.de>
Thread-Topic: [PATCH 02/12] dm-zoned: convert to xarray
Thread-Index: AQHWME8lVxTjUtVcsk+eNiOb78e0PQ==
Date: Mon, 25 May 2020 02:01:01 +0000
Message-ID: <CY4PR04MB3751A147399A0E84B85834AEE7B30@CY4PR04MB3751.namprd04.prod.outlook.com>
References: <20200522153901.133375-1-hare@suse.de>
	<20200522153901.133375-3-hare@suse.de>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [199.255.47.8]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: fa6d1786-faa4-4720-eb19-08d8004f7955
x-ms-traffictypediagnostic: CY4PR04MB0200:
x-microsoft-antispam-prvs: <CY4PR04MB02001D886DDA0BA9362C83E9E7B30@CY4PR04MB0200.namprd04.prod.outlook.com>
wdcipoutbound: EOP-TRUE
x-ms-oob-tlc-oobclassifiers: OLM:862;
x-forefront-prvs: 0414DF926F
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 7K8WOjMAwL8GOkN/M47E2H3KIPQZDFXBfOuApDt85XvX3jIdWx6vyT7cZAhO3pUm2SlL95qFyoZ7gaXi1dAL53ZyEVAikOQrd4oiz8RCx2Bw0Q06fqSfEtTFtB953LmG55c6Hl6ns8H2LiaesFoNP195Kn2+yL+diHRZR51N4bHXkIYhO8TBzedBIH3pi/9GLqZuhlBPDgh/IMsVjmuP/yMnH2uRDQwtpeFUFg1wK7XvTCp5SxZDwa2bYAoua22eUdthkfEeNAEQD/w+Pt7pJaqvWavjhEAR7PispHnlmQF00SQx1DQgGbu+b+UmiWmCL3Hz5FiBs9vHlii70qb1GA==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
	IPV:NLI; SFV:NSPM; H:CY4PR04MB3751.namprd04.prod.outlook.com;
	PTR:; CAT:NONE; SFTY:;
	SFS:(4636009)(346002)(366004)(136003)(376002)(396003)(39860400002)(53546011)(7696005)(6506007)(186003)(26005)(33656002)(52536014)(76116006)(91956017)(66446008)(71200400001)(66476007)(66556008)(64756008)(2906002)(66946007)(8936002)(8676002)(9686003)(6916009)(55016002)(54906003)(86362001)(316002)(4326008)(478600001)(5660300002);
	DIR:OUT; SFP:1102;
x-ms-exchange-antispam-messagedata: rc1Jx9/FaMxEzXBUYOb1ck2bION5BlqmW+9s3hE/cLm7VLC0wQN4n1ODCsbUcMAw6jcW9H/gMqniS8rgrKWD3/saEl9PQ8hUl6ttiVM5ZTkXp84bguwZ0NO8qXomuZkBs5UlJ7omH3mjzLJubknimhu4ZDgAN9/n4kYt9yWJQTAcIxmg1NWzg/DyX8zTDJlVsmCaGTENO+26FuZx9NktfdGt3XCh1uLr+pFs8IpQGRKJeNqloZgsyVygB1MEjyZNcwo5kI42k507g/Fb9x7VX0escr5RbExPBGSlYGB9pnCbgUqguUKA63rixqt+SdmABST5joI4GEUty2T7e2/0G2drAuVYRaJe2vYW2+W2GiKiCSMW+KNehMM8XC2uznUiM/6IKQkeTSeNo2nXdkod3rPY6LwRH5/nCA95D9Y3ICcKYoMriwOat1PTCu8276ahRr8xOc4wy1rdTihsrBWSgub0eDleeYDpkQx00Q+2VmY=
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fa6d1786-faa4-4720-eb19-08d8004f7955
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 May 2020 02:01:01.0385 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: rw+TiTwQnqZF+AGjf5rCw2LpQnSMmkYBmVnYbEhuiIPVelb8h97xtQwBnv+YjyEwrHUEqC7uESlNAzLrbU9nYw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR04MB0200
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 04P21CTR030561
X-loop: dm-devel@redhat.com
Cc: "dm-devel@redhat.com" <dm-devel@redhat.com>,
	Mike Snitzer <snitzer@redhat.com>
Subject: Re: [dm-devel] [PATCH 02/12] dm-zoned: convert to xarray
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

On 2020/05/23 0:39, Hannes Reinecke wrote:
> The zones array is getting really large, and large arrays
> tend to wreak havoc with the caches.

s/caches/CPU cache, may be ?

> So convert it to xarray to become more cache friendly.
> 
> Signed-off-by: Hannes Reinecke <hare@suse.de>
> ---
>  drivers/md/dm-zoned-metadata.c | 98 +++++++++++++++++++++++++++++++-----------
>  1 file changed, 73 insertions(+), 25 deletions(-)
> 
> diff --git a/drivers/md/dm-zoned-metadata.c b/drivers/md/dm-zoned-metadata.c
> index b0d3ed4ac56a..3da6702bb1ae 100644
> --- a/drivers/md/dm-zoned-metadata.c
> +++ b/drivers/md/dm-zoned-metadata.c
> @@ -172,7 +172,7 @@ struct dmz_metadata {
>  	unsigned int		nr_chunks;
>  
>  	/* Zone information array */
> -	struct dm_zone		*zones;
> +	struct xarray		zones;
>  
>  	struct dmz_sb		sb[3];
>  	unsigned int		mblk_primary;
> @@ -327,6 +327,11 @@ unsigned int dmz_nr_unmap_seq_zones(struct dmz_metadata *zmd)
>  	return atomic_read(&zmd->unmap_nr_seq);
>  }
>  
> +static struct dm_zone *dmz_get(struct dmz_metadata *zmd, unsigned int zone_id)
> +{
> +	return xa_load(&zmd->zones, zone_id);
> +}
> +
>  const char *dmz_metadata_label(struct dmz_metadata *zmd)
>  {
>  	return (const char *)zmd->label;
> @@ -1121,6 +1126,7 @@ static int dmz_lookup_secondary_sb(struct dmz_metadata *zmd)
>  {
>  	unsigned int zone_nr_blocks = zmd->zone_nr_blocks;
>  	struct dmz_mblock *mblk;
> +	unsigned int zone_id = zmd->sb[0].zone->id;
>  	int i;
>  
>  	/* Allocate a block */
> @@ -1133,17 +1139,16 @@ static int dmz_lookup_secondary_sb(struct dmz_metadata *zmd)
>  
>  	/* Bad first super block: search for the second one */
>  	zmd->sb[1].block = zmd->sb[0].block + zone_nr_blocks;
> -	zmd->sb[1].zone = zmd->sb[0].zone + 1;
> +	zmd->sb[1].zone = xa_load(&zmd->zones, zone_id + 1);
>  	zmd->sb[1].dev = dmz_zone_to_dev(zmd, zmd->sb[1].zone);
> -	for (i = 0; i < zmd->nr_rnd_zones - 1; i++) {
> +	for (i = 1; i < zmd->nr_rnd_zones; i++) {
>  		if (dmz_read_sb(zmd, 1) != 0)
>  			break;
> -		if (le32_to_cpu(zmd->sb[1].sb->magic) == DMZ_MAGIC) {
> -			zmd->sb[1].zone += i;
> +		if (le32_to_cpu(zmd->sb[1].sb->magic) == DMZ_MAGIC)
>  			return 0;
> -		}
>  		zmd->sb[1].block += zone_nr_blocks;
> -		zmd->sb[1].dev = dmz_zone_to_dev(zmd, zmd->sb[1].zone + i);
> +		zmd->sb[1].zone = dmz_get(zmd, zone_id + i);
> +		zmd->sb[1].dev = dmz_zone_to_dev(zmd, zmd->sb[1].zone);
>  	}
>  
>  	dmz_free_mblock(zmd, mblk);
> @@ -1259,8 +1264,12 @@ static int dmz_load_sb(struct dmz_metadata *zmd)
>  	/* Read and check secondary super block */
>  	if (ret == 0) {
>  		sb_good[0] = true;
> -		if (!zmd->sb[1].zone)
> -			zmd->sb[1].zone = zmd->sb[0].zone + zmd->nr_meta_zones;
> +		if (!zmd->sb[1].zone) {
> +			unsigned int zone_id =
> +				zmd->sb[0].zone->id + zmd->nr_meta_zones;
> +
> +			zmd->sb[1].zone = dmz_get(zmd, zone_id);
> +		}
>  		zmd->sb[1].block = dmz_start_block(zmd, zmd->sb[1].zone);
>  		zmd->sb[1].dev = dmz_zone_to_dev(zmd, zmd->sb[1].zone);
>  		ret = dmz_get_sb(zmd, 1);
> @@ -1341,7 +1350,12 @@ static int dmz_init_zone(struct blk_zone *blkz, unsigned int num, void *data)
>  	struct dmz_metadata *zmd = data;
>  	struct dmz_dev *dev = zmd->nr_devs > 1 ? &zmd->dev[1] : &zmd->dev[0];
>  	int idx = num + dev->zone_offset;
> -	struct dm_zone *zone = &zmd->zones[idx];
> +	struct dm_zone *zone = kzalloc(sizeof(struct dm_zone), GFP_KERNEL);
> +
> +	if (!zone)
> +		return -ENOMEM;
> +	if (xa_insert(&zmd->zones, idx, zone, GFP_KERNEL))
> +		return -EBUSY;
>  
>  	if (blkz->len != zmd->zone_nr_sectors) {
>  		if (zmd->sb_version > 1) {
> @@ -1397,14 +1411,18 @@ static int dmz_init_zone(struct blk_zone *blkz, unsigned int num, void *data)
>  	return 0;
>  }
>  
> -static void dmz_emulate_zones(struct dmz_metadata *zmd, struct dmz_dev *dev)
> +static int dmz_emulate_zones(struct dmz_metadata *zmd, struct dmz_dev *dev)
>  {
>  	int idx;
>  	sector_t zone_offset = 0;
>  
>  	for(idx = 0; idx < dev->nr_zones; idx++) {
> -		struct dm_zone *zone = &zmd->zones[idx];
> -
> +		struct dm_zone *zone =
> +			kzalloc(sizeof(struct dm_zone), GFP_KERNEL);
> +		if (!zone)
> +			return -ENOMEM;
> +		if (xa_insert(&zmd->zones, idx, zone, GFP_KERNEL) < 0)
> +			return -EBUSY;

Same change as in dmz_init_zone(). Make this hunk a helper ?

>  		INIT_LIST_HEAD(&zone->link);
>  		atomic_set(&zone->refcount, 0);
>  		zone->id = idx;

And we can add this inside the helper too.

> @@ -1420,6 +1438,7 @@ static void dmz_emulate_zones(struct dmz_metadata *zmd, struct dmz_dev *dev)
>  		}
>  		zone_offset += zmd->zone_nr_sectors;
>  	}
> +	return 0;
>  }
>  
>  /*
> @@ -1427,8 +1446,15 @@ static void dmz_emulate_zones(struct dmz_metadata *zmd, struct dmz_dev *dev)
>   */
>  static void dmz_drop_zones(struct dmz_metadata *zmd)
>  {
> -	kfree(zmd->zones);
> -	zmd->zones = NULL;
> +	int idx;
> +
> +	for(idx = 0; idx < zmd->nr_zones; idx++) {
> +		struct dm_zone *zone = xa_load(&zmd->zones, idx);
> +
> +		kfree(zone);
> +		xa_erase(&zmd->zones, idx);
> +	}
> +	xa_destroy(&zmd->zones);
>  }
>  
>  /*
> @@ -1460,20 +1486,25 @@ static int dmz_init_zones(struct dmz_metadata *zmd)
>  		DMERR("(%s): No zones found", zmd->devname);
>  		return -ENXIO;
>  	}
> -	zmd->zones = kcalloc(zmd->nr_zones, sizeof(struct dm_zone), GFP_KERNEL);
> -	if (!zmd->zones)
> -		return -ENOMEM;
> +	xa_init(&zmd->zones);
>  
>  	DMDEBUG("(%s): Using %zu B for zone information",
>  		zmd->devname, sizeof(struct dm_zone) * zmd->nr_zones);
>  
>  	if (zmd->nr_devs > 1) {
> -		dmz_emulate_zones(zmd, &zmd->dev[0]);
> +		ret = dmz_emulate_zones(zmd, &zmd->dev[0]);
> +		if (ret < 0) {
> +			DMDEBUG("(%s): Failed to emulate zones, error %d",
> +				zmd->devname, ret);
> +			dmz_drop_zones(zmd);
> +			return ret;
> +		}
> +
>  		/*
>  		 * Primary superblock zone is always at zone 0 when multiple
>  		 * drives are present.
>  		 */
> -		zmd->sb[0].zone = &zmd->zones[0];
> +		zmd->sb[0].zone = dmz_get(zmd, 0);
>  
>  		zoned_dev = &zmd->dev[1];
>  	}
> @@ -1576,11 +1607,6 @@ static int dmz_handle_seq_write_err(struct dmz_metadata *zmd,
>  	return 0;
>  }
>  
> -static struct dm_zone *dmz_get(struct dmz_metadata *zmd, unsigned int zone_id)
> -{
> -	return &zmd->zones[zone_id];
> -}
> -
>  /*
>   * Reset a zone write pointer.
>   */
> @@ -1662,6 +1688,11 @@ static int dmz_load_mapping(struct dmz_metadata *zmd)
>  		}
>  
>  		dzone = dmz_get(zmd, dzone_id);
> +		if (!dzone) {
> +			dmz_zmd_err(zmd, "Chunk %u mapping: data zone %u not present",
> +				    chunk, dzone_id);
> +			return -EIO;
> +		}
>  		set_bit(DMZ_DATA, &dzone->flags);
>  		dzone->chunk = chunk;
>  		dmz_get_zone_weight(zmd, dzone);
> @@ -1685,6 +1716,11 @@ static int dmz_load_mapping(struct dmz_metadata *zmd)
>  		}
>  
>  		bzone = dmz_get(zmd, bzone_id);
> +		if (!bzone) {
> +			dmz_zmd_err(zmd, "Chunk %u mapping: buffer zone %u not present",
> +				    chunk, bzone_id);
> +			return -EIO;
> +		}
>  		if (!dmz_is_rnd(bzone) && !dmz_is_cache(bzone)) {
>  			dmz_zmd_err(zmd, "Chunk %u mapping: invalid buffer zone %u",
>  				    chunk, bzone_id);
> @@ -1715,6 +1751,8 @@ static int dmz_load_mapping(struct dmz_metadata *zmd)
>  	 */
>  	for (i = 0; i < zmd->nr_zones; i++) {
>  		dzone = dmz_get(zmd, i);
> +		if (!dzone)
> +			continue;
>  		if (dmz_is_meta(dzone))
>  			continue;
>  		if (dmz_is_offline(dzone))
> @@ -1977,6 +2015,10 @@ struct dm_zone *dmz_get_chunk_mapping(struct dmz_metadata *zmd, unsigned int chu
>  	} else {
>  		/* The chunk is already mapped: get the mapping zone */
>  		dzone = dmz_get(zmd, dzone_id);
> +		if (!dzone) {
> +			dzone = ERR_PTR(-EIO);
> +			goto out;
> +		}
>  		if (dzone->chunk != chunk) {
>  			dzone = ERR_PTR(-EIO);
>  			goto out;
> @@ -2794,6 +2836,12 @@ int dmz_ctr_metadata(struct dmz_dev *dev, int num_dev,
>  	/* Set metadata zones starting from sb_zone */
>  	for (i = 0; i < zmd->nr_meta_zones << 1; i++) {
>  		zone = dmz_get(zmd, zmd->sb[0].zone->id + i);
> +		if (!zone) {
> +			dmz_zmd_err(zmd,
> +				    "metadata zone %u not present", i);
> +			ret = -ENXIO;
> +			goto err;
> +		}
>  		if (!dmz_is_rnd(zone) && !dmz_is_cache(zone)) {
>  			dmz_zmd_err(zmd,
>  				    "metadata zone %d is not random", i);
> 

Apart from the nits above, this looks good to me.

-- 
Damien Le Moal
Western Digital Research



--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

