Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
	by mail.lfdr.de (Postfix) with ESMTP id D0BBD1A04D9
	for <lists+dm-devel@lfdr.de>; Tue,  7 Apr 2020 04:25:17 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1586226316;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 references:references:list-id:list-help:list-unsubscribe:
	 list-subscribe:list-post; bh=ta4cuZLXi8Czva5QNNHB1vV2J+roLZ0ucAT8j449CJE=;
	b=V9VyCnBGfFcDJq+IT71/c0W/F0ACPOQ0PowyDMz48SJWiwLfapO0ypGFXAB/ShltUXSTpW
	0vyJSaQbq1kcBYV1OgXy0zKQSyigr5p3tKXW8Js2yvMzHMbpSdGOW455b6O3GJK6qOGZud
	EQ5zTCjQ/pMY04qnOWEK28FhR3CnRG0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-480-HG2JDeQ1Na2ID9S9jTUEEg-1; Mon, 06 Apr 2020 22:25:13 -0400
X-MC-Unique: HG2JDeQ1Na2ID9S9jTUEEg-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id F0BEB19251A0;
	Tue,  7 Apr 2020 02:25:07 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 01A905C1B2;
	Tue,  7 Apr 2020 02:25:06 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 7B52593A6D;
	Tue,  7 Apr 2020 02:25:00 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 0372Or2W000938 for <dm-devel@listman.util.phx.redhat.com>;
	Mon, 6 Apr 2020 22:24:53 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 913D9D0175; Tue,  7 Apr 2020 02:24:53 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast03.extmail.prod.ext.rdu2.redhat.com [10.11.55.19])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 8BFC1D0170
	for <dm-devel@redhat.com>; Tue,  7 Apr 2020 02:24:51 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 291708FF662
	for <dm-devel@redhat.com>; Tue,  7 Apr 2020 02:24:51 +0000 (UTC)
Received: from esa2.hgst.iphmx.com (esa2.hgst.iphmx.com [68.232.143.124])
	(Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-485-8_iUkoP8OGeSss0EjsM0Zw-1; Mon, 06 Apr 2020 22:24:46 -0400
X-MC-Unique: 8_iUkoP8OGeSss0EjsM0Zw-1
IronPort-SDR: EH1LH9Y9xfKqqCu9EuK4g0qTkR8SZlx+EUvSWb31GIM8mwEbGe7QXjo5OzxZSH4ydU9YV2yR17
	QJY/ZBO2tdm/g32bpTCCpsNNv93D4pRZwg468eYa9C6kml2U0Z1o2WNz+hRwm87X9cawoK0nj5
	OC25XWPhk4MA3gLL6KVFihdYbiSn3XRncfBbm89+dfEkgdWmmvB1TA6yoWZyY+cD89aZk2J3ib
	RMD0xjxMv3kJIE0jPMWdb6zDUv/gfI/krGfOwcbCLcBc2876ehq6xwv0OwnsIlqTAs40PNSdN3
	fPs=
X-IronPort-AV: E=Sophos;i="5.72,353,1580745600"; d="scan'208";a="237057139"
Received: from mail-dm6nam11lp2172.outbound.protection.outlook.com (HELO
	NAM11-DM6-obe.outbound.protection.outlook.com) ([104.47.57.172])
	by ob1.hgst.iphmx.com with ESMTP; 07 Apr 2020 10:25:03 +0800
Received: from BY5PR04MB6900.namprd04.prod.outlook.com (2603:10b6:a03:229::20)
	by BY5PR04MB6549.namprd04.prod.outlook.com (2603:10b6:a03:1d2::23)
	with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2878.15;
	Tue, 7 Apr 2020 02:24:43 +0000
Received: from BY5PR04MB6900.namprd04.prod.outlook.com
	([fe80::d9cc:93c6:19f5:200c]) by
	BY5PR04MB6900.namprd04.prod.outlook.com
	([fe80::d9cc:93c6:19f5:200c%3]) with mapi id 15.20.2878.018;
	Tue, 7 Apr 2020 02:24:43 +0000
From: Damien Le Moal <Damien.LeMoal@wdc.com>
To: Hannes Reinecke <hare@suse.de>, Mike Snitzer <snitzer@redhat.com>
Thread-Topic: [PATCH 04/11] dm-zoned: move fields from struct dmz_dev to
	dmz_metadata
Thread-Index: AQHWDDjiE5QKNzcei0uIaS/Gk3L8JA==
Date: Tue, 7 Apr 2020 02:24:43 +0000
Message-ID: <BY5PR04MB69002D8789BF5EC1D78A853EE7C30@BY5PR04MB6900.namprd04.prod.outlook.com>
References: <20200406143505.133271-1-hare@suse.de>
	<20200406143505.133271-5-hare@suse.de>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [129.253.182.57]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 22b954cd-143b-4798-a20f-08d7da9ad582
x-ms-traffictypediagnostic: BY5PR04MB6549:
x-microsoft-antispam-prvs: <BY5PR04MB6549E85B226BFE253AFCCCF9E7C30@BY5PR04MB6549.namprd04.prod.outlook.com>
wdcipoutbound: EOP-TRUE
x-ms-oob-tlc-oobclassifiers: OLM:131;
x-forefront-prvs: 036614DD9C
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
	IPV:NLI; SFV:NSPM; H:BY5PR04MB6900.namprd04.prod.outlook.com;
	PTR:; CAT:NONE; SFTY:;
	SFS:(10019020)(4636009)(396003)(39850400004)(366004)(346002)(136003)(376002)(8936002)(81156014)(478600001)(2906002)(30864003)(71200400001)(81166006)(86362001)(8676002)(4326008)(76116006)(26005)(53546011)(6506007)(186003)(33656002)(5660300002)(7696005)(316002)(66446008)(64756008)(66556008)(66946007)(52536014)(9686003)(55016002)(66476007)(54906003)(110136005)(579004);
	DIR:OUT; SFP:1102;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: URCl9ohIL1BngObKYaI3KeSx0YPCEteAd7AIIA5OkX0Pj5LG+hisRGcf+H+rkKNNA1bq8JowHFzHjolYWeL5uTmnhJCjUV/Q/CCbXAB+FEbvBZwGm7ICJNLmGu4gkngbL/WcWOMtEhjOrdjh87GIPzfTjwjg80UzIaLAYn7+nOTsZ2EzD1Mo3aU5PWOwWLpztYgdP9n4ODJ07VZSuAXWV87/w3u2RV4I9FophrJBJtLZ2AhJD9bUiq/pV13h8KtbtruSJ2ocUyo9YrjP5TYjW0KXQRkOPNdZsi6Xs988h9yFWsIYnHOJ8E9IPQDDUq9KCQpPNsCj5x2s9h8tE2k+Mtac2PfAXOWoGZr73jyBw0VnuLoAsAlwnIaMLLvN+RU4J6BC6e519qyQAuSNOpE9x+wArrtYKhw1ma5+Rg+S45A58ATa1f9BpaXkIHvsl3Rr
x-ms-exchange-antispam-messagedata: BZ96buL1OInj51FgvaHYU+vGJ2meLEI0Ts0GI3jU5xWEv32rGSDPomwEu9G8/XGxfCMXZYNZ3DXsT1oHG/36gibuOt5afz4I+Ms7odsT6IlPEjNgiJEKx7i1DQmVLpb8MowwYweJE5zGwI9wh+KJ5Q==
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 22b954cd-143b-4798-a20f-08d7da9ad582
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Apr 2020 02:24:43.7165 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: q4hoO6dbKecfdBH93G23qOorKj0JFyfGj/pB7mvm+ItvodwONuZzergI1vB0ICsiDF/EYqfu4FvWINFvUZtkJw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR04MB6549
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 0372Or2W000938
X-loop: dm-devel@redhat.com
Cc: Bob Liu <bob.liu@oracle.com>, "dm-devel@redhat.com" <dm-devel@redhat.com>
Subject: Re: [dm-devel] [PATCH 04/11] dm-zoned: move fields from struct
 dmz_dev to dmz_metadata
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On 2020/04/07 2:29, Hannes Reinecke wrote:
> Move fields from the device structure into the metadata structure
> and provide accessor functions.
> 
> Signed-off-by: Hannes Reinecke <hare@suse.de>

Looks OK.

Reviewed-by: Damien Le Moal <damien.lemoal@wdc.com>

> ---
>  drivers/md/dm-zoned-metadata.c | 88 +++++++++++++++++++++++-----------
>  drivers/md/dm-zoned-reclaim.c  |  8 ++--
>  drivers/md/dm-zoned-target.c   | 52 ++++++++++----------
>  drivers/md/dm-zoned.h          | 14 +++---
>  4 files changed, 97 insertions(+), 65 deletions(-)
> 
> diff --git a/drivers/md/dm-zoned-metadata.c b/drivers/md/dm-zoned-metadata.c
> index 731aa4c99373..ae261bf6452c 100644
> --- a/drivers/md/dm-zoned-metadata.c
> +++ b/drivers/md/dm-zoned-metadata.c
> @@ -138,9 +138,16 @@ struct dmz_metadata {
>  	unsigned int		zone_nr_bitmap_blocks;
>  	unsigned int		zone_bits_per_mblk;
>  
> +	sector_t		zone_nr_blocks;
> +	sector_t		zone_nr_blocks_shift;
> +
> +	sector_t		zone_nr_sectors;
> +	sector_t		zone_nr_sectors_shift;
> +
>  	unsigned int		nr_bitmap_blocks;
>  	unsigned int		nr_map_blocks;
>  
> +	unsigned int		nr_zones;
>  	unsigned int		nr_useable_zones;
>  	unsigned int		nr_meta_blocks;
>  	unsigned int		nr_meta_zones;
> @@ -195,12 +202,12 @@ unsigned int dmz_id(struct dmz_metadata *zmd, struct dm_zone *zone)
>  
>  sector_t dmz_start_sect(struct dmz_metadata *zmd, struct dm_zone *zone)
>  {
> -	return (sector_t)dmz_id(zmd, zone) << zmd->dev->zone_nr_sectors_shift;
> +	return (sector_t)dmz_id(zmd, zone) << zmd->zone_nr_sectors_shift;
>  }
>  
>  sector_t dmz_start_block(struct dmz_metadata *zmd, struct dm_zone *zone)
>  {
> -	return (sector_t)dmz_id(zmd, zone) << zmd->dev->zone_nr_blocks_shift;
> +	return (sector_t)dmz_id(zmd, zone) << zmd->zone_nr_blocks_shift;
>  }
>  
>  struct dmz_dev *dmz_zone_to_dev(struct dmz_metadata *zmd, struct dm_zone *zone)
> @@ -208,9 +215,29 @@ struct dmz_dev *dmz_zone_to_dev(struct dmz_metadata *zmd, struct dm_zone *zone)
>  	return &zmd->dev[0];
>  }
>  
> +unsigned int dmz_zone_nr_blocks(struct dmz_metadata *zmd)
> +{
> +	return zmd->zone_nr_blocks;
> +}
> +
> +unsigned int dmz_zone_nr_blocks_shift(struct dmz_metadata *zmd)
> +{
> +	return zmd->zone_nr_blocks_shift;
> +}
> +
> +unsigned int dmz_zone_nr_sectors(struct dmz_metadata *zmd)
> +{
> +	return zmd->zone_nr_sectors;
> +}
> +
> +unsigned int dmz_zone_nr_sectors_shift(struct dmz_metadata *zmd)
> +{
> +	return zmd->zone_nr_sectors_shift;
> +}
> +
>  unsigned int dmz_nr_zones(struct dmz_metadata *zmd)
>  {
> -	return zmd->dev->nr_zones;
> +	return zmd->nr_zones;
>  }
>  
>  unsigned int dmz_nr_chunks(struct dmz_metadata *zmd)
> @@ -887,8 +914,8 @@ static int dmz_check_sb(struct dmz_metadata *zmd, unsigned int set)
>  		return -ENXIO;
>  	}
>  
> -	nr_meta_zones = (le32_to_cpu(sb->nr_meta_blocks) + dev->zone_nr_blocks - 1)
> -		>> dev->zone_nr_blocks_shift;
> +	nr_meta_zones = (le32_to_cpu(sb->nr_meta_blocks) + zmd->zone_nr_blocks - 1)
> +		>> zmd->zone_nr_blocks_shift;
>  	if (!nr_meta_zones ||
>  	    nr_meta_zones >= zmd->nr_rnd_zones) {
>  		dmz_dev_err(dev, "Invalid number of metadata blocks");
> @@ -937,7 +964,7 @@ static int dmz_read_sb(struct dmz_metadata *zmd, unsigned int set)
>   */
>  static int dmz_lookup_secondary_sb(struct dmz_metadata *zmd)
>  {
> -	unsigned int zone_nr_blocks = zmd->dev->zone_nr_blocks;
> +	unsigned int zone_nr_blocks = zmd->zone_nr_blocks;
>  	struct dmz_mblock *mblk;
>  	int i;
>  
> @@ -1148,7 +1175,7 @@ static int dmz_init_zone(struct blk_zone *blkz, unsigned int idx, void *data)
>  	struct dmz_dev *dev = zmd->dev;
>  
>  	/* Ignore the eventual last runt (smaller) zone */
> -	if (blkz->len != dev->zone_nr_sectors) {
> +	if (blkz->len != zmd->zone_nr_sectors) {
>  		if (blkz->start + blkz->len == dev->capacity)
>  			return 0;
>  		return -ENXIO;
> @@ -1213,19 +1240,24 @@ static int dmz_init_zones(struct dmz_metadata *zmd)
>  	int ret;
>  
>  	/* Init */
> -	zmd->zone_bitmap_size = dev->zone_nr_blocks >> 3;
> +	zmd->zone_nr_sectors = dev->zone_nr_sectors;
> +	zmd->zone_nr_sectors_shift = ilog2(zmd->zone_nr_sectors);
> +	zmd->zone_nr_blocks = dmz_sect2blk(zmd->zone_nr_sectors);
> +	zmd->zone_nr_blocks_shift = ilog2(zmd->zone_nr_blocks);
> +	zmd->zone_bitmap_size = zmd->zone_nr_blocks >> 3;
>  	zmd->zone_nr_bitmap_blocks =
>  		max_t(sector_t, 1, zmd->zone_bitmap_size >> DMZ_BLOCK_SHIFT);
> -	zmd->zone_bits_per_mblk = min_t(sector_t, dev->zone_nr_blocks,
> +	zmd->zone_bits_per_mblk = min_t(sector_t, zmd->zone_nr_blocks,
>  					DMZ_BLOCK_SIZE_BITS);
>  
>  	/* Allocate zone array */
> -	zmd->zones = kcalloc(dev->nr_zones, sizeof(struct dm_zone), GFP_KERNEL);
> +	zmd->nr_zones = dev->nr_zones;
> +	zmd->zones = kcalloc(zmd->nr_zones, sizeof(struct dm_zone), GFP_KERNEL);
>  	if (!zmd->zones)
>  		return -ENOMEM;
>  
>  	dmz_dev_info(dev, "Using %zu B for zone information",
> -		     sizeof(struct dm_zone) * dev->nr_zones);
> +		     sizeof(struct dm_zone) * zmd->nr_zones);
>  
>  	/*
>  	 * Get zone information and initialize zone descriptors.  At the same
> @@ -1344,7 +1376,7 @@ static int dmz_reset_zone(struct dmz_metadata *zmd, struct dm_zone *zone)
>  
>  		ret = blkdev_zone_mgmt(dev->bdev, REQ_OP_ZONE_RESET,
>  				       dmz_start_sect(zmd, zone),
> -				       dev->zone_nr_sectors, GFP_NOIO);
> +				       zmd->zone_nr_sectors, GFP_NOIO);
>  		if (ret) {
>  			dmz_dev_err(dev, "Reset zone %u failed %d",
>  				    dmz_id(zmd, zone), ret);
> @@ -1398,7 +1430,7 @@ static int dmz_load_mapping(struct dmz_metadata *zmd)
>  		if (dzone_id == DMZ_MAP_UNMAPPED)
>  			goto next;
>  
> -		if (dzone_id >= dev->nr_zones) {
> +		if (dzone_id >= zmd->nr_zones) {
>  			dmz_dev_err(dev, "Chunk %u mapping: invalid data zone ID %u",
>  				    chunk, dzone_id);
>  			return -EIO;
> @@ -1419,7 +1451,7 @@ static int dmz_load_mapping(struct dmz_metadata *zmd)
>  		if (bzone_id == DMZ_MAP_UNMAPPED)
>  			goto next;
>  
> -		if (bzone_id >= dev->nr_zones) {
> +		if (bzone_id >= zmd->nr_zones) {
>  			dmz_dev_err(dev, "Chunk %u mapping: invalid buffer zone ID %u",
>  				    chunk, bzone_id);
>  			return -EIO;
> @@ -1451,7 +1483,7 @@ static int dmz_load_mapping(struct dmz_metadata *zmd)
>  	 * fully initialized. All remaining zones are unmapped data
>  	 * zones. Finish initializing those here.
>  	 */
> -	for (i = 0; i < dev->nr_zones; i++) {
> +	for (i = 0; i < zmd->nr_zones; i++) {
>  		dzone = dmz_get(zmd, i);
>  		if (dmz_is_meta(dzone))
>  			continue;
> @@ -1996,7 +2028,7 @@ int dmz_copy_valid_blocks(struct dmz_metadata *zmd, struct dm_zone *from_zone,
>  	sector_t chunk_block = 0;
>  
>  	/* Get the zones bitmap blocks */
> -	while (chunk_block < zmd->dev->zone_nr_blocks) {
> +	while (chunk_block < zmd->zone_nr_blocks) {
>  		from_mblk = dmz_get_bitmap(zmd, from_zone, chunk_block);
>  		if (IS_ERR(from_mblk))
>  			return PTR_ERR(from_mblk);
> @@ -2031,7 +2063,7 @@ int dmz_merge_valid_blocks(struct dmz_metadata *zmd, struct dm_zone *from_zone,
>  	int ret;
>  
>  	/* Get the zones bitmap blocks */
> -	while (chunk_block < zmd->dev->zone_nr_blocks) {
> +	while (chunk_block < zmd->zone_nr_blocks) {
>  		/* Get a valid region from the source zone */
>  		ret = dmz_first_valid_block(zmd, from_zone, &chunk_block);
>  		if (ret <= 0)
> @@ -2055,7 +2087,7 @@ int dmz_validate_blocks(struct dmz_metadata *zmd, struct dm_zone *zone,
>  			sector_t chunk_block, unsigned int nr_blocks)
>  {
>  	unsigned int count, bit, nr_bits;
> -	unsigned int zone_nr_blocks = zmd->dev->zone_nr_blocks;
> +	unsigned int zone_nr_blocks = zmd->zone_nr_blocks;
>  	struct dmz_mblock *mblk;
>  	unsigned int n = 0;
>  
> @@ -2142,7 +2174,7 @@ int dmz_invalidate_blocks(struct dmz_metadata *zmd, struct dm_zone *zone,
>  	dmz_dev_debug(zmd->dev, "=> INVALIDATE zone %u, block %llu, %u blocks",
>  		      dmz_id(zmd, zone), (u64)chunk_block, nr_blocks);
>  
> -	WARN_ON(chunk_block + nr_blocks > zmd->dev->zone_nr_blocks);
> +	WARN_ON(chunk_block + nr_blocks > zmd->zone_nr_blocks);
>  
>  	while (nr_blocks) {
>  		/* Get bitmap block */
> @@ -2186,7 +2218,7 @@ static int dmz_test_block(struct dmz_metadata *zmd, struct dm_zone *zone,
>  	struct dmz_mblock *mblk;
>  	int ret;
>  
> -	WARN_ON(chunk_block >= zmd->dev->zone_nr_blocks);
> +	WARN_ON(chunk_block >= zmd->zone_nr_blocks);
>  
>  	/* Get bitmap block */
>  	mblk = dmz_get_bitmap(zmd, zone, chunk_block);
> @@ -2216,7 +2248,7 @@ static int dmz_to_next_set_block(struct dmz_metadata *zmd, struct dm_zone *zone,
>  	unsigned long *bitmap;
>  	int n = 0;
>  
> -	WARN_ON(chunk_block + nr_blocks > zmd->dev->zone_nr_blocks);
> +	WARN_ON(chunk_block + nr_blocks > zmd->zone_nr_blocks);
>  
>  	while (nr_blocks) {
>  		/* Get bitmap block */
> @@ -2260,7 +2292,7 @@ int dmz_block_valid(struct dmz_metadata *zmd, struct dm_zone *zone,
>  
>  	/* The block is valid: get the number of valid blocks from block */
>  	return dmz_to_next_set_block(zmd, zone, chunk_block,
> -				     zmd->dev->zone_nr_blocks - chunk_block, 0);
> +				     zmd->zone_nr_blocks - chunk_block, 0);
>  }
>  
>  /*
> @@ -2276,7 +2308,7 @@ int dmz_first_valid_block(struct dmz_metadata *zmd, struct dm_zone *zone,
>  	int ret;
>  
>  	ret = dmz_to_next_set_block(zmd, zone, start_block,
> -				    zmd->dev->zone_nr_blocks - start_block, 1);
> +				    zmd->zone_nr_blocks - start_block, 1);
>  	if (ret < 0)
>  		return ret;
>  
> @@ -2284,7 +2316,7 @@ int dmz_first_valid_block(struct dmz_metadata *zmd, struct dm_zone *zone,
>  	*chunk_block = start_block;
>  
>  	return dmz_to_next_set_block(zmd, zone, start_block,
> -				     zmd->dev->zone_nr_blocks - start_block, 0);
> +				     zmd->zone_nr_blocks - start_block, 0);
>  }
>  
>  /*
> @@ -2323,7 +2355,7 @@ static void dmz_get_zone_weight(struct dmz_metadata *zmd, struct dm_zone *zone)
>  	struct dmz_mblock *mblk;
>  	sector_t chunk_block = 0;
>  	unsigned int bit, nr_bits;
> -	unsigned int nr_blocks = zmd->dev->zone_nr_blocks;
> +	unsigned int nr_blocks = zmd->zone_nr_blocks;
>  	void *bitmap;
>  	int n = 0;
>  
> @@ -2495,7 +2527,7 @@ int dmz_ctr_metadata(struct dmz_dev *dev, struct dmz_metadata **metadata)
>  	dmz_dev_info(dev, "  %llu 512-byte logical sectors",
>  		     (u64)dev->capacity);
>  	dmz_dev_info(dev, "  %u zones of %llu 512-byte logical sectors",
> -		     dev->nr_zones, (u64)dev->zone_nr_sectors);
> +		     zmd->nr_zones, (u64)zmd->zone_nr_sectors);
>  	dmz_dev_info(dev, "  %u metadata zones",
>  		     zmd->nr_meta_zones * 2);
>  	dmz_dev_info(dev, "  %u data zones for %u chunks",
> @@ -2548,7 +2580,7 @@ int dmz_resume_metadata(struct dmz_metadata *zmd)
>  	int ret;
>  
>  	/* Check zones */
> -	for (i = 0; i < dev->nr_zones; i++) {
> +	for (i = 0; i < zmd->nr_zones; i++) {
>  		zone = dmz_get(zmd, i);
>  		if (!zone) {
>  			dmz_dev_err(dev, "Unable to get zone %u", i);
> @@ -2576,7 +2608,7 @@ int dmz_resume_metadata(struct dmz_metadata *zmd)
>  				    i, (u64)zone->wp_block, (u64)wp_block);
>  			zone->wp_block = wp_block;
>  			dmz_invalidate_blocks(zmd, zone, zone->wp_block,
> -					      dev->zone_nr_blocks - zone->wp_block);
> +					      zmd->zone_nr_blocks - zone->wp_block);
>  		}
>  	}
>  
> diff --git a/drivers/md/dm-zoned-reclaim.c b/drivers/md/dm-zoned-reclaim.c
> index e7ace908a9b7..95d2c8870480 100644
> --- a/drivers/md/dm-zoned-reclaim.c
> +++ b/drivers/md/dm-zoned-reclaim.c
> @@ -128,7 +128,7 @@ static int dmz_reclaim_copy(struct dmz_reclaim *zrc,
>  	if (dmz_is_seq(src_zone))
>  		end_block = src_zone->wp_block;
>  	else
> -		end_block = dev->zone_nr_blocks;
> +		end_block = dmz_zone_nr_blocks(zmd);
>  	src_zone_block = dmz_start_block(zmd, src_zone);
>  	dst_zone_block = dmz_start_block(zmd, dst_zone);
>  
> @@ -210,7 +210,7 @@ static int dmz_reclaim_buf(struct dmz_reclaim *zrc, struct dm_zone *dzone)
>  	ret = dmz_merge_valid_blocks(zmd, bzone, dzone, chunk_block);
>  	if (ret == 0) {
>  		/* Free the buffer zone */
> -		dmz_invalidate_blocks(zmd, bzone, 0, zrc->dev->zone_nr_blocks);
> +		dmz_invalidate_blocks(zmd, bzone, 0, dmz_zone_nr_blocks(zmd));
>  		dmz_lock_map(zmd);
>  		dmz_unmap_zone(zmd, bzone);
>  		dmz_unlock_zone_reclaim(dzone);
> @@ -252,7 +252,7 @@ static int dmz_reclaim_seq_data(struct dmz_reclaim *zrc, struct dm_zone *dzone)
>  		 * Free the data zone and remap the chunk to
>  		 * the buffer zone.
>  		 */
> -		dmz_invalidate_blocks(zmd, dzone, 0, zrc->dev->zone_nr_blocks);
> +		dmz_invalidate_blocks(zmd, dzone, 0, dmz_zone_nr_blocks(zmd));
>  		dmz_lock_map(zmd);
>  		dmz_unmap_zone(zmd, bzone);
>  		dmz_unmap_zone(zmd, dzone);
> @@ -306,7 +306,7 @@ static int dmz_reclaim_rnd_data(struct dmz_reclaim *zrc, struct dm_zone *dzone)
>  		dmz_unlock_map(zmd);
>  	} else {
>  		/* Free the data zone and remap the chunk */
> -		dmz_invalidate_blocks(zmd, dzone, 0, zrc->dev->zone_nr_blocks);
> +		dmz_invalidate_blocks(zmd, dzone, 0, dmz_zone_nr_blocks(zmd));
>  		dmz_lock_map(zmd);
>  		dmz_unmap_zone(zmd, dzone);
>  		dmz_unlock_zone_reclaim(dzone);
> diff --git a/drivers/md/dm-zoned-target.c b/drivers/md/dm-zoned-target.c
> index 44e30a7de8b9..f4e3be7f9474 100644
> --- a/drivers/md/dm-zoned-target.c
> +++ b/drivers/md/dm-zoned-target.c
> @@ -165,7 +165,8 @@ static void dmz_handle_read_zero(struct dmz_target *dmz, struct bio *bio,
>  static int dmz_handle_read(struct dmz_target *dmz, struct dm_zone *zone,
>  			   struct bio *bio)
>  {
> -	sector_t chunk_block = dmz_chunk_block(dmz->dev, dmz_bio_block(bio));
> +	struct dmz_metadata *zmd = dmz->metadata;
> +	sector_t chunk_block = dmz_chunk_block(zmd, dmz_bio_block(bio));
>  	unsigned int nr_blocks = dmz_bio_blocks(bio);
>  	sector_t end_block = chunk_block + nr_blocks;
>  	struct dm_zone *rzone, *bzone;
> @@ -178,9 +179,9 @@ static int dmz_handle_read(struct dmz_target *dmz, struct dm_zone *zone,
>  	}
>  
>  	dmz_dev_debug(dmz->dev, "READ chunk %llu -> %s zone %u, block %llu, %u blocks",
> -		      (unsigned long long)dmz_bio_chunk(dmz->dev, bio),
> +		      (unsigned long long)dmz_bio_chunk(zmd, bio),
>  		      (dmz_is_rnd(zone) ? "RND" : "SEQ"),
> -		      dmz_id(dmz->metadata, zone),
> +		      dmz_id(zmd, zone),
>  		      (unsigned long long)chunk_block, nr_blocks);
>  
>  	/* Check block validity to determine the read location */
> @@ -189,7 +190,7 @@ static int dmz_handle_read(struct dmz_target *dmz, struct dm_zone *zone,
>  		nr_blocks = 0;
>  		if (dmz_is_rnd(zone) || chunk_block < zone->wp_block) {
>  			/* Test block validity in the data zone */
> -			ret = dmz_block_valid(dmz->metadata, zone, chunk_block);
> +			ret = dmz_block_valid(zmd, zone, chunk_block);
>  			if (ret < 0)
>  				return ret;
>  			if (ret > 0) {
> @@ -204,7 +205,7 @@ static int dmz_handle_read(struct dmz_target *dmz, struct dm_zone *zone,
>  		 * Check the buffer zone, if there is one.
>  		 */
>  		if (!nr_blocks && bzone) {
> -			ret = dmz_block_valid(dmz->metadata, bzone, chunk_block);
> +			ret = dmz_block_valid(zmd, bzone, chunk_block);
>  			if (ret < 0)
>  				return ret;
>  			if (ret > 0) {
> @@ -308,16 +309,17 @@ static int dmz_handle_buffered_write(struct dmz_target *dmz,
>  static int dmz_handle_write(struct dmz_target *dmz, struct dm_zone *zone,
>  			    struct bio *bio)
>  {
> -	sector_t chunk_block = dmz_chunk_block(dmz->dev, dmz_bio_block(bio));
> +	struct dmz_metadata *zmd = dmz->metadata;
> +	sector_t chunk_block = dmz_chunk_block(zmd, dmz_bio_block(bio));
>  	unsigned int nr_blocks = dmz_bio_blocks(bio);
>  
>  	if (!zone)
>  		return -ENOSPC;
>  
>  	dmz_dev_debug(dmz->dev, "WRITE chunk %llu -> %s zone %u, block %llu, %u blocks",
> -		      (unsigned long long)dmz_bio_chunk(dmz->dev, bio),
> +		      (unsigned long long)dmz_bio_chunk(zmd, bio),
>  		      (dmz_is_rnd(zone) ? "RND" : "SEQ"),
> -		      dmz_id(dmz->metadata, zone),
> +		      dmz_id(zmd, zone),
>  		      (unsigned long long)chunk_block, nr_blocks);
>  
>  	if (dmz_is_rnd(zone) || chunk_block == zone->wp_block) {
> @@ -345,7 +347,7 @@ static int dmz_handle_discard(struct dmz_target *dmz, struct dm_zone *zone,
>  	struct dmz_metadata *zmd = dmz->metadata;
>  	sector_t block = dmz_bio_block(bio);
>  	unsigned int nr_blocks = dmz_bio_blocks(bio);
> -	sector_t chunk_block = dmz_chunk_block(dmz->dev, block);
> +	sector_t chunk_block = dmz_chunk_block(zmd, block);
>  	int ret = 0;
>  
>  	/* For unmapped chunks, there is nothing to do */
> @@ -356,7 +358,7 @@ static int dmz_handle_discard(struct dmz_target *dmz, struct dm_zone *zone,
>  		return -EROFS;
>  
>  	dmz_dev_debug(dmz->dev, "DISCARD chunk %llu -> zone %u, block %llu, %u blocks",
> -		      (unsigned long long)dmz_bio_chunk(dmz->dev, bio),
> +		      (unsigned long long)dmz_bio_chunk(zmd, bio),
>  		      dmz_id(zmd, zone),
>  		      (unsigned long long)chunk_block, nr_blocks);
>  
> @@ -402,7 +404,7 @@ static void dmz_handle_bio(struct dmz_target *dmz, struct dm_chunk_work *cw,
>  	 * mapping for read and discard. If a mapping is obtained,
>  	 + the zone returned will be set to active state.
>  	 */
> -	zone = dmz_get_chunk_mapping(zmd, dmz_bio_chunk(dmz->dev, bio),
> +	zone = dmz_get_chunk_mapping(zmd, dmz_bio_chunk(zmd, bio),
>  				     bio_op(bio));
>  	if (IS_ERR(zone)) {
>  		ret = PTR_ERR(zone);
> @@ -525,7 +527,7 @@ static void dmz_flush_work(struct work_struct *work)
>   */
>  static int dmz_queue_chunk_work(struct dmz_target *dmz, struct bio *bio)
>  {
> -	unsigned int chunk = dmz_bio_chunk(dmz->dev, bio);
> +	unsigned int chunk = dmz_bio_chunk(dmz->metadata, bio);
>  	struct dm_chunk_work *cw;
>  	int ret = 0;
>  
> @@ -618,6 +620,7 @@ bool dmz_check_bdev(struct dmz_dev *dmz_dev)
>  static int dmz_map(struct dm_target *ti, struct bio *bio)
>  {
>  	struct dmz_target *dmz = ti->private;
> +	struct dmz_metadata *zmd = dmz->metadata;
>  	struct dmz_dev *dev = dmz->dev;
>  	struct dmz_bioctx *bioctx = dm_per_bio_data(bio, sizeof(struct dmz_bioctx));
>  	sector_t sector = bio->bi_iter.bi_sector;
> @@ -630,8 +633,8 @@ static int dmz_map(struct dm_target *ti, struct bio *bio)
>  
>  	dmz_dev_debug(dev, "BIO op %d sector %llu + %u => chunk %llu, block %llu, %u blocks",
>  		      bio_op(bio), (unsigned long long)sector, nr_sectors,
> -		      (unsigned long long)dmz_bio_chunk(dmz->dev, bio),
> -		      (unsigned long long)dmz_chunk_block(dmz->dev, dmz_bio_block(bio)),
> +		      (unsigned long long)dmz_bio_chunk(zmd, bio),
> +		      (unsigned long long)dmz_chunk_block(zmd, dmz_bio_block(bio)),
>  		      (unsigned int)dmz_bio_blocks(bio));
>  
>  	bio_set_dev(bio, dev->bdev);
> @@ -659,16 +662,16 @@ static int dmz_map(struct dm_target *ti, struct bio *bio)
>  	}
>  
>  	/* Split zone BIOs to fit entirely into a zone */
> -	chunk_sector = sector & (dev->zone_nr_sectors - 1);
> -	if (chunk_sector + nr_sectors > dev->zone_nr_sectors)
> -		dm_accept_partial_bio(bio, dev->zone_nr_sectors - chunk_sector);
> +	chunk_sector = sector & (dmz_zone_nr_sectors(zmd) - 1);
> +	if (chunk_sector + nr_sectors > dmz_zone_nr_sectors(zmd))
> +		dm_accept_partial_bio(bio, dmz_zone_nr_sectors(zmd) - chunk_sector);
>  
>  	/* Now ready to handle this BIO */
>  	ret = dmz_queue_chunk_work(dmz, bio);
>  	if (ret) {
>  		dmz_dev_debug(dmz->dev,
>  			      "BIO op %d, can't process chunk %llu, err %i\n",
> -			      bio_op(bio), (u64)dmz_bio_chunk(dmz->dev, bio),
> +			      bio_op(bio), (u64)dmz_bio_chunk(zmd, bio),
>  			      ret);
>  		return DM_MAPIO_REQUEUE;
>  	}
> @@ -722,10 +725,6 @@ static int dmz_get_zoned_device(struct dm_target *ti, char *path)
>  	}
>  
>  	dev->zone_nr_sectors = blk_queue_zone_sectors(q);
> -	dev->zone_nr_sectors_shift = ilog2(dev->zone_nr_sectors);
> -
> -	dev->zone_nr_blocks = dmz_sect2blk(dev->zone_nr_sectors);
> -	dev->zone_nr_blocks_shift = ilog2(dev->zone_nr_blocks);
>  
>  	dev->nr_zones = blkdev_nr_zones(dev->bdev->bd_disk);
>  
> @@ -790,7 +789,7 @@ static int dmz_ctr(struct dm_target *ti, unsigned int argc, char **argv)
>  	}
>  
>  	/* Set target (no write same support) */
> -	ti->max_io_len = dev->zone_nr_sectors << 9;
> +	ti->max_io_len = dmz_zone_nr_sectors(dmz->metadata) << 9;
>  	ti->num_flush_bios = 1;
>  	ti->num_discard_bios = 1;
>  	ti->num_write_zeroes_bios = 1;
> @@ -799,7 +798,8 @@ static int dmz_ctr(struct dm_target *ti, unsigned int argc, char **argv)
>  	ti->discards_supported = true;
>  
>  	/* The exposed capacity is the number of chunks that can be mapped */
> -	ti->len = (sector_t)dmz_nr_chunks(dmz->metadata) << dev->zone_nr_sectors_shift;
> +	ti->len = (sector_t)dmz_nr_chunks(dmz->metadata) <<
> +		dmz_zone_nr_sectors_shift(dmz->metadata);
>  
>  	/* Zone BIO */
>  	ret = bioset_init(&dmz->bio_set, DMZ_MIN_BIOS, 0, 0);
> @@ -895,7 +895,7 @@ static void dmz_dtr(struct dm_target *ti)
>  static void dmz_io_hints(struct dm_target *ti, struct queue_limits *limits)
>  {
>  	struct dmz_target *dmz = ti->private;
> -	unsigned int chunk_sectors = dmz->dev->zone_nr_sectors;
> +	unsigned int chunk_sectors = dmz_zone_nr_sectors(dmz->metadata);
>  
>  	limits->logical_block_size = DMZ_BLOCK_SIZE;
>  	limits->physical_block_size = DMZ_BLOCK_SIZE;
> @@ -960,7 +960,7 @@ static int dmz_iterate_devices(struct dm_target *ti,
>  {
>  	struct dmz_target *dmz = ti->private;
>  	struct dmz_dev *dev = dmz->dev;
> -	sector_t capacity = dev->capacity & ~(dev->zone_nr_sectors - 1);
> +	sector_t capacity = dev->capacity & ~(dmz_zone_nr_sectors(dmz->metadata) - 1);
>  
>  	return fn(ti, dmz->ddev, 0, capacity, data);
>  }
> diff --git a/drivers/md/dm-zoned.h b/drivers/md/dm-zoned.h
> index 39d59898abbe..c1b7b9a729c2 100644
> --- a/drivers/md/dm-zoned.h
> +++ b/drivers/md/dm-zoned.h
> @@ -60,15 +60,11 @@ struct dmz_dev {
>  	unsigned int		flags;
>  
>  	sector_t		zone_nr_sectors;
> -	unsigned int		zone_nr_sectors_shift;
> -
> -	sector_t		zone_nr_blocks;
> -	sector_t		zone_nr_blocks_shift;
>  };
>  
> -#define dmz_bio_chunk(dev, bio)	((bio)->bi_iter.bi_sector >> \
> -				 (dev)->zone_nr_sectors_shift)
> -#define dmz_chunk_block(dev, b)	((b) & ((dev)->zone_nr_blocks - 1))
> +#define dmz_bio_chunk(zmd, bio)	((bio)->bi_iter.bi_sector >> \
> +				 dmz_zone_nr_sectors_shift(zmd))
> +#define dmz_chunk_block(zmd, b)	((b) & (dmz_zone_nr_blocks(zmd) - 1))
>  
>  /* Device flags. */
>  #define DMZ_BDEV_DYING		(1 << 0)
> @@ -198,6 +194,10 @@ unsigned int dmz_nr_rnd_zones(struct dmz_metadata *zmd);
>  unsigned int dmz_nr_unmap_rnd_zones(struct dmz_metadata *zmd);
>  unsigned int dmz_nr_seq_zones(struct dmz_metadata *zmd);
>  unsigned int dmz_nr_unmap_seq_zones(struct dmz_metadata *zmd);
> +unsigned int dmz_zone_nr_blocks(struct dmz_metadata *zmd);
> +unsigned int dmz_zone_nr_blocks_shift(struct dmz_metadata *zmd);
> +unsigned int dmz_zone_nr_sectors(struct dmz_metadata *zmd);
> +unsigned int dmz_zone_nr_sectors_shift(struct dmz_metadata *zmd);
>  
>  /*
>   * Activate a zone (increment its reference count).
> 


-- 
Damien Le Moal
Western Digital Research



--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

