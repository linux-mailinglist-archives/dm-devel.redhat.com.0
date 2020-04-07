Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com [205.139.110.120])
	by mail.lfdr.de (Postfix) with ESMTP id 6A6781A04A3
	for <lists+dm-devel@lfdr.de>; Tue,  7 Apr 2020 03:48:35 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1586224114;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 references:references:list-id:list-help:list-unsubscribe:
	 list-subscribe:list-post; bh=V36AwfFyZd/WhY0sx1aXZ2wm/kztsvDZAuICpiMBqmI=;
	b=JQlXhtFOayKshvxB/pBaAjCQmlYxaK1d5m4MsmU9VWXoz+WV+7z9AAvn20o4DCn/9e+Xf8
	i9FxAQ6ZUxlZ5NGIJ2uqGppoJtPlHyWrcNZnuBRtyAoRTYQ+tnMqQiqFAx4hHVrWpErDND
	LEbbkAxNqaoAstXrzhdkYtx8TRGwJig=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-414-hb3d7P24PsSQFofb3UzvPQ-1; Mon, 06 Apr 2020 21:48:31 -0400
X-MC-Unique: hb3d7P24PsSQFofb3UzvPQ-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 6FC14107B0EF;
	Tue,  7 Apr 2020 01:48:21 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 71375118F3F;
	Tue,  7 Apr 2020 01:48:18 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 67A7D1809567;
	Tue,  7 Apr 2020 01:47:55 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 0371lbvG031288 for <dm-devel@listman.util.phx.redhat.com>;
	Mon, 6 Apr 2020 21:47:37 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 781E02166B2D; Tue,  7 Apr 2020 01:47:37 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast05.extmail.prod.ext.rdu2.redhat.com [10.11.55.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 717872166B2C
	for <dm-devel@redhat.com>; Tue,  7 Apr 2020 01:47:35 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 20E34800297
	for <dm-devel@redhat.com>; Tue,  7 Apr 2020 01:47:35 +0000 (UTC)
Received: from esa4.hgst.iphmx.com (esa4.hgst.iphmx.com [216.71.154.42])
	(Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-443-ukr9mbVCM_SikoiPkN9EIA-1; Mon, 06 Apr 2020 21:47:31 -0400
X-MC-Unique: ukr9mbVCM_SikoiPkN9EIA-1
IronPort-SDR: Bp5lHJLaqY8Wa8T3bmZSBxOsEF4q3173IbrXy15YBrmsNevyywK3WHjegZaWu4shkESuOp6y0Z
	5EYmvLdrCd6sGY6zj+9HHPB4FQhZdp+UzKjbzWpLXKxww24JkP+DC8/2K1a1j789977Nx8EvLj
	nAltOLaDUhW9p+aSXk1tbvaMBLxOJXy+jo9DZE7emE6JFcPEMTz9mZGLJeiKWC8m+Wf2HYf3PC
	5f4QCxMOJpO4SZpvlqnYGd9XPIHlL4BS5V6mK6rY5PKqR6Mml6qh76uvsX0wZ8JEZjxNK/bKAI
	jXw=
X-IronPort-AV: E=Sophos;i="5.72,353,1580745600"; d="scan'208";a="134731950"
Received: from mail-dm6nam10lp2109.outbound.protection.outlook.com (HELO
	NAM10-DM6-obe.outbound.protection.outlook.com) ([104.47.58.109])
	by ob1.hgst.iphmx.com with ESMTP; 07 Apr 2020 09:47:29 +0800
Received: from BY5PR04MB6900.namprd04.prod.outlook.com (2603:10b6:a03:229::20)
	by BY5PR04MB6357.namprd04.prod.outlook.com (2603:10b6:a03:1f1::14)
	with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2878.16;
	Tue, 7 Apr 2020 01:47:28 +0000
Received: from BY5PR04MB6900.namprd04.prod.outlook.com
	([fe80::d9cc:93c6:19f5:200c]) by
	BY5PR04MB6900.namprd04.prod.outlook.com
	([fe80::d9cc:93c6:19f5:200c%3]) with mapi id 15.20.2878.018;
	Tue, 7 Apr 2020 01:47:28 +0000
From: Damien Le Moal <Damien.LeMoal@wdc.com>
To: Hannes Reinecke <hare@suse.de>, Mike Snitzer <snitzer@redhat.com>
Thread-Topic: [PATCH 01/11] dm-zoned: store zone id within the zone structure
Thread-Index: AQHWDDiHfozKIoLhVEayehv52S7fcQ==
Date: Tue, 7 Apr 2020 01:47:27 +0000
Message-ID: <BY5PR04MB6900F60FCE7FB016A67370F8E7C30@BY5PR04MB6900.namprd04.prod.outlook.com>
References: <20200406143505.133271-1-hare@suse.de>
	<20200406143505.133271-2-hare@suse.de>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [129.253.182.57]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: d763d3d0-b63f-4a0f-c98f-08d7da95a0dd
x-ms-traffictypediagnostic: BY5PR04MB6357:
x-microsoft-antispam-prvs: <BY5PR04MB6357E9048DECF7D28671992EE7C30@BY5PR04MB6357.namprd04.prod.outlook.com>
wdcipoutbound: EOP-TRUE
x-ms-oob-tlc-oobclassifiers: OLM:2331;
x-forefront-prvs: 036614DD9C
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
	IPV:NLI; SFV:NSPM; H:BY5PR04MB6900.namprd04.prod.outlook.com;
	PTR:; CAT:NONE; SFTY:;
	SFS:(10019020)(4636009)(396003)(376002)(366004)(346002)(39850400004)(136003)(81156014)(7696005)(316002)(86362001)(81166006)(6506007)(8936002)(2906002)(8676002)(5660300002)(54906003)(53546011)(110136005)(71200400001)(4326008)(33656002)(76116006)(26005)(55016002)(66446008)(66476007)(64756008)(52536014)(186003)(66946007)(9686003)(478600001)(66556008);
	DIR:OUT; SFP:1102;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 1/DZn6I7ATRo1yqmBjpD9UPGayjgCuNwg7y7oLXmYVt+8SkBg6OqZSEWDub5PYLeF/Ft08c6t0e8YI9CIvuDj6t+9IDEtyIWzY43XFAw+9CD47GUDNAGo9ayyf1qrZ0rCOKrdnjmDeJk2LIGGZATjUwi3EID2oi3oroMTIYnQyBm7dPt/uZnh7O8eGLuyNdbUOxzHv84IDP6t/sZ0VhFR3R+in2A/5v1ygY5G1mODMm/L3tbzx9cr8SXWZzGBpTb+bn/aQSo0ZqlKPApLgUXDZsV6tTVR3e/j3QoWvuFj/SpG+f9wRhvUK1Bx3ytlj1WGwh4F4fYMd7UL5nSFOstAlo9KaINletPdOC7zwoij/Lg1FzKgdOcqJ/ysu3/+oZf4bFcIeVm6x/eXuQEU8To2C60OGSRNNIa7EaHCvO1T3VJm1LPnw1AgsX6UJON32Pw
x-ms-exchange-antispam-messagedata: kcGQgYpy6H/xFoInltHWIMI/2NofJnPRCYzYCHYGzPqsbUBSOkllQGJO3KZABhobumlc1NXxoGnOPTAoqHHu2hTfW7whfb/Irac7/vk2ArAbgyXvFaWALmJl79YlTsz5Ax7/pDsGcKAAsESmGm8TKg==
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d763d3d0-b63f-4a0f-c98f-08d7da95a0dd
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Apr 2020 01:47:27.9190 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: OdEbtguWYTeRrHE4GbeNtNWfJ7m6A4dpCCPpDrEdt6hzXf07bcYRw+mTzveie3uQec1oaxusWef/StETqzGaRw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR04MB6357
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 0371lbvG031288
X-loop: dm-devel@redhat.com
Cc: Bob Liu <bob.liu@oracle.com>, "dm-devel@redhat.com" <dm-devel@redhat.com>
Subject: Re: [dm-devel] [PATCH 01/11] dm-zoned: store zone id within the
	zone structure
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On 2020/04/07 2:26, Hannes Reinecke wrote:
> Instead of calculating the zone index by the offset within the
> zone array store the index within the structure itself.
> 
> Signed-off-by: Hannes Reinecke <hare@suse.de>
> ---
>  drivers/md/dm-zoned-metadata.c | 3 ++-
>  drivers/md/dm-zoned.h          | 3 +++
>  2 files changed, 5 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/md/dm-zoned-metadata.c b/drivers/md/dm-zoned-metadata.c
> index c8787560fa9f..afce594067fb 100644
> --- a/drivers/md/dm-zoned-metadata.c
> +++ b/drivers/md/dm-zoned-metadata.c
> @@ -189,7 +189,7 @@ struct dmz_metadata {
>   */
>  unsigned int dmz_id(struct dmz_metadata *zmd, struct dm_zone *zone)
>  {
> -	return ((unsigned int)(zone - zmd->zones));
> +	return zone->id;

The zmd argument is now unused, and the helper does not make much sense anymore.
Why not just drop it entirely ? Callers directly referencing the ->id field of a
zone is simple and clear.

>  }
>  
>  sector_t dmz_start_sect(struct dmz_metadata *zmd, struct dm_zone *zone)
> @@ -1119,6 +1119,7 @@ static int dmz_init_zone(struct blk_zone *blkz, unsigned int idx, void *data)
>  
>  	INIT_LIST_HEAD(&zone->link);
>  	atomic_set(&zone->refcount, 0);
> +	zone->id = idx;
>  	zone->chunk = DMZ_MAP_UNMAPPED;
>  
>  	switch (blkz->type) {
> diff --git a/drivers/md/dm-zoned.h b/drivers/md/dm-zoned.h
> index 884c0e586082..39d59898abbe 100644
> --- a/drivers/md/dm-zoned.h
> +++ b/drivers/md/dm-zoned.h
> @@ -87,6 +87,9 @@ struct dm_zone {
>  	/* Zone activation reference count */
>  	atomic_t		refcount;
>  
> +	/* Zone id */
> +	unsigned int		id;
> +
>  	/* Zone write pointer block (relative to the zone start block) */
>  	unsigned int		wp_block;
>  
> 


-- 
Damien Le Moal
Western Digital Research



--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

