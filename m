Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-delivery-1.mimecast.com [207.211.31.120])
	by mail.lfdr.de (Postfix) with ESMTP id B50D41CCFE2
	for <lists+dm-devel@lfdr.de>; Mon, 11 May 2020 04:48:48 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1589165327;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 references:references:list-id:list-help:list-unsubscribe:
	 list-subscribe:list-post; bh=OZGGWj6YyCkz9ZI3wRnyJppRswIznlQa6e13dOpu+ec=;
	b=IT4ykGWkYBAmOrVn5mFHbon2U8TiYNy5ggxsbhGHnUMoB7/y8i4NMm7HTGlFV9zELPI6iw
	1vHqkb2Mr2Mr9Xo+knW/gGs7qkUSLhxWJ6fyAlrNqw0gIYshnkCGq3UK9E67RdMjVinlxn
	G885TRaBDARfXKwElgh1vUfiB5eqKuU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-151-64Pw6ZMyO-qHJ_SraljZNQ-1; Sun, 10 May 2020 22:48:45 -0400
X-MC-Unique: 64Pw6ZMyO-qHJ_SraljZNQ-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id ECC56EC1A0;
	Mon, 11 May 2020 02:48:39 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id C1D895C1B2;
	Mon, 11 May 2020 02:48:39 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 6D34F4CAA0;
	Mon, 11 May 2020 02:48:36 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 04B2mBG2006753 for <dm-devel@listman.util.phx.redhat.com>;
	Sun, 10 May 2020 22:48:11 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 5F941951DE; Mon, 11 May 2020 02:48:11 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast03.extmail.prod.ext.rdu2.redhat.com [10.11.55.19])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 5A771951B4
	for <dm-devel@redhat.com>; Mon, 11 May 2020 02:48:09 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 5D5CD801030
	for <dm-devel@redhat.com>; Mon, 11 May 2020 02:48:09 +0000 (UTC)
Received: from esa6.hgst.iphmx.com (esa6.hgst.iphmx.com [216.71.154.45])
	(Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-245-DjFkoDHZMp2cOkyNhL9kqg-1; Sun, 10 May 2020 22:48:06 -0400
X-MC-Unique: DjFkoDHZMp2cOkyNhL9kqg-1
IronPort-SDR: GsOUSqd4VO546JQAcjl2ts4tu8EEfeosEr173sfGLIa6SWLOf/FaIGymeUeBbig/xPt+p+/HIT
	mqi44RQGXmnG7xVftMLNrO6q5iNrb955Kezl39WbKvq/yRBWJXGoHzo5hV3cYRcoUL7p5ea6Lb
	m2v9w3FMd4mI22a3Gk41eRfIk5q+WZf/n1qKk0RFsX6KOrkE2VYIpbIJnbhG/F4SNHhn8jvKSH
	59N0bu8Xnv5A7+OnCt5lka0NFmu9ygi1zN3wkXH5E9TKtWmb0bH/KLIL2MkZMJ5n3rzH+epEi4
	6ZI=
X-IronPort-AV: E=Sophos;i="5.73,378,1583164800"; d="scan'208";a="138799233"
Received: from mail-sn1nam02lp2053.outbound.protection.outlook.com (HELO
	NAM02-SN1-obe.outbound.protection.outlook.com) ([104.47.36.53])
	by ob1.hgst.iphmx.com with ESMTP; 11 May 2020 10:48:05 +0800
Received: from BY5PR04MB6900.namprd04.prod.outlook.com (2603:10b6:a03:229::20)
	by BY5PR04MB6487.namprd04.prod.outlook.com (2603:10b6:a03:1c4::24)
	with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2979.30;
	Mon, 11 May 2020 02:48:03 +0000
Received: from BY5PR04MB6900.namprd04.prod.outlook.com
	([fe80::b574:3071:da2f:7606]) by
	BY5PR04MB6900.namprd04.prod.outlook.com
	([fe80::b574:3071:da2f:7606%6]) with mapi id 15.20.2979.033;
	Mon, 11 May 2020 02:48:03 +0000
From: Damien Le Moal <Damien.LeMoal@wdc.com>
To: Hannes Reinecke <hare@suse.de>, Mike Snitzer <snitzer@redhat.com>
Thread-Topic: [PATCH 12/14] dm-zoned: Reduce logging output on startup
Thread-Index: AQHWJRedizFyiami502WP7PNZ/3ZoA==
Date: Mon, 11 May 2020 02:48:03 +0000
Message-ID: <BY5PR04MB69001396D7E9821865734BC5E7A10@BY5PR04MB6900.namprd04.prod.outlook.com>
References: <20200508090332.40716-1-hare@suse.de>
	<20200508090332.40716-13-hare@suse.de>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [129.253.182.57]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: f705c00e-8de2-468b-4f90-08d7f555ba0a
x-ms-traffictypediagnostic: BY5PR04MB6487:
x-microsoft-antispam-prvs: <BY5PR04MB6487D3B1A4CBAAEA8932C0C7E7A10@BY5PR04MB6487.namprd04.prod.outlook.com>
wdcipoutbound: EOP-TRUE
x-ms-oob-tlc-oobclassifiers: OLM:121;
x-forefront-prvs: 04004D94E2
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: LnnkDzr/xIpRNvl9Dg4QrvcUBDDphq11hliciOY6sIZ8p/CosUupepFt+2HtQ3la6R/12rbK2ScL/hOE3Q5doq8++9Y6dlIaaowBXu0FXLVQeSG/XMbbR7ERfg6qnGUPuS1/TepFSFlVKpErlRS/GtkD91vJ8mMo1mAzuFdqRnIglsk2rhqgVkQzsgULrCrwlD+5zaxHLb1bHDwiRpVnFD98PvVsCIxJ5KBHzGjYYt87wyMwj3ZsYvAcHoh4imh6tJgcJiTBkzCtOxlvOYp5m2+70CwmwXJer5QRF/GF2cgoJErQQph6iEq0gs+Cvkg0j2R1oNSlbiV+hv+SCal8D1m0zggtP+JUzGLw512jycJhpRSOFOG95AVG2bCtLzTsB8j5etyJIvfahw+57qdao9Vk8VfF2LWQOjwhwWDTEcaTqB00A7X4yJKa999UV2SlZpGRq1AjJy/IkigJ6q1/sVTPsJRBHVgsBDp7E6yKUJ0EsnBc1aogLWVVAdXZln+JL+Gm6wkV4DeXOOMijYvT9A==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
	IPV:NLI; SFV:NSPM; H:BY5PR04MB6900.namprd04.prod.outlook.com;
	PTR:; CAT:NONE; SFTY:;
	SFS:(4636009)(396003)(376002)(366004)(346002)(136003)(39860400002)(33430700001)(2906002)(8676002)(110136005)(54906003)(66946007)(66556008)(6506007)(53546011)(66446008)(66476007)(52536014)(26005)(186003)(76116006)(64756008)(316002)(8936002)(7696005)(33440700001)(55016002)(9686003)(86362001)(33656002)(4326008)(5660300002)(71200400001)(478600001);
	DIR:OUT; SFP:1102;
x-ms-exchange-antispam-messagedata: 5kVWOxlyz2uibUti8s1pAp2cJj67TSDXy8ORFpAshntRtXw3ZjML8cWwyhRT3b54xrnoUStBa3o8eWKkoxHKZ/EuB3PDNz0D3YdNicbR59Y5l83FerjqyI0V0DAZ7yLDuxmxp0np6HrKxbmTjx0M2fkFlrPYxYbedWLyIciQpKMqUtu+VjxHzawssI6AJj4JINswnWD3jOH4vaaaWj34qG2d76nuCYwnGj2OgK/iIUi9mnK1m6y1oqDFscCvl4SWdTjoSNVIyzjf8DzeE/gPapkKD0r/WsY9vB6602RDipo6X9CEWaIVUDrlzXUN+9YXnKDzK0C3we0FcgBUS0FH+McJY9XiGbLw5rdT0/E6ZtY+D5Xz+SLE4v21noxYT2yh6W9oIPOWKdso9o22787OeQ1DaQzYUEDdIQ4gFWR4fzetWaKPwYitnrWDQyJUimtr8wlfLHoBaxzM8K13E7LHULs1l3Gg3tsZpCsAbrUm7PpYbA4i+o6OkEj6j3SvW57t
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f705c00e-8de2-468b-4f90-08d7f555ba0a
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 May 2020 02:48:03.6615 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: bA0qH4G1zqGXLSJg9gDyqk9b/os+ueN4FvHQ2OuQ9PdPzgzuc+L9wVV0qTm7UuQlfD1gOTk6DaqwND/8hTVZUQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR04MB6487
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 04B2mBG2006753
X-loop: dm-devel@redhat.com
Cc: Bob Liu <bob.liu@oracle.com>, "dm-devel@redhat.com" <dm-devel@redhat.com>
Subject: Re: [dm-devel] [PATCH 12/14] dm-zoned: Reduce logging output on
	startup
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

On 2020/05/08 18:04, Hannes Reinecke wrote:
> dm-zoned is becoming quite chatty during startup; reduce the noise
> by moving some information to 'debug' level.
> 
> Suggested-by: Mike Snitzer <snitzer@redhat.com>
> Signed-off-by: Hannes Reinecke <hare@suse.de>
> ---
>  drivers/md/dm-zoned-metadata.c | 24 ++++++++++++------------
>  1 file changed, 12 insertions(+), 12 deletions(-)
> 
> diff --git a/drivers/md/dm-zoned-metadata.c b/drivers/md/dm-zoned-metadata.c
> index 77b9ea4bad74..80c0fe4c3546 100644
> --- a/drivers/md/dm-zoned-metadata.c
> +++ b/drivers/md/dm-zoned-metadata.c
> @@ -1279,8 +1279,8 @@ static int dmz_init_zones(struct dmz_metadata *zmd)
>  	if (!zmd->zones)
>  		return -ENOMEM;
>  
> -	DMINFO("(%s): Using %zu B for zone information",
> -	       zmd->devname, sizeof(struct dm_zone) * zmd->nr_zones);
> +	DMDEBUG("(%s): Using %zu B for zone information",
> +		zmd->devname, sizeof(struct dm_zone) * zmd->nr_zones);
>  
>  	/*
>  	 * Get zone information and initialize zone descriptors.  At the same
> @@ -2562,16 +2562,16 @@ int dmz_ctr_metadata(struct dmz_dev *dev, struct dmz_metadata **metadata,
>  
>  	dmz_zmd_info(zmd, "  %u zones of %llu 512-byte logical sectors",
>  		     zmd->nr_zones, (u64)zmd->zone_nr_sectors);
> -	dmz_zmd_info(zmd, "  %u metadata zones",
> -		     zmd->nr_meta_zones * 2);
> -	dmz_zmd_info(zmd, "  %u data zones for %u chunks",
> -		     zmd->nr_data_zones, zmd->nr_chunks);
> -	dmz_zmd_info(zmd, "    %u random zones (%u unmapped)",
> -		     zmd->nr_rnd, atomic_read(&zmd->unmap_nr_rnd));
> -	dmz_zmd_info(zmd, "    %u sequential zones (%u unmapped)",
> -		     zmd->nr_seq, atomic_read(&zmd->unmap_nr_seq));
> -	dmz_zmd_info(zmd, "  %u reserved sequential data zones",
> -		     zmd->nr_reserved_seq);
> +	dmz_zmd_debug(zmd, "  %u metadata zones",
> +		      zmd->nr_meta_zones * 2);
> +	dmz_zmd_debug(zmd, "  %u data zones for %u chunks",
> +		      zmd->nr_data_zones, zmd->nr_chunks);
> +	dmz_zmd_debug(zmd, "    %u random zones (%u unmapped)",
> +		      zmd->nr_rnd, atomic_read(&zmd->unmap_nr_rnd));
> +	dmz_zmd_debug(zmd, "    %u sequential zones (%u unmapped)",
> +		      zmd->nr_seq, atomic_read(&zmd->unmap_nr_seq));
> +	dmz_zmd_debug(zmd, "  %u reserved sequential data zones",
> +		      zmd->nr_reserved_seq);
>  	dmz_zmd_debug(zmd, "Format:");
>  	dmz_zmd_debug(zmd, "%u metadata blocks per set (%u max cache)",
>  		      zmd->nr_meta_blocks, zmd->max_nr_mblks);
> 

Reviewed-by: Damien Le Moal <damien.lemoal@wdc.com>

-- 
Damien Le Moal
Western Digital Research



--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

