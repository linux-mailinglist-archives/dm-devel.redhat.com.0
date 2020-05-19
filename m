Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-delivery-1.mimecast.com [207.211.31.120])
	by mail.lfdr.de (Postfix) with ESMTP id A18661DA485
	for <lists+dm-devel@lfdr.de>; Wed, 20 May 2020 00:27:33 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1589927252;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 references:references:list-id:list-help:list-unsubscribe:
	 list-subscribe:list-post; bh=BN3xNFWW8VZhVi1SL95IF5Il+Sna2RFf9lzVlBL7CJM=;
	b=JGbTAUXdOjdbGNn9RpnnoWl7v0vhrqX0Ihydx4y/a1wOouvhjlN9l0i/93vaYLpu/wVqRf
	mauzhzhc9vbqkOQJIOKyHIwJ7hSaoxxyZZ4PZObqFiDw8jSxuJPPzNfBQoQerQixLLGvW5
	nUp9+k/2JEkdsAAlAl2pm1T7es38Nj4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-37--bKNzgvnPAi5AaUVVggPow-1; Tue, 19 May 2020 18:27:30 -0400
X-MC-Unique: -bKNzgvnPAi5AaUVVggPow-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 0853F835B42;
	Tue, 19 May 2020 22:27:25 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id B0E383A2;
	Tue, 19 May 2020 22:27:24 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 703D04ED80;
	Tue, 19 May 2020 22:27:22 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 04JMQbfk002950 for <dm-devel@listman.util.phx.redhat.com>;
	Tue, 19 May 2020 18:26:37 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 0080DAFD72; Tue, 19 May 2020 22:26:37 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast01.extmail.prod.ext.rdu2.redhat.com [10.11.55.17])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id EF377AF9A5
	for <dm-devel@redhat.com>; Tue, 19 May 2020 22:26:34 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 196368A5E92
	for <dm-devel@redhat.com>; Tue, 19 May 2020 22:26:34 +0000 (UTC)
Received: from esa5.hgst.iphmx.com (esa5.hgst.iphmx.com [216.71.153.144])
	(Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-54-NQkeNmU_OM6tFsvUl5DxuA-1; Tue, 19 May 2020 18:26:28 -0400
X-MC-Unique: NQkeNmU_OM6tFsvUl5DxuA-1
IronPort-SDR: u+PMbZXRtDYYMAPGFeqvwQJWOeB5ObyIJ63emVnsOyJ7msUiHDXfaYk6FkKdFU/SWG+afHCSdV
	AP0sFl8AKQ2Amb4ctXzvihxtOOpCPFJWbrNOS5QsbJuupMyLWUMn+8v+gtmYU/9w+/Lv3D0u4W
	PIAG7zaiRYQzSKKK5aORjZ+OVcsGu6/HDrGzS8QGRjm9C0ZrF7D6Org+JgH6TGHhJWSuSwP43h
	G+MfVsDunJP/uzDGpbI0y7z2SjeWgkrdj3For6ftn1QRGnt2MUVur/Cbajquf1pNMkbEJGnVye
	9lM=
X-IronPort-AV: E=Sophos;i="5.73,411,1583164800"; d="scan'208";a="138402572"
Received: from mail-co1nam11lp2169.outbound.protection.outlook.com (HELO
	NAM11-CO1-obe.outbound.protection.outlook.com) ([104.47.56.169])
	by ob1.hgst.iphmx.com with ESMTP; 20 May 2020 06:26:28 +0800
Received: from BY5PR04MB6900.namprd04.prod.outlook.com (2603:10b6:a03:229::20)
	by BY5PR04MB6616.namprd04.prod.outlook.com (2603:10b6:a03:1de::22)
	with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3000.26;
	Tue, 19 May 2020 22:26:26 +0000
Received: from BY5PR04MB6900.namprd04.prod.outlook.com
	([fe80::b574:3071:da2f:7606]) by
	BY5PR04MB6900.namprd04.prod.outlook.com
	([fe80::b574:3071:da2f:7606%5]) with mapi id 15.20.3021.020;
	Tue, 19 May 2020 22:26:26 +0000
From: Damien Le Moal <Damien.LeMoal@wdc.com>
To: Hannes Reinecke <hare@suse.de>, Mike Snitzer <snitzer@redhat.com>
Thread-Topic: [PATCH 3/6] dm-zoned: reclaim random zones when idle
Thread-Index: AQHWLbWP2Nu/zCoHek2WOppjUubdyQ==
Date: Tue, 19 May 2020 22:26:26 +0000
Message-ID: <BY5PR04MB690069314E49070B4F4BA663E7B90@BY5PR04MB6900.namprd04.prod.outlook.com>
References: <20200519081424.103318-1-hare@suse.de>
	<20200519081424.103318-4-hare@suse.de>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [129.253.182.57]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 4cf776b7-ac75-476f-11af-08d7fc43ab4e
x-ms-traffictypediagnostic: BY5PR04MB6616:
x-microsoft-antispam-prvs: <BY5PR04MB6616CF68086EC07DDCE5B5CFE7B90@BY5PR04MB6616.namprd04.prod.outlook.com>
wdcipoutbound: EOP-TRUE
x-ms-oob-tlc-oobclassifiers: OLM:3631;
x-forefront-prvs: 040866B734
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: Rz1eOQQRggmk68Ff//ComF6+CGrNmPzadlWUU1+qHmFVKqwd8DQ34/J/prTz25xcEK/AtPI7LPQTga4iRoeuc3rIA1Wpu/S2rz7NB+t12DalkdxKuKI4roDWA5YAx7/b6Z7uEV+cbJ5Z9i1005cBtCpUInmkae9E/nQg1WiU8fIgAOgP1baba/lEnRvOs7Hui4UWEZuskWSKhjzsDo2k00EJqxdTK3pgRQgnKH22wypkB0zhRHeJ1g91bX7YdhjmXOteOARbZsf8M4yXzUmDtnI4kFVA9GrwKkXBtuv1+yNIoL8bB39SCwq50f6NryjDNVvLqLO4Cc+Kc+/HaAN/5+e/f9Ce4K2LPv99u4yWpcRzdIftRCS+7/11RSE2T9pOykPnNvqUlRQG9rn6J3y6ylo9sR2HGzq2WupXgTOrSRvzrIuiHyJgLu5ZxhaEKmZa
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
	IPV:NLI; SFV:NSPM; H:BY5PR04MB6900.namprd04.prod.outlook.com;
	PTR:; CAT:NONE; SFTY:;
	SFS:(4636009)(346002)(366004)(396003)(376002)(39860400002)(136003)(66556008)(64756008)(66446008)(66476007)(66946007)(76116006)(478600001)(110136005)(8676002)(52536014)(4326008)(6506007)(8936002)(316002)(5660300002)(53546011)(26005)(55016002)(2906002)(7696005)(33656002)(86362001)(9686003)(186003)(71200400001);
	DIR:OUT; SFP:1102;
x-ms-exchange-antispam-messagedata: oGN/YeLRoQTQa7mi/BW8M5DOHk0aHbDjViJcsCJuq4bEtISiPoUICdvdn8qo2DhfJyZ+8j5FNFI5YNw0oFfof2j96DBbm4rKcwR+DFCh+EpKy3rD3k9xdciK05JvirjaJqnwRBtFjPUARz7jueLOex4s8Vye2E2oKMyqSJwpR3HJhoE/ZsEA5GF3M2SMwGJRoumN1xykOQC0TLhQUmtYTK5i1BsyyiQ5eKfymIXk856c0Cs7bR2X9+AHny6/pxTvYEVWWYuaQgAh8SKP4xC3l6SWw4m9uSrAjODZmgn816S8tpYtGQL4z1JiB5R6osS7uFc/PqEjeDBcQvZgAEQM3pvy5i7rghEXNfXS/N0iJwDCaxfYtjRgiQAMxQNnsxmQsOmohQ35Z6QLjlcZCGjS/88Tp2HPmESVZ4rqJe1iOBQQB9JU6bL+RjheG0C3SXq0/bkyLl0KsvmyVq960N7OlyuW1eeiN9ymtFzdA3x5+W4aJomVtqSDhixjFOOUs62B
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4cf776b7-ac75-476f-11af-08d7fc43ab4e
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 May 2020 22:26:26.1451 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: KRiMnB1h8fIca2USBdjknZBNEu6OaF2XDuR+AzKn5YgRR/OaLuM0UtNmoK0zyPcgiBu2C7nuQigHqhVfNIUekA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR04MB6616
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 04JMQbfk002950
X-loop: dm-devel@redhat.com
Cc: "dm-devel@redhat.com" <dm-devel@redhat.com>
Subject: Re: [dm-devel] [PATCH 3/6] dm-zoned: reclaim random zones when idle
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
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On 2020/05/19 17:14, Hannes Reinecke wrote:
> When the system is idle we should be starting reclaiming
> random zones, too.
> 
> Signed-off-by: Hannes Reinecke <hare@suse.de>
> ---
>  drivers/md/dm-zoned-metadata.c | 13 +++++++++----
>  drivers/md/dm-zoned-reclaim.c  | 30 +++++++++++++++++++-----------
>  drivers/md/dm-zoned.h          |  2 +-
>  3 files changed, 29 insertions(+), 16 deletions(-)
> 
> diff --git a/drivers/md/dm-zoned-metadata.c b/drivers/md/dm-zoned-metadata.c
> index c7d44686a5ea..ee613ba2e8aa 100644
> --- a/drivers/md/dm-zoned-metadata.c
> +++ b/drivers/md/dm-zoned-metadata.c
> @@ -1859,15 +1859,20 @@ static void dmz_wait_for_reclaim(struct dmz_metadata *zmd, struct dm_zone *zone)
>  /*
>   * Select a cache or random write zone for reclaim.
>   */
> -static struct dm_zone *dmz_get_rnd_zone_for_reclaim(struct dmz_metadata *zmd)
> +static struct dm_zone *dmz_get_rnd_zone_for_reclaim(struct dmz_metadata *zmd,
> +						    bool idle)
>  {
>  	struct dm_zone *dzone = NULL;
>  	struct dm_zone *zone;
>  	struct list_head *zone_list = &zmd->map_rnd_list;
>  
>  	/* If we have cache zones select from the cache zone list */
> -	if (zmd->nr_cache)
> +	if (zmd->nr_cache) {
>  		zone_list = &zmd->map_cache_list;
> +		/* Try to relaim random zones, too, when idle */
> +		if (idle && list_empty(zone_list))
> +			zone_list = &zmd->map_rnd_list;
> +	}
>  
>  	list_for_each_entry(zone, zone_list, link) {
>  		if (dmz_is_buf(zone))
> @@ -1901,7 +1906,7 @@ static struct dm_zone *dmz_get_seq_zone_for_reclaim(struct dmz_metadata *zmd)
>  /*
>   * Select a zone for reclaim.
>   */
> -struct dm_zone *dmz_get_zone_for_reclaim(struct dmz_metadata *zmd)
> +struct dm_zone *dmz_get_zone_for_reclaim(struct dmz_metadata *zmd, bool idle)
>  {
>  	struct dm_zone *zone;
>  
> @@ -1917,7 +1922,7 @@ struct dm_zone *dmz_get_zone_for_reclaim(struct dmz_metadata *zmd)
>  	if (list_empty(&zmd->reserved_seq_zones_list))
>  		zone = dmz_get_seq_zone_for_reclaim(zmd);
>  	else
> -		zone = dmz_get_rnd_zone_for_reclaim(zmd);
> +		zone = dmz_get_rnd_zone_for_reclaim(zmd, idle);
>  	dmz_unlock_map(zmd);
>  
>  	return zone;
> diff --git a/drivers/md/dm-zoned-reclaim.c b/drivers/md/dm-zoned-reclaim.c
> index 9e3760091fcf..1855c056d6a4 100644
> --- a/drivers/md/dm-zoned-reclaim.c
> +++ b/drivers/md/dm-zoned-reclaim.c
> @@ -284,7 +284,10 @@ static int dmz_reclaim_rnd_data(struct dmz_reclaim *zrc, struct dm_zone *dzone)
>  	int alloc_flags = dmz_nr_cache_zones(zmd) ?
>  		DMZ_ALLOC_RND : DMZ_ALLOC_SEQ;
>  
> -	/* Get a free sequential zone */
> +	/* Always use sequential zones to reclaim random zones */
> +	if (dmz_is_rnd(dzone))
> +		alloc_flags = DMZ_ALLOC_SEQ;
> +	/* Get a free random or sequential zone */
>  	dmz_lock_map(zmd);
>  	szone = dmz_alloc_zone(zmd, alloc_flags | DMZ_ALLOC_RECLAIM);
>  	dmz_unlock_map(zmd);
> @@ -343,6 +346,14 @@ static void dmz_reclaim_empty(struct dmz_reclaim *zrc, struct dm_zone *dzone)
>  	dmz_unlock_flush(zmd);
>  }
>  
> +/*
> + * Test if the target device is idle.
> + */
> +static inline int dmz_target_idle(struct dmz_reclaim *zrc)
> +{
> +	return time_is_before_jiffies(zrc->atime + DMZ_IDLE_PERIOD);
> +}
> +
>  /*
>   * Find a candidate zone for reclaim and process it.
>   */
> @@ -356,7 +367,7 @@ static int dmz_do_reclaim(struct dmz_reclaim *zrc)
>  	int ret;
>  
>  	/* Get a data zone */
> -	dzone = dmz_get_zone_for_reclaim(zmd);
> +	dzone = dmz_get_zone_for_reclaim(zmd, dmz_target_idle(zrc));
>  	if (!dzone)
>  		return -EBUSY;
>  
> @@ -420,14 +431,6 @@ static int dmz_do_reclaim(struct dmz_reclaim *zrc)
>  	return 0;
>  }
>  
> -/*
> - * Test if the target device is idle.
> - */
> -static inline int dmz_target_idle(struct dmz_reclaim *zrc)
> -{
> -	return time_is_before_jiffies(zrc->atime + DMZ_IDLE_PERIOD);
> -}
> -
>  static unsigned int dmz_reclaim_percentage(struct dmz_reclaim *zrc)
>  {
>  	struct dmz_metadata *zmd = zrc->metadata;
> @@ -450,8 +453,13 @@ static unsigned int dmz_reclaim_percentage(struct dmz_reclaim *zrc)
>   */
>  static bool dmz_should_reclaim(struct dmz_reclaim *zrc, unsigned int p_unmap)
>  {
> +	unsigned int nr_reclaim = dmz_nr_rnd_zones(zrc->metadata);
> +
> +	if (dmz_nr_cache_zones(zrc->metadata))
> +		nr_reclaim += dmz_nr_cache_zones(zrc->metadata);
> +
>  	/* Reclaim when idle */
> -	if (dmz_target_idle(zrc) && p_unmap < 100)
> +	if (dmz_target_idle(zrc) && nr_reclaim)
>  		return true;
>  
>  	/* If there are still plenty of cache zones, do not reclaim */
> diff --git a/drivers/md/dm-zoned.h b/drivers/md/dm-zoned.h
> index 29e01a853f84..288054dd7cf4 100644
> --- a/drivers/md/dm-zoned.h
> +++ b/drivers/md/dm-zoned.h
> @@ -240,7 +240,7 @@ static inline bool dmz_is_active(struct dm_zone *zone)
>  
>  int dmz_lock_zone_reclaim(struct dm_zone *zone);
>  void dmz_unlock_zone_reclaim(struct dm_zone *zone);
> -struct dm_zone *dmz_get_zone_for_reclaim(struct dmz_metadata *zmd);
> +struct dm_zone *dmz_get_zone_for_reclaim(struct dmz_metadata *zmd, bool idle);
>  
>  struct dm_zone *dmz_get_chunk_mapping(struct dmz_metadata *zmd,
>  				      unsigned int chunk, int op);
> 

Looks good.

Reviewed-by: Damien Le Moal <damien.lemoal@wdc.com>


-- 
Damien Le Moal
Western Digital Research



--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

