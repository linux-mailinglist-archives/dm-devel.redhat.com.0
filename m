Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-74.mimecast.com (us-smtp-delivery-74.mimecast.com [216.205.24.74])
	by mail.lfdr.de (Postfix) with ESMTP id CA7F6198925
	for <lists+dm-devel@lfdr.de>; Tue, 31 Mar 2020 02:57:40 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1585616259;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 references:references:list-id:list-help:list-unsubscribe:
	 list-subscribe:list-post; bh=ibfeLTbVB0rYmaxqSrP4AR658XJklpevMlnZee7jwRM=;
	b=f3rMVSDKDi8epEodz68TIMa79M+Zxt4p9K0tbUCwWl6FcCv/B0lnwUb2X+uGPci704ksCl
	5LRAjP1T1I7QDc8MsT6eLVlmzvDNfdCHHYHVFEAHEExbIawbijmLdqUa13XKbX0+gNj0TQ
	ggmuRnKab49mPKL9fOsYgIWgvG8jJA4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-35-XUnfCbmuNZm_lde-1ComtQ-1; Mon, 30 Mar 2020 20:57:37 -0400
X-MC-Unique: XUnfCbmuNZm_lde-1ComtQ-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 1CE3D8017CC;
	Tue, 31 Mar 2020 00:57:31 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id A3D9D97B12;
	Tue, 31 Mar 2020 00:57:28 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 6C5D286BE0;
	Tue, 31 Mar 2020 00:57:26 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 02V0vKmj028260 for <dm-devel@listman.util.phx.redhat.com>;
	Mon, 30 Mar 2020 20:57:20 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 8CD5B20316F1; Tue, 31 Mar 2020 00:57:20 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast03.extmail.prod.ext.rdu2.redhat.com [10.11.55.19])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 87AF820316E9
	for <dm-devel@redhat.com>; Tue, 31 Mar 2020 00:57:18 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 48E3F8FF669
	for <dm-devel@redhat.com>; Tue, 31 Mar 2020 00:57:18 +0000 (UTC)
Received: from esa4.hgst.iphmx.com (esa4.hgst.iphmx.com [216.71.154.42])
	(Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-456-7aJ5l9ynP3u2beuD16CZDg-1; Mon, 30 Mar 2020 20:57:15 -0400
X-MC-Unique: 7aJ5l9ynP3u2beuD16CZDg-1
IronPort-SDR: Tu9l1TB1mCPibxNhRwXZfRYFmf597CROJm7gieZbzba5TbyW4CEmy+27sqHa+upupPzRTW1bdc
	4xCbJgtaK9nj/R/R+lSMuPVkXgcXwyGn7C3SY1cDUPQlEA3/jYM00oWxRqMijzfxE5HGbXMHxI
	eXc0ttMy3x5VVm3qr/Ioh1t47GxW3DTW1qMg+PlP0480Lyo8xSgQiIKLIaB39HJBMg1rpQWvtj
	0c9BSiZ0b1ML0yZnsaQSR1InnGiL9TmwtWV5lgRe6GHHuG0K6Z2FO2jdorZuleE/+f1QjYWBZl
	TBQ=
X-IronPort-AV: E=Sophos;i="5.72,326,1580745600"; d="scan'208";a="133919948"
Received: from mail-dm6nam10lp2101.outbound.protection.outlook.com (HELO
	NAM10-DM6-obe.outbound.protection.outlook.com) ([104.47.58.101])
	by ob1.hgst.iphmx.com with ESMTP; 31 Mar 2020 08:57:14 +0800
Received: from CO2PR04MB2343.namprd04.prod.outlook.com (2603:10b6:102:12::9)
	by CO2PR04MB2134.namprd04.prod.outlook.com (2603:10b6:102:c::12) with
	Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2856.20;
	Tue, 31 Mar 2020 00:57:12 +0000
Received: from CO2PR04MB2343.namprd04.prod.outlook.com
	([fe80::c1a:6c0f:8207:580b]) by CO2PR04MB2343.namprd04.prod.outlook.com
	([fe80::c1a:6c0f:8207:580b%7]) with mapi id 15.20.2856.019;
	Tue, 31 Mar 2020 00:57:12 +0000
From: Damien Le Moal <Damien.LeMoal@wdc.com>
To: Hannes Reinecke <hare@suse.de>, Mike Snitzer <snitzer@redhat.com>
Thread-Topic: [PATCH 1/4] dm-zoned: store zone id within the zone structure
Thread-Index: AQHWBAd1BqJBiErRDEOTvwxS4QAuJA==
Date: Tue, 31 Mar 2020 00:57:12 +0000
Message-ID: <CO2PR04MB2343EA1C30F6ACC57B36F170E7C80@CO2PR04MB2343.namprd04.prod.outlook.com>
References: <20200327071459.67796-1-hare@suse.de>
	<20200327071459.67796-2-hare@suse.de>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [129.253.182.57]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: c4fe27f3-81b3-4051-bef1-08d7d50e72d2
x-ms-traffictypediagnostic: CO2PR04MB2134:
x-microsoft-antispam-prvs: <CO2PR04MB21343DCF6D884D9E035C43EEE7C80@CO2PR04MB2134.namprd04.prod.outlook.com>
wdcipoutbound: EOP-TRUE
x-ms-oob-tlc-oobclassifiers: OLM:7691;
x-forefront-prvs: 0359162B6D
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
	IPV:NLI; SFV:NSPM; H:CO2PR04MB2343.namprd04.prod.outlook.com;
	PTR:; CAT:NONE; SFTY:;
	SFS:(10019020)(4636009)(366004)(376002)(346002)(39860400002)(396003)(136003)(91956017)(26005)(76116006)(186003)(64756008)(66476007)(4326008)(7696005)(2906002)(110136005)(53546011)(6506007)(55016002)(8676002)(9686003)(5660300002)(54906003)(66446008)(66556008)(81166006)(52536014)(81156014)(8936002)(66946007)(478600001)(316002)(86362001)(71200400001)(33656002);
	DIR:OUT; SFP:1102;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: RDrnZIv204I4V3wTF4SPty3KnCJVAT9e2PgcUVIHv5SejNMwkvV9AqwF7ls+F3xoTHLFhvd1FC4Y63+RulbKNMqqKaqm6pw//rYHuBFDyWV+cZVRhTY8LaDieUN3MRg9wUjKhbrQMevF3Mmv2eSvDZwfY/jmPs246rluOR6DvLmVx7VJdNNgh0pMHcQS6dV+XiDNujZw8AXk3TzFQZBw2IewTww3IeJZveAzbapVZRiEQ6/K5CKYl+KORU6SkDp7L3t6ScCiW9ZT+6GvOq+PwArF4ZGouR2lQdsWUOiQjzXkufselE9ZOkgFTBmMhWzFiw9WVAFcYdvXDlNqYd7YYH13qjJ8H+KEYI7MWqJGGKj4aHoauiRzBB9BOL3jYtMcjUsNuohiOBCoZmIrxBQVNa0YiWkctpgmS6PJGZnAds8V1mwn16c9rPL8zVnUOrcD
x-ms-exchange-antispam-messagedata: ed/pHhciY5Y1kzhq0WOig5wxdujvCbphzoNfblirZ8qp2BwMuf+I7zrF570czT8gwDDS9U8DsAnSs0OywAXx+OpuK3o8RiNI6GLgAW9rQ5PwCexRfg5O5bigMDrsVdEc3Q1e84mItS9cItAD14+TXw==
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c4fe27f3-81b3-4051-bef1-08d7d50e72d2
X-MS-Exchange-CrossTenant-originalarrivaltime: 31 Mar 2020 00:57:12.8007 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: TYZWL4Yn61WHAH2EJpSdq5e5jJnGOuBGh0UqwQniaamsMcI4XiJWfiLFK9X5ZKp1JzdZT7XITKHn/oFYiv0RNg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO2PR04MB2134
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 02V0vKmj028260
X-loop: dm-devel@redhat.com
Cc: Bob Liu <bob.liu@oracle.com>, "dm-devel@redhat.com" <dm-devel@redhat.com>
Subject: Re: [dm-devel] [PATCH 1/4] dm-zoned: store zone id within the zone
	structure
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

On 2020/03/27 16:15, Hannes Reinecke wrote:
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
>  }
>  
>  sector_t dmz_start_sect(struct dmz_metadata *zmd, struct dm_zone *zone)
> @@ -1119,6 +1119,7 @@ static int dmz_init_zone(struct blk_zone *blkz, unsigned int idx, void *data)
>  
>  	INIT_LIST_HEAD(&zone->link);
>  	atomic_set(&zone->refcount, 0);
> +	zone->id = idx;

See my comment on patch 4. Allowing partial bdev mapping changes the meaning of
this ID: for a partial mapping, this is not equal to the zone number anymore. So
we should document that (in the struct declaration), and may be merge this patch
with patch 4 since they are related so closely ?

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

