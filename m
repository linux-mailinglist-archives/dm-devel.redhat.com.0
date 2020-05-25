Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-delivery-1.mimecast.com [207.211.31.120])
	by mail.lfdr.de (Postfix) with ESMTP id 48F5D1E04CC
	for <lists+dm-devel@lfdr.de>; Mon, 25 May 2020 04:43:29 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1590374608;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 references:references:list-id:list-help:list-unsubscribe:
	 list-subscribe:list-post; bh=xzvw5sTpJzvlh7Q5fAlYY0uwYEQ6r5pPZ0H6LUZdKxo=;
	b=QfCFOc8XJbm2aNWKo7bUFIKp4ItBVvrRfdgHmT7AUy0asriL3gVjy3T8wPfBgf0WcnV++B
	81OfxSzf2AOoFAAR6fo/zg9wymApnVpfGzmm+KktgV2ewE6JK3sB2dBIA3LhgEihAb/mcR
	uUV4U9RwuxRUNiFCEA69MhiidDXnEiQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-77-evvf7rjPOXq6tDzvkY7unw-1; Sun, 24 May 2020 22:43:25 -0400
X-MC-Unique: evvf7rjPOXq6tDzvkY7unw-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A776A800688;
	Mon, 25 May 2020 02:43:18 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id A8D905D9DC;
	Mon, 25 May 2020 02:43:17 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 203BA1809543;
	Mon, 25 May 2020 02:43:12 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 04P2h5o3001733 for <dm-devel@listman.util.phx.redhat.com>;
	Sun, 24 May 2020 22:43:05 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 4DF7110F8E06; Mon, 25 May 2020 02:43:03 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast03.extmail.prod.ext.rdu2.redhat.com [10.11.55.19])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 90D3F10F8E05
	for <dm-devel@redhat.com>; Mon, 25 May 2020 02:43:00 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 16C998026A2
	for <dm-devel@redhat.com>; Mon, 25 May 2020 02:43:00 +0000 (UTC)
Received: from esa6.hgst.iphmx.com (esa6.hgst.iphmx.com [216.71.154.45])
	(Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-51-gxPpUPFFP4O0AjENAa9T3Q-1; Sun, 24 May 2020 22:42:57 -0400
X-MC-Unique: gxPpUPFFP4O0AjENAa9T3Q-1
IronPort-SDR: 89cD4LxOZxxBIE5+oznhEOgGhasxSdt1utqdz1pcTkXZcwolLAyeEjZd2+PYElKAR83t322CmM
	VJkxvm6CF059QBHurQWH3WlAWrDCeIq01nzJizSpprlqmGI2PuGXO1NF13GMFJcVQuuVXM+2uK
	8Xyf4mw6sZqXs9OtqdCKIUE80Cbc96f14NYu7XZbhxhlP7IQao0Pf7+uIYDZzS+u+MmJUy/oJB
	GcYRrx479E3M/upfknXvGPOWCEpenehPATo+zrrBZzhPIP6sP8UkorcbJeyndqody3nPTmx2FE
	2IU=
X-IronPort-AV: E=Sophos;i="5.73,431,1583164800"; d="scan'208";a="139869968"
Received: from mail-sn1nam02lp2051.outbound.protection.outlook.com (HELO
	NAM02-SN1-obe.outbound.protection.outlook.com) ([104.47.36.51])
	by ob1.hgst.iphmx.com with ESMTP; 25 May 2020 10:42:56 +0800
Received: from CY4PR04MB3751.namprd04.prod.outlook.com (2603:10b6:903:ec::14)
	by CY4PR04MB0584.namprd04.prod.outlook.com (2603:10b6:903:b3::8) with
	Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3021.23;
	Mon, 25 May 2020 02:42:54 +0000
Received: from CY4PR04MB3751.namprd04.prod.outlook.com
	([fe80::c593:f271:eebe:ac7]) by CY4PR04MB3751.namprd04.prod.outlook.com
	([fe80::c593:f271:eebe:ac7%9]) with mapi id 15.20.3021.029;
	Mon, 25 May 2020 02:42:54 +0000
From: Damien Le Moal <Damien.LeMoal@wdc.com>
To: Hannes Reinecke <hare@suse.de>
Thread-Topic: [PATCH 11/12] dm-zoned: round-robin load balancer for reclaiming
	zones
Thread-Index: AQHWME8mEX9sLbBB5kOG9SbUWUd4aw==
Date: Mon, 25 May 2020 02:42:54 +0000
Message-ID: <CY4PR04MB375158B6B94B1452DFDFCF98E7B30@CY4PR04MB3751.namprd04.prod.outlook.com>
References: <20200522153901.133375-1-hare@suse.de>
	<20200522153901.133375-12-hare@suse.de>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [199.255.47.8]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: f2ec48c5-d04e-458d-e66d-08d8005553a4
x-ms-traffictypediagnostic: CY4PR04MB0584:
x-microsoft-antispam-prvs: <CY4PR04MB058471D483D746C001B2DC89E7B30@CY4PR04MB0584.namprd04.prod.outlook.com>
wdcipoutbound: EOP-TRUE
x-ms-oob-tlc-oobclassifiers: OLM:3631;
x-forefront-prvs: 0414DF926F
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: LLq6cLOAudbqoR31PTN28ra0T9KEB3TT7OpGOCRqmIFUYKAax0coA+WkR7Qol+hza/jMKj1wVgnuAcV8g2vLwPSOVVMUeClzvGfrY5iQJyGaAsQeu7AYjYzXi2pxWISVYSgjg5S6dZYYKENpawYs3xDYq4bjvXZEmg17ZvdntZBePng90TBi9I7nQGdAH9wy8aHOCsV89lLRG6i8/KyunmmU6bN0P6FMbZU4nfsHSJ3m59JN0mZ4vdLyedeV24P0rB58KHMZDKn5zew1mQeWNpxV3VepchFxbrmB+7l7lbyhdceWg42uS58NaI/5igWNdKj7eYEpWZY4nMMS5y55kg==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
	IPV:NLI; SFV:NSPM; H:CY4PR04MB3751.namprd04.prod.outlook.com;
	PTR:; CAT:NONE; SFTY:;
	SFS:(4636009)(366004)(39860400002)(346002)(136003)(376002)(396003)(6916009)(71200400001)(66946007)(64756008)(2906002)(66556008)(91956017)(76116006)(316002)(9686003)(66446008)(8936002)(8676002)(4326008)(66476007)(55016002)(54906003)(33656002)(26005)(86362001)(5660300002)(53546011)(186003)(6506007)(52536014)(7696005)(478600001);
	DIR:OUT; SFP:1102;
x-ms-exchange-antispam-messagedata: eDQIy35JMtunTeFNHU4+6MAfyQRdavGBRXuuvvywQYCjklveJlxoFv+tDbMsYmFgQFrAeKAdEpP5hvxe7v0/8azlMj3xW+lgE44snpPnqXbxt27znAQvuD8C4ThMlICVcOXcrQlNo2qOal7cLR6vvHQK4wJ4HHx2xlnYisYZqMNKJjRmhYaEQ2lihZdvAV9Coa3HP1Hx6OybV+kPnRYCrh0VFN7IY/vZCKaWca/slqJdcjlLyUbhpY2jL9sucvkJxU/Blmo9ZYJ6HsZbvwtn9hRWMAMjMw819NilXezp8NTaVEmkUgHXp4qjFZTRTUdptbA1ya5Plk7FpB2hh59EP7i4UhREj1bd1fN0YGY5bxwXvvO/5wgoqWuaxyZDdfOrEFqHZM3etEy4J0HHVgjo2spVY+c8MF0IkYLW681pNYi7yhGaorqtX2qRO1iccwd4ilbShrlVvdrYmIzzHc8BtWLagsnkbk6ukxx5uE63NmU=
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f2ec48c5-d04e-458d-e66d-08d8005553a4
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 May 2020 02:42:54.7031 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: tt43dr91MRocQwe6BRp+F7Dv/NJL/x6RgY6NKsvA+v6npCaaJxqV9LnHCrkLZ573gFgyIA5mMJa9avCrOv6Cew==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR04MB0584
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 04P2h5o3001733
X-loop: dm-devel@redhat.com
Cc: "dm-devel@redhat.com" <dm-devel@redhat.com>,
	Mike Snitzer <snitzer@redhat.com>
Subject: Re: [dm-devel] [PATCH 11/12] dm-zoned: round-robin load balancer
 for reclaiming zones
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On 2020/05/23 0:39, Hannes Reinecke wrote:
> When reclaiming zones we should arbitrate between the zoned
> devices to get a better throughput. So implement a simple
> round-robin load balancer between the zoned devices.
> 
> Signed-off-by: Hannes Reinecke <hare@suse.de>
> ---
>  drivers/md/dm-zoned-metadata.c | 8 +++++++-
>  1 file changed, 7 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/md/dm-zoned-metadata.c b/drivers/md/dm-zoned-metadata.c
> index 87784e7785bc..25dcad2a565f 100644
> --- a/drivers/md/dm-zoned-metadata.c
> +++ b/drivers/md/dm-zoned-metadata.c
> @@ -171,6 +171,8 @@ struct dmz_metadata {
>  	unsigned int		nr_reserved_seq;
>  	unsigned int		nr_chunks;
>  
> +	unsigned int		last_alloc_idx;
> +
>  	/* Zone information array */
>  	struct xarray		zones;
>  
> @@ -2178,7 +2180,7 @@ struct dm_zone *dmz_alloc_zone(struct dmz_metadata *zmd, unsigned long flags)
>  {
>  	struct list_head *list;
>  	struct dm_zone *zone;
> -	unsigned int dev_idx = 0;
> +	unsigned int dev_idx = zmd->last_alloc_idx;
>  
>  again:
>  	if (flags & DMZ_ALLOC_CACHE)
> @@ -2214,6 +2216,9 @@ struct dm_zone *dmz_alloc_zone(struct dmz_metadata *zmd, unsigned long flags)
>  	zone = list_first_entry(list, struct dm_zone, link);
>  	list_del_init(&zone->link);
>  
> +	if (!(flags & DMZ_ALLOC_CACHE))
> +		zmd->last_alloc_idx = (dev_idx + 1) % zmd->nr_devs;
> +
>  	if (dmz_is_cache(zone))
>  		atomic_dec(&zmd->unmap_nr_cache);
>  	else if (dmz_is_rnd(zone))
> @@ -2839,6 +2844,7 @@ int dmz_ctr_metadata(struct dmz_dev *dev, int num_dev,
>  	zmd->dev = dev;
>  	zmd->nr_devs = num_dev;
>  	zmd->mblk_rbtree = RB_ROOT;
> +	zmd->last_alloc_idx = 0;
>  	init_rwsem(&zmd->mblk_sem);
>  	mutex_init(&zmd->mblk_flush_lock);
>  	spin_lock_init(&zmd->mblk_lock);
> 


OK. So my comment on patch 8 is already addressed. Or at least partly... Where
is last_alloc_idx actually used ? It looks like this only sets last_alloc_idx
but do not use that value on entry to dmz_alloc_zone() to allocate the zone.

-- 
Damien Le Moal
Western Digital Research



--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

