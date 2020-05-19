Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
	by mail.lfdr.de (Postfix) with ESMTP id C169A1DA472
	for <lists+dm-devel@lfdr.de>; Wed, 20 May 2020 00:23:27 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1589927006;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 references:references:list-id:list-help:list-unsubscribe:
	 list-subscribe:list-post; bh=URVPOn+VnGd8pg5AIj3OCDngjZuk+ZBDWGi57Ia6Uec=;
	b=Fj/20rkxZtAMJ0175XGIfIl4eiNtmPyk7sPMK+9VZRoWOE4dhVJ3xstipA2dS0gI/Fhhhh
	o8G7lW9bAPkFXfJ4hsElHusD6Y57w5DhomDTRqap2sed9S+dhxsgs08qRZSTQPxnPf2jv2
	C5RqlYEZSOU+ZjRchD+2EGm7hgEEJ8A=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-178-C5QbeWIEPeKV7LfJ3QyN6A-1; Tue, 19 May 2020 18:23:24 -0400
X-MC-Unique: C5QbeWIEPeKV7LfJ3QyN6A-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A5F4664AD0;
	Tue, 19 May 2020 22:23:18 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id C46538206F;
	Tue, 19 May 2020 22:23:17 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 0F5281809547;
	Tue, 19 May 2020 22:23:15 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 04JMN9E0002790 for <dm-devel@listman.util.phx.redhat.com>;
	Tue, 19 May 2020 18:23:09 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id ACB9A215670C; Tue, 19 May 2020 22:23:09 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast01.extmail.prod.ext.rdu2.redhat.com [10.11.55.17])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id A7A7A215688E
	for <dm-devel@redhat.com>; Tue, 19 May 2020 22:23:06 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id A65C48ECB0A
	for <dm-devel@redhat.com>; Tue, 19 May 2020 22:23:06 +0000 (UTC)
Received: from esa5.hgst.iphmx.com (esa5.hgst.iphmx.com [216.71.153.144])
	(Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-466-ElESHipIP5C0oJ1Bi1NYrw-1; Tue, 19 May 2020 18:23:03 -0400
X-MC-Unique: ElESHipIP5C0oJ1Bi1NYrw-1
IronPort-SDR: GCt/wlTV2puBb+CTJbXzZkhgQbL6+ODy/JIkARFsQhwobD7undTILzZGvoHOBfxys2gsVcn4RD
	J/nXxfJNeH4pco3rziRiBwKtVSnM6/mRbL54i0bySBRo816JCo/eLGsDrWX3fEP8kezC+JJx5w
	OX0g2XwWwpP2PyqPuS3nxOwseYhNMQsWshpPhzDirTcPKbeyNNbnrNp6uCgaNMyqRp1P1TnOKi
	o6BoJaZ5BK+f2Zjxws61Lgl1+CLoKSK3oVuIqJLDV+nnC4CAr4V5ThAFlqokZCichiDYAmU7iN
	BhU=
X-IronPort-AV: E=Sophos;i="5.73,411,1583164800"; d="scan'208";a="138402437"
Received: from mail-dm6nam11lp2174.outbound.protection.outlook.com (HELO
	NAM11-DM6-obe.outbound.protection.outlook.com) ([104.47.57.174])
	by ob1.hgst.iphmx.com with ESMTP; 20 May 2020 06:23:03 +0800
Received: from BY5PR04MB6900.namprd04.prod.outlook.com (2603:10b6:a03:229::20)
	by BY5PR04MB7089.namprd04.prod.outlook.com (2603:10b6:a03:22f::21)
	with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3000.26;
	Tue, 19 May 2020 22:23:00 +0000
Received: from BY5PR04MB6900.namprd04.prod.outlook.com
	([fe80::b574:3071:da2f:7606]) by
	BY5PR04MB6900.namprd04.prod.outlook.com
	([fe80::b574:3071:da2f:7606%5]) with mapi id 15.20.3021.020;
	Tue, 19 May 2020 22:23:00 +0000
From: Damien Le Moal <Damien.LeMoal@wdc.com>
To: Hannes Reinecke <hare@suse.de>, Mike Snitzer <snitzer@redhat.com>
Thread-Topic: [PATCH 2/6] dm-zoned: separate random and cache zones
Thread-Index: AQHWLbWO/xoJWDdpMkW6/a3PQQweVw==
Date: Tue, 19 May 2020 22:23:00 +0000
Message-ID: <BY5PR04MB69002C676ED0525ACCDF69A1E7B90@BY5PR04MB6900.namprd04.prod.outlook.com>
References: <20200519081424.103318-1-hare@suse.de>
	<20200519081424.103318-3-hare@suse.de>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [129.253.182.57]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 76986462-0850-4bc0-7eb2-08d7fc4330bd
x-ms-traffictypediagnostic: BY5PR04MB7089:
x-microsoft-antispam-prvs: <BY5PR04MB708902E9FC5E06281B102398E7B90@BY5PR04MB7089.namprd04.prod.outlook.com>
wdcipoutbound: EOP-TRUE
x-ms-oob-tlc-oobclassifiers: OLM:126;
x-forefront-prvs: 040866B734
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: tV+0qBgDCvhD2+4mVNOPAOJ/gEMaWVFFGWrafGiM22lL4bkh4cysi0qlco/6DLUgNFuRq0Q/ULgt131ZgISaZZoGEblp10gCFqhMblradDbS8izXANvgEuTxD0NyUC+aCjR4dqnh/S8x1kjj72bAOIS2ublYMFd5V9tMFRzDyDABvVVyfHD99cqkDVXUmy8oqbZC3Hra9F72A0PhZiGYSBqrZMx8gXN5RUubxEozXHhXLE9KvkDehy/xCUeiGjgFpSPXsR4gv2ZvGe0nibOMNVwCr0iYNDXMLzB+kwl+IANJdsrVUg3gPMzOsDtqhhmA4iv1Ne8o57DjweQ7RySigPlGjGchE7Vv0MHpaxUYGk9BRuLvJ59kmYVi45YHV4lcFzUiYMeAfeL1lcskyvGJQh24YtD0ji+pb/bhYZxL0KrbbTrPlfjevgbqJCmFKPrJ
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
	IPV:NLI; SFV:NSPM; H:BY5PR04MB6900.namprd04.prod.outlook.com;
	PTR:; CAT:NONE; SFTY:;
	SFS:(4636009)(136003)(396003)(346002)(366004)(376002)(39850400004)(30864003)(110136005)(7696005)(478600001)(53546011)(316002)(4326008)(33656002)(26005)(2906002)(52536014)(186003)(66476007)(8936002)(71200400001)(6506007)(8676002)(5660300002)(64756008)(66446008)(9686003)(66946007)(76116006)(86362001)(66556008)(55016002)(579004);
	DIR:OUT; SFP:1102;
x-ms-exchange-antispam-messagedata: SSvairsP4M/y0lUXstU9eCI6UbjzjN3w32E8wvl5IUb/hKvXdPkoJpbEzhWTmY8ZJSOZ4/vhsBS9luebJbWTFcw0G2qmgNcG6ThAu9NR7pLDGz6NHIm+SNmsDRCQJ1JKx7Yk5Flp79LRbpJ0NvCh2L8P66eBsb6tWm0HihjX04p/atyNtP86xcksycr3aClp1+lealYm1+3F6KMgsd8Uh1mhIXVApfHL3+eY3Qmm7lZV718ZuWDcUShyrcLSdmxxmOx4N3Ne+NduCZ5EjUxwTX0NjwkVD1YRY7mkZxrw7qLo2ONw2n91cn5zc7dOoNzpxDDhMTr5ZAjpAw+5cOrYqs/qZBf+/ibkdvXTWV/OmCoTDuqH8+0JabC7IjHCnbDCT5OBj5Wboe5oAPfN/vbx0vmMyVe4qi30mwo9cE6w9VoO+yHCbDsJFGTu9E/fHvYmazAeOuid7EgEdGQZbhURhmWTA7saidQ/XvMyuQnk+TrG1u4tTDI+xtxJqp17M+a9
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 76986462-0850-4bc0-7eb2-08d7fc4330bd
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 May 2020 22:23:00.5165 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: fBc2RaPM3Kjyl+9xXn/kIPRYOqYS7HXAITTyPEb+aTS7s8cQYxbJcxnG6SLxKQBcwtOQaWt8FJTWDZ3x9njy6A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR04MB7089
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 04JMN9E0002790
X-loop: dm-devel@redhat.com
Cc: "dm-devel@redhat.com" <dm-devel@redhat.com>
Subject: Re: [dm-devel] [PATCH 2/6] dm-zoned: separate random and cache zones
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

On 2020/05/19 17:14, Hannes Reinecke wrote:
> Instead of lumping emulated zones together with random zones we
> should be handling them as separate 'cache' zones. This improves
> code readability and allows to for an easier implementation of

s/to for//

> different cache policies.
> This patch also add additional allocation flags, to separate

s/add/adds

> the type (cache, random, or sequential) from the purpose
> (eg reclaim).
> With this patch we're also switching the allocation policy to
> not use random zones as buffer zones if cache zones are present.
> This avoids a performance drop when all cache zones are used.
> 
> Signed-off-by: Hannes Reinecke <hare@suse.de>
> ---
>  drivers/md/dm-zoned-metadata.c | 123 ++++++++++++++++++++++++++++++-----------
>  drivers/md/dm-zoned-reclaim.c  |  76 +++++++++++++++----------
>  drivers/md/dm-zoned-target.c   |  19 +++++--
>  drivers/md/dm-zoned.h          |   8 ++-
>  4 files changed, 159 insertions(+), 67 deletions(-)
> 
> diff --git a/drivers/md/dm-zoned-metadata.c b/drivers/md/dm-zoned-metadata.c
> index 65e196cfb443..c7d44686a5ea 100644
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
> @@ -1647,7 +1663,9 @@ static int dmz_load_mapping(struct dmz_metadata *zmd)
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
> @@ -1664,7 +1682,7 @@ static int dmz_load_mapping(struct dmz_metadata *zmd)
>  		}
>  
>  		bzone = dmz_get(zmd, bzone_id);
> -		if (!dmz_is_rnd(bzone)) {
> +		if (!dmz_is_rnd(bzone) && !dmz_is_cache(bzone)) {
>  			dmz_zmd_err(zmd, "Chunk %u mapping: invalid buffer zone %u",
>  				    chunk, bzone_id);
>  			return -EIO;
> @@ -1676,7 +1694,10 @@ static int dmz_load_mapping(struct dmz_metadata *zmd)
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
> @@ -1693,8 +1714,12 @@ static int dmz_load_mapping(struct dmz_metadata *zmd)
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
> @@ -1707,7 +1732,10 @@ static int dmz_load_mapping(struct dmz_metadata *zmd)
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
> @@ -1751,6 +1779,9 @@ static void __dmz_lru_zone(struct dmz_metadata *zmd, struct dm_zone *zone)
>  	if (dmz_is_seq(zone)) {
>  		/* LRU rotate sequential zone */
>  		list_add_tail(&zone->link, &zmd->map_seq_list);
> +	} else if (dmz_is_cache(zone)) {
> +		/* LRU rotate cache zone */
> +		list_add_tail(&zone->link, &zmd->map_cache_list);
>  	} else {
>  		/* LRU rotate random zone */
>  		list_add_tail(&zone->link, &zmd->map_rnd_list);
> @@ -1826,17 +1857,19 @@ static void dmz_wait_for_reclaim(struct dmz_metadata *zmd, struct dm_zone *zone)
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
> @@ -1855,9 +1888,6 @@ static struct dm_zone *dmz_get_seq_zone_for_reclaim(struct dmz_metadata *zmd)
>  {
>  	struct dm_zone *zone;
>  
> -	if (list_empty(&zmd->map_seq_list))
> -		return ERR_PTR(-EBUSY);
> -
>  	list_for_each_entry(zone, &zmd->map_seq_list, link) {
>  		if (!zone->bzone)
>  			continue;
> @@ -1907,6 +1937,7 @@ struct dm_zone *dmz_get_chunk_mapping(struct dmz_metadata *zmd, unsigned int chu
>  	unsigned int dzone_id;
>  	struct dm_zone *dzone = NULL;
>  	int ret = 0;
> +	int alloc_flags = zmd->nr_cache ? DMZ_ALLOC_CACHE : DMZ_ALLOC_RND;
>  
>  	dmz_lock_map(zmd);
>  again:
> @@ -1921,7 +1952,7 @@ struct dm_zone *dmz_get_chunk_mapping(struct dmz_metadata *zmd, unsigned int chu
>  			goto out;
>  
>  		/* Allocate a random zone */
> -		dzone = dmz_alloc_zone(zmd, DMZ_ALLOC_RND);
> +		dzone = dmz_alloc_zone(zmd, alloc_flags);
>  		if (!dzone) {
>  			if (dmz_dev_is_dying(zmd)) {
>  				dzone = ERR_PTR(-EIO);
> @@ -2014,6 +2045,7 @@ struct dm_zone *dmz_get_chunk_buffer(struct dmz_metadata *zmd,
>  				     struct dm_zone *dzone)
>  {
>  	struct dm_zone *bzone;
> +	int alloc_flags = zmd->nr_cache ? DMZ_ALLOC_CACHE : DMZ_ALLOC_RND;
>  
>  	dmz_lock_map(zmd);
>  again:
> @@ -2022,7 +2054,7 @@ struct dm_zone *dmz_get_chunk_buffer(struct dmz_metadata *zmd,
>  		goto out;
>  
>  	/* Allocate a random zone */
> -	bzone = dmz_alloc_zone(zmd, DMZ_ALLOC_RND);
> +	bzone = dmz_alloc_zone(zmd, alloc_flags);
>  	if (!bzone) {
>  		if (dmz_dev_is_dying(zmd)) {
>  			bzone = ERR_PTR(-EIO);
> @@ -2039,7 +2071,10 @@ struct dm_zone *dmz_get_chunk_buffer(struct dmz_metadata *zmd,
>  	bzone->chunk = dzone->chunk;
>  	bzone->bzone = dzone;
>  	dzone->bzone = bzone;
> -	list_add_tail(&bzone->link, &zmd->map_rnd_list);
> +	if (dmz_is_cache(bzone))
> +		list_add_tail(&bzone->link, &zmd->map_cache_list);
> +	else
> +		list_add_tail(&bzone->link, &zmd->map_rnd_list);
>  out:
>  	dmz_unlock_map(zmd);
>  
> @@ -2055,31 +2090,46 @@ struct dm_zone *dmz_alloc_zone(struct dmz_metadata *zmd, unsigned long flags)
>  	struct list_head *list;
>  	struct dm_zone *zone;
>  
> -	if (flags & DMZ_ALLOC_RND)
> +	if (flags & DMZ_ALLOC_CACHE)
> +		list = &zmd->unmap_cache_list;
> +	else if (flags & DMZ_ALLOC_RND)
>  		list = &zmd->unmap_rnd_list;
>  	else
>  		list = &zmd->unmap_seq_list;
> +
>  again:
>  	if (list_empty(list)) {
>  		/*
> -		 * No free zone: if this is for reclaim, allow using the
> -		 * reserved sequential zones.
> +		 * No free zone: return NULL if this is for not reclaim.
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
> @@ -2110,7 +2160,10 @@ void dmz_free_zone(struct dmz_metadata *zmd, struct dm_zone *zone)
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
> @@ -2136,7 +2189,9 @@ void dmz_map_zone(struct dmz_metadata *zmd, struct dm_zone *dzone,
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
> @@ -2710,6 +2765,10 @@ int dmz_ctr_metadata(struct dmz_dev *dev, int num_dev,
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
> @@ -2732,7 +2791,7 @@ int dmz_ctr_metadata(struct dmz_dev *dev, int num_dev,
>  	/* Set metadata zones starting from sb_zone */
>  	for (i = 0; i < zmd->nr_meta_zones << 1; i++) {
>  		zone = dmz_get(zmd, zmd->sb[0].zone->id + i);
> -		if (!dmz_is_rnd(zone)) {
> +		if (!dmz_is_rnd(zone) && !dmz_is_cache(zone)) {
>  			dmz_zmd_err(zmd,
>  				    "metadata zone %d is not random", i);
>  			ret = -ENXIO;
> @@ -2784,6 +2843,8 @@ int dmz_ctr_metadata(struct dmz_dev *dev, int num_dev,
>  		      zmd->nr_meta_zones * 2);
>  	dmz_zmd_debug(zmd, "  %u data zones for %u chunks",
>  		      zmd->nr_data_zones, zmd->nr_chunks);
> +	dmz_zmd_debug(zmd, "    %u cache zones (%u unmapped)",
> +		      zmd->nr_cache, atomic_read(&zmd->unmap_nr_cache));
>  	dmz_zmd_debug(zmd, "    %u random zones (%u unmapped)",
>  		      zmd->nr_rnd, atomic_read(&zmd->unmap_nr_rnd));
>  	dmz_zmd_debug(zmd, "    %u sequential zones (%u unmapped)",
> diff --git a/drivers/md/dm-zoned-reclaim.c b/drivers/md/dm-zoned-reclaim.c
> index 77f02170cdd3..9e3760091fcf 100644
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
> @@ -281,17 +281,21 @@ static int dmz_reclaim_rnd_data(struct dmz_reclaim *zrc, struct dm_zone *dzone)
>  	struct dm_zone *szone = NULL;
>  	struct dmz_metadata *zmd = zrc->metadata;
>  	int ret;
> +	int alloc_flags = dmz_nr_cache_zones(zmd) ?
> +		DMZ_ALLOC_RND : DMZ_ALLOC_SEQ;
>  
>  	/* Get a free sequential zone */
>  	dmz_lock_map(zmd);
> -	szone = dmz_alloc_zone(zmd, DMZ_ALLOC_RECLAIM);
> +	szone = dmz_alloc_zone(zmd, alloc_flags | DMZ_ALLOC_RECLAIM);
>  	dmz_unlock_map(zmd);
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
> @@ -358,7 +362,7 @@ static int dmz_do_reclaim(struct dmz_reclaim *zrc)
>  
>  	start = jiffies;
>  	dev = dmz_zone_to_dev(zmd, dzone);
> -	if (dmz_is_rnd(dzone)) {
> +	if (dmz_is_cache(dzone) || dmz_is_rnd(dzone)) {
>  		if (!dmz_weight(dzone)) {
>  			/* Empty zone */
>  			dmz_reclaim_empty(zrc, dzone);
> @@ -424,29 +428,41 @@ static inline int dmz_target_idle(struct dmz_reclaim *zrc)
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
> @@ -456,14 +472,14 @@ static void dmz_reclaim_work(struct work_struct *work)
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
> @@ -474,22 +490,22 @@ static void dmz_reclaim_work(struct work_struct *work)
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
> +	DMDEBUG("(%s): Reclaim (%u): %s, %u%% free zones (%u/%u cache %u/%u random)",
>  		dmz_metadata_label(zmd),
>  		zrc->kc_throttle.throttle,
>  		(dmz_target_idle(zrc) ? "Idle" : "Busy"),
> -		p_unmap_rnd, nr_unmap_rnd, nr_rnd);
> +		p_unmap, dmz_nr_unmap_cache_zones(zmd),
> +		dmz_nr_cache_zones(zmd),
> +		dmz_nr_unmap_rnd_zones(zmd),
> +		dmz_nr_rnd_zones(zmd));
>  
>  	ret = dmz_do_reclaim(zrc);
>  	if (ret) {
> @@ -587,7 +603,9 @@ void dmz_reclaim_bio_acc(struct dmz_reclaim *zrc)
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
> index b586fc67d931..2770e293a97b 100644
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
> @@ -1065,8 +1070,10 @@ static void dmz_status(struct dm_target *ti, status_type_t type,
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
> index 4971a765be55..29e01a853f84 100644
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
> @@ -189,7 +191,9 @@ bool dmz_check_dev(struct dmz_metadata *zmd);
>  bool dmz_dev_is_dying(struct dmz_metadata *zmd);
>  
>  #define DMZ_ALLOC_RND		0x01
> -#define DMZ_ALLOC_RECLAIM	0x02
> +#define DMZ_ALLOC_CACHE		0x02
> +#define DMZ_ALLOC_SEQ		0x04
> +#define DMZ_ALLOC_RECLAIM	0x10
>  
>  struct dm_zone *dmz_alloc_zone(struct dmz_metadata *zmd, unsigned long flags);
>  void dmz_free_zone(struct dmz_metadata *zmd, struct dm_zone *zone);
> @@ -198,6 +202,8 @@ void dmz_map_zone(struct dmz_metadata *zmd, struct dm_zone *zone,
>  		  unsigned int chunk);
>  void dmz_unmap_zone(struct dmz_metadata *zmd, struct dm_zone *zone);
>  unsigned int dmz_nr_zones(struct dmz_metadata *zmd);
> +unsigned int dmz_nr_cache_zones(struct dmz_metadata *zmd);
> +unsigned int dmz_nr_unmap_cache_zones(struct dmz_metadata *zmd);
>  unsigned int dmz_nr_rnd_zones(struct dmz_metadata *zmd);
>  unsigned int dmz_nr_unmap_rnd_zones(struct dmz_metadata *zmd);
>  unsigned int dmz_nr_seq_zones(struct dmz_metadata *zmd);
> 

Except for the commit message typos, looks good.

Reviewed-by: Damien Le Moal <damien.lemoal@wdc.com>

-- 
Damien Le Moal
Western Digital Research



--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

