Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com [205.139.110.120])
	by mail.lfdr.de (Postfix) with ESMTP id 56F4D1D1306
	for <lists+dm-devel@lfdr.de>; Wed, 13 May 2020 14:45:41 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1589373940;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 references:references:list-id:list-help:list-unsubscribe:
	 list-subscribe:list-post; bh=N6LKBNyRDZ800FWLiER8MJE8uJvefPzqADB9YKv5fdQ=;
	b=ZVskl0q4yvU/1gppzBCK+TC0e0faaH0Ti1AqjFt1vRjJGdkwY++28+Fhz1ktimwmxjpQlW
	2vOxL30uLW4TLtX9/1Lr+YujeSogjv6BnfQZdwD/kki9hMzDl+fFdFddMubirvkfkT6NMM
	bY1w3f8kuImOM6ktSSmzed20sKocVfU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-466-S-bjMy9BMW-OHIjLaQikZg-1; Wed, 13 May 2020 08:45:35 -0400
X-MC-Unique: S-bjMy9BMW-OHIjLaQikZg-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 95DC8100CCC3;
	Wed, 13 May 2020 12:45:28 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 08EA5619A7;
	Wed, 13 May 2020 12:45:27 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 879C21809547;
	Wed, 13 May 2020 12:45:22 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 04DCiuGe021021 for <dm-devel@listman.util.phx.redhat.com>;
	Wed, 13 May 2020 08:44:57 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id D56471013E9A; Wed, 13 May 2020 12:44:56 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast01.extmail.prod.ext.rdu2.redhat.com [10.11.55.17])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id D000C108FE34
	for <dm-devel@redhat.com>; Wed, 13 May 2020 12:44:54 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id F1AE1916104
	for <dm-devel@redhat.com>; Wed, 13 May 2020 12:44:53 +0000 (UTC)
Received: from esa1.hgst.iphmx.com (esa1.hgst.iphmx.com [68.232.141.245])
	(Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-136-cmCpeUikPX2fl9WvZGNS1w-1; Wed, 13 May 2020 08:44:45 -0400
X-MC-Unique: cmCpeUikPX2fl9WvZGNS1w-1
IronPort-SDR: Y0YCjis5t8uUdbGS9VTircgZXXo8Tr+WDmu1euoT+dWfnHvsUwymvJDPsUYmvB115L+O6/3++K
	KdQJS4Md4uqj72Lzo+Mher6Ih5AuHCF1DeTjRtCSaQUoyRicUVsSEehEueXz1X/xdqICDrX4d2
	xUlnJKSimis7PAQn6m8rayBjC+spRtSikVHVlecE8CECF6TuHULUHWsPkW6o4A6ifcPa7SmZi8
	9mTN+DUHDk95JbKp3KFDG25mbqL/oX+cJ1E1m2axRRuKv15RFiZ52ZklgkElIptmgQwEcQlNOn
	Teg=
X-IronPort-AV: E=Sophos;i="5.73,387,1583164800"; d="scan'208";a="246521811"
Received: from mail-dm6nam12lp2174.outbound.protection.outlook.com (HELO
	NAM12-DM6-obe.outbound.protection.outlook.com) ([104.47.59.174])
	by ob1.hgst.iphmx.com with ESMTP; 13 May 2020 20:44:44 +0800
Received: from BY5PR04MB6900.namprd04.prod.outlook.com (2603:10b6:a03:229::20)
	by BY5PR04MB6851.namprd04.prod.outlook.com (2603:10b6:a03:220::22)
	with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3000.25;
	Wed, 13 May 2020 12:44:43 +0000
Received: from BY5PR04MB6900.namprd04.prod.outlook.com
	([fe80::b574:3071:da2f:7606]) by
	BY5PR04MB6900.namprd04.prod.outlook.com
	([fe80::b574:3071:da2f:7606%6]) with mapi id 15.20.3000.016;
	Wed, 13 May 2020 12:44:43 +0000
From: Damien Le Moal <Damien.LeMoal@wdc.com>
To: Hannes Reinecke <hare@suse.de>, Mike Snitzer <snitzer@redhat.com>
Thread-Topic: [PATCH 2/2] dm-zoned: split off random and cache zones
Thread-Index: AQHWKPUxxZHdPXh7K0y0k5U/Iw5OgA==
Date: Wed, 13 May 2020 12:44:42 +0000
Message-ID: <BY5PR04MB6900F36D4228D0FD0216AD61E7BF0@BY5PR04MB6900.namprd04.prod.outlook.com>
References: <20200513070729.71461-1-hare@suse.de>
	<20200513070729.71461-3-hare@suse.de>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [129.253.182.57]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: a98f7586-b8a0-4453-edb9-08d7f73b68e0
x-ms-traffictypediagnostic: BY5PR04MB6851:
x-microsoft-antispam-prvs: <BY5PR04MB6851DAB1B0DA65C0D8F4F1E7E7BF0@BY5PR04MB6851.namprd04.prod.outlook.com>
wdcipoutbound: EOP-TRUE
x-ms-oob-tlc-oobclassifiers: OLM:6108;
x-forefront-prvs: 0402872DA1
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: UlZPRoTp63/ttcikHaypBqv1ZJZBNJooYjt9ZbF+F+gz/G/sZgqd9/ZU2K6xSj9bPGBDc1w7VOK+KfM7hr4q0ye+USBjFgDo3j8sX0/Xis+CYvMoLntUfJL3GrRIinKW7aUzZNBtLM4ub6fmFYbQFQEIYjGz4uuE630zFyvmI6DTtZY8jkjUArnC7gh5aVWGAB0YmDUBzW1+7/INoQZbvmcFragwHjXJk0ywieNTme+HJvun9bcvCGxk90ssUIkxpvG0kIsvqPWr7SyP3XRzFChMyv1cRZk5K2IAv2FkdXdb+2FWiftDTEQSXikjlY2l4fEpbyC2Kss0gDJuh+/hQyIn5HsjFGLAf86QqZa100p97Dj5o2MUvDvQtAlBoUOXgp77UkhHC9tYIwWDkuvD03dPyq2E0+ANsd7JH+PNqmdh5xJmrEzq7BWQOllZjFzwcMqt932Ep4hEhSHVNPDxmXlDVXxw6YjeShJrAEATJ/vmtRqo4bVnmAQuFljno4+bVu5JTB2j4JAnip+23bCHyQ==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
	IPV:NLI; SFV:NSPM; H:BY5PR04MB6900.namprd04.prod.outlook.com;
	PTR:; CAT:NONE; SFTY:;
	SFS:(4636009)(39860400002)(346002)(396003)(136003)(366004)(376002)(33430700001)(66946007)(110136005)(52536014)(66476007)(316002)(4326008)(66446008)(64756008)(66556008)(478600001)(7696005)(76116006)(5660300002)(30864003)(33656002)(33440700001)(71200400001)(2906002)(8936002)(8676002)(55016002)(86362001)(9686003)(6506007)(53546011)(186003)(26005)(579004);
	DIR:OUT; SFP:1102;
x-ms-exchange-antispam-messagedata: SWwkG8cOE7bPbgJO+MY0wYbEn0dNbf7axGjEhUNPp17h78Y7GiHv4nHP/yIN8j008n73Vs3CGNjML4VHBPneqi+NB/00+lK37oI36u9CXodhpw78dImeXVbCo+0yYkJZXNHQ6cvBorZTQsMKI/qldv96e23uRvtOSUk8ojikZeOjY7kbC+ondnJ2r46iORMHPNkKTiJUM5697Oj0LIdNdeLns/etgUetyy9/bk3xFdG6S8OkVLz5bGVeBj5E1w8MYTjbrXGdvZQbYNN5O/h4B9VP8+Xj3hOn5c+sToPkg2bpfxxGYilbede/5CQGNeVvB1nQwi5B9P3i0aK6FP1suj9vSTZ6snB0NsWheLQO3lrN5EYOoqAhWLc2qnLC3SHGeACsKV2nOcniUPLwFmFR9eizl6Pj1tfk0TSPk3f0frvmZi2TwWF9hbal6K5SHkiMjnnZLhKbgGz7N24Q6LmuOWTzAm8nTzrEphD0JnJSFDepYYqQSXNBxuZ8rCzrcPB6
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a98f7586-b8a0-4453-edb9-08d7f73b68e0
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 May 2020 12:44:42.9752 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: d+HsZTgTzMQZxlG9YH8kcXkkhD0gXiwlXiE6rYXs6M1jO/dZdu9FXARggT2je1LlgiprlnkVvhsxICPD21hXGg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR04MB6851
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 04DCiuGe021021
X-loop: dm-devel@redhat.com
Cc: "dm-devel@redhat.com" <dm-devel@redhat.com>
Subject: Re: [dm-devel] [PATCH 2/2] dm-zoned: split off random and cache
	zones
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

On 2020/05/13 16:07, Hannes Reinecke wrote:
> Instead of emulating zones on the regular disk as random zones
> this patch adds a new 'cache' zone type.
> This allows us to use the random zones on the zoned disk as
> data zones (if cache zones are present), and improves performance
> as the zones on the (slower) zoned disk are then never used
> for caching.
> 
> Signed-off-by: Hannes Reinecke <hare@suse.de>
> ---
>  .../admin-guide/device-mapper/dm-zoned.rst    |  17 +-
>  drivers/md/dm-zoned-metadata.c                | 145 ++++++++++++++----
>  drivers/md/dm-zoned-reclaim.c                 |  70 +++++----
>  drivers/md/dm-zoned-target.c                  |  19 ++-
>  drivers/md/dm-zoned.h                         |   7 +-
>  5 files changed, 181 insertions(+), 77 deletions(-)
> 
> diff --git a/Documentation/admin-guide/device-mapper/dm-zoned.rst b/Documentation/admin-guide/device-mapper/dm-zoned.rst
> index 553752ea2521..d4933638737a 100644
> --- a/Documentation/admin-guide/device-mapper/dm-zoned.rst
> +++ b/Documentation/admin-guide/device-mapper/dm-zoned.rst
> @@ -174,17 +174,18 @@ Ex::
>  
>  will return a line
>  
> -	0 <size> zoned <nr_zones> zones <nr_unmap_rnd>/<nr_rnd> random <nr_unmap_seq>/<nr_seq> sequential
> +	0 <size> zoned <nr_zones> zones <nr_unmap/nr_total> cache <nr_unmap>/<nr_total> random <nr_unmap>/<nr_total> sequential
>  
> -where <nr_zones> is the total number of zones, <nr_unmap_rnd> is the number
> -of unmapped (ie free) random zones, <nr_rnd> the total number of zones,
> -<nr_unmap_seq> the number of unmapped sequential zones, and <nr_seq> the
> -total number of sequential zones.
> +where <nr_zones> is the total number of zones, followed by statistics for
> +the zone types (cache, random, and sequential), where <nr_unmap>/<nr_total>
> +is the number of unmapped (ie free) vs the overall number of zones.
> +'cache' zones are located on the regular disk, 'random' and 'sequential'
> +on the zoned disk.
>  
>  Normally the reclaim process will be started once there are less than 50
> -percent free random zones. In order to start the reclaim process manually
> -even before reaching this threshold the 'dmsetup message' function can be
> -used:
> +percent free cache or random zones. In order to start the reclaim process
> +manually even before reaching this threshold the 'dmsetup message' function
> +can be used:
>  
>  Ex::
>  
> diff --git a/drivers/md/dm-zoned-metadata.c b/drivers/md/dm-zoned-metadata.c
> index 9b93d7ff1dfc..dbcbcb0ddf56 100644
> --- a/drivers/md/dm-zoned-metadata.c
> +++ b/drivers/md/dm-zoned-metadata.c
> @@ -166,6 +166,7 @@ struct dmz_metadata {
>  	unsigned int		nr_meta_blocks;
>  	unsigned int		nr_meta_zones;
>  	unsigned int		nr_data_zones;
> +	unsigned int		nr_cache_zones;
>  	unsigned int		nr_rnd_zones;
>  	unsigned int		nr_reserved_seq;
>  	unsigned int		nr_chunks;
> @@ -196,6 +197,11 @@ struct dmz_metadata {
>  	struct list_head	unmap_rnd_list;
>  	struct list_head	map_rnd_list;
>  
> +	unsigned int		nr_cache;
> +	atomic_t		unmap_nr_cache;
> +	struct list_head	unmap_cache_list;
> +	struct list_head	map_cache_list;
> +
>  	unsigned int		nr_seq;
>  	atomic_t		unmap_nr_seq;
>  	struct list_head	unmap_seq_list;
> @@ -301,6 +307,16 @@ unsigned int dmz_nr_unmap_rnd_zones(struct dmz_metadata *zmd)
>  	return atomic_read(&zmd->unmap_nr_rnd);
>  }
>  
> +unsigned int dmz_nr_cache_zones(struct dmz_metadata *zmd)
> +{
> +	return zmd->nr_cache;
> +}
> +
> +unsigned int dmz_nr_unmap_cache_zones(struct dmz_metadata *zmd)
> +{
> +	return atomic_read(&zmd->unmap_nr_cache);
> +}
> +
>  unsigned int dmz_nr_seq_zones(struct dmz_metadata *zmd)
>  {
>  	return zmd->nr_seq;
> @@ -1390,9 +1406,9 @@ static void dmz_emulate_zones(struct dmz_metadata *zmd, struct dmz_dev *dev)
>  		atomic_set(&zone->refcount, 0);
>  		zone->id = idx;
>  		zone->chunk = DMZ_MAP_UNMAPPED;
> -		set_bit(DMZ_RND, &zone->flags);
> +		set_bit(DMZ_CACHE, &zone->flags);
>  		zone->wp_block = 0;
> -		zmd->nr_rnd_zones++;
> +		zmd->nr_cache_zones++;
>  		zmd->nr_useable_zones++;
>  		if (dev->capacity - zone_offset < zmd->zone_nr_sectors) {
>  			/* Disable runt zone */
> @@ -1651,7 +1667,9 @@ static int dmz_load_mapping(struct dmz_metadata *zmd)
>  		dzone->chunk = chunk;
>  		dmz_get_zone_weight(zmd, dzone);
>  
> -		if (dmz_is_rnd(dzone))
> +		if (dmz_is_cache(dzone))
> +			list_add_tail(&dzone->link, &zmd->map_cache_list);
> +		else if (dmz_is_rnd(dzone))
>  			list_add_tail(&dzone->link, &zmd->map_rnd_list);
>  		else
>  			list_add_tail(&dzone->link, &zmd->map_seq_list);
> @@ -1668,7 +1686,7 @@ static int dmz_load_mapping(struct dmz_metadata *zmd)
>  		}
>  
>  		bzone = dmz_get(zmd, bzone_id);
> -		if (!dmz_is_rnd(bzone)) {
> +		if (!dmz_is_rnd(bzone) && !dmz_is_cache(bzone)) {
>  			dmz_zmd_err(zmd, "Chunk %u mapping: invalid buffer zone %u",
>  				    chunk, bzone_id);
>  			return -EIO;
> @@ -1680,7 +1698,10 @@ static int dmz_load_mapping(struct dmz_metadata *zmd)
>  		bzone->bzone = dzone;
>  		dzone->bzone = bzone;
>  		dmz_get_zone_weight(zmd, bzone);
> -		list_add_tail(&bzone->link, &zmd->map_rnd_list);
> +		if (dmz_is_cache(bzone))
> +			list_add_tail(&bzone->link, &zmd->map_cache_list);
> +		else
> +			list_add_tail(&bzone->link, &zmd->map_rnd_list);
>  next:
>  		chunk++;
>  		e++;
> @@ -1697,8 +1718,12 @@ static int dmz_load_mapping(struct dmz_metadata *zmd)
>  		dzone = dmz_get(zmd, i);
>  		if (dmz_is_meta(dzone))
>  			continue;
> +		if (dmz_is_offline(dzone))
> +			continue;
>  
> -		if (dmz_is_rnd(dzone))
> +		if (dmz_is_cache(dzone))
> +			zmd->nr_cache++;
> +		else if (dmz_is_rnd(dzone))
>  			zmd->nr_rnd++;
>  		else
>  			zmd->nr_seq++;
> @@ -1711,7 +1736,10 @@ static int dmz_load_mapping(struct dmz_metadata *zmd)
>  		/* Unmapped data zone */
>  		set_bit(DMZ_DATA, &dzone->flags);
>  		dzone->chunk = DMZ_MAP_UNMAPPED;
> -		if (dmz_is_rnd(dzone)) {
> +		if (dmz_is_cache(dzone)) {
> +			list_add_tail(&dzone->link, &zmd->unmap_cache_list);
> +			atomic_inc(&zmd->unmap_nr_cache);
> +		} else if (dmz_is_rnd(dzone)) {
>  			list_add_tail(&dzone->link, &zmd->unmap_rnd_list);
>  			atomic_inc(&zmd->unmap_nr_rnd);
>  		} else if (atomic_read(&zmd->nr_reserved_seq_zones) < zmd->nr_reserved_seq) {
> @@ -1755,6 +1783,9 @@ static void __dmz_lru_zone(struct dmz_metadata *zmd, struct dm_zone *zone)
>  	if (dmz_is_seq(zone)) {
>  		/* LRU rotate sequential zone */
>  		list_add_tail(&zone->link, &zmd->map_seq_list);
> +	} else if (dmz_is_cache(zone)) {
> +		/* LRU rotate cache zone */
> +		list_add_tail(&zone->link, &zmd->map_cache_list);
>  	} else {
>  		/* LRU rotate random zone */
>  		list_add_tail(&zone->link, &zmd->map_rnd_list);
> @@ -1830,17 +1861,19 @@ static void dmz_wait_for_reclaim(struct dmz_metadata *zmd, struct dm_zone *zone)
>  }
>  
>  /*
> - * Select a random write zone for reclaim.
> + * Select a cache or random write zone for reclaim.
>   */
>  static struct dm_zone *dmz_get_rnd_zone_for_reclaim(struct dmz_metadata *zmd)
>  {
>  	struct dm_zone *dzone = NULL;
>  	struct dm_zone *zone;
> +	struct list_head *zone_list = &zmd->map_rnd_list;
>  
> -	if (list_empty(&zmd->map_rnd_list))
> -		return ERR_PTR(-EBUSY);
> +	/* If we have cache zones select from the cache zone list */
> +	if (zmd->nr_cache)
> +		zone_list = &zmd->map_cache_list;
>  
> -	list_for_each_entry(zone, &zmd->map_rnd_list, link) {
> +	list_for_each_entry(zone, zone_list, link) {
>  		if (dmz_is_buf(zone))
>  			dzone = zone->bzone;
>  		else
> @@ -1853,15 +1886,21 @@ static struct dm_zone *dmz_get_rnd_zone_for_reclaim(struct dmz_metadata *zmd)
>  }
>  
>  /*
> - * Select a buffered sequential zone for reclaim.
> + * Select a buffered random write or sequential zone for reclaim.

Random write zoned should never be "buffered", or to be very precise, they will
be only during the time reclaim moves a cache zone data to a random zone. That
is visible in the dmz_handle_write() change that execute
dmz_handle_direct_write() for cache or buffered zones instead of using
dmz_handle_buffered_write(). So I think this comment can stay as is.

>   */
>  static struct dm_zone *dmz_get_seq_zone_for_reclaim(struct dmz_metadata *zmd)
>  {
>  	struct dm_zone *zone;
>  
> -	if (list_empty(&zmd->map_seq_list))
> -		return ERR_PTR(-EBUSY);
> -
> +	if (zmd->nr_cache) {
> +		/* If we have cache zones start with random zones */
> +		list_for_each_entry(zone, &zmd->map_rnd_list, link) {
> +			if (!zone->bzone)
> +				continue;
> +			if (dmz_lock_zone_reclaim(zone))
> +				return zone;
> +		}
> +	}

For the reason stated above, I think this change is not necessary either.

>  	list_for_each_entry(zone, &zmd->map_seq_list, link) {
>  		if (!zone->bzone)
>  			continue;
> @@ -1911,6 +1950,7 @@ struct dm_zone *dmz_get_chunk_mapping(struct dmz_metadata *zmd, unsigned int chu
>  	unsigned int dzone_id;
>  	struct dm_zone *dzone = NULL;
>  	int ret = 0;
> +	int alloc_flags = zmd->nr_cache ? DMZ_ALLOC_CACHE : DMZ_ALLOC_RND;
>  
>  	dmz_lock_map(zmd);
>  again:
> @@ -1925,7 +1965,7 @@ struct dm_zone *dmz_get_chunk_mapping(struct dmz_metadata *zmd, unsigned int chu
>  			goto out;
>  
>  		/* Allocate a random zone */
> -		dzone = dmz_alloc_zone(zmd, DMZ_ALLOC_RND);
> +		dzone = dmz_alloc_zone(zmd, alloc_flags);
>  		if (!dzone) {
>  			if (dmz_dev_is_dying(zmd)) {
>  				dzone = ERR_PTR(-EIO);
> @@ -2018,6 +2058,7 @@ struct dm_zone *dmz_get_chunk_buffer(struct dmz_metadata *zmd,
>  				     struct dm_zone *dzone)
>  {
>  	struct dm_zone *bzone;
> +	int alloc_flags = zmd->nr_cache ? DMZ_ALLOC_CACHE : DMZ_ALLOC_RND;
>  
>  	dmz_lock_map(zmd);
>  again:
> @@ -2026,7 +2067,7 @@ struct dm_zone *dmz_get_chunk_buffer(struct dmz_metadata *zmd,
>  		goto out;
>  
>  	/* Allocate a random zone */
> -	bzone = dmz_alloc_zone(zmd, DMZ_ALLOC_RND);
> +	bzone = dmz_alloc_zone(zmd, alloc_flags);
>  	if (!bzone) {
>  		if (dmz_dev_is_dying(zmd)) {
>  			bzone = ERR_PTR(-EIO);
> @@ -2043,7 +2084,10 @@ struct dm_zone *dmz_get_chunk_buffer(struct dmz_metadata *zmd,
>  	bzone->chunk = dzone->chunk;
>  	bzone->bzone = dzone;
>  	dzone->bzone = bzone;
> -	list_add_tail(&bzone->link, &zmd->map_rnd_list);
> +	if (alloc_flags == DMZ_ALLOC_CACHE)
> +		list_add_tail(&bzone->link, &zmd->map_cache_list);
> +	else
> +		list_add_tail(&bzone->link, &zmd->map_rnd_list);
>  out:
>  	dmz_unlock_map(zmd);
>  
> @@ -2059,31 +2103,53 @@ struct dm_zone *dmz_alloc_zone(struct dmz_metadata *zmd, unsigned long flags)
>  	struct list_head *list;
>  	struct dm_zone *zone;
>  
> -	if (flags & DMZ_ALLOC_RND)
> +	switch (flags) {
> +	case DMZ_ALLOC_CACHE:
> +		list = &zmd->unmap_cache_list;
> +		break;
> +	case DMZ_ALLOC_RND:
>  		list = &zmd->unmap_rnd_list;
> -	else
> -		list = &zmd->unmap_seq_list;
> +		break;
> +	default:
> +		if (zmd->nr_cache)> +			list = &zmd->unmap_rnd_list;
> +		else
> +			list = &zmd->unmap_seq_list;
> +		break;
> +	}
>  again:
>  	if (list_empty(list)) {
>  		/*
> -		 * No free zone: if this is for reclaim, allow using the
> -		 * reserved sequential zones.
> +		 * No free zone: return NULL if this is for not reclaim.

s/for not reclaim/not for reclaim

>  		 */
> -		if (!(flags & DMZ_ALLOC_RECLAIM) ||
> -		    list_empty(&zmd->reserved_seq_zones_list))
> +		if (!(flags & DMZ_ALLOC_RECLAIM))
>  			return NULL;
> -
> -		zone = list_first_entry(&zmd->reserved_seq_zones_list,
> -					struct dm_zone, link);
> -		list_del_init(&zone->link);
> -		atomic_dec(&zmd->nr_reserved_seq_zones);
> +		/*
> +		 * Use sequential write zones if we started off with random
> +		 * zones and the list is empty
> +		 */
> +		if (list == &zmd->unmap_rnd_list) {
> +			list = &zmd->unmap_seq_list;
> +			goto again;
> +		}
> +		/*
> +		 * Fallback to the reserved sequential zones
> +		 */
> +		zone = list_first_entry_or_null(&zmd->reserved_seq_zones_list,
> +						struct dm_zone, link);
> +		if (zone) {
> +			list_del_init(&zone->link);
> +			atomic_dec(&zmd->nr_reserved_seq_zones);
> +		}
>  		return zone;
>  	}
>  
>  	zone = list_first_entry(list, struct dm_zone, link);
>  	list_del_init(&zone->link);
>  
> -	if (dmz_is_rnd(zone))
> +	if (dmz_is_cache(zone))
> +		atomic_dec(&zmd->unmap_nr_cache);
> +	else if (dmz_is_rnd(zone))
>  		atomic_dec(&zmd->unmap_nr_rnd);
>  	else
>  		atomic_dec(&zmd->unmap_nr_seq);
> @@ -2114,7 +2180,10 @@ void dmz_free_zone(struct dmz_metadata *zmd, struct dm_zone *zone)
>  		dmz_reset_zone(zmd, zone);
>  
>  	/* Return the zone to its type unmap list */
> -	if (dmz_is_rnd(zone)) {
> +	if (dmz_is_cache(zone)) {
> +		list_add_tail(&zone->link, &zmd->unmap_cache_list);
> +		atomic_inc(&zmd->unmap_nr_cache);
> +	} else if (dmz_is_rnd(zone)) {
>  		list_add_tail(&zone->link, &zmd->unmap_rnd_list);
>  		atomic_inc(&zmd->unmap_nr_rnd);
>  	} else if (atomic_read(&zmd->nr_reserved_seq_zones) <
> @@ -2140,7 +2209,9 @@ void dmz_map_zone(struct dmz_metadata *zmd, struct dm_zone *dzone,
>  	dmz_set_chunk_mapping(zmd, chunk, dzone->id,
>  			      DMZ_MAP_UNMAPPED);
>  	dzone->chunk = chunk;
> -	if (dmz_is_rnd(dzone))
> +	if (dmz_is_cache(dzone))
> +		list_add_tail(&dzone->link, &zmd->map_cache_list);
> +	else if (dmz_is_rnd(dzone))
>  		list_add_tail(&dzone->link, &zmd->map_rnd_list);
>  	else
>  		list_add_tail(&dzone->link, &zmd->map_seq_list);
> @@ -2714,6 +2785,10 @@ int dmz_ctr_metadata(struct dmz_dev *dev, int num_dev,
>  	INIT_LIST_HEAD(&zmd->unmap_rnd_list);
>  	INIT_LIST_HEAD(&zmd->map_rnd_list);
>  
> +	atomic_set(&zmd->unmap_nr_cache, 0);
> +	INIT_LIST_HEAD(&zmd->unmap_cache_list);
> +	INIT_LIST_HEAD(&zmd->map_cache_list);
> +
>  	atomic_set(&zmd->unmap_nr_seq, 0);
>  	INIT_LIST_HEAD(&zmd->unmap_seq_list);
>  	INIT_LIST_HEAD(&zmd->map_seq_list);
> @@ -2736,7 +2811,7 @@ int dmz_ctr_metadata(struct dmz_dev *dev, int num_dev,
>  	/* Set metadata zones starting from sb_zone */
>  	for (i = 0; i < zmd->nr_meta_zones << 1; i++) {
>  		zone = dmz_get(zmd, zmd->sb[0].zone->id + i);
> -		if (!dmz_is_rnd(zone)) {
> +		if (!dmz_is_rnd(zone) && !dmz_is_cache(zone)) {
>  			dmz_zmd_err(zmd,
>  				    "metadata zone %d is not random", i);
>  			ret = -ENXIO;
> @@ -2788,6 +2863,8 @@ int dmz_ctr_metadata(struct dmz_dev *dev, int num_dev,
>  		      zmd->nr_meta_zones * 2);
>  	dmz_zmd_debug(zmd, "  %u data zones for %u chunks",
>  		      zmd->nr_data_zones, zmd->nr_chunks);
> +	dmz_zmd_debug(zmd, "    %u cache zones (%u unmapped)",
> +		      zmd->nr_cache, atomic_read(&zmd->unmap_nr_cache));
>  	dmz_zmd_debug(zmd, "    %u random zones (%u unmapped)",
>  		      zmd->nr_rnd, atomic_read(&zmd->unmap_nr_rnd));
>  	dmz_zmd_debug(zmd, "    %u sequential zones (%u unmapped)",
> diff --git a/drivers/md/dm-zoned-reclaim.c b/drivers/md/dm-zoned-reclaim.c
> index 39ea0d5d4706..6004cf71a000 100644
> --- a/drivers/md/dm-zoned-reclaim.c
> +++ b/drivers/md/dm-zoned-reclaim.c
> @@ -43,13 +43,13 @@ enum {
>   * Percentage of unmapped (free) random zones below which reclaim starts
>   * even if the target is busy.
>   */
> -#define DMZ_RECLAIM_LOW_UNMAP_RND	30
> +#define DMZ_RECLAIM_LOW_UNMAP_ZONES	30
>  
>  /*
>   * Percentage of unmapped (free) random zones above which reclaim will
>   * stop if the target is busy.
>   */
> -#define DMZ_RECLAIM_HIGH_UNMAP_RND	50
> +#define DMZ_RECLAIM_HIGH_UNMAP_ZONES	50
>  
>  /*
>   * Align a sequential zone write pointer to chunk_block.
> @@ -289,9 +289,11 @@ static int dmz_reclaim_rnd_data(struct dmz_reclaim *zrc, struct dm_zone *dzone)
>  	if (!szone)
>  		return -ENOSPC;
>  
> -	DMDEBUG("(%s): Chunk %u, move rnd zone %u (weight %u) to seq zone %u",
> -		dmz_metadata_label(zmd),
> -		chunk, dzone->id, dmz_weight(dzone), szone->id);
> +	DMDEBUG("(%s): Chunk %u, move %s zone %u (weight %u) to %s zone %u",
> +		dmz_metadata_label(zmd), chunk,
> +		dmz_is_cache(dzone) ? "cache" : "rnd",
> +		dzone->id, dmz_weight(dzone),
> +		dmz_is_rnd(szone) ? "rnd" : "seq", szone->id);
>  
>  	/* Flush the random data zone into the sequential zone */
>  	ret = dmz_reclaim_copy(zrc, dzone, szone);
> @@ -358,7 +360,7 @@ static int dmz_do_reclaim(struct dmz_reclaim *zrc)
>  
>  	start = jiffies;
>  	dev = dmz_zone_to_dev(zmd, dzone);
> -	if (dmz_is_rnd(dzone)) {
> +	if (dmz_is_cache(dzone) || dmz_is_rnd(dzone)) {
>  		if (!dmz_weight(dzone)) {
>  			/* Empty zone */
>  			dmz_reclaim_empty(zrc, dzone);
> @@ -424,29 +426,41 @@ static inline int dmz_target_idle(struct dmz_reclaim *zrc)
>  	return time_is_before_jiffies(zrc->atime + DMZ_IDLE_PERIOD);
>  }
>  
> -/*
> - * Test if reclaim is necessary.
> - */
> -static bool dmz_should_reclaim(struct dmz_reclaim *zrc)
> +static unsigned int dmz_reclaim_percentage(struct dmz_reclaim *zrc)
>  {
>  	struct dmz_metadata *zmd = zrc->metadata;
> +	unsigned int nr_cache = dmz_nr_cache_zones(zmd);
>  	unsigned int nr_rnd = dmz_nr_rnd_zones(zmd);
> -	unsigned int nr_unmap_rnd = dmz_nr_unmap_rnd_zones(zmd);
> -	unsigned int p_unmap_rnd = nr_unmap_rnd * 100 / nr_rnd;
> +	unsigned int nr_unmap, nr_zones;
>  
> +	if (nr_cache) {
> +		nr_zones = nr_cache;
> +		nr_unmap = dmz_nr_unmap_cache_zones(zmd);
> +	} else {
> +		nr_zones = nr_rnd;
> +		nr_unmap = dmz_nr_unmap_rnd_zones(zmd);
> +	}
> +	return nr_unmap * 100 / nr_zones;
> +}
> +
> +/*
> + * Test if reclaim is necessary.
> + */
> +static bool dmz_should_reclaim(struct dmz_reclaim *zrc, unsigned int p_unmap)
> +{
>  	/* Reclaim when idle */
> -	if (dmz_target_idle(zrc) && nr_unmap_rnd < nr_rnd)
> +	if (dmz_target_idle(zrc) && p_unmap < 100)
>  		return true;
>  
> -	/* If there are still plenty of random zones, do not reclaim */
> -	if (p_unmap_rnd >= DMZ_RECLAIM_HIGH_UNMAP_RND)
> +	/* If there are still plenty of cache zones, do not reclaim */
> +	if (p_unmap >= DMZ_RECLAIM_HIGH_UNMAP_ZONES)
>  		return false;
>  
>  	/*
> -	 * If the percentage of unmapped random zones is low,
> +	 * If the percentage of unmapped cache zones is low,
>  	 * reclaim even if the target is busy.
>  	 */
> -	return p_unmap_rnd <= DMZ_RECLAIM_LOW_UNMAP_RND;
> +	return p_unmap <= DMZ_RECLAIM_LOW_UNMAP_ZONES;
>  }
>  
>  /*
> @@ -456,14 +470,14 @@ static void dmz_reclaim_work(struct work_struct *work)
>  {
>  	struct dmz_reclaim *zrc = container_of(work, struct dmz_reclaim, work.work);
>  	struct dmz_metadata *zmd = zrc->metadata;
> -	unsigned int nr_rnd, nr_unmap_rnd;
> -	unsigned int p_unmap_rnd;
> +	unsigned int p_unmap;
>  	int ret;
>  
>  	if (dmz_dev_is_dying(zmd))
>  		return;
>  
> -	if (!dmz_should_reclaim(zrc)) {
> +	p_unmap = dmz_reclaim_percentage(zrc);
> +	if (!dmz_should_reclaim(zrc, p_unmap)) {
>  		mod_delayed_work(zrc->wq, &zrc->work, DMZ_IDLE_PERIOD);
>  		return;
>  	}
> @@ -474,22 +488,20 @@ static void dmz_reclaim_work(struct work_struct *work)
>  	 * and slower if there are still some free random zones to avoid
>  	 * as much as possible to negatively impact the user workload.
>  	 */
> -	nr_rnd = dmz_nr_rnd_zones(zmd);
> -	nr_unmap_rnd = dmz_nr_unmap_rnd_zones(zmd);
> -	p_unmap_rnd = nr_unmap_rnd * 100 / nr_rnd;
> -	if (dmz_target_idle(zrc) || p_unmap_rnd < DMZ_RECLAIM_LOW_UNMAP_RND / 2) {
> +	if (dmz_target_idle(zrc) || p_unmap < DMZ_RECLAIM_LOW_UNMAP_ZONES / 2) {
>  		/* Idle or very low percentage: go fast */
>  		zrc->kc_throttle.throttle = 100;
>  	} else {
>  		/* Busy but we still have some random zone: throttle */
> -		zrc->kc_throttle.throttle = min(75U, 100U - p_unmap_rnd / 2);
> +		zrc->kc_throttle.throttle = min(75U, 100U - p_unmap / 2);
>  	}
>  
> -	DMDEBUG("(%s): Reclaim (%u): %s, %u%% free rnd zones (%u/%u)",
> +	DMDEBUG("(%s): Reclaim (%u): %s, %u%% free cache zones (%u/%u)",
>  		dmz_metadata_label(zmd),
>  		zrc->kc_throttle.throttle,
>  		(dmz_target_idle(zrc) ? "Idle" : "Busy"),
> -		p_unmap_rnd, nr_unmap_rnd, nr_rnd);
> +		p_unmap, dmz_nr_unmap_cache_zones(zmd),
> +		dmz_nr_cache_zones(zmd));
>  
>  	ret = dmz_do_reclaim(zrc);
>  	if (ret) {
> @@ -587,7 +599,9 @@ void dmz_reclaim_bio_acc(struct dmz_reclaim *zrc)
>   */
>  void dmz_schedule_reclaim(struct dmz_reclaim *zrc)
>  {
> -	if (dmz_should_reclaim(zrc))
> +	unsigned int p_unmap = dmz_reclaim_percentage(zrc);
> +
> +	if (dmz_should_reclaim(zrc, p_unmap))
>  		mod_delayed_work(zrc->wq, &zrc->work, 0);
>  }
>  
> diff --git a/drivers/md/dm-zoned-target.c b/drivers/md/dm-zoned-target.c
> index ea43f6892ced..8999de07cddb 100644
> --- a/drivers/md/dm-zoned-target.c
> +++ b/drivers/md/dm-zoned-target.c
> @@ -190,7 +190,8 @@ static int dmz_handle_read(struct dmz_target *dmz, struct dm_zone *zone,
>  	DMDEBUG("(%s): READ chunk %llu -> %s zone %u, block %llu, %u blocks",
>  		dmz_metadata_label(zmd),
>  		(unsigned long long)dmz_bio_chunk(zmd, bio),
> -		(dmz_is_rnd(zone) ? "RND" : "SEQ"),
> +		(dmz_is_rnd(zone) ? "RND" :
> +		 (dmz_is_cache(zone) ? "CACHE" : "SEQ")),
>  		zone->id,
>  		(unsigned long long)chunk_block, nr_blocks);
>  
> @@ -198,7 +199,8 @@ static int dmz_handle_read(struct dmz_target *dmz, struct dm_zone *zone,
>  	bzone = zone->bzone;
>  	while (chunk_block < end_block) {
>  		nr_blocks = 0;
> -		if (dmz_is_rnd(zone) || chunk_block < zone->wp_block) {
> +		if (dmz_is_rnd(zone) || dmz_is_cache(zone) ||
> +		    chunk_block < zone->wp_block) {
>  			/* Test block validity in the data zone */
>  			ret = dmz_block_valid(zmd, zone, chunk_block);
>  			if (ret < 0)
> @@ -331,11 +333,13 @@ static int dmz_handle_write(struct dmz_target *dmz, struct dm_zone *zone,
>  	DMDEBUG("(%s): WRITE chunk %llu -> %s zone %u, block %llu, %u blocks",
>  		dmz_metadata_label(zmd),
>  		(unsigned long long)dmz_bio_chunk(zmd, bio),
> -		(dmz_is_rnd(zone) ? "RND" : "SEQ"),
> +		(dmz_is_rnd(zone) ? "RND" :
> +		 (dmz_is_cache(zone) ? "CACHE" : "SEQ")),
>  		zone->id,
>  		(unsigned long long)chunk_block, nr_blocks);
>  
> -	if (dmz_is_rnd(zone) || chunk_block == zone->wp_block) {
> +	if (dmz_is_rnd(zone) || dmz_is_cache(zone) ||
> +	    chunk_block == zone->wp_block) {
>  		/*
>  		 * zone is a random zone or it is a sequential zone
>  		 * and the BIO is aligned to the zone write pointer:
> @@ -381,7 +385,8 @@ static int dmz_handle_discard(struct dmz_target *dmz, struct dm_zone *zone,
>  	 * Invalidate blocks in the data zone and its
>  	 * buffer zone if one is mapped.
>  	 */
> -	if (dmz_is_rnd(zone) || chunk_block < zone->wp_block)
> +	if (dmz_is_rnd(zone) || dmz_is_cache(zone) ||
> +	    chunk_block < zone->wp_block)
>  		ret = dmz_invalidate_blocks(zmd, zone, chunk_block, nr_blocks);
>  	if (ret == 0 && zone->bzone)
>  		ret = dmz_invalidate_blocks(zmd, zone->bzone,
> @@ -1064,8 +1069,10 @@ static void dmz_status(struct dm_target *ti, status_type_t type,
>  
>  	switch (type) {
>  	case STATUSTYPE_INFO:
> -		DMEMIT("%u zones %u/%u random %u/%u sequential",
> +		DMEMIT("%u zones %u/%u cache %u/%u random %u/%u sequential",
>  		       dmz_nr_zones(dmz->metadata),
> +		       dmz_nr_unmap_cache_zones(dmz->metadata),
> +		       dmz_nr_cache_zones(dmz->metadata),
>  		       dmz_nr_unmap_rnd_zones(dmz->metadata),
>  		       dmz_nr_rnd_zones(dmz->metadata),
>  		       dmz_nr_unmap_seq_zones(dmz->metadata),
> diff --git a/drivers/md/dm-zoned.h b/drivers/md/dm-zoned.h
> index 4971a765be55..b1bdfa3c957a 100644
> --- a/drivers/md/dm-zoned.h
> +++ b/drivers/md/dm-zoned.h
> @@ -111,6 +111,7 @@ struct dm_zone {
>   */
>  enum {
>  	/* Zone write type */
> +	DMZ_CACHE,
>  	DMZ_RND,
>  	DMZ_SEQ,
>  
> @@ -131,6 +132,7 @@ enum {
>  /*
>   * Zone data accessors.
>   */
> +#define dmz_is_cache(z)		test_bit(DMZ_CACHE, &(z)->flags)
>  #define dmz_is_rnd(z)		test_bit(DMZ_RND, &(z)->flags)
>  #define dmz_is_seq(z)		test_bit(DMZ_SEQ, &(z)->flags)
>  #define dmz_is_empty(z)		((z)->wp_block == 0)
> @@ -189,7 +191,8 @@ bool dmz_check_dev(struct dmz_metadata *zmd);
>  bool dmz_dev_is_dying(struct dmz_metadata *zmd);
>  
>  #define DMZ_ALLOC_RND		0x01
> -#define DMZ_ALLOC_RECLAIM	0x02
> +#define DMZ_ALLOC_CACHE		0x02
> +#define DMZ_ALLOC_RECLAIM	0x04
>  
>  struct dm_zone *dmz_alloc_zone(struct dmz_metadata *zmd, unsigned long flags);
>  void dmz_free_zone(struct dmz_metadata *zmd, struct dm_zone *zone);
> @@ -198,6 +201,8 @@ void dmz_map_zone(struct dmz_metadata *zmd, struct dm_zone *zone,
>  		  unsigned int chunk);
>  void dmz_unmap_zone(struct dmz_metadata *zmd, struct dm_zone *zone);
>  unsigned int dmz_nr_zones(struct dmz_metadata *zmd);
> +unsigned int dmz_nr_cache_zones(struct dmz_metadata *zmd);
> +unsigned int dmz_nr_unmap_cache_zones(struct dmz_metadata *zmd);
>  unsigned int dmz_nr_rnd_zones(struct dmz_metadata *zmd);
>  unsigned int dmz_nr_unmap_rnd_zones(struct dmz_metadata *zmd);
>  unsigned int dmz_nr_seq_zones(struct dmz_metadata *zmd);
> 

Apart from the nits above, all look good. I am running this right now and it is
running at SMR drive speed ! Awesome ! Will send a plot once the run is over.

Cheers.

-- 
Damien Le Moal
Western Digital Research



--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

