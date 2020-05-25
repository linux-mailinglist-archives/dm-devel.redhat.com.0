Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
	by mail.lfdr.de (Postfix) with ESMTP id 8DAD31E04AE
	for <lists+dm-devel@lfdr.de>; Mon, 25 May 2020 04:28:02 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1590373681;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 references:references:list-id:list-help:list-unsubscribe:
	 list-subscribe:list-post; bh=3uKU/y8lBSJvNVh/fRqLimlfRa+LmwmP2conKgTgEoo=;
	b=ALBk+Usu+KFhe9XLu+unozWyPTcxAkOzgrZCDcDcyuEIG6fO7eBKSfy01Ak+7u019tVmv2
	d9TzFAyTuvYxua2cDj1d7ZUfG2I56eusu5qYZoLy82gyqKwCE4MIam/QibvZJb9nwaQvB4
	9c7o2+i17CQJyoGCRBOZ/A7UQb1iL2k=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-62-bNupYhCDPc-0Dj-GxBZsPw-1; Sun, 24 May 2020 22:27:59 -0400
X-MC-Unique: bNupYhCDPc-0Dj-GxBZsPw-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E3E1B8014D7;
	Mon, 25 May 2020 02:27:52 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 8BD755C1D4;
	Mon, 25 May 2020 02:27:51 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id B3E5654D0D;
	Mon, 25 May 2020 02:27:43 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 04P2RbYg000453 for <dm-devel@listman.util.phx.redhat.com>;
	Sun, 24 May 2020 22:27:37 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 78AB5176C5; Mon, 25 May 2020 02:27:36 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast06.extmail.prod.ext.rdu2.redhat.com [10.11.55.22])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 698F81731D
	for <dm-devel@redhat.com>; Mon, 25 May 2020 02:27:34 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 21E06185A78B
	for <dm-devel@redhat.com>; Mon, 25 May 2020 02:27:34 +0000 (UTC)
Received: from esa6.hgst.iphmx.com (esa6.hgst.iphmx.com [216.71.154.45])
	(Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-424-nSWc58m0OsymT_bydYNlzw-1; Sun, 24 May 2020 22:27:29 -0400
X-MC-Unique: nSWc58m0OsymT_bydYNlzw-1
IronPort-SDR: EudbSzoKAcmbs4RZnb0m6U1AiYUQWT4MXziScEFEqZ7DVkfzxy/GFuYbaXypmAL2S2XkzIGgCe
	BdEW28siY2+NMCYJGfk8yKP61kfIcdBGA/yqlzKI1sY5NV9074aw6u//wA1/mxwVEjMS1KASyS
	sNzwuRIXfDk1a0sWLvsfobKrx4RFHCZxgbUEDYefb/yDseMl0h/wo6UUYnjGWM+mf/TiJCshv4
	4MyGofSsqG9Nhq9oDA2IrhF2t2gvyONpj5r2955BTFKqTuRAkvyb3vnFDYTvavb+aCtboELhHg
	GVE=
X-IronPort-AV: E=Sophos;i="5.73,431,1583164800"; d="scan'208";a="139869305"
Received: from mail-co1nam04lp2053.outbound.protection.outlook.com (HELO
	NAM04-CO1-obe.outbound.protection.outlook.com) ([104.47.45.53])
	by ob1.hgst.iphmx.com with ESMTP; 25 May 2020 10:27:28 +0800
Received: from CY4PR04MB3751.namprd04.prod.outlook.com (2603:10b6:903:ec::14)
	by CY4PR04MB3735.namprd04.prod.outlook.com (2603:10b6:903:e5::17)
	with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3021.24;
	Mon, 25 May 2020 02:27:26 +0000
Received: from CY4PR04MB3751.namprd04.prod.outlook.com
	([fe80::c593:f271:eebe:ac7]) by CY4PR04MB3751.namprd04.prod.outlook.com
	([fe80::c593:f271:eebe:ac7%9]) with mapi id 15.20.3021.029;
	Mon, 25 May 2020 02:27:26 +0000
From: Damien Le Moal <Damien.LeMoal@wdc.com>
To: Hannes Reinecke <hare@suse.de>
Thread-Topic: [PATCH 08/12] dm-zoned: move random and sequential zones into
	struct dmz_dev
Thread-Index: AQHWME8obVsvk7+dMUyzwSSh98vqjg==
Date: Mon, 25 May 2020 02:27:25 +0000
Message-ID: <CY4PR04MB3751E7CBF9B0089AE28C353FE7B30@CY4PR04MB3751.namprd04.prod.outlook.com>
References: <20200522153901.133375-1-hare@suse.de>
	<20200522153901.133375-9-hare@suse.de>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [199.255.47.8]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 07908653-dde2-4e74-662a-08d800532a17
x-ms-traffictypediagnostic: CY4PR04MB3735:
x-microsoft-antispam-prvs: <CY4PR04MB37351D11E7EC89CD5F2755DFE7B30@CY4PR04MB3735.namprd04.prod.outlook.com>
wdcipoutbound: EOP-TRUE
x-ms-oob-tlc-oobclassifiers: OLM:2150;
x-forefront-prvs: 0414DF926F
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: IUPvJ9lUVmpjM8mKbixp1uD6C7SJnOCVRIX8gIpVtIEY59h/0RezzLOfn/yRU5LbtXrISjGYwT9I1MA+GPjITyPLSdXuelLap65MpJhuSj+0W10qbf7hk+josm7zuV0QsKzEY8ybQOJb5w2yRZ0/sFAc9DSeepzCShQymuE4Sx7gaFFsKokOLdY/Qm2nL94tM3Ug9/0MMJQitSX4NKOubEWBVkkOJaPIsdRDdEZOZgiWX9QeazHxLE1KCLDYDZTzP1j+ZiFrRBo0sqexQRj8XkapVf4mDdDgdkznaWCul3wOEFn3+UKiywZtgDHsInFncyLXOX0bkRW6dMkqYAjDNQ==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
	IPV:NLI; SFV:NSPM; H:CY4PR04MB3751.namprd04.prod.outlook.com;
	PTR:; CAT:NONE; SFTY:;
	SFS:(4636009)(366004)(396003)(346002)(136003)(376002)(39860400002)(8676002)(5660300002)(52536014)(186003)(66446008)(26005)(8936002)(76116006)(66476007)(66556008)(33656002)(66946007)(91956017)(64756008)(53546011)(4326008)(7696005)(86362001)(30864003)(2906002)(9686003)(54906003)(478600001)(6506007)(6916009)(55016002)(316002)(71200400001);
	DIR:OUT; SFP:1102;
x-ms-exchange-antispam-messagedata: dJBjEn82MyCi6VOUPymQcx0oNRzJorA5Jsl1iSwM8xAgcVF3tMRvsmosu8YNRl85CHbUpdT9RZ52qfau2ZhSYCIzs/ADs420nwPAOGvani8irZJfZSjpMg2RaztrdZsq2RLoiXLDJut8aE41V96o+GybKPBEtS8CRt62qdrDp4/B+5PdKr+ZKeTxEq2AvLA3/LXOasFam/yIoxVdMO3OVH3AUj4ZfKn/yTYwCc5KEAR4z8PidStHNAaQUfW8kkFKmBO5ldiFVgM9Nha2P5fee+gib3/JQr1zUsIS27/MFW1j1QxIlPSZTDxQatkW1mYi2WzakOJ9zmjbk7e37L94A11LLymFaULOri+FdH3YAvY72JIYAEJSTOxusBHPN5MS21nsQdRQ8/NRcqoSh5fHGK+ZqgZNa2jSveKtJ0uScOKOjt1tWG9s1j+a1N9NuVMlht1UdYYrV+Li1I8sv6PdlF13EXNXvY/4kmH5dRTFPtc=
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 07908653-dde2-4e74-662a-08d800532a17
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 May 2020 02:27:25.9388 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 35GBTJiJfSvtDDazFb8ycUpUfX1Ucesqormf8nZYt/GCXHZZKlUto91hiLdm/OLyxoIKHcZLHRPZCivy5D4N/A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR04MB3735
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 04P2RbYg000453
X-loop: dm-devel@redhat.com
Cc: "dm-devel@redhat.com" <dm-devel@redhat.com>,
	Mike Snitzer <snitzer@redhat.com>
Subject: Re: [dm-devel] [PATCH 08/12] dm-zoned: move random and sequential
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

On 2020/05/23 0:39, Hannes Reinecke wrote:
> Random and sequential zones should be part of the respective
> device structure to make arbitration between devices possible.
> 
> Signed-off-by: Hannes Reinecke <hare@suse.de>
> ---
>  drivers/md/dm-zoned-metadata.c | 143 +++++++++++++++++++++++++----------------
>  drivers/md/dm-zoned.h          |  10 +++
>  2 files changed, 99 insertions(+), 54 deletions(-)
> 
> diff --git a/drivers/md/dm-zoned-metadata.c b/drivers/md/dm-zoned-metadata.c
> index 1b9da698a812..5f44970a6187 100644
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
> @@ -281,12 +272,22 @@ unsigned int dmz_nr_chunks(struct dmz_metadata *zmd)
>  
>  unsigned int dmz_nr_rnd_zones(struct dmz_metadata *zmd)
>  {
> -	return zmd->nr_rnd;
> +	unsigned int nr_rnd_zones = 0;
> +	int i;
> +
> +	for (i = 0; i < zmd->nr_devs; i++)
> +		nr_rnd_zones += zmd->dev[i].nr_rnd;

We could keep the total nr_rnd_zones in dmz_metadata to avoid this one since the
value will never change at run time.

> +	return nr_rnd_zones;
>  }
>  
>  unsigned int dmz_nr_unmap_rnd_zones(struct dmz_metadata *zmd)
>  {
> -	return atomic_read(&zmd->unmap_nr_rnd);
> +	unsigned int nr_unmap_rnd_zones = 0;
> +	int i;
> +
> +	for (i = 0; i < zmd->nr_devs; i++)
> +		nr_unmap_rnd_zones += atomic_read(&zmd->dev[i].unmap_nr_rnd);
> +	return nr_unmap_rnd_zones;
>  }
>  
>  unsigned int dmz_nr_cache_zones(struct dmz_metadata *zmd)
> @@ -301,12 +302,22 @@ unsigned int dmz_nr_unmap_cache_zones(struct dmz_metadata *zmd)
>  
>  unsigned int dmz_nr_seq_zones(struct dmz_metadata *zmd)
>  {
> -	return zmd->nr_seq;
> +	unsigned int nr_seq_zones = 0;
> +	int i;
> +
> +	for (i = 0; i < zmd->nr_devs; i++)
> +		nr_seq_zones += zmd->dev[i].nr_seq;

Same here. This value does not change at runtime.

> +	return nr_seq_zones;
>  }
>  
>  unsigned int dmz_nr_unmap_seq_zones(struct dmz_metadata *zmd)
>  {
> -	return atomic_read(&zmd->unmap_nr_seq);
> +	unsigned int nr_unmap_seq_zones = 0;
> +	int i;
> +
> +	for (i = 0; i < zmd->nr_devs; i++)
> +		nr_unmap_seq_zones += atomic_read(&zmd->dev[i].unmap_nr_seq);
> +	return nr_unmap_seq_zones;
>  }
>  
>  static struct dm_zone *dmz_get(struct dmz_metadata *zmd, unsigned int zone_id)
> @@ -1485,6 +1496,14 @@ static int dmz_init_zones(struct dmz_metadata *zmd)
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
> @@ -1702,9 +1721,9 @@ static int dmz_load_mapping(struct dmz_metadata *zmd)
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
> @@ -1738,7 +1757,7 @@ static int dmz_load_mapping(struct dmz_metadata *zmd)
>  		if (dmz_is_cache(bzone))
>  			list_add_tail(&bzone->link, &zmd->map_cache_list);
>  		else
> -			list_add_tail(&bzone->link, &zmd->map_rnd_list);
> +			list_add_tail(&bzone->link, &bzone->dev->map_rnd_list);
>  next:
>  		chunk++;
>  		e++;
> @@ -1763,9 +1782,9 @@ static int dmz_load_mapping(struct dmz_metadata *zmd)
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
> @@ -1779,16 +1798,18 @@ static int dmz_load_mapping(struct dmz_metadata *zmd)
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
> @@ -1822,13 +1843,13 @@ static void __dmz_lru_zone(struct dmz_metadata *zmd, struct dm_zone *zone)
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
> @@ -1910,14 +1931,24 @@ static struct dm_zone *dmz_get_rnd_zone_for_reclaim(struct dmz_metadata *zmd,
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

This is going to use the first zoned dev until it has no more random zones, then
switch to the next zoned dev. What about going round-robin on the devices to
increase parallelism between the drives ?


> +		}
> +	} else {
> +		/* Otherwise the random zones are on the first disk */
> +		zone_list = &zmd->dev[0].map_rnd_list;
>  	}
>  
>  	list_for_each_entry(zone, zone_list, link) {
> @@ -1938,12 +1969,17 @@ static struct dm_zone *dmz_get_rnd_zone_for_reclaim(struct dmz_metadata *zmd,
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

Same comment here.

>  	}
>  
>  	return NULL;
> @@ -2129,7 +2165,7 @@ struct dm_zone *dmz_get_chunk_buffer(struct dmz_metadata *zmd,
>  	if (dmz_is_cache(bzone))
>  		list_add_tail(&bzone->link, &zmd->map_cache_list);
>  	else
> -		list_add_tail(&bzone->link, &zmd->map_rnd_list);
> +		list_add_tail(&bzone->link, &bzone->dev->map_rnd_list);
>  out:
>  	dmz_unlock_map(zmd);
>  
> @@ -2144,21 +2180,27 @@ struct dm_zone *dmz_alloc_zone(struct dmz_metadata *zmd, unsigned long flags)
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
> @@ -2177,9 +2219,9 @@ struct dm_zone *dmz_alloc_zone(struct dmz_metadata *zmd, unsigned long flags)
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
> @@ -2209,14 +2251,14 @@ void dmz_free_zone(struct dmz_metadata *zmd, struct dm_zone *zone)
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
> @@ -2236,9 +2278,9 @@ void dmz_map_zone(struct dmz_metadata *zmd, struct dm_zone *dzone,
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
> @@ -2806,18 +2848,11 @@ int dmz_ctr_metadata(struct dmz_dev *dev, int num_dev,
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
> @@ -2887,9 +2922,9 @@ int dmz_ctr_metadata(struct dmz_dev *dev, int num_dev,
>  	dmz_zmd_debug(zmd, "    %u cache zones (%u unmapped)",
>  		      zmd->nr_cache, atomic_read(&zmd->unmap_nr_cache));
>  	dmz_zmd_debug(zmd, "    %u random zones (%u unmapped)",
> -		      zmd->nr_rnd, atomic_read(&zmd->unmap_nr_rnd));
> +		      dmz_nr_rnd_zones(zmd), dmz_nr_unmap_rnd_zones(zmd));
>  	dmz_zmd_debug(zmd, "    %u sequential zones (%u unmapped)",
> -		      zmd->nr_seq, atomic_read(&zmd->unmap_nr_seq));
> +		      dmz_nr_seq_zones(zmd), dmz_nr_unmap_seq_zones(zmd));
>  	dmz_zmd_debug(zmd, "  %u reserved sequential data zones",
>  		      zmd->nr_reserved_seq);
>  	dmz_zmd_debug(zmd, "Format:");
> diff --git a/drivers/md/dm-zoned.h b/drivers/md/dm-zoned.h
> index 983f5b5e9fa0..56e138586d9b 100644
> --- a/drivers/md/dm-zoned.h
> +++ b/drivers/md/dm-zoned.h
> @@ -66,6 +66,16 @@ struct dmz_dev {
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
> 


-- 
Damien Le Moal
Western Digital Research



--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

