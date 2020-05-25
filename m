Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
	by mail.lfdr.de (Postfix) with ESMTP id 068FA1E0495
	for <lists+dm-devel@lfdr.de>; Mon, 25 May 2020 04:10:13 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1590372613;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 references:references:list-id:list-help:list-unsubscribe:
	 list-subscribe:list-post; bh=99+TnUgRVOhuCZHOAj38pzNQVWEYzq3JadTvfbbZ4os=;
	b=GJaHL7NcuVwa9zdl45kRMCkEaSkiK9uaxZ7BfzY5NG8kH4l1a/n4Tzg3L8FsF8zUoXwAVe
	x7wMjFquZ3Z3oXttbpiotxz9lI1c9AoGmyHNXZo++eEOeVXPuyXqlR1oisQsIpsH00oxxd
	wF/YrlEeMMiZ9swdhVqshk02qlUaXvo=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-318-MP0w_AmjPfi3517T_bcctA-1; Sun, 24 May 2020 22:10:10 -0400
X-MC-Unique: MP0w_AmjPfi3517T_bcctA-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 70000107ACF7;
	Mon, 25 May 2020 02:10:03 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 7387660CC0;
	Mon, 25 May 2020 02:10:01 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id CBE0B1809543;
	Mon, 25 May 2020 02:09:57 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 04P29pHH031268 for <dm-devel@listman.util.phx.redhat.com>;
	Sun, 24 May 2020 22:09:52 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id B300C110F3BB; Mon, 25 May 2020 02:09:51 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast01.extmail.prod.ext.rdu2.redhat.com [10.11.55.17])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 96BDE112C09F
	for <dm-devel@redhat.com>; Mon, 25 May 2020 02:09:48 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 4FE8B8F3B98
	for <dm-devel@redhat.com>; Mon, 25 May 2020 02:09:47 +0000 (UTC)
Received: from esa3.hgst.iphmx.com (esa3.hgst.iphmx.com [216.71.153.141])
	(Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-234-MQd0iydONUq_NnU6e2jtOw-1; Sun, 24 May 2020 22:09:43 -0400
X-MC-Unique: MQd0iydONUq_NnU6e2jtOw-1
IronPort-SDR: Ch1Dl4abSvttnAaURWm5Z3URezUYI5LnW4AniVgxzy96M14dWypqYlIxiLJToGn2scQQ3pgxzr
	66ooqQ9588cZaYq7j8UXP29yUizcHy8cORztrVlboe9FgoIE/GPgt0QjksegRqskL8sKpR//nK
	H+EFuXvK0q6ev7ra6gc/pZeZExIPoBDC+nneHWSVOHjerRf5mGfp1pzCN1iNKf/iqphy1dkhXC
	V9JKg1OKMt8S1PRlw4NRbvjap59twDrPnjHYY5Op3CVq3UB2jS404MK/BDmJpl7xFwTEHzda0M
	L3Q=
X-IronPort-AV: E=Sophos;i="5.73,431,1583164800"; d="scan'208";a="142762153"
Received: from mail-bn7nam10lp2106.outbound.protection.outlook.com (HELO
	NAM10-BN7-obe.outbound.protection.outlook.com) ([104.47.70.106])
	by ob1.hgst.iphmx.com with ESMTP; 25 May 2020 10:09:41 +0800
Received: from CY4PR04MB3751.namprd04.prod.outlook.com (2603:10b6:903:ec::14)
	by CY4PR04MB0167.namprd04.prod.outlook.com (2603:10b6:903:3b::10)
	with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3021.24;
	Mon, 25 May 2020 02:09:40 +0000
Received: from CY4PR04MB3751.namprd04.prod.outlook.com
	([fe80::c593:f271:eebe:ac7]) by CY4PR04MB3751.namprd04.prod.outlook.com
	([fe80::c593:f271:eebe:ac7%9]) with mapi id 15.20.3021.029;
	Mon, 25 May 2020 02:09:40 +0000
From: Damien Le Moal <Damien.LeMoal@wdc.com>
To: Hannes Reinecke <hare@suse.de>
Thread-Topic: [PATCH 03/12] dm-zoned: use on-stack superblock for tertiary
	devices
Thread-Index: AQHWME8lphdKG8LpwUepS4VewGDG4w==
Date: Mon, 25 May 2020 02:09:40 +0000
Message-ID: <CY4PR04MB3751FB76DF953D2E84BFC419E7B30@CY4PR04MB3751.namprd04.prod.outlook.com>
References: <20200522153901.133375-1-hare@suse.de>
	<20200522153901.133375-4-hare@suse.de>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [199.255.47.8]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: e08ce031-89e7-4932-ac0b-08d80050aec5
x-ms-traffictypediagnostic: CY4PR04MB0167:
x-microsoft-antispam-prvs: <CY4PR04MB016764B6839C01CEA10E4D44E7B30@CY4PR04MB0167.namprd04.prod.outlook.com>
wdcipoutbound: EOP-TRUE
x-ms-oob-tlc-oobclassifiers: OLM:3044;
x-forefront-prvs: 0414DF926F
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 3TbtySq9r+wfAqJb5NdREuDnxvK0yhTfb0C4/Pgv/ZBJmuij94tj2YztQCZfYrlYGYcyZ3/p+2ZO4VFSyZ2xQxT487So7+jd4gRhCHyUM3xt78bDGz5ARuUzjgdfWibpZcZ1tjklSS61mHuJBZ/KvzBkckwlX9zfdpVYfnzLfMxRj3BvyjtRyAE21VBVzeDh1mxIEXTOhwBRAK/zFl102fZJWwvyKMszq3OoN9AMklHlg2W8g5ZgsPsknd7zzkcizplLWhXDpGS8DS/Edn2VthFzoCitybN7bXd5On9FTFdpYTta2sOEoyyZqvgcImlrPCQ5fp/mqpwX86sJDHVGUg==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
	IPV:NLI; SFV:NSPM; H:CY4PR04MB3751.namprd04.prod.outlook.com;
	PTR:; CAT:NONE; SFTY:;
	SFS:(4636009)(39860400002)(136003)(376002)(396003)(346002)(366004)(316002)(53546011)(6506007)(8936002)(186003)(478600001)(86362001)(7696005)(4326008)(33656002)(2906002)(26005)(52536014)(66446008)(91956017)(66946007)(5660300002)(76116006)(6916009)(66556008)(66476007)(71200400001)(64756008)(54906003)(55016002)(9686003)(8676002);
	DIR:OUT; SFP:1102;
x-ms-exchange-antispam-messagedata: A/52FAUbhhyS9qsR7wjCO63poJv7WkQ/bHPq3luO57Wox7qvF+hmkN0F5b1I1IOdJp7OEzYMuijFZBN28k/sAiAYe/IRHtwysNn2kMCNBY2VWDvcYlTVt5w+bAF8UWYejAPI2SeO3dp9RV8+iTGoNOhHDxle+FTUWJ+P7NkxMLMehj1l4vkQEpQnt3tWrVcTPetF4CpdWGdhuJleBHGWj/CgBwYne6pogakMPve6+XkMklj+HTVdSU4RRYH+yTnz3/VBXUE6p/Z/TYOiqShdwCUUxOB8dBww+puc8nIqKKSiUjmmuxhbL9bPpS895knyvPPjeMWY6s+hqL6skLDQBX19zpJnU4q9+EBFIyOHkCH4Ipey0aorlOFLqS33uzu+uEeMIEuApdEi3CEKMbfl5TjRq1ZYM658fiCjqEdMRm1eyNukMvDBEiG2K+qZtM3sc5qEvI6uIxvgZwB1PUxKJjWd5cRQ06azRkD201AIooI=
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e08ce031-89e7-4932-ac0b-08d80050aec5
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 May 2020 02:09:40.1869 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 1hpIql0Z7sCpZ0/Fl0e5btbBabWLbULbmx0kSBnkHGe0sTdlaWB8dF8oEwfm8fNztBK2GT+bT2iEOyDot0zOsQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR04MB0167
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 04P29pHH031268
X-loop: dm-devel@redhat.com
Cc: "dm-devel@redhat.com" <dm-devel@redhat.com>,
	Mike Snitzer <snitzer@redhat.com>
Subject: Re: [dm-devel] [PATCH 03/12] dm-zoned: use on-stack superblock for
 tertiary devices
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

On 2020/05/23 0:39, Hannes Reinecke wrote:
> Checking the teriary superblock just consists of validating UUIDs,

s/teriary/tertiary

> crcs, and the generation number; it doesn't have contents which
> would be required during the actual operation.
> So we should use an on-stack superblock and avoid having to store
> it together with the 'real' superblocks.

...a temoprary in-memory superblock allocation...

The entire structure should not be on stack... see below.

> 
> Signed-off-by: Hannes Reinecke <hare@suse.de>
> ---
>  drivers/md/dm-zoned-metadata.c | 98 +++++++++++++++++++++++-------------------
>  1 file changed, 53 insertions(+), 45 deletions(-)
> 
> diff --git a/drivers/md/dm-zoned-metadata.c b/drivers/md/dm-zoned-metadata.c
> index 3da6702bb1ae..b70a988fa771 100644
> --- a/drivers/md/dm-zoned-metadata.c
> +++ b/drivers/md/dm-zoned-metadata.c
> @@ -174,7 +174,7 @@ struct dmz_metadata {
>  	/* Zone information array */
>  	struct xarray		zones;
>  
> -	struct dmz_sb		sb[3];
> +	struct dmz_sb		sb[2];
>  	unsigned int		mblk_primary;
>  	unsigned int		sb_version;
>  	u64			sb_gen;
> @@ -995,10 +995,11 @@ int dmz_flush_metadata(struct dmz_metadata *zmd)
>  /*
>   * Check super block.
>   */
> -static int dmz_check_sb(struct dmz_metadata *zmd, unsigned int set)
> +static int dmz_check_sb(struct dmz_metadata *zmd, struct dmz_sb *dsb,
> +			bool tertiary)
>  {
> -	struct dmz_super *sb = zmd->sb[set].sb;
> -	struct dmz_dev *dev = zmd->sb[set].dev;
> +	struct dmz_super *sb = dsb->sb;
> +	struct dmz_dev *dev = dsb->dev;
>  	unsigned int nr_meta_zones, nr_data_zones;
>  	u32 crc, stored_crc;
>  	u64 gen;
> @@ -1015,7 +1016,7 @@ static int dmz_check_sb(struct dmz_metadata *zmd, unsigned int set)
>  			    DMZ_META_VER, zmd->sb_version);
>  		return -EINVAL;
>  	}
> -	if ((zmd->sb_version < 1) && (set == 2)) {
> +	if ((zmd->sb_version < 1) && tertiary) {
>  		dmz_dev_err(dev, "Tertiary superblocks are not supported");
>  		return -EINVAL;
>  	}
> @@ -1059,7 +1060,7 @@ static int dmz_check_sb(struct dmz_metadata *zmd, unsigned int set)
>  			return -ENXIO;
>  		}
>  
> -		if (set == 2) {
> +		if (tertiary) {
>  			/*
>  			 * Generation number should be 0, but it doesn't
>  			 * really matter if it isn't.
> @@ -1108,13 +1109,13 @@ static int dmz_check_sb(struct dmz_metadata *zmd, unsigned int set)
>  /*
>   * Read the first or second super block from disk.
>   */
> -static int dmz_read_sb(struct dmz_metadata *zmd, unsigned int set)
> +static int dmz_read_sb(struct dmz_metadata *zmd, struct dmz_sb *sb, int set)
>  {
>  	DMDEBUG("(%s): read superblock set %d dev %s block %llu",
>  		zmd->devname, set, zmd->sb[set].dev->name,
>  		zmd->sb[set].block);
> -	return dmz_rdwr_block(zmd->sb[set].dev, REQ_OP_READ,
> -			      zmd->sb[set].block, zmd->sb[set].mblk->page);
> +	return dmz_rdwr_block(sb->dev, REQ_OP_READ,
> +			      sb->block, sb->mblk->page);
>  }
>  
>  /*
> @@ -1142,7 +1143,7 @@ static int dmz_lookup_secondary_sb(struct dmz_metadata *zmd)
>  	zmd->sb[1].zone = xa_load(&zmd->zones, zone_id + 1);
>  	zmd->sb[1].dev = dmz_zone_to_dev(zmd, zmd->sb[1].zone);
>  	for (i = 1; i < zmd->nr_rnd_zones; i++) {
> -		if (dmz_read_sb(zmd, 1) != 0)
> +		if (dmz_read_sb(zmd, &zmd->sb[1], 1) != 0)
>  			break;
>  		if (le32_to_cpu(zmd->sb[1].sb->magic) == DMZ_MAGIC)
>  			return 0;
> @@ -1160,9 +1161,9 @@ static int dmz_lookup_secondary_sb(struct dmz_metadata *zmd)
>  }
>  
>  /*
> - * Read the first or second super block from disk.
> + * Read a super block from disk.
>   */
> -static int dmz_get_sb(struct dmz_metadata *zmd, unsigned int set)
> +static int dmz_get_sb(struct dmz_metadata *zmd, struct dmz_sb *sb, int set)
>  {
>  	struct dmz_mblock *mblk;
>  	int ret;
> @@ -1172,14 +1173,14 @@ static int dmz_get_sb(struct dmz_metadata *zmd, unsigned int set)
>  	if (!mblk)
>  		return -ENOMEM;
>  
> -	zmd->sb[set].mblk = mblk;
> -	zmd->sb[set].sb = mblk->data;
> +	sb->mblk = mblk;
> +	sb->sb = mblk->data;
>  
>  	/* Read super block */
> -	ret = dmz_read_sb(zmd, set);
> +	ret = dmz_read_sb(zmd, sb, set);
>  	if (ret) {
>  		dmz_free_mblock(zmd, mblk);
> -		zmd->sb[set].mblk = NULL;
> +		sb->mblk = NULL;
>  		return ret;
>  	}
>  
> @@ -1253,13 +1254,13 @@ static int dmz_load_sb(struct dmz_metadata *zmd)
>  	/* Read and check the primary super block */
>  	zmd->sb[0].block = dmz_start_block(zmd, zmd->sb[0].zone);
>  	zmd->sb[0].dev = dmz_zone_to_dev(zmd, zmd->sb[0].zone);
> -	ret = dmz_get_sb(zmd, 0);
> +	ret = dmz_get_sb(zmd, &zmd->sb[0], 0);
>  	if (ret) {
>  		dmz_dev_err(zmd->sb[0].dev, "Read primary super block failed");
>  		return ret;
>  	}
>  
> -	ret = dmz_check_sb(zmd, 0);
> +	ret = dmz_check_sb(zmd, &zmd->sb[0], false);
>  
>  	/* Read and check secondary super block */
>  	if (ret == 0) {
> @@ -1272,7 +1273,7 @@ static int dmz_load_sb(struct dmz_metadata *zmd)
>  		}
>  		zmd->sb[1].block = dmz_start_block(zmd, zmd->sb[1].zone);
>  		zmd->sb[1].dev = dmz_zone_to_dev(zmd, zmd->sb[1].zone);
> -		ret = dmz_get_sb(zmd, 1);
> +		ret = dmz_get_sb(zmd, &zmd->sb[1], 1);
>  	} else
>  		ret = dmz_lookup_secondary_sb(zmd);
>  
> @@ -1281,7 +1282,7 @@ static int dmz_load_sb(struct dmz_metadata *zmd)
>  		return ret;
>  	}
>  
> -	ret = dmz_check_sb(zmd, 1);
> +	ret = dmz_check_sb(zmd, &zmd->sb[1], false);
>  	if (ret == 0)
>  		sb_good[1] = true;
>  
> @@ -1326,18 +1327,32 @@ static int dmz_load_sb(struct dmz_metadata *zmd)
>  		      "Using super block %u (gen %llu)",
>  		      zmd->mblk_primary, zmd->sb_gen);
>  
> -	if ((zmd->sb_version > 1) && zmd->sb[2].zone) {
> -		zmd->sb[2].block = dmz_start_block(zmd, zmd->sb[2].zone);
> -		zmd->sb[2].dev = dmz_zone_to_dev(zmd, zmd->sb[2].zone);
> -		ret = dmz_get_sb(zmd, 2);
> -		if (ret) {
> -			dmz_dev_err(zmd->sb[2].dev,
> -				    "Read tertiary super block failed");
> -			return ret;
> +	if (zmd->sb_version > 1) {
> +		int i;
> +
> +		for (i = 1; i < zmd->nr_devs; i++) {
> +			struct dmz_sb sb;

I would rather have dmz_get_sb() allocate this struct than have it on stack...
It is not big, but still. To be symetric, we can add dmz_put_sb() for freeing it.

> +
> +			sb.block = 0;
> +			sb.zone = dmz_get(zmd, zmd->dev[i].zone_offset);
> +			sb.dev = &zmd->dev[i];
> +			if (!dmz_is_meta(sb.zone)) {
> +				dmz_dev_err(sb.dev,
> +					    "Tertiary super block zone %u not marked as metadata zone",
> +					    sb.zone->id);
> +				return -EINVAL;
> +			}
> +			ret = dmz_get_sb(zmd, &sb, i + 1);
> +			if (ret) {
> +				dmz_dev_err(sb.dev,
> +					    "Read tertiary super block failed");
> +				return ret;
> +			}
> +			ret = dmz_check_sb(zmd, &sb, true);
> +			dmz_free_mblock(zmd, sb.mblk);
> +			if (ret == -EINVAL)
> +				return ret;
>  		}
> -		ret = dmz_check_sb(zmd, 2);
> -		if (ret == -EINVAL)
> -			return ret;
>  	}
>  	return 0;
>  }
> @@ -1402,12 +1417,15 @@ static int dmz_init_zone(struct blk_zone *blkz, unsigned int num, void *data)
>  				zmd->sb[0].zone = zone;
>  			}
>  		}
> -		if (zmd->nr_devs > 1 && !zmd->sb[2].zone) {
> -			/* Tertiary superblock zone */
> -			zmd->sb[2].zone = zone;
> +		if (zmd->nr_devs > 1 && num == 0) {
> +			/*
> +			 * Tertiary superblock zones are always at the
> +			 * start of the zoned devices, so mark them
> +			 * as metadata zone.
> +			 */
> +			set_bit(DMZ_META, &zone->flags);
>  		}
>  	}
> -
>  	return 0;
>  }
>  
> @@ -2850,16 +2868,6 @@ int dmz_ctr_metadata(struct dmz_dev *dev, int num_dev,
>  		}
>  		set_bit(DMZ_META, &zone->flags);
>  	}
> -	if (zmd->sb[2].zone) {
> -		zone = dmz_get(zmd, zmd->sb[2].zone->id);
> -		if (!zone) {
> -			dmz_zmd_err(zmd,
> -				    "Tertiary metadata zone not present");
> -			ret = -ENXIO;
> -			goto err;
> -		}
> -		set_bit(DMZ_META, &zone->flags);
> -	}
>  	/* Load mapping table */
>  	ret = dmz_load_mapping(zmd);
>  	if (ret)
> 


-- 
Damien Le Moal
Western Digital Research



--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

