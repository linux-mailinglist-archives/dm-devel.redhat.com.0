Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-delivery-1.mimecast.com [205.139.110.120])
	by mail.lfdr.de (Postfix) with ESMTP id CB44F12A5E3
	for <lists+dm-devel@lfdr.de>; Wed, 25 Dec 2019 05:34:53 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1577248492;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 references:references:list-id:list-help:list-unsubscribe:
	 list-subscribe:list-post; bh=eZGuNBt4U1xy8JLl5UjdqoWufMpWM5in3vbQxlIlh1c=;
	b=XgVf6GsUjJWMECyoQ7kV90/eYgSYbvR1XxKdFiMsQD2t51PwO69mssEsrdmneriz4Clunl
	SD6zDYW1WbJp0cT+icl15Il/fZELWvV0JOhRgzDNz4ywGomVsVaXqMxTDoaewsnLzznD3i
	+a7Rr8acNGBSxQY8nlQnElfGmLJ5imc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-418-9M0MpIGoP0qNYlvxqEXYdw-1; Tue, 24 Dec 2019 23:34:49 -0500
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 801D4184B479;
	Wed, 25 Dec 2019 04:34:40 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 1C8555D9E5;
	Wed, 25 Dec 2019 04:34:34 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 4A4BD18095FF;
	Wed, 25 Dec 2019 04:34:19 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id xBP4XvNt031767 for <dm-devel@listman.util.phx.redhat.com>;
	Tue, 24 Dec 2019 23:33:57 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 344CF2166B27; Wed, 25 Dec 2019 04:33:57 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast05.extmail.prod.ext.rdu2.redhat.com [10.11.55.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 2E2D72166B29
	for <dm-devel@redhat.com>; Wed, 25 Dec 2019 04:33:54 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 5F2128012A2
	for <dm-devel@redhat.com>; Wed, 25 Dec 2019 04:33:54 +0000 (UTC)
IronPort-SDR: xqYFrU8Diyn5zuVl6RTx1PgTSEDqd6/xXUjr9RdRDtdAuiw4ifrpF38Ra0bFwm++4b2W93edKw
	HMv0jqxVavtssqZNPdNGOvGUCln38NZKsQ7RdHWilwy1xVCh3zAQYyfZKYHYiVidg8gHYxnweX
	Rk1c4imjYddrO1sQLW8iDcMixsoRuul8zsQLiRt0JxXLXHXLujzJQgQpkVIWims6UhP7y9imyM
	QK0a45WVSWGrHKjeuwEyz/+c+NY9teEfOrcAOD0olhOQ2M6F3F0aNHB9yFeGOm7v6hSzk6u7rg
	KB8=
X-IronPort-AV: E=Sophos;i="5.69,353,1571673600"; d="scan'208";a="233778188"
Received: from esa1.hgst.iphmx.com (esa1.hgst.iphmx.com [68.232.141.245])
	(Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-44-GKNpnRCmOS-g-w0pk9tZsQ-1; Tue, 24 Dec 2019 23:33:50 -0500
Received: from mail-bn7nam10lp2107.outbound.protection.outlook.com (HELO
	NAM10-BN7-obe.outbound.protection.outlook.com) ([104.47.70.107])
	by ob1.hgst.iphmx.com with ESMTP; 25 Dec 2019 12:33:49 +0800
Received: from BYAPR04MB5816.namprd04.prod.outlook.com (20.179.59.16) by
	BYAPR04MB5047.namprd04.prod.outlook.com (52.135.235.223) with Microsoft
	SMTP
	Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	15.20.2559.15; Wed, 25 Dec 2019 04:33:47 +0000
Received: from BYAPR04MB5816.namprd04.prod.outlook.com
	([fe80::cd8e:d1de:e661:a61]) by BYAPR04MB5816.namprd04.prod.outlook.com
	([fe80::cd8e:d1de:e661:a61%5]) with mapi id 15.20.2581.007;
	Wed, 25 Dec 2019 04:33:47 +0000
From: Damien Le Moal <Damien.LeMoal@wdc.com>
To: Dmitry Fomichev <Dmitry.Fomichev@wdc.com>, "dm-devel@redhat.com"
	<dm-devel@redhat.com>, Mike Snitzer <snitzer@redhat.com>
Thread-Topic: [PATCH] dm-zoned: support zone sizes smaller than 128MiB
Thread-Index: AQHVufZIfw/ob7u0uEW9Uy3r/n27YQ==
Date: Wed, 25 Dec 2019 04:33:47 +0000
Message-ID: <BYAPR04MB58164CDACE14A503D4B6A72FE7280@BYAPR04MB5816.namprd04.prod.outlook.com>
References: <20191224010546.20532-1-dmitry.fomichev@wdc.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [199.255.47.7]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 7c33d4ff-3f39-437e-e071-08d788f3a21d
x-ms-traffictypediagnostic: BYAPR04MB5047:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <BYAPR04MB504728E63EE10DE91E1438A1E7280@BYAPR04MB5047.namprd04.prod.outlook.com>
wdcipoutbound: EOP-TRUE
x-ms-oob-tlc-oobclassifiers: OLM:3044;
x-forefront-prvs: 02622CEF0A
x-forefront-antispam-report: SFV:NSPM;
	SFS:(10019020)(4636009)(376002)(366004)(39860400002)(136003)(396003)(346002)(199004)(189003)(66556008)(64756008)(66946007)(91956017)(55016002)(9686003)(66446008)(2906002)(66476007)(5660300002)(76116006)(450100002)(71200400001)(81166006)(81156014)(8676002)(53546011)(86362001)(186003)(52536014)(26005)(33656002)(478600001)(7696005)(316002)(6506007)(110136005)(8936002);
	DIR:OUT; SFP:1102; SCL:1; SRVR:BYAPR04MB5047;
	H:BYAPR04MB5816.namprd04.prod.outlook.com; FPR:; SPF:None;
	LANG:en; PTR:InfoNoRecords; A:1; MX:1;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: umQtQ0EI5aB+aqOrzI+Eyhr+ny/Jfw6/DkaJyqGb6u+q8ndWLz2blJ9vykTXjh15SeGav58OwqKs+dLVo2L+UwoB5wbNy0tzZUv1b2sE0lXsRjfIMeaNMMhX088wAwMi0TEpYBtryUGei4hg0jMm9FnDcpkGCxgLawSryHO6rVZaDZKvZqNaRUKF0Vi/LzEr8IN9b51fcb5mN+B/yyOzwJWyI/3CNwu/2aTEzkQ9DOMoRRQPyx6vLgGV496EC3vScTiF3V1lTzrG5THTMiEj/mcAq6AsyuFT9NQs8ncmNeD2/fAqJ6b3TmQc7smi1J4o4e1m4vS6njtskAx1IfmxCyi65m7tqy0791Q5IcCBEzHMvuI3oUTCsXqnn3ltvQCR1a44k8yI5pyKMOJcBA4wXse4ul6WPraHfqukZ8Ri10bR2ixpQXxmPZZFqSrVE/Md
MIME-Version: 1.0
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7c33d4ff-3f39-437e-e071-08d788f3a21d
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Dec 2019 04:33:47.2423 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: IU8fQxFzzDP+Aut7FhZ3TKno8RJeMEW3olma9oH8/Y3IamCZCVSiEalEN87uONzKm9InAVt+NrgrZrjTr3vMpw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR04MB5047
X-MC-Unique: GKNpnRCmOS-g-w0pk9tZsQ-1
X-MC-Unique: 9M0MpIGoP0qNYlvxqEXYdw-1
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id xBP4XvNt031767
X-loop: dm-devel@redhat.com
Subject: Re: [dm-devel] [PATCH] dm-zoned: support zone sizes smaller than
	128MiB
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On 2019/12/24 10:05, Dmitry Fomichev wrote:
> dm-zoned is observed to log failed kernel assertions and not to work
> correctly when operating against a device with a zone size smaller
> than 128MiB (4K block size times 32768 bits per 4K block). The reason
> is that the bitmap size per zone is calculated as zero with such a
> small zone size. This patch fixes this problem and also makes the code
> related to zone bitmap management be able to handle per zone bitmaps
> smaller than a single block.
> 
> A dm-zoned-tools patch is required to properly format dm-zoned devices
> with zone sizes smaller than 128MiB and this patch is being posted
> separately.
> 
> Fixes: 3b1a94c88b79 ("dm zoned: drive-managed zoned block device target")
> Cc: stable@vger.kernel.org
> Signed-off-by: Dmitry Fomichev <dmitry.fomichev@wdc.com>

Looks good to me.

Reviewed-by: Damien Le Moal <damien.lemoal@wdc.com>


> ---
>  drivers/md/dm-zoned-metadata.c | 23 ++++++++++++++---------
>  1 file changed, 14 insertions(+), 9 deletions(-)
> 
> diff --git a/drivers/md/dm-zoned-metadata.c b/drivers/md/dm-zoned-metadata.c
> index 069e4675da6b..91512eb40458 100644
> --- a/drivers/md/dm-zoned-metadata.c
> +++ b/drivers/md/dm-zoned-metadata.c
> @@ -134,6 +134,7 @@ struct dmz_metadata {
>  
>  	sector_t		zone_bitmap_size;
>  	unsigned int		zone_nr_bitmap_blocks;
> +	unsigned int		zone_bits_per_mblk;
>  
>  	unsigned int		nr_bitmap_blocks;
>  	unsigned int		nr_map_blocks;
> @@ -1153,7 +1154,10 @@ static int dmz_init_zones(struct dmz_metadata *zmd)
>  
>  	/* Init */
>  	zmd->zone_bitmap_size = dev->zone_nr_blocks >> 3;
> -	zmd->zone_nr_bitmap_blocks = zmd->zone_bitmap_size >> DMZ_BLOCK_SHIFT;
> +	zmd->zone_nr_bitmap_blocks =
> +		max_t(sector_t, 1, zmd->zone_bitmap_size >> DMZ_BLOCK_SHIFT);
> +	zmd->zone_bits_per_mblk = min_t(sector_t, dev->zone_nr_blocks,
> +					DMZ_BLOCK_SIZE_BITS);
>  
>  	/* Allocate zone array */
>  	zmd->zones = kcalloc(dev->nr_zones, sizeof(struct dm_zone), GFP_KERNEL);
> @@ -1947,7 +1951,7 @@ int dmz_copy_valid_blocks(struct dmz_metadata *zmd, struct dm_zone *from_zone,
>  		dmz_release_mblock(zmd, to_mblk);
>  		dmz_release_mblock(zmd, from_mblk);
>  
> -		chunk_block += DMZ_BLOCK_SIZE_BITS;
> +		chunk_block += zmd->zone_bits_per_mblk;
>  	}
>  
>  	to_zone->weight = from_zone->weight;
> @@ -2008,7 +2012,7 @@ int dmz_validate_blocks(struct dmz_metadata *zmd, struct dm_zone *zone,
>  
>  		/* Set bits */
>  		bit = chunk_block & DMZ_BLOCK_MASK_BITS;
> -		nr_bits = min(nr_blocks, DMZ_BLOCK_SIZE_BITS - bit);
> +		nr_bits = min(nr_blocks, zmd->zone_bits_per_mblk - bit);
>  
>  		count = dmz_set_bits((unsigned long *)mblk->data, bit, nr_bits);
>  		if (count) {
> @@ -2087,7 +2091,7 @@ int dmz_invalidate_blocks(struct dmz_metadata *zmd, struct dm_zone *zone,
>  
>  		/* Clear bits */
>  		bit = chunk_block & DMZ_BLOCK_MASK_BITS;
> -		nr_bits = min(nr_blocks, DMZ_BLOCK_SIZE_BITS - bit);
> +		nr_bits = min(nr_blocks, zmd->zone_bits_per_mblk - bit);
>  
>  		count = dmz_clear_bits((unsigned long *)mblk->data,
>  				       bit, nr_bits);
> @@ -2147,6 +2151,7 @@ static int dmz_to_next_set_block(struct dmz_metadata *zmd, struct dm_zone *zone,
>  {
>  	struct dmz_mblock *mblk;
>  	unsigned int bit, set_bit, nr_bits;
> +	unsigned int zone_bits = zmd->zone_bits_per_mblk;
>  	unsigned long *bitmap;
>  	int n = 0;
>  
> @@ -2161,15 +2166,15 @@ static int dmz_to_next_set_block(struct dmz_metadata *zmd, struct dm_zone *zone,
>  		/* Get offset */
>  		bitmap = (unsigned long *) mblk->data;
>  		bit = chunk_block & DMZ_BLOCK_MASK_BITS;
> -		nr_bits = min(nr_blocks, DMZ_BLOCK_SIZE_BITS - bit);
> +		nr_bits = min(nr_blocks, zone_bits - bit);
>  		if (set)
> -			set_bit = find_next_bit(bitmap, DMZ_BLOCK_SIZE_BITS, bit);
> +			set_bit = find_next_bit(bitmap, zone_bits, bit);
>  		else
> -			set_bit = find_next_zero_bit(bitmap, DMZ_BLOCK_SIZE_BITS, bit);
> +			set_bit = find_next_zero_bit(bitmap, zone_bits, bit);
>  		dmz_release_mblock(zmd, mblk);
>  
>  		n += set_bit - bit;
> -		if (set_bit < DMZ_BLOCK_SIZE_BITS)
> +		if (set_bit < zone_bits)
>  			break;
>  
>  		nr_blocks -= nr_bits;
> @@ -2272,7 +2277,7 @@ static void dmz_get_zone_weight(struct dmz_metadata *zmd, struct dm_zone *zone)
>  		/* Count bits in this block */
>  		bitmap = mblk->data;
>  		bit = chunk_block & DMZ_BLOCK_MASK_BITS;
> -		nr_bits = min(nr_blocks, DMZ_BLOCK_SIZE_BITS - bit);
> +		nr_bits = min(nr_blocks, zmd->zone_bits_per_mblk - bit);
>  		n += dmz_count_bits(bitmap, bit, nr_bits);
>  
>  		dmz_release_mblock(zmd, mblk);
> 


-- 
Damien Le Moal
Western Digital Research



--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

