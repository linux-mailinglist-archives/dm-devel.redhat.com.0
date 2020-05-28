Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
	by mail.lfdr.de (Postfix) with ESMTP id B546A1E544E
	for <lists+dm-devel@lfdr.de>; Thu, 28 May 2020 04:59:31 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1590634770;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 references:references:list-id:list-help:list-unsubscribe:
	 list-subscribe:list-post; bh=CJrdBvDc+vBwVqN7IXVf0un01MgMNcuaHK7knQykC90=;
	b=SFvLr+z2UI7fbTV0hQJKMkEzVxl/Nxr1q6Ns/cFTKdxjWRY2NBf7+I+p83sGriPuX1x5EY
	Zp0R7QzWhGV7xEJVke+NgUGPOG9V1bcG1xP/elw+PwFYwGcO78Jii+FYJT4dCCxKwDDZh4
	fgvqOcfroFSiSlQmXN00ZX6RcPyS130=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-334-R0tTq-_IPMSoUldnEfJxIg-1; Wed, 27 May 2020 22:59:28 -0400
X-MC-Unique: R0tTq-_IPMSoUldnEfJxIg-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 50DD4107ACF2;
	Thu, 28 May 2020 02:59:23 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 2EAE85C1B0;
	Thu, 28 May 2020 02:59:23 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 82BE36B4EF;
	Thu, 28 May 2020 02:59:22 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 04S2xJss031018 for <dm-devel@listman.util.phx.redhat.com>;
	Wed, 27 May 2020 22:59:19 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 4A5472026D69; Thu, 28 May 2020 02:59:19 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast02.extmail.prod.ext.rdu2.redhat.com [10.11.55.18])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 37BE02026DFD
	for <dm-devel@redhat.com>; Thu, 28 May 2020 02:59:16 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id C2B688007A4
	for <dm-devel@redhat.com>; Thu, 28 May 2020 02:59:16 +0000 (UTC)
Received: from esa5.hgst.iphmx.com (esa5.hgst.iphmx.com [216.71.153.144])
	(Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-102-7LB7eFGmP76Fww_bqrjWNQ-1; Wed, 27 May 2020 22:59:12 -0400
X-MC-Unique: 7LB7eFGmP76Fww_bqrjWNQ-1
IronPort-SDR: Z8HgH5EW04cQQrlyLJZnSBPZRmMzg0K2TjwZy8dsWNMelIHKznLHHh+Lph0hHGeWMPRGvq6RMT
	EJUbqL9JrZyJPwcicPrUp8wr93+966yJoYEen6iItzWbT4E1Y+OY4uTL1fddF0/kqxaopcaEpq
	I1veegIn2QLmUCCLDXH3Pr7TjVHOTUHlzJwKPiktqNH7cJdWvly5Y7YTtZbbmIbMIavaPqxVkI
	UuWyu+kyxHFlyVyZax+Aef1ukqgBhW0+xX9yMo1h5ZcJgfQk5jyKlIwJ2hSAWyEDvAfQ3DELKt
	fgk=
X-IronPort-AV: E=Sophos;i="5.73,443,1583164800"; d="scan'208";a="138995561"
Received: from mail-bn8nam12lp2169.outbound.protection.outlook.com (HELO
	NAM12-BN8-obe.outbound.protection.outlook.com) ([104.47.55.169])
	by ob1.hgst.iphmx.com with ESMTP; 28 May 2020 10:59:03 +0800
Received: from CY4PR04MB3751.namprd04.prod.outlook.com (2603:10b6:903:ec::14)
	by CY4PR04MB1094.namprd04.prod.outlook.com (2603:10b6:910:52::31)
	with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3021.27;
	Thu, 28 May 2020 02:59:01 +0000
Received: from CY4PR04MB3751.namprd04.prod.outlook.com
	([fe80::c593:f271:eebe:ac7]) by CY4PR04MB3751.namprd04.prod.outlook.com
	([fe80::c593:f271:eebe:ac7%9]) with mapi id 15.20.3021.029;
	Thu, 28 May 2020 02:59:01 +0000
From: Damien Le Moal <Damien.LeMoal@wdc.com>
To: Hannes Reinecke <hare@suse.de>, Mike Snitzer <snitzer@redhat.com>
Thread-Topic: [PATCH 09/15] dm-zoned: allocate dm devices dynamically
Thread-Index: AQHWM+898hhLrdi8+E+B8q4G2jLviA==
Date: Thu, 28 May 2020 02:59:01 +0000
Message-ID: <CY4PR04MB3751E4ACF48C26D712DA020AE78E0@CY4PR04MB3751.namprd04.prod.outlook.com>
References: <20200527062225.72849-1-hare@suse.de>
	<20200527062225.72849-10-hare@suse.de>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [129.253.182.57]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: d9b1a43c-af1d-4bd5-933a-08d802b31335
x-ms-traffictypediagnostic: CY4PR04MB1094:
x-microsoft-antispam-prvs: <CY4PR04MB1094A6A2CB61A05ABD6201B0E78E0@CY4PR04MB1094.namprd04.prod.outlook.com>
wdcipoutbound: EOP-TRUE
x-ms-oob-tlc-oobclassifiers: OLM:126;
x-forefront-prvs: 0417A3FFD2
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: h4iUV5Jp86pems87+bqiaKq/jg0d3rNKkXhWh+pML4dyBpSTCnso5rzPQ1aZ7zeTTnNFcFPDsCDnAQaNwmJVPhZrsAs6cJNZI1ZHI3hEPI7BEsgKeHHf+Q6x+a7TOJj9XCF1qlOZpOFD6qR/s5NJ4/+5XcMkffxm0fMow24HOUEewxuOrZFYccMiPNo5HBHDT62693TlRiMU14sz5zT4lylqXFKwJyd29fhtiMBBcjsFnfnFJKRCuVesYEhmrCjugJ1P8pYbPx5h3BNxA8mwwFvm4B3hH738YTaMSAYS04PF1L85rLa7mzEaa97qG1tv
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
	IPV:NLI; SFV:NSPM; H:CY4PR04MB3751.namprd04.prod.outlook.com;
	PTR:; CAT:NONE; SFTY:;
	SFS:(4636009)(396003)(346002)(366004)(136003)(376002)(39860400002)(91956017)(76116006)(55016002)(52536014)(6506007)(53546011)(4326008)(9686003)(8676002)(8936002)(71200400001)(5660300002)(66946007)(7696005)(478600001)(186003)(64756008)(83380400001)(33656002)(66556008)(86362001)(110136005)(2906002)(66446008)(26005)(316002)(66476007);
	DIR:OUT; SFP:1102;
x-ms-exchange-antispam-messagedata: P87k3czJCOrRluReAXI6smGvAxSxSVQQXCowas7B0/CAPoSYIp2CTa0tv+ZNHOLmN937trtzFlRSirIrOEEePS+3LQGUMNWYBaAYL/ZjnPANPhXtBlmWEfjZf0tRKv14v4D6SFlSje7uGeOf0bjiLgOqc2y7sjMuqViROuQMGpLB3A4Hadh2+IsWgnOk9km3OAdl6BtjZAjtWtk5tWTbBjwty8MPGbDQ7SvybVaCDCmDR9lNg5rzGhtqvqdQnCNhwoUxRr2o1iGPgR/FBk9rLz9f9OLXl7TMxuvUvODLcdwORFSlHPQz0o7WVGN6XpWI+OZTNFixxqrSkJ3NnNY6y/h4H+Eu+gIBbnfKOHkeLzIu6US7z6N6oK+Y56cGS2gBBUUSI4XaBTECMA2C1n5a6Ry5gEh8cpgVMX4As42GfbyamoRfE7wes6tPuGzFTwAQhPMI54eB3RAAHP91v+TKZn+HhpuartJPp9RC6QochnWm1OBqiBn8RXa7zkWmXgQx
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d9b1a43c-af1d-4bd5-933a-08d802b31335
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 May 2020 02:59:01.7215 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: kqxFXfGNcbCVNjZlT/qZD1ypLNH6Gq1zHTBrfDvapzRHnbfisb68gmR86vJVHjquj0q/dqG+6TFMfc294OcLRg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR04MB1094
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 04S2xJss031018
X-loop: dm-devel@redhat.com
Cc: "dm-devel@redhat.com" <dm-devel@redhat.com>
Subject: Re: [dm-devel] [PATCH 09/15] dm-zoned: allocate dm devices
	dynamically
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

On 2020/05/27 15:22, Hannes Reinecke wrote:
> Allocate dm devices dynamically to allow for expansion to
> several devices.
> 
> Signed-off-by: Hannes Reinecke <hare@suse.de>
> ---
>  drivers/md/dm-zoned-target.c | 29 +++++++++++++++++++----------
>  1 file changed, 19 insertions(+), 10 deletions(-)
> 
> diff --git a/drivers/md/dm-zoned-target.c b/drivers/md/dm-zoned-target.c
> index 087dd4801663..fec1b6a9c6f1 100644
> --- a/drivers/md/dm-zoned-target.c
> +++ b/drivers/md/dm-zoned-target.c
> @@ -40,9 +40,10 @@ struct dm_chunk_work {
>   * Target descriptor.
>   */
>  struct dmz_target {
> -	struct dm_dev		*ddev[DMZ_MAX_DEVS];
> +	struct dm_dev		**ddev;
> +	unsigned int		nr_ddevs;
>  
> -	unsigned long		flags;
> +	unsigned int		flags;
>  
>  	/* Zoned block device information */
>  	struct dmz_dev		*dev;
> @@ -836,12 +837,20 @@ static int dmz_ctr(struct dm_target *ti, unsigned int argc, char **argv)
>  		ti->error = "Unable to allocate the zoned target descriptor";
>  		return -ENOMEM;
>  	}
> -	dmz->dev = kcalloc(2, sizeof(struct dmz_dev), GFP_KERNEL);
> +	dmz->dev = kcalloc(argc, sizeof(struct dmz_dev), GFP_KERNEL);
>  	if (!dmz->dev) {
>  		ti->error = "Unable to allocate the zoned device descriptors";
>  		kfree(dmz);
>  		return -ENOMEM;
>  	}
> +	dmz->ddev = kcalloc(argc, sizeof(struct dm_dev *), GFP_KERNEL);
> +	if (!dmz->ddev) {
> +		ti->error = "Unable to allocate the dm device descriptors";
> +		ret = -ENOMEM;
> +		goto err;
> +	}
> +	dmz->nr_ddevs = argc;
> +
>  	ti->private = dmz;
>  
>  	/* Get the target zoned block device */
> @@ -1048,13 +1057,13 @@ static int dmz_iterate_devices(struct dm_target *ti,
>  	struct dmz_target *dmz = ti->private;
>  	unsigned int zone_nr_sectors = dmz_zone_nr_sectors(dmz->metadata);
>  	sector_t capacity;
> -	int r;
> +	int i, r;
>  
> -	capacity = dmz->dev[0].capacity & ~(zone_nr_sectors - 1);
> -	r = fn(ti, dmz->ddev[0], 0, capacity, data);
> -	if (!r && dmz->ddev[1]) {
> -		capacity = dmz->dev[1].capacity & ~(zone_nr_sectors - 1);
> -		r = fn(ti, dmz->ddev[1], 0, capacity, data);
> +	for (i = 0; i < dmz->nr_ddevs; i++) {
> +		capacity = dmz->dev[i].capacity & ~(zone_nr_sectors - 1);
> +		r = fn(ti, dmz->ddev[i], 0, capacity, data);
> +		if (r)
> +			break;
>  	}
>  	return r;
>  }
> @@ -1083,7 +1092,7 @@ static void dmz_status(struct dm_target *ti, status_type_t type,
>  		dev = &dmz->dev[0];
>  		format_dev_t(buf, dev->bdev->bd_dev);
>  		DMEMIT("%s", buf);
> -		if (dmz->dev[1].bdev) {
> +		if (dmz->nr_ddevs > 1) {
>  			dev = &dmz->dev[1];
>  			format_dev_t(buf, dev->bdev->bd_dev);
>  			DMEMIT(" %s", buf);
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

