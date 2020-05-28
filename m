Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-delivery-1.mimecast.com [205.139.110.120])
	by mail.lfdr.de (Postfix) with ESMTP id 9EC6D1E54A3
	for <lists+dm-devel@lfdr.de>; Thu, 28 May 2020 05:26:31 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1590636390;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=CqjZMuQYicbrl6EX8EQJkIn4mak2eZnq1uRYqLjn8P0=;
	b=aknPj//y78rOdqSKVCbRvajp7Ls9zp7TvNsACGuqzVbw6nzuixmMsLJo6Anr4wrxLHTSko
	kMerEz3fvZl39B1DuOqA+8MLe0FdJiwlsLacjLQmaSQvHmhotse7M93rWPtNwPLDUZwca/
	k4F5YXPTLpeViOs2QsUwg+/iwdOZWIQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-402-b7YLAKBtNAq0oLBecBN4Zg-1; Wed, 27 May 2020 23:26:28 -0400
X-MC-Unique: b7YLAKBtNAq0oLBecBN4Zg-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E45341855A0E;
	Thu, 28 May 2020 03:26:21 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id D36515C1B0;
	Thu, 28 May 2020 03:26:20 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id B608D1809543;
	Thu, 28 May 2020 03:26:17 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 04S3QArb032754 for <dm-devel@listman.util.phx.redhat.com>;
	Wed, 27 May 2020 23:26:10 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id B54C010D178B; Thu, 28 May 2020 03:26:09 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast06.extmail.prod.ext.rdu2.redhat.com [10.11.55.22])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 1B53910D17A9
	for <dm-devel@redhat.com>; Thu, 28 May 2020 03:26:06 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id BD59F185A78B
	for <dm-devel@redhat.com>; Thu, 28 May 2020 03:26:05 +0000 (UTC)
Received: from esa3.hgst.iphmx.com (esa3.hgst.iphmx.com [216.71.153.141])
	(Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-158-1ISa3avoOC65uvbBfrIqJQ-1; Wed, 27 May 2020 23:26:02 -0400
X-MC-Unique: 1ISa3avoOC65uvbBfrIqJQ-1
IronPort-SDR: R0XWWI8IGsesKVj4hPSK9QjIHiNABqKhcZ7w/KELqAt6zd6P3F1xZiiAAaQewJie8CdFke32FG
	8fn+lYxwcyrv+FwPHg+uIcklZjT8hHTjbd6W6uaYC4ojTIOmTpddtLVn2Y0s0udTzBSW8neA0s
	DVdkWRTvgsKgWiOPccMs3Iobq8FzNNP61wgkcJss+5WNEAP2HutRtanFFdY7geyr6cQrh/nigI
	AK+qEImlKKxAPwoOas+tyDWUr1bvmxfqvGjK+AgsU1wM+tXDDUqzp+nhsxZmPGJDjyfoydC3mu
	HAo=
X-IronPort-AV: E=Sophos;i="5.73,443,1583164800"; d="scan'208";a="143002638"
Received: from mail-dm6nam10lp2102.outbound.protection.outlook.com (HELO
	NAM10-DM6-obe.outbound.protection.outlook.com) ([104.47.58.102])
	by ob1.hgst.iphmx.com with ESMTP; 28 May 2020 11:26:01 +0800
Received: from CY4PR04MB3751.namprd04.prod.outlook.com (2603:10b6:903:ec::14)
	by CY4PR04MB0872.namprd04.prod.outlook.com (2603:10b6:910:54::12)
	with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3021.27;
	Thu, 28 May 2020 03:25:58 +0000
Received: from CY4PR04MB3751.namprd04.prod.outlook.com
	([fe80::c593:f271:eebe:ac7]) by CY4PR04MB3751.namprd04.prod.outlook.com
	([fe80::c593:f271:eebe:ac7%9]) with mapi id 15.20.3021.029;
	Thu, 28 May 2020 03:25:58 +0000
From: Damien Le Moal <Damien.LeMoal@wdc.com>
To: "snitzer@redhat.com" <snitzer@redhat.com>, "hare@suse.de" <hare@suse.de>
Thread-Topic: [PATCH 11/15] dm-zoned: move random and sequential zones into
	struct dmz_dev
Thread-Index: AQHWM+8+tDcrdtjLc0OuGTTPo0RM6ai814cA
Date: Thu, 28 May 2020 03:25:58 +0000
Message-ID: <4dc7bbec312087c34e9153646f705d7e5a62266e.camel@wdc.com>
References: <20200527062225.72849-1-hare@suse.de>
	<20200527062225.72849-12-hare@suse.de>
In-Reply-To: <20200527062225.72849-12-hare@suse.de>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.36.2 (3.36.2-1.fc32)
x-originating-ip: [2400:2411:43c0:6000:62d1:16e6:ecb1:d604]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 543c0c09-1e37-4d8e-be1a-08d802b6d6e0
x-ms-traffictypediagnostic: CY4PR04MB0872:
x-microsoft-antispam-prvs: <CY4PR04MB0872DE3BF0485C4E6E4CE800E78E0@CY4PR04MB0872.namprd04.prod.outlook.com>
wdcipoutbound: EOP-TRUE
x-ms-oob-tlc-oobclassifiers: OLM:525;
x-forefront-prvs: 0417A3FFD2
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 4IWQprWkWX2L6BlPPINHV90jQ255JO+UMfvVwjb6PsJ9g+MqB1KNEHSqk9tphccas4OjQboRakUaxlZ6ojWLYmNf0y1zyjNUaAx7N+V4kp1CTenvtMCACZ2K6YmsZND1XDuXFyEpMGnIq+Wwu5R48xOYUkaZtwLqznrgcrP3am5gGTdsFruluEr9wNQlCb1plyxlnmDVeWAwSJdmlPtDADMHouuHTDWU/JXzO/d+W4QZWnhcsk0/aw/KU8dZGRgt/ajIe8nYHSWQ3MFWQUY6QyHXdcC6RcqOfMZ1Ok5UdFPA4xRRWPtVxJgydVxVLT/JDBLx5AJ3ZJ+amvJDnAXS2w==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
	IPV:NLI; SFV:NSPM; H:CY4PR04MB3751.namprd04.prod.outlook.com;
	PTR:; CAT:NONE; SFTY:;
	SFS:(4636009)(136003)(366004)(346002)(39860400002)(376002)(396003)(110136005)(316002)(5660300002)(66476007)(64756008)(66446008)(76116006)(66946007)(66556008)(4326008)(478600001)(2906002)(83380400001)(91956017)(2616005)(71200400001)(86362001)(6486002)(30864003)(6506007)(8936002)(8676002)(6512007)(186003)(36756003);
	DIR:OUT; SFP:1102;
x-ms-exchange-antispam-messagedata: QBtGLN02OQgc/BZ3QcajliFM61ZVxaqdJaxXMH/11M7JB1TEkpDp4UUq7iU5H78UnD6KjExU/xk+3LCZ/4l+ryUnb/u4ZYkst+jQhSkUc94pHfT9CYWNG4Pw+jK/0Ylha8rdJp6wd9agf+SG6nw+sUwwr93GDVGAgmKx4He/xCdAymP273NaiXhda7ZUxKOVjc6wYNymzwf36KkpLzUEsknDzl7HGBLPyFiy99EAJnmTE/u4TP0F+4hb+mgKKM5up2eJXvjnVpP/RzCqLI3QC46+j9kpQAw8DDIxjd0MCo9JLX6k+GE+Sw/+aljneqnis7I9Ecu3dq2J7zhONFRW/XVRqNXZmsXRgOrcRwFhxy+vY/7FVAKM/3ZXp5YOdrpEHCjOv6QXNnsVnzB56yvVjLp3Bn8NLwwa1MjIUnHZnetBKUu88iNFKg8jm/ac26oZWBaASNfVKwxUjwD3weKHi97vWyg+VElvb+j7tK998PKjJp+lHQI1fE5Ub9BqXhKQQ1CQ5ESRs5vBg4nGNu/qoKW3DDR1rjzpd/w9WEk005ZqZJLqYbu3I4eKzGGZe8mV
x-ms-exchange-transport-forked: True
Content-ID: <908091F06FAC5F4E928330E8EDB62617@namprd04.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 543c0c09-1e37-4d8e-be1a-08d802b6d6e0
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 May 2020 03:25:58.3022 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: PBuF/ZlSt5lwJgYdu2NOZqT0n+lmI8FNvakiL6/6qv1CD4D8ftL9KKKBgJP4sG0+AQyf0I5OXBCZTG1IiEFtMA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR04MB0872
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
X-MIME-Autoconverted: from base64 to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 04S3QArb032754
X-loop: dm-devel@redhat.com
Cc: "dm-devel@redhat.com" <dm-devel@redhat.com>
Subject: Re: [dm-devel] [PATCH 11/15] dm-zoned: move random and sequential
 zones into struct dmz_dev
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

On Wed, 2020-05-27 at 08:22 +0200, Hannes Reinecke wrote:
> Random and sequential zones should be part of the respective
> device structure to make arbitration between devices possible.
> 
> Signed-off-by: Hannes Reinecke <hare@suse.de>
> ---
>  drivers/md/dm-zoned-metadata.c | 139 +++++++++++++++++++++++------------------
>  drivers/md/dm-zoned-reclaim.c  |  15 +++--
>  drivers/md/dm-zoned-target.c   |  25 ++++++--
>  drivers/md/dm-zoned.h          |  18 ++++--
>  4 files changed, 119 insertions(+), 78 deletions(-)
> 
> diff --git a/drivers/md/dm-zoned-metadata.c b/drivers/md/dm-zoned-metadata.c
> index 445760730d10..f309219a5457 100644
> --- a/drivers/md/dm-zoned-metadata.c
> +++ b/drivers/md/dm-zoned-metadata.c
> @@ -192,21 +192,12 @@ struct dmz_metadata {
>  	/* Zone allocation management */
>  	struct mutex		map_lock;
>  	struct dmz_mblock	**map_mblk;
> -	unsigned int		nr_rnd;
> -	atomic_t		unmap_nr_rnd;
> -	struct list_head	unmap_rnd_list;
> -	struct list_head	map_rnd_list;
>  
>  	unsigned int		nr_cache;
>  	atomic_t		unmap_nr_cache;
>  	struct list_head	unmap_cache_list;
>  	struct list_head	map_cache_list;
>  
> -	unsigned int		nr_seq;
> -	atomic_t		unmap_nr_seq;
> -	struct list_head	unmap_seq_list;
> -	struct list_head	map_seq_list;
> -
>  	atomic_t		nr_reserved_seq_zones;
>  	struct list_head	reserved_seq_zones_list;
>  
> @@ -279,14 +270,14 @@ unsigned int dmz_nr_chunks(struct dmz_metadata *zmd)
>  	return zmd->nr_chunks;
>  }
>  
> -unsigned int dmz_nr_rnd_zones(struct dmz_metadata *zmd)
> +unsigned int dmz_nr_rnd_zones(struct dmz_metadata *zmd, int idx)
>  {
> -	return zmd->nr_rnd;
> +	return zmd->dev[idx].nr_rnd;
>  }
>  
> -unsigned int dmz_nr_unmap_rnd_zones(struct dmz_metadata *zmd)
> +unsigned int dmz_nr_unmap_rnd_zones(struct dmz_metadata *zmd, int idx)
>  {
> -	return atomic_read(&zmd->unmap_nr_rnd);
> +	return atomic_read(&zmd->dev[idx].unmap_nr_rnd);
>  }
>  
>  unsigned int dmz_nr_cache_zones(struct dmz_metadata *zmd)
> @@ -299,14 +290,14 @@ unsigned int dmz_nr_unmap_cache_zones(struct dmz_metadata *zmd)
>  	return atomic_read(&zmd->unmap_nr_cache);
>  }
>  
> -unsigned int dmz_nr_seq_zones(struct dmz_metadata *zmd)
> +unsigned int dmz_nr_seq_zones(struct dmz_metadata *zmd, int idx)
>  {
> -	return zmd->nr_seq;
> +	return zmd->dev[idx].nr_seq;
>  }
>  
> -unsigned int dmz_nr_unmap_seq_zones(struct dmz_metadata *zmd)
> +unsigned int dmz_nr_unmap_seq_zones(struct dmz_metadata *zmd, int idx)
>  {
> -	return atomic_read(&zmd->unmap_nr_seq);
> +	return atomic_read(&zmd->dev[idx].unmap_nr_seq);
>  }
>  
>  static struct dm_zone *dmz_get(struct dmz_metadata *zmd, unsigned int zone_id)
> @@ -1495,6 +1486,14 @@ static int dmz_init_zones(struct dmz_metadata *zmd)
>  
>  		dev->metadata = zmd;
>  		zmd->nr_zones += dev->nr_zones;
> +
> +		atomic_set(&dev->unmap_nr_rnd, 0);
> +		INIT_LIST_HEAD(&dev->unmap_rnd_list);
> +		INIT_LIST_HEAD(&dev->map_rnd_list);
> +
> +		atomic_set(&dev->unmap_nr_seq, 0);
> +		INIT_LIST_HEAD(&dev->unmap_seq_list);
> +		INIT_LIST_HEAD(&dev->map_seq_list);
>  	}
>  
>  	if (!zmd->nr_zones) {
> @@ -1715,9 +1714,9 @@ static int dmz_load_mapping(struct dmz_metadata *zmd)
>  		if (dmz_is_cache(dzone))
>  			list_add_tail(&dzone->link, &zmd->map_cache_list);
>  		else if (dmz_is_rnd(dzone))
> -			list_add_tail(&dzone->link, &zmd->map_rnd_list);
> +			list_add_tail(&dzone->link, &dzone->dev->map_rnd_list);
>  		else
> -			list_add_tail(&dzone->link, &zmd->map_seq_list);
> +			list_add_tail(&dzone->link, &dzone->dev->map_seq_list);
>  
>  		/* Check buffer zone */
>  		bzone_id = le32_to_cpu(dmap[e].bzone_id);
> @@ -1751,7 +1750,7 @@ static int dmz_load_mapping(struct dmz_metadata *zmd)
>  		if (dmz_is_cache(bzone))
>  			list_add_tail(&bzone->link, &zmd->map_cache_list);
>  		else
> -			list_add_tail(&bzone->link, &zmd->map_rnd_list);
> +			list_add_tail(&bzone->link, &bzone->dev->map_rnd_list);
>  next:
>  		chunk++;
>  		e++;
> @@ -1776,9 +1775,9 @@ static int dmz_load_mapping(struct dmz_metadata *zmd)
>  		if (dmz_is_cache(dzone))
>  			zmd->nr_cache++;
>  		else if (dmz_is_rnd(dzone))
> -			zmd->nr_rnd++;
> +			dzone->dev->nr_rnd++;
>  		else
> -			zmd->nr_seq++;
> +			dzone->dev->nr_seq++;
>  
>  		if (dmz_is_data(dzone)) {
>  			/* Already initialized */
> @@ -1792,16 +1791,18 @@ static int dmz_load_mapping(struct dmz_metadata *zmd)
>  			list_add_tail(&dzone->link, &zmd->unmap_cache_list);
>  			atomic_inc(&zmd->unmap_nr_cache);
>  		} else if (dmz_is_rnd(dzone)) {
> -			list_add_tail(&dzone->link, &zmd->unmap_rnd_list);
> -			atomic_inc(&zmd->unmap_nr_rnd);
> +			list_add_tail(&dzone->link,
> +				      &dzone->dev->unmap_rnd_list);
> +			atomic_inc(&dzone->dev->unmap_nr_rnd);
>  		} else if (atomic_read(&zmd->nr_reserved_seq_zones) < zmd->nr_reserved_seq) {
>  			list_add_tail(&dzone->link, &zmd->reserved_seq_zones_list);
>  			set_bit(DMZ_RESERVED, &dzone->flags);
>  			atomic_inc(&zmd->nr_reserved_seq_zones);
> -			zmd->nr_seq--;
> +			dzone->dev->nr_seq--;
>  		} else {
> -			list_add_tail(&dzone->link, &zmd->unmap_seq_list);
> -			atomic_inc(&zmd->unmap_nr_seq);
> +			list_add_tail(&dzone->link,
> +				      &dzone->dev->unmap_seq_list);
> +			atomic_inc(&dzone->dev->unmap_nr_seq);
>  		}
>  	}
>  
> @@ -1835,13 +1836,13 @@ static void __dmz_lru_zone(struct dmz_metadata *zmd, struct dm_zone *zone)
>  	list_del_init(&zone->link);
>  	if (dmz_is_seq(zone)) {
>  		/* LRU rotate sequential zone */
> -		list_add_tail(&zone->link, &zmd->map_seq_list);
> +		list_add_tail(&zone->link, &zone->dev->map_seq_list);
>  	} else if (dmz_is_cache(zone)) {
>  		/* LRU rotate cache zone */
>  		list_add_tail(&zone->link, &zmd->map_cache_list);
>  	} else {
>  		/* LRU rotate random zone */
> -		list_add_tail(&zone->link, &zmd->map_rnd_list);
> +		list_add_tail(&zone->link, &zone->dev->map_rnd_list);
>  	}
>  }
>  
> @@ -1923,14 +1924,24 @@ static struct dm_zone *dmz_get_rnd_zone_for_reclaim(struct dmz_metadata *zmd,
>  {
>  	struct dm_zone *dzone = NULL;
>  	struct dm_zone *zone;
> -	struct list_head *zone_list = &zmd->map_rnd_list;
> +	struct list_head *zone_list;
>  
>  	/* If we have cache zones select from the cache zone list */
>  	if (zmd->nr_cache) {
>  		zone_list = &zmd->map_cache_list;
>  		/* Try to relaim random zones, too, when idle */
> -		if (idle && list_empty(zone_list))
> -			zone_list = &zmd->map_rnd_list;
> +		if (idle && list_empty(zone_list)) {
> +			int i;
> +
> +			for (i = 1; i < zmd->nr_devs; i++) {
> +				zone_list = &zmd->dev[i].map_rnd_list;
> +				if (!list_empty(zone_list))
> +					break;
> +			}
> +		}
> +	} else {
> +		/* Otherwise the random zones are on the first disk */
> +		zone_list = &zmd->dev[0].map_rnd_list;
>  	}
>  
>  	list_for_each_entry(zone, zone_list, link) {
> @@ -1951,12 +1962,17 @@ static struct dm_zone *dmz_get_rnd_zone_for_reclaim(struct dmz_metadata *zmd,
>  static struct dm_zone *dmz_get_seq_zone_for_reclaim(struct dmz_metadata *zmd)
>  {
>  	struct dm_zone *zone;
> +	int i;
>  
> -	list_for_each_entry(zone, &zmd->map_seq_list, link) {
> -		if (!zone->bzone)
> -			continue;
> -		if (dmz_lock_zone_reclaim(zone))
> -			return zone;
> +	for (i = 0; i < zmd->nr_devs; i++) {
> +		struct dmz_dev *dev = &zmd->dev[i];
> +
> +		list_for_each_entry(zone, &dev->map_seq_list, link) {
> +			if (!zone->bzone)
> +				continue;
> +			if (dmz_lock_zone_reclaim(zone))
> +				return zone;
> +		}
>  	}
>  
>  	return NULL;
> @@ -2142,7 +2158,7 @@ struct dm_zone *dmz_get_chunk_buffer(struct dmz_metadata *zmd,
>  	if (dmz_is_cache(bzone))
>  		list_add_tail(&bzone->link, &zmd->map_cache_list);
>  	else
> -		list_add_tail(&bzone->link, &zmd->map_rnd_list);
> +		list_add_tail(&bzone->link, &bzone->dev->map_rnd_list);
>  out:
>  	dmz_unlock_map(zmd);
>  
> @@ -2157,21 +2173,27 @@ struct dm_zone *dmz_alloc_zone(struct dmz_metadata *zmd, unsigned long flags)
>  {
>  	struct list_head *list;
>  	struct dm_zone *zone;
> +	unsigned int dev_idx = 0;
>  
> +again:
>  	if (flags & DMZ_ALLOC_CACHE)
>  		list = &zmd->unmap_cache_list;
>  	else if (flags & DMZ_ALLOC_RND)
> -		list = &zmd->unmap_rnd_list;
> +		list = &zmd->dev[dev_idx].unmap_rnd_list;
>  	else
> -		list = &zmd->unmap_seq_list;
> +		list = &zmd->dev[dev_idx].unmap_seq_list;
>  
> -again:
>  	if (list_empty(list)) {
>  		/*
>  		 * No free zone: return NULL if this is for not reclaim.
>  		 */
>  		if (!(flags & DMZ_ALLOC_RECLAIM))
>  			return NULL;
> +		if (dev_idx < zmd->nr_devs) {
> +			dev_idx++;
> +			goto again;
> +		}
> +
>  		/*
>  		 * Fallback to the reserved sequential zones
>  		 */
> @@ -2190,9 +2212,9 @@ struct dm_zone *dmz_alloc_zone(struct dmz_metadata *zmd, unsigned long flags)
>  	if (dmz_is_cache(zone))
>  		atomic_dec(&zmd->unmap_nr_cache);
>  	else if (dmz_is_rnd(zone))
> -		atomic_dec(&zmd->unmap_nr_rnd);
> +		atomic_dec(&zone->dev->unmap_nr_rnd);
>  	else
> -		atomic_dec(&zmd->unmap_nr_seq);
> +		atomic_dec(&zone->dev->unmap_nr_seq);
>  
>  	if (dmz_is_offline(zone)) {
>  		dmz_zmd_warn(zmd, "Zone %u is offline", zone->id);
> @@ -2222,14 +2244,14 @@ void dmz_free_zone(struct dmz_metadata *zmd, struct dm_zone *zone)
>  		list_add_tail(&zone->link, &zmd->unmap_cache_list);
>  		atomic_inc(&zmd->unmap_nr_cache);
>  	} else if (dmz_is_rnd(zone)) {
> -		list_add_tail(&zone->link, &zmd->unmap_rnd_list);
> -		atomic_inc(&zmd->unmap_nr_rnd);
> +		list_add_tail(&zone->link, &zone->dev->unmap_rnd_list);
> +		atomic_inc(&zone->dev->unmap_nr_rnd);
>  	} else if (dmz_is_reserved(zone)) {
>  		list_add_tail(&zone->link, &zmd->reserved_seq_zones_list);
>  		atomic_inc(&zmd->nr_reserved_seq_zones);
>  	} else {
> -		list_add_tail(&zone->link, &zmd->unmap_seq_list);
> -		atomic_inc(&zmd->unmap_nr_seq);
> +		list_add_tail(&zone->link, &zone->dev->unmap_seq_list);
> +		atomic_inc(&zone->dev->unmap_nr_seq);
>  	}
>  
>  	wake_up_all(&zmd->free_wq);
> @@ -2249,9 +2271,9 @@ void dmz_map_zone(struct dmz_metadata *zmd, struct dm_zone *dzone,
>  	if (dmz_is_cache(dzone))
>  		list_add_tail(&dzone->link, &zmd->map_cache_list);
>  	else if (dmz_is_rnd(dzone))
> -		list_add_tail(&dzone->link, &zmd->map_rnd_list);
> +		list_add_tail(&dzone->link, &dzone->dev->map_rnd_list);
>  	else
> -		list_add_tail(&dzone->link, &zmd->map_seq_list);
> +		list_add_tail(&dzone->link, &dzone->dev->map_seq_list);
>  }
>  
>  /*
> @@ -2819,18 +2841,11 @@ int dmz_ctr_metadata(struct dmz_dev *dev, int num_dev,
>  	INIT_LIST_HEAD(&zmd->mblk_dirty_list);
>  
>  	mutex_init(&zmd->map_lock);
> -	atomic_set(&zmd->unmap_nr_rnd, 0);
> -	INIT_LIST_HEAD(&zmd->unmap_rnd_list);
> -	INIT_LIST_HEAD(&zmd->map_rnd_list);
>  
>  	atomic_set(&zmd->unmap_nr_cache, 0);
>  	INIT_LIST_HEAD(&zmd->unmap_cache_list);
>  	INIT_LIST_HEAD(&zmd->map_cache_list);
>  
> -	atomic_set(&zmd->unmap_nr_seq, 0);
> -	INIT_LIST_HEAD(&zmd->unmap_seq_list);
> -	INIT_LIST_HEAD(&zmd->map_seq_list);
> -
>  	atomic_set(&zmd->nr_reserved_seq_zones, 0);
>  	INIT_LIST_HEAD(&zmd->reserved_seq_zones_list);
>  
> @@ -2899,10 +2914,14 @@ int dmz_ctr_metadata(struct dmz_dev *dev, int num_dev,
>  		      zmd->nr_data_zones, zmd->nr_chunks);
>  	dmz_zmd_debug(zmd, "    %u cache zones (%u unmapped)",
>  		      zmd->nr_cache, atomic_read(&zmd->unmap_nr_cache));
> -	dmz_zmd_debug(zmd, "    %u random zones (%u unmapped)",
> -		      zmd->nr_rnd, atomic_read(&zmd->unmap_nr_rnd));
> -	dmz_zmd_debug(zmd, "    %u sequential zones (%u unmapped)",
> -		      zmd->nr_seq, atomic_read(&zmd->unmap_nr_seq));
> +	for (i = 0; i < zmd->nr_devs; i++) {
> +		dmz_zmd_debug(zmd, "    %u random zones (%u unmapped)",
> +			      dmz_nr_rnd_zones(zmd, i),
> +			      dmz_nr_unmap_rnd_zones(zmd, i));
> +		dmz_zmd_debug(zmd, "    %u sequential zones (%u unmapped)",
> +			      dmz_nr_seq_zones(zmd, i),
> +			      dmz_nr_unmap_seq_zones(zmd, i));
> +	}
>  	dmz_zmd_debug(zmd, "  %u reserved sequential data zones",
>  		      zmd->nr_reserved_seq);
>  	dmz_zmd_debug(zmd, "Format:");
> diff --git a/drivers/md/dm-zoned-reclaim.c b/drivers/md/dm-zoned-reclaim.c
> index 09843645248a..18edf1b9bf52 100644
> --- a/drivers/md/dm-zoned-reclaim.c
> +++ b/drivers/md/dm-zoned-reclaim.c
> @@ -447,15 +447,14 @@ static unsigned int dmz_reclaim_percentage(struct dmz_reclaim *zrc)
>  {
>  	struct dmz_metadata *zmd = zrc->metadata;
>  	unsigned int nr_cache = dmz_nr_cache_zones(zmd);
> -	unsigned int nr_rnd = dmz_nr_rnd_zones(zmd);
>  	unsigned int nr_unmap, nr_zones;
>  
>  	if (nr_cache) {
>  		nr_zones = nr_cache;
>  		nr_unmap = dmz_nr_unmap_cache_zones(zmd);
>  	} else {
> -		nr_zones = nr_rnd;
> -		nr_unmap = dmz_nr_unmap_rnd_zones(zmd);
> +		nr_zones = dmz_nr_rnd_zones(zmd, zrc->dev_idx);
> +		nr_unmap = dmz_nr_unmap_rnd_zones(zmd, zrc->dev_idx);
>  	}
>  	return nr_unmap * 100 / nr_zones;
>  }
> @@ -467,7 +466,7 @@ static bool dmz_should_reclaim(struct dmz_reclaim *zrc, unsigned int p_unmap)
>  {
>  	unsigned int nr_reclaim;
>  
> -	nr_reclaim = dmz_nr_rnd_zones(zrc->metadata);
> +	nr_reclaim = dmz_nr_rnd_zones(zrc->metadata, zrc->dev_idx);
>  
>  	if (dmz_nr_cache_zones(zrc->metadata)) {
>  		/*
> @@ -528,8 +527,8 @@ static void dmz_reclaim_work(struct work_struct *work)
>  		zrc->kc_throttle.throttle = min(75U, 100U - p_unmap / 2);
>  	}
>  
> -	nr_unmap_rnd = dmz_nr_unmap_rnd_zones(zmd);
> -	nr_rnd = dmz_nr_rnd_zones(zmd);
> +	nr_unmap_rnd = dmz_nr_unmap_rnd_zones(zmd, zrc->dev_idx);
> +	nr_rnd = dmz_nr_rnd_zones(zmd, zrc->dev_idx);
>  
>  	DMDEBUG("(%s/%u): Reclaim (%u): %s, %u%% free zones (%u/%u cache %u/%u random)",
>  		dmz_metadata_label(zmd), zrc->dev_idx,
> @@ -537,8 +536,8 @@ static void dmz_reclaim_work(struct work_struct *work)
>  		(dmz_target_idle(zrc) ? "Idle" : "Busy"),
>  		p_unmap, dmz_nr_unmap_cache_zones(zmd),
>  		dmz_nr_cache_zones(zmd),
> -		dmz_nr_unmap_rnd_zones(zmd),
> -		dmz_nr_rnd_zones(zmd));
> +		dmz_nr_unmap_rnd_zones(zmd, zrc->dev_idx),
> +		dmz_nr_rnd_zones(zmd, zrc->dev_idx));
>  
>  	ret = dmz_do_reclaim(zrc);
>  	if (ret && ret != -EINTR) {
> diff --git a/drivers/md/dm-zoned-target.c b/drivers/md/dm-zoned-target.c
> index fc1df9714f63..f6f00a363903 100644
> --- a/drivers/md/dm-zoned-target.c
> +++ b/drivers/md/dm-zoned-target.c
> @@ -1082,17 +1082,30 @@ static void dmz_status(struct dm_target *ti, status_type_t type,
>  	ssize_t sz = 0;
>  	char buf[BDEVNAME_SIZE];
>  	struct dmz_dev *dev;
> +	int i;
>  
>  	switch (type) {
>  	case STATUSTYPE_INFO:
> -		DMEMIT("%u zones %u/%u cache %u/%u random %u/%u sequential",
> +		DMEMIT("%u zones %u/%u cache",
>  		       dmz_nr_zones(dmz->metadata),
>  		       dmz_nr_unmap_cache_zones(dmz->metadata),
> -		       dmz_nr_cache_zones(dmz->metadata),
> -		       dmz_nr_unmap_rnd_zones(dmz->metadata),
> -		       dmz_nr_rnd_zones(dmz->metadata),
> -		       dmz_nr_unmap_seq_zones(dmz->metadata),
> -		       dmz_nr_seq_zones(dmz->metadata));
> +		       dmz_nr_cache_zones(dmz->metadata));
> +		for (i = 0; i < DMZ_MAX_DEVS; i++) {

i < zmd->nr_devs ? Since now only what is needed is allocated.

> +			if (!dmz->ddev[i])
> +				continue;
> +			/*
> +			 * For a multi-device setup the first device
> +			 * contains only cache zones.
> +			 */
> +			if ((i == 0) &&
> +			    (dmz_nr_cache_zones(dmz->metadata) > 0))
> +				continue;
> +			DMEMIT(" %u/%u random %u/%u sequential",
> +			       dmz_nr_unmap_rnd_zones(dmz->metadata, i),
> +			       dmz_nr_rnd_zones(dmz->metadata, i),
> +			       dmz_nr_unmap_seq_zones(dmz->metadata, i),
> +			       dmz_nr_seq_zones(dmz->metadata, i));
> +		}
>  		break;
>  	case STATUSTYPE_TABLE:
>  		dev = &dmz->dev[0];
> diff --git a/drivers/md/dm-zoned.h b/drivers/md/dm-zoned.h
> index 0cc3459f78ce..f2a760f62db5 100644
> --- a/drivers/md/dm-zoned.h
> +++ b/drivers/md/dm-zoned.h
> @@ -67,6 +67,16 @@ struct dmz_dev {
>  	unsigned int		flags;
>  
>  	sector_t		zone_nr_sectors;
> +
> +	unsigned int		nr_rnd;
> +	atomic_t		unmap_nr_rnd;
> +	struct list_head	unmap_rnd_list;
> +	struct list_head	map_rnd_list;
> +
> +	unsigned int		nr_seq;
> +	atomic_t		unmap_nr_seq;
> +	struct list_head	unmap_seq_list;
> +	struct list_head	map_seq_list;
>  };
>  
>  #define dmz_bio_chunk(zmd, bio)	((bio)->bi_iter.bi_sector >> \
> @@ -213,10 +223,10 @@ void dmz_unmap_zone(struct dmz_metadata *zmd, struct dm_zone *zone);
>  unsigned int dmz_nr_zones(struct dmz_metadata *zmd);
>  unsigned int dmz_nr_cache_zones(struct dmz_metadata *zmd);
>  unsigned int dmz_nr_unmap_cache_zones(struct dmz_metadata *zmd);
> -unsigned int dmz_nr_rnd_zones(struct dmz_metadata *zmd);
> -unsigned int dmz_nr_unmap_rnd_zones(struct dmz_metadata *zmd);
> -unsigned int dmz_nr_seq_zones(struct dmz_metadata *zmd);
> -unsigned int dmz_nr_unmap_seq_zones(struct dmz_metadata *zmd);
> +unsigned int dmz_nr_rnd_zones(struct dmz_metadata *zmd, int idx);
> +unsigned int dmz_nr_unmap_rnd_zones(struct dmz_metadata *zmd, int idx);
> +unsigned int dmz_nr_seq_zones(struct dmz_metadata *zmd, int idx);
> +unsigned int dmz_nr_unmap_seq_zones(struct dmz_metadata *zmd, int idx);
>  unsigned int dmz_zone_nr_blocks(struct dmz_metadata *zmd);
>  unsigned int dmz_zone_nr_blocks_shift(struct dmz_metadata *zmd);
>  unsigned int dmz_zone_nr_sectors(struct dmz_metadata *zmd);

-- 
Damien Le Moal
Western Digital Research

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

