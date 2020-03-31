Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-74.mimecast.com (us-smtp-delivery-74.mimecast.com [63.128.21.74])
	by mail.lfdr.de (Postfix) with ESMTP id 2FD821988EC
	for <lists+dm-devel@lfdr.de>; Tue, 31 Mar 2020 02:32:11 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1585614730;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 references:references:list-id:list-help:list-unsubscribe:
	 list-subscribe:list-post; bh=ySXraRSZ4RUPvcfp61Kagr+o+pI1/F3zZ814kb056QE=;
	b=f1mtzTqa4i0agYlwHADChjBmB15icMVwgu/B64WrOuqNinuq9/45w26r8jTewtEUNVq/IM
	CkFGGuE+j1WPmFjguuz81lLM+Sdl2JxjDkO2K/cjD/PbRn1+SXDzkHJ5LSNVOELwqAHbZi
	8ZJzoWOW1tzWaoWm0MnNjvH41jzLjBc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-234-gKX7ZMU_MKCt49YrdsVnbg-1; Mon, 30 Mar 2020 20:32:07 -0400
X-MC-Unique: gKX7ZMU_MKCt49YrdsVnbg-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 2A3228017CC;
	Tue, 31 Mar 2020 00:31:58 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 1A08119C58;
	Tue, 31 Mar 2020 00:31:49 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id ED1B118089C8;
	Tue, 31 Mar 2020 00:31:33 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 02V0VHp9027015 for <dm-devel@listman.util.phx.redhat.com>;
	Mon, 30 Mar 2020 20:31:17 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 5BA161000DA5; Tue, 31 Mar 2020 00:31:17 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast04.extmail.prod.ext.rdu2.redhat.com [10.11.55.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 55EEB1006B21
	for <dm-devel@redhat.com>; Tue, 31 Mar 2020 00:31:15 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 2DF0F101A55A
	for <dm-devel@redhat.com>; Tue, 31 Mar 2020 00:31:15 +0000 (UTC)
Received: from esa3.hgst.iphmx.com (esa3.hgst.iphmx.com [216.71.153.141])
	(Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-444-AYbmEnkZOOOKUTeu8yhMbQ-1; Mon, 30 Mar 2020 20:31:12 -0400
X-MC-Unique: AYbmEnkZOOOKUTeu8yhMbQ-1
IronPort-SDR: mUqR/48LlClLVk+DVvWLNMJUFnIFerrIwEJIsyJA5P8tgXy83JmOZEIs6QGCbMYg4/jtFW/f9W
	M6qOYDuEDjyBrRybV+uuCL3YzZ2z/PwWO02vjtT/a3iHd6mvRT2ICTm0d1nhxGFslHM4l32zpf
	iKvK/1m1p0T+6Insp7UvuhEq7cxoxuSyfdw3fhftBrwCYOdKvErPqY+3zn/vv3pz41TF1nVeUG
	FCbcwaNV8cGiNVf8X64oFODDG55BZJ8rCVuOGMGQU/edY+3szEOrxnJQ1LMVfcwDBwXJ0AbHc/
	XqQ=
X-IronPort-AV: E=Sophos;i="5.72,326,1580745600"; d="scan'208";a="138300418"
Received: from mail-bn8nam12lp2174.outbound.protection.outlook.com (HELO
	NAM12-BN8-obe.outbound.protection.outlook.com) ([104.47.55.174])
	by ob1.hgst.iphmx.com with ESMTP; 31 Mar 2020 08:31:11 +0800
Received: from CO2PR04MB2343.namprd04.prod.outlook.com (2603:10b6:102:12::9)
	by CO2PR04MB2247.namprd04.prod.outlook.com (2603:10b6:102:13::11) with
	Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2856.20;
	Tue, 31 Mar 2020 00:31:10 +0000
Received: from CO2PR04MB2343.namprd04.prod.outlook.com
	([fe80::c1a:6c0f:8207:580b]) by CO2PR04MB2343.namprd04.prod.outlook.com
	([fe80::c1a:6c0f:8207:580b%7]) with mapi id 15.20.2856.019;
	Tue, 31 Mar 2020 00:31:09 +0000
From: Damien Le Moal <Damien.LeMoal@wdc.com>
To: Hannes Reinecke <hare@suse.de>, Mike Snitzer <snitzer@redhat.com>
Thread-Topic: [PATCH] dm-zoned: add 'status' and 'message' callbacks
Thread-Index: AQHWBAaYHqsTsVeKQE6+tdf/igewjw==
Date: Tue, 31 Mar 2020 00:31:09 +0000
Message-ID: <CO2PR04MB23437D3AB9358726A7E858E5E7C80@CO2PR04MB2343.namprd04.prod.outlook.com>
References: <20200327070849.67694-1-hare@suse.de>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [129.253.182.57]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 6f6b6270-6933-4c1f-443c-08d7d50acf44
x-ms-traffictypediagnostic: CO2PR04MB2247:
x-microsoft-antispam-prvs: <CO2PR04MB224794A5CE8867780519AF67E7C80@CO2PR04MB2247.namprd04.prod.outlook.com>
wdcipoutbound: EOP-TRUE
x-ms-oob-tlc-oobclassifiers: OLM:883;
x-forefront-prvs: 0359162B6D
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
	IPV:NLI; SFV:NSPM; H:CO2PR04MB2343.namprd04.prod.outlook.com;
	PTR:; CAT:NONE; SFTY:;
	SFS:(10019020)(4636009)(376002)(346002)(39860400002)(366004)(396003)(136003)(53546011)(8676002)(186003)(81166006)(478600001)(6506007)(110136005)(86362001)(5660300002)(52536014)(2906002)(33656002)(91956017)(76116006)(66556008)(66476007)(71200400001)(81156014)(64756008)(66946007)(316002)(66446008)(55016002)(15650500001)(8936002)(4326008)(7696005)(26005)(9686003);
	DIR:OUT; SFP:1102;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: xjAoeez5NLhbyR0f1ixFvBHdmR5tnet/5g6Y4nfLRH6MvUV+ictwl1gIq2oXI6t5Mv7seNKe8qHYPA7cmmASrQQPcZ0V5LiHuneqXtLZWjQV1qSDcbSgKhuRKRGBT10aSCmSf0r0mlijxWfqCuOZNbaIv1PB7kAaQuGJ/oQwdSl5EHPNJnuscAUrLtV4MQOvHDDJkkBAPTUE8Qlzq4cNXocQDN+tymjzvVWeNT9VdyZP3GEERZ48qKTg1TCS/r5Dfu8xQSvvZb+4AzfTC76V68jSgWeenb/t6Mxcak35+jJsKc7Hzae7qxB6l/n52Zw1zLXQhOzygKtH2so5+y3a2UColaybr4nvkAIEaPpF3RY2zv5Oz10uvkc2NbfB/Ymes3Ha6oxBOSwLilY+7klQKEP/vtIQuvuIwKDa+ZPf+UrxOqoEaFgkrb0RITUlHF8Z
x-ms-exchange-antispam-messagedata: MF0i6PJtr+Gs1mjQIxuJwgBsIrzUWKjtaZjPEk7IVhMFbG53xu8qxWX+3ZlSWOduhyWL1PmmurWJcQBbnVGTorsVX1AAnjEINwVCB2E6b9umZFgivSVRMk3+QbuqVl9izfUQdiBVs0N1a5kUMRJdyg==
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6f6b6270-6933-4c1f-443c-08d7d50acf44
X-MS-Exchange-CrossTenant-originalarrivaltime: 31 Mar 2020 00:31:09.8651 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Or1n9xy43joNA1oKUgs5tHiSD9PNQP6LjxhfuDKx+UaQuTVzgf0CAkHI8HV0MJbUixsePjPFDwhSGZhbx3eVmA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO2PR04MB2247
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 02V0VHp9027015
X-loop: dm-devel@redhat.com
Cc: "dm-devel@redhat.com" <dm-devel@redhat.com>
Subject: Re: [dm-devel] [PATCH] dm-zoned: add 'status' and 'message'
	callbacks
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

On 2020/03/27 16:09, Hannes Reinecke wrote:
> Add callbacks to supply information for 'dmsetup status'
> and 'dmsetup info', and implement the message 'reclaim'
> to start the reclaim worker.
> 
> Signed-off-by: Hannes Reinecke <hare@suse.de>

Looks good.

Reviewed-by: Damien Le Moal <damien.lemoal@wdc.com>

> ---
>  drivers/md/dm-zoned-metadata.c | 15 +++++++++++++++
>  drivers/md/dm-zoned-target.c   | 43 ++++++++++++++++++++++++++++++++++++++++++
>  drivers/md/dm-zoned.h          |  3 +++
>  3 files changed, 61 insertions(+)
> 
> diff --git a/drivers/md/dm-zoned-metadata.c b/drivers/md/dm-zoned-metadata.c
> index 516c7b671d25..6c456b9165db 100644
> --- a/drivers/md/dm-zoned-metadata.c
> +++ b/drivers/md/dm-zoned-metadata.c
> @@ -202,6 +202,11 @@ sector_t dmz_start_block(struct dmz_metadata *zmd, struct dm_zone *zone)
>  	return (sector_t)dmz_id(zmd, zone) << zmd->dev->zone_nr_blocks_shift;
>  }
>  
> +unsigned int dmz_nr_zones(struct dmz_metadata *zmd)
> +{
> +	return zmd->dev->nr_zones;
> +}
> +
>  unsigned int dmz_nr_chunks(struct dmz_metadata *zmd)
>  {
>  	return zmd->nr_chunks;
> @@ -217,6 +222,16 @@ unsigned int dmz_nr_unmap_rnd_zones(struct dmz_metadata *zmd)
>  	return atomic_read(&zmd->unmap_nr_rnd);
>  }
>  
> +unsigned int dmz_nr_seq_zones(struct dmz_metadata *zmd)
> +{
> +	return zmd->nr_seq;
> +}
> +
> +unsigned int dmz_nr_unmap_seq_zones(struct dmz_metadata *zmd)
> +{
> +	return atomic_read(&zmd->unmap_nr_seq);
> +}
> +
>  /*
>   * Lock/unlock mapping table.
>   * The map lock also protects all the zone lists.
> diff --git a/drivers/md/dm-zoned-target.c b/drivers/md/dm-zoned-target.c
> index f4f83d39b3dc..44e30a7de8b9 100644
> --- a/drivers/md/dm-zoned-target.c
> +++ b/drivers/md/dm-zoned-target.c
> @@ -965,6 +965,47 @@ static int dmz_iterate_devices(struct dm_target *ti,
>  	return fn(ti, dmz->ddev, 0, capacity, data);
>  }
>  
> +static void dmz_status(struct dm_target *ti, status_type_t type,
> +		       unsigned int status_flags, char *result,
> +		       unsigned int maxlen)
> +{
> +	struct dmz_target *dmz = ti->private;
> +	ssize_t sz = 0;
> +	char buf[BDEVNAME_SIZE];
> +
> +	switch (type) {
> +	case STATUSTYPE_INFO:
> +		DMEMIT("%u zones "
> +		       "%u/%u random "
> +		       "%u/%u sequential",
> +		       dmz_nr_zones(dmz->metadata),
> +		       dmz_nr_unmap_rnd_zones(dmz->metadata),
> +		       dmz_nr_rnd_zones(dmz->metadata),
> +		       dmz_nr_unmap_seq_zones(dmz->metadata),
> +		       dmz_nr_seq_zones(dmz->metadata));
> +		break;
> +	case STATUSTYPE_TABLE:
> +		format_dev_t(buf, dmz->dev->bdev->bd_dev);
> +		DMEMIT("%s ", buf);
> +		break;
> +	}
> +	return;
> +}
> +
> +static int dmz_message(struct dm_target *ti, unsigned int argc, char **argv,
> +		       char *result, unsigned int maxlen)
> +{
> +	struct dmz_target *dmz = ti->private;
> +	int r = -EINVAL;
> +
> +	if (!strcasecmp(argv[0], "reclaim")) {
> +		dmz_schedule_reclaim(dmz->reclaim);
> +		r = 0;
> +	} else
> +		DMERR("unrecognized message %s", argv[0]);
> +	return r;
> +}
> +
>  static struct target_type dmz_type = {
>  	.name		 = "zoned",
>  	.version	 = {1, 1, 0},
> @@ -978,6 +1019,8 @@ static struct target_type dmz_type = {
>  	.postsuspend	 = dmz_suspend,
>  	.resume		 = dmz_resume,
>  	.iterate_devices = dmz_iterate_devices,
> +	.status		 = dmz_status,
> +	.message	 = dmz_message,
>  };
>  
>  static int __init dmz_init(void)
> diff --git a/drivers/md/dm-zoned.h b/drivers/md/dm-zoned.h
> index 5b5e493d479c..884c0e586082 100644
> --- a/drivers/md/dm-zoned.h
> +++ b/drivers/md/dm-zoned.h
> @@ -190,8 +190,11 @@ void dmz_free_zone(struct dmz_metadata *zmd, struct dm_zone *zone);
>  void dmz_map_zone(struct dmz_metadata *zmd, struct dm_zone *zone,
>  		  unsigned int chunk);
>  void dmz_unmap_zone(struct dmz_metadata *zmd, struct dm_zone *zone);
> +unsigned int dmz_nr_zones(struct dmz_metadata *zmd);
>  unsigned int dmz_nr_rnd_zones(struct dmz_metadata *zmd);
>  unsigned int dmz_nr_unmap_rnd_zones(struct dmz_metadata *zmd);
> +unsigned int dmz_nr_seq_zones(struct dmz_metadata *zmd);
> +unsigned int dmz_nr_unmap_seq_zones(struct dmz_metadata *zmd);
>  
>  /*
>   * Activate a zone (increment its reference count).
> 


-- 
Damien Le Moal
Western Digital Research



--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

