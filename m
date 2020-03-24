Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-74.mimecast.com (us-smtp-delivery-74.mimecast.com [63.128.21.74])
	by mail.lfdr.de (Postfix) with ESMTP id 61FEC1903FF
	for <lists+dm-devel@lfdr.de>; Tue, 24 Mar 2020 04:54:50 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1585022089;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 references:references:list-id:list-help:list-unsubscribe:
	 list-subscribe:list-post; bh=e0ozPy839LEHzenqwStFa/raRSD4Y36UIp/IePVSkrI=;
	b=NxzIjXan/lLY0bSyaT7KwfRkNQQzer9hrShFW21DW1DEw59E/nma5nbfGjX9pDbIs9sO3E
	JNV87Saf92uhg+TKfebo9klpyEJ5kMf0uhIgKx6d3dTr80DfAEiX7FPKi8towjNh10qXW5
	OGKKdBn+nvgonb0pOxAEOeiaFV7y0RI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-254-kF_9S6H_P7aB2YXoeBiLGg-1; Mon, 23 Mar 2020 23:54:46 -0400
X-MC-Unique: kF_9S6H_P7aB2YXoeBiLGg-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D2852DB25;
	Tue, 24 Mar 2020 03:54:40 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id A2EA95DA7B;
	Tue, 24 Mar 2020 03:54:40 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id B545E18089CE;
	Tue, 24 Mar 2020 03:54:35 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 02O3sR3m025851 for <dm-devel@listman.util.phx.redhat.com>;
	Mon, 23 Mar 2020 23:54:27 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 5C537AF7B0; Tue, 24 Mar 2020 03:54:27 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast03.extmail.prod.ext.rdu2.redhat.com [10.11.55.19])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 57AA353C8
	for <dm-devel@redhat.com>; Tue, 24 Mar 2020 03:54:24 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id C90A58FF668
	for <dm-devel@redhat.com>; Tue, 24 Mar 2020 03:54:24 +0000 (UTC)
Received: from esa5.hgst.iphmx.com (esa5.hgst.iphmx.com [216.71.153.144])
	(Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-247-5Uan0TkWO5aKvZzN3vowbA-1; Mon, 23 Mar 2020 23:54:22 -0400
X-MC-Unique: 5Uan0TkWO5aKvZzN3vowbA-1
IronPort-SDR: uXDGAMNqINOpgyYNUrHg5O6wPGe3/FK+ydklWMVwC3VFrq/ufpBEwIxsIfd4Lybh4ksnW+TRL1
	5U3nEa/DKWzVRxBysiqDKEurArf9ubhk+OfekOnMiX3irBVDGVkTBqAO967UHo+uTZLm8lvxoD
	+DDrrPOxUgYmrmvhIcL50ZGpQJolHxnGVXvDZHmPsaEhZ2DaWA4o/6+WXKYs9dygvmyHremU+K
	M86FhLeT2ysR48cTHZXIh5j6ttD+UCe6ALTCknegqV1j7y5+v3jcUVM+FSI3BMqM+1QJymlnud
	T9c=
X-IronPort-AV: E=Sophos;i="5.72,298,1580745600"; d="scan'208";a="133756738"
Received: from mail-dm6nam11lp2168.outbound.protection.outlook.com (HELO
	NAM11-DM6-obe.outbound.protection.outlook.com) ([104.47.57.168])
	by ob1.hgst.iphmx.com with ESMTP; 24 Mar 2020 11:54:20 +0800
Received: from CO2PR04MB2343.namprd04.prod.outlook.com (2603:10b6:102:12::9)
	by CO2PR04MB2135.namprd04.prod.outlook.com (2603:10b6:102:b::6) with
	Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2835.22;
	Tue, 24 Mar 2020 03:54:17 +0000
Received: from CO2PR04MB2343.namprd04.prod.outlook.com
	([fe80::c1a:6c0f:8207:580b]) by CO2PR04MB2343.namprd04.prod.outlook.com
	([fe80::c1a:6c0f:8207:580b%7]) with mapi id 15.20.2835.021;
	Tue, 24 Mar 2020 03:54:17 +0000
From: Damien Le Moal <Damien.LeMoal@wdc.com>
To: Hannes Reinecke <hare@suse.de>
Thread-Topic: [PATCH 2/2] dm-zoned: add 'status' and 'message' callbacks
Thread-Index: AQHWASRN+EEVtcKBDE65eYGek1Z9Uw==
Date: Tue, 24 Mar 2020 03:54:17 +0000
Message-ID: <CO2PR04MB23435B2F65967957A5055580E7F10@CO2PR04MB2343.namprd04.prod.outlook.com>
References: <20200323150352.107826-1-hare@suse.de>
	<20200323150352.107826-3-hare@suse.de>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [199.255.47.7]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 187db360-758c-4bfc-b77c-08d7cfa706e1
x-ms-traffictypediagnostic: CO2PR04MB2135:
x-microsoft-antispam-prvs: <CO2PR04MB21351CE02E19706348BA155BE7F10@CO2PR04MB2135.namprd04.prod.outlook.com>
wdcipoutbound: EOP-TRUE
x-ms-oob-tlc-oobclassifiers: OLM:1013;
x-forefront-prvs: 03524FBD26
x-forefront-antispam-report: SFV:NSPM;
	SFS:(10019020)(4636009)(396003)(39860400002)(136003)(346002)(376002)(366004)(186003)(33656002)(91956017)(66556008)(66446008)(52536014)(76116006)(64756008)(9686003)(66946007)(66476007)(2906002)(6916009)(7696005)(15650500001)(81166006)(86362001)(8936002)(26005)(81156014)(8676002)(54906003)(5660300002)(55016002)(4326008)(316002)(478600001)(71200400001)(6506007)(53546011);
	DIR:OUT; SFP:1102; SCL:1; SRVR:CO2PR04MB2135;
	H:CO2PR04MB2343.namprd04.prod.outlook.com; FPR:; SPF:None;
	LANG:en; PTR:InfoNoRecords;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: WyykEnnhSQnEre0FdTJuhthJ5q36YKd5gZ2cfNRGHs/qRzzp0hBfYhHkiLWhjjSAAXqO7/D63OQKvXWiqg9w8kTf8FwVCz3mapeOlSsTpWSE1r0qO5Dp6BT/XCJiOB6CH1/YlJw1MBQoYLQihX9x9B7yotKJVsJaqwkqcEZUlbWzQVfZKKxdehN0skPdD2CWfG/I95VP1TM5Aqs/wTHSpSde4rT1mIIaOuCQ46Ppyo48QvwxOq5kW1jP1y9eQhK03zRCtpSIJHgCETcj47n6KVY67SmA45acVy1vK6Ac37PBjCIViN5sSsOk4DW+IJi5I/soqv1t0iIMevESpnqzVxS+KfG3d/GBoZqN7vtAqNud/g7BmYFZvX6Vr8KYMVH3H8fy5HOrhuJYPzIuobAvwsCfMoc3GuJ1C2TMfQD5Er3JeuS9XTdht9I1pQzKf/Py
x-ms-exchange-antispam-messagedata: xECjOZg06qj7AldMFgZZ5elGYD43/hZFg3DmdhXaThZdIcFOYhHM1ovYHDpcg9qF7abBfaIwzt4+ZbLnth2kLdRi1i+1oYmFfw1TGy+eKHNfXFSIq0F7qZciVqmh1NF7mQgf29BGJLknoRUc5//BSg==
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 187db360-758c-4bfc-b77c-08d7cfa706e1
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Mar 2020 03:54:17.6908 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: NdaPvuE30YUYHG/CZ+VDavHq+zvOGO++ccXgBqFF8Cl95a5yrDIqF3QyDiOSjernG9ib6X+TEymS9txXevF99g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO2PR04MB2135
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 02O3sR3m025851
X-loop: dm-devel@redhat.com
Cc: "dm-devel@redhat.com" <dm-devel@redhat.com>,
	Johannes Thumshirn <jth@kernel.org>, Mike Snitzer <snitzer@redhat.com>
Subject: Re: [dm-devel] [PATCH 2/2] dm-zoned: add 'status' and 'message'
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On 2020/03/24 0:04, Hannes Reinecke wrote:
> Add callbacks to supply information for 'dmsetup status'
> and 'dmsetup info', and implement the message 'reclaim'
> to start the reclaim worker.

This one is nice ! Can you send it out minus the cache changes ? We can use it
with unmodified dm-zoned :)

> 
> Signed-off-by: Hannes Reinecke <hare@suse.de>
> ---
>  drivers/md/dm-zoned-metadata.c | 15 ++++++++++
>  drivers/md/dm-zoned-target.c   | 50 ++++++++++++++++++++++++++++++++++
>  drivers/md/dm-zoned.h          |  3 ++
>  3 files changed, 68 insertions(+)
> 
> diff --git a/drivers/md/dm-zoned-metadata.c b/drivers/md/dm-zoned-metadata.c
> index 41cc3a29db0b..878e152250ab 100644
> --- a/drivers/md/dm-zoned-metadata.c
> +++ b/drivers/md/dm-zoned-metadata.c
> @@ -219,6 +219,11 @@ sector_t dmz_start_block(struct dmz_metadata *zmd, struct dm_zone *zone)
>  	return zone_id << zmd->dev->zone_nr_blocks_shift;
>  }
>  
> +unsigned int dmz_nr_zones(struct dmz_metadata *zmd)
> +{
> +	return zmd->nr_zones;
> +}
> +
>  unsigned int dmz_nr_chunks(struct dmz_metadata *zmd)
>  {
>  	return zmd->nr_chunks;
> @@ -244,6 +249,16 @@ unsigned int dmz_nr_unmap_cache_zones(struct dmz_metadata *zmd)
>  	return atomic_read(&zmd->unmap_nr_cache);
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
> index 3f25953672b9..1c0368981f49 100644
> --- a/drivers/md/dm-zoned-target.c
> +++ b/drivers/md/dm-zoned-target.c
> @@ -1050,6 +1050,54 @@ static int dmz_iterate_devices(struct dm_target *ti,
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
> +		       "%u/%u cache "
> +		       "%u/%u random "
> +		       "%u/%u sequential",
> +		       dmz_nr_zones(dmz->metadata),
> +		       dmz_nr_unmap_cache_zones(dmz->metadata),
> +		       dmz_nr_cache_zones(dmz->metadata),
> +		       dmz_nr_unmap_rnd_zones(dmz->metadata),
> +		       dmz_nr_rnd_zones(dmz->metadata),
> +		       dmz_nr_unmap_seq_zones(dmz->metadata),
> +		       dmz_nr_seq_zones(dmz->metadata));
> +		break;
> +	case STATUSTYPE_TABLE:
> +		format_dev_t(buf, dmz->dev->bdev->bd_dev);
> +		DMEMIT("%s ", buf);
> +		if (dmz->cdev) {
> +			format_dev_t(buf, dmz->cdev->bdev->bd_dev);
> +			DMEMIT("%s ", buf);
> +		}
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
> @@ -1063,6 +1111,8 @@ static struct target_type dmz_type = {
>  	.postsuspend	 = dmz_suspend,
>  	.resume		 = dmz_resume,
>  	.iterate_devices = dmz_iterate_devices,
> +	.status		 = dmz_status,
> +	.message	 = dmz_message,
>  };
>  
>  static int __init dmz_init(void)
> diff --git a/drivers/md/dm-zoned.h b/drivers/md/dm-zoned.h
> index c2b6a919681a..2b3745e8f679 100644
> --- a/drivers/md/dm-zoned.h
> +++ b/drivers/md/dm-zoned.h
> @@ -213,10 +213,13 @@ void dmz_free_zone(struct dmz_metadata *zmd, struct dm_zone *zone);
>  void dmz_map_zone(struct dmz_metadata *zmd, struct dm_zone *zone,
>  		  unsigned int chunk);
>  void dmz_unmap_zone(struct dmz_metadata *zmd, struct dm_zone *zone);
> +unsigned int dmz_nr_zones(struct dmz_metadata *zmd);
>  unsigned int dmz_nr_rnd_zones(struct dmz_metadata *zmd);
>  unsigned int dmz_nr_unmap_rnd_zones(struct dmz_metadata *zmd);
>  unsigned int dmz_nr_cache_zones(struct dmz_metadata *zmd);
>  unsigned int dmz_nr_unmap_cache_zones(struct dmz_metadata *zmd);
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

