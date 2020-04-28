Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com [207.211.31.120])
	by mail.lfdr.de (Postfix) with ESMTP id A22211BB9F7
	for <lists+dm-devel@lfdr.de>; Tue, 28 Apr 2020 11:37:46 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1588066665;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 references:references:list-id:list-help:list-unsubscribe:
	 list-subscribe:list-post; bh=cmjCDc0l+o30gZyburmvPI4WQ+xoy9TdzG7SFQII13E=;
	b=JnMsiUpr1xEH2IOM96vTQaXmQWHQmIzr0vxJnF997YAGPZtGVYNS9CvvXLU2SYtdkk4ZQO
	ceGiywLzKWKZc/ATIIMjIeoczMXTBlwULOaGGPzYcPz3PoA05nYLSuyqC4ASk21HjmjxEY
	NIkHuXSgpSjDDU7jsZ6ZJ2ah3Jl9j6I=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-37-dd7B48l7MiC9YAGvVQwGYw-1; Tue, 28 Apr 2020 05:37:42 -0400
X-MC-Unique: dd7B48l7MiC9YAGvVQwGYw-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 833B7108BD15;
	Tue, 28 Apr 2020 09:37:36 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 35F4E5D9E2;
	Tue, 28 Apr 2020 09:37:36 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 57FAB4CA94;
	Tue, 28 Apr 2020 09:37:35 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 03S9bS6C022733 for <dm-devel@listman.util.phx.redhat.com>;
	Tue, 28 Apr 2020 05:37:28 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 9EBA9B5507; Tue, 28 Apr 2020 09:37:28 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast06.extmail.prod.ext.rdu2.redhat.com [10.11.55.22])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 99B68B5502
	for <dm-devel@redhat.com>; Tue, 28 Apr 2020 09:37:24 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id E810F1859160
	for <dm-devel@redhat.com>; Tue, 28 Apr 2020 09:37:23 +0000 (UTC)
Received: from esa5.hgst.iphmx.com (esa5.hgst.iphmx.com [216.71.153.144])
	(Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-403-Ftmd2ELlPo6wujuj_wZzfg-1; Tue, 28 Apr 2020 05:37:21 -0400
X-MC-Unique: Ftmd2ELlPo6wujuj_wZzfg-1
IronPort-SDR: v1M3LQYIe90xmB6Pueei/QVrgqQ1bGIr92IL4fsJRratesaMC3355KStEgCovJk8iAFq5rbUXG
	zJDxODmY0SB6VClVzeIkHIe45aYiTwdxrkIV8qgYwJVzRtnMfMuz1TdPy24eFZqPPMdgYY6//q
	ID5Vhx/O9H5laeTqXVTkRpV/L6fvac9YuYuNPoQyWXj5ZrqryqQbKnDgFABAsMFGotEH958lUM
	obc6SbC8hDcTk4QJrHl9dP+Zku3az6eIZ90bqjVjRp5xuGSR3JkEliRUhwSegOgW0eGw3iUVGy
	GaQ=
X-IronPort-AV: E=Sophos;i="5.73,327,1583164800"; d="scan'208";a="136641918"
Received: from mail-mw2nam12lp2044.outbound.protection.outlook.com (HELO
	NAM12-MW2-obe.outbound.protection.outlook.com) ([104.47.66.44])
	by ob1.hgst.iphmx.com with ESMTP; 28 Apr 2020 17:37:20 +0800
Received: from BY5PR04MB6900.namprd04.prod.outlook.com (2603:10b6:a03:229::20)
	by BY5PR04MB6373.namprd04.prod.outlook.com (2603:10b6:a03:1e7::7)
	with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2937.22;
	Tue, 28 Apr 2020 09:37:19 +0000
Received: from BY5PR04MB6900.namprd04.prod.outlook.com
	([fe80::b574:3071:da2f:7606]) by
	BY5PR04MB6900.namprd04.prod.outlook.com
	([fe80::b574:3071:da2f:7606%8]) with mapi id 15.20.2937.023;
	Tue, 28 Apr 2020 09:37:19 +0000
From: Damien Le Moal <Damien.LeMoal@wdc.com>
To: Hannes Reinecke <hare@suse.de>, Mike Snitzer <snitzer@redhat.com>
Thread-Topic: [PATCH 07/13] dm-zoned: Introduce dmz_dev_is_dying() and
	dmz_check_dev()
Thread-Index: AQHWFvuylGnWjkQLsEKqt8EC1cn+tQ==
Date: Tue, 28 Apr 2020 09:37:19 +0000
Message-ID: <BY5PR04MB69001736CB25D7B7DA1DEE30E7AC0@BY5PR04MB6900.namprd04.prod.outlook.com>
References: <20200420100824.124618-1-hare@suse.de>
	<20200420100824.124618-8-hare@suse.de>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [129.253.182.57]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: b7e71e68-2a20-41a6-9bbc-08d7eb57bec5
x-ms-traffictypediagnostic: BY5PR04MB6373:
x-microsoft-antispam-prvs: <BY5PR04MB6373CED76E522230715208AEE7AC0@BY5PR04MB6373.namprd04.prod.outlook.com>
wdcipoutbound: EOP-TRUE
x-ms-oob-tlc-oobclassifiers: OLM:17;
x-forefront-prvs: 0387D64A71
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
	IPV:NLI; SFV:NSPM; H:BY5PR04MB6900.namprd04.prod.outlook.com;
	PTR:; CAT:NONE; SFTY:;
	SFS:(4636009)(136003)(396003)(376002)(366004)(346002)(39850400004)(64756008)(66476007)(66446008)(66556008)(76116006)(66946007)(26005)(8936002)(8676002)(54906003)(6506007)(110136005)(316002)(33656002)(7696005)(53546011)(71200400001)(86362001)(81156014)(186003)(5660300002)(2906002)(478600001)(4326008)(52536014)(55016002)(9686003);
	DIR:OUT; SFP:1102;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: M4eMGbCSSaiDxlRJ/g+RAAaQ3SJAb4GkfsuUT+SudyobRJb8priLgiwu44TYPtO7gAn/44cblTx1h1BS58a+ujFEL+zD//oMjzZSRyJVLocWyhM0L0dthFcT61jxsc8yE4rou95Q6hOMKCl3J9H9SXIQN5n487ZhrSEUoJBVtvZVHSAmPqhvsaMyIVGnbMQ1Pdnpd5igSRPpQvKz9O5e4JxDqFLf2PAmhEXzgbu3GkHy3ogNHCKH7qUAhLkaY5kn4Z5Fs9n0Q19BaLxGLUVMXNP4AsBhYD2bW/GDbrZVm/ZbETzpf0kcodJBHhddHwnSnAx4zF7oI/wk2Iol0Opnk0fktldf7Us1kKK4O8f5KKLeMxxRTBlEnAse31zJoHtQxx3JZgghceM5Y0ZD0l1LXk26Y7J4kXxxByiHfzMALDWj3JAxjuLXKjSKTQEZ67yj
x-ms-exchange-antispam-messagedata: Lei5q5Ly0p0HWI6ewPuUpl3wjcmFVbmtyhdBGjK/49qbjOwPbgmG4IblnsmQTC/Yrveq5z2J/lvJTj1ftuFBRDlkfMUnjnMD3y8PgQRTBkbmBbS9F7m+As97OrOwN5G6fSb14C3APiJDYF1tEvsPe6chciKQ3xcdCCsQR7Z9imKnMtDZjPiNijczcquIatCVa+8B1ujzXlJTyGQehaUAAhEOU9vZ+CZyGU54Jdl2JZlAMKVVegP8zWRQ1XG4Lq3hnRjZF7iat9vPrEEvCZYSMFGhhiPNSGszcYUlrBbgSKF/jabmv6qKe+wuo0+qAkvA6Zni0RNIedXgwA5J2ak22U+ZQdtd4eyqqqVfRJ28P7DdOZa09w1cbeWQLE/b/bxy1PkXxoJO3/chKoOE7wKTDLq2H1o8PZmJ+I1g9suLYrEdukslBsqxbMZVhwj3QLdQcDb+HP/GZyNtGfSbQKGrJksob1W5sDxHyclKipn+V3XIsxchnN600tvlX4DkOehFhMT7RRvzypGLV5N9Aq8icD4+Kzg8LQ0KYzi1HHn1XuJuac58Chyp6Qd4pSnUlu2yJgB7izrnT+dvAxTxfZMu7oTJggg3u9l+dKU85G2JeTlKRlYDIPTCwuRJvw9hykdUXOlD/lUYVDgQbV0lppsfoCTHnBIVwGK855xNh295RMR9zg5Y9+K0n7y3b5M0CLMpqtXMAbdkDoVBHLS1M/uLvo4Wek9VLlRMd2S6uEKob+8tWd1Z4z8V/bKhtVN4MVwISkB97T57p0p//5+/MDXK4d56YU/3bIblqMA7xszDEi0=
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b7e71e68-2a20-41a6-9bbc-08d7eb57bec5
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Apr 2020 09:37:19.0154 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Y2qy6Ek3jF9pPkgv1TiFXgGnxy/sVVSbq7IuUXusPMOJTqjZUQqafpyXPq3/yfurUuzMESSKu1rJ3+LrFTm4CQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR04MB6373
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 03S9bS6C022733
X-loop: dm-devel@redhat.com
Cc: Bob Liu <bob.liu@oracle.com>, "dm-devel@redhat.com" <dm-devel@redhat.com>
Subject: Re: [dm-devel] [PATCH 07/13] dm-zoned: Introduce dmz_dev_is_dying()
 and dmz_check_dev()
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

On 2020/04/20 19:08, Hannes Reinecke wrote:
> Introduce accessors dmz_dev_is_dying() and dmz_check_dev() to
> avoid having to reference the devices directly.
> 
> Signed-off-by: Hannes Reinecke <hare@suse.de>
> Reviewed-by: Bob Liu <bob.liu@oracle.com>
> ---
>  drivers/md/dm-zoned-metadata.c | 14 ++++++++++++--
>  drivers/md/dm-zoned-reclaim.c  |  4 ++--
>  drivers/md/dm-zoned-target.c   |  2 +-
>  drivers/md/dm-zoned.h          |  3 +++
>  4 files changed, 18 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/md/dm-zoned-metadata.c b/drivers/md/dm-zoned-metadata.c
> index 7cda48683c0b..426af738f1ca 100644
> --- a/drivers/md/dm-zoned-metadata.c
> +++ b/drivers/md/dm-zoned-metadata.c
> @@ -267,6 +267,16 @@ const char *dmz_metadata_label(struct dmz_metadata *zmd)
>  	return (const char *)zmd->devname;
>  }
>  
> +bool dmz_check_dev(struct dmz_metadata *zmd)
> +{
> +	return dmz_check_bdev(&zmd->dev[0]);
> +}
> +
> +bool dmz_dev_is_dying(struct dmz_metadata *zmd)
> +{
> +	return dmz_bdev_is_dying(&zmd->dev[0]);
> +}
> +
>  /*
>   * Lock/unlock mapping table.
>   * The map lock also protects all the zone lists.
> @@ -1719,7 +1729,7 @@ struct dm_zone *dmz_get_chunk_mapping(struct dmz_metadata *zmd, unsigned int chu
>  		/* Allocate a random zone */
>  		dzone = dmz_alloc_zone(zmd, DMZ_ALLOC_RND);
>  		if (!dzone) {
> -			if (dmz_bdev_is_dying(zmd->dev)) {
> +			if (dmz_dev_is_dying(zmd)) {
>  				dzone = ERR_PTR(-EIO);
>  				goto out;
>  			}
> @@ -1820,7 +1830,7 @@ struct dm_zone *dmz_get_chunk_buffer(struct dmz_metadata *zmd,
>  	/* Allocate a random zone */
>  	bzone = dmz_alloc_zone(zmd, DMZ_ALLOC_RND);
>  	if (!bzone) {
> -		if (dmz_bdev_is_dying(zmd->dev)) {
> +		if (dmz_dev_is_dying(zmd)) {
>  			bzone = ERR_PTR(-EIO);
>  			goto out;
>  		}
> diff --git a/drivers/md/dm-zoned-reclaim.c b/drivers/md/dm-zoned-reclaim.c
> index 699c4145306e..5daede0daf92 100644
> --- a/drivers/md/dm-zoned-reclaim.c
> +++ b/drivers/md/dm-zoned-reclaim.c
> @@ -455,7 +455,7 @@ static void dmz_reclaim_work(struct work_struct *work)
>  	unsigned int p_unmap_rnd;
>  	int ret;
>  
> -	if (dmz_bdev_is_dying(zrc->dev))
> +	if (dmz_dev_is_dying(zmd))
>  		return;
>  
>  	if (!dmz_should_reclaim(zrc)) {
> @@ -490,7 +490,7 @@ static void dmz_reclaim_work(struct work_struct *work)
>  	if (ret) {
>  		DMDEBUG("(%s): Reclaim error %d\n",
>  			dmz_metadata_label(zmd), ret);
> -		if (!dmz_check_bdev(zrc->dev))
> +		if (!dmz_check_dev(zmd))
>  			return;
>  	}
>  
> diff --git a/drivers/md/dm-zoned-target.c b/drivers/md/dm-zoned-target.c
> index 748d4cd5d62d..15f00535060f 100644
> --- a/drivers/md/dm-zoned-target.c
> +++ b/drivers/md/dm-zoned-target.c
> @@ -632,7 +632,7 @@ static int dmz_map(struct dm_target *ti, struct bio *bio)
>  	sector_t chunk_sector;
>  	int ret;
>  
> -	if (dmz_bdev_is_dying(dmz->dev))
> +	if (dmz_dev_is_dying(zmd))
>  		return DM_MAPIO_KILL;
>  
>  	DMDEBUG("(%s): BIO op %d sector %llu + %u => chunk %llu, block %llu, %u blocks",
> diff --git a/drivers/md/dm-zoned.h b/drivers/md/dm-zoned.h
> index dd768dc60341..e0883df8a903 100644
> --- a/drivers/md/dm-zoned.h
> +++ b/drivers/md/dm-zoned.h
> @@ -181,6 +181,9 @@ sector_t dmz_start_sect(struct dmz_metadata *zmd, struct dm_zone *zone);
>  sector_t dmz_start_block(struct dmz_metadata *zmd, struct dm_zone *zone);
>  unsigned int dmz_nr_chunks(struct dmz_metadata *zmd);
>  
> +bool dmz_check_dev(struct dmz_metadata *zmd);
> +bool dmz_dev_is_dying(struct dmz_metadata *zmd);
> +
>  #define DMZ_ALLOC_RND		0x01
>  #define DMZ_ALLOC_RECLAIM	0x02
>  
> 

Reviewed-by: Damien Le Moal <damien.lemoal@wdc.com>

-- 
Damien Le Moal
Western Digital Research



--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

