Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
	by mail.lfdr.de (Postfix) with ESMTP id 93B4E1BB9B4
	for <lists+dm-devel@lfdr.de>; Tue, 28 Apr 2020 11:20:53 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1588065652;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 references:references:list-id:list-help:list-unsubscribe:
	 list-subscribe:list-post; bh=b1YJSBuDUpsna+/WWr9QxcNxL3FFJV55vqMCWPEldO0=;
	b=d/BMav6kKMNmqeNlsiy8LNK6Gvzr3cC36jKpfX3j69TkySnDs/fLX6BA6SGUqTdaOVBxGF
	nwyRApYFCD4LL3B/YNbhQh4/MmfxW+PDxUk4uU1xjC9DfYq8i25Mh/uijzUOHyVVyY40X7
	p8DLFkUuutigiAEZr50ML4twOS5zBUI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-272-5JOy0yk5NZKCmLcOMmxPhw-1; Tue, 28 Apr 2020 05:20:49 -0400
X-MC-Unique: 5JOy0yk5NZKCmLcOMmxPhw-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D3C8C80572D;
	Tue, 28 Apr 2020 09:20:41 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 4D369100EBA7;
	Tue, 28 Apr 2020 09:20:37 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 286311809542;
	Tue, 28 Apr 2020 09:20:22 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 03S9K4lR021202 for <dm-devel@listman.util.phx.redhat.com>;
	Tue, 28 Apr 2020 05:20:04 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id F25E32026D69; Tue, 28 Apr 2020 09:20:03 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast05.extmail.prod.ext.rdu2.redhat.com [10.11.55.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id ECB3E20A8DC5
	for <dm-devel@redhat.com>; Tue, 28 Apr 2020 09:20:01 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 898E580028B
	for <dm-devel@redhat.com>; Tue, 28 Apr 2020 09:20:01 +0000 (UTC)
Received: from esa1.hgst.iphmx.com (esa1.hgst.iphmx.com [68.232.141.245])
	(Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-42-uav6Cv-GPheY0Z6V_atlEQ-1; Tue, 28 Apr 2020 05:19:59 -0400
X-MC-Unique: uav6Cv-GPheY0Z6V_atlEQ-1
IronPort-SDR: oqB5cY5H/6nveGctWgUQRKp8xKlnuu21NV/CALoEV63++f7YQyOyXBYuVXvLMUF49I6EyIugLB
	QYVFZx66dhQ79AFnTI3dzB4y/78AQXAuxriVex7SFR4Avzz584Zui7zjl8lwM3d65u7T7KRLQR
	G/2kMMUBgOu28xw6SGmQlmLLymRhQH6sfTZelxmhPGhQrAaqc11uq8gm97c13MlnHnvJ9L/9U8
	JAb+q5FgfB3hyKEh3eXOWlwgbfrGzub1Zgt2VThfk88ll4XlyHpm+IEwTOQOYsiCToXQ5pWCcd
	iM4=
X-IronPort-AV: E=Sophos;i="5.73,327,1583164800"; d="scan'208";a="245112201"
Received: from mail-bn8nam11lp2168.outbound.protection.outlook.com (HELO
	NAM11-BN8-obe.outbound.protection.outlook.com) ([104.47.58.168])
	by ob1.hgst.iphmx.com with ESMTP; 28 Apr 2020 17:19:57 +0800
Received: from BY5PR04MB6900.namprd04.prod.outlook.com (2603:10b6:a03:229::20)
	by BY5PR04MB6310.namprd04.prod.outlook.com (2603:10b6:a03:1ed::23)
	with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2937.13;
	Tue, 28 Apr 2020 09:19:56 +0000
Received: from BY5PR04MB6900.namprd04.prod.outlook.com
	([fe80::b574:3071:da2f:7606]) by
	BY5PR04MB6900.namprd04.prod.outlook.com
	([fe80::b574:3071:da2f:7606%8]) with mapi id 15.20.2937.023;
	Tue, 28 Apr 2020 09:19:56 +0000
From: Damien Le Moal <Damien.LeMoal@wdc.com>
To: Hannes Reinecke <hare@suse.de>, Mike Snitzer <snitzer@redhat.com>
Thread-Topic: [PATCH 01/13] dm-zoned: add 'status' and 'message' callbacks
Thread-Index: AQHWFvu3AJjDawq40EivT8jWwL3fJg==
Date: Tue, 28 Apr 2020 09:19:56 +0000
Message-ID: <BY5PR04MB690041D65C67CF80F1CD9014E7AC0@BY5PR04MB6900.namprd04.prod.outlook.com>
References: <20200420100824.124618-1-hare@suse.de>
	<20200420100824.124618-2-hare@suse.de>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [129.253.182.57]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 1d78ea82-8faf-4bbc-4b8e-08d7eb555124
x-ms-traffictypediagnostic: BY5PR04MB6310:
x-microsoft-antispam-prvs: <BY5PR04MB631058D3931055B25CAE00AAE7AC0@BY5PR04MB6310.namprd04.prod.outlook.com>
wdcipoutbound: EOP-TRUE
x-ms-oob-tlc-oobclassifiers: OLM:883;
x-forefront-prvs: 0387D64A71
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
	IPV:NLI; SFV:NSPM; H:BY5PR04MB6900.namprd04.prod.outlook.com;
	PTR:; CAT:NONE; SFTY:;
	SFS:(4636009)(366004)(376002)(346002)(39850400004)(136003)(396003)(7696005)(186003)(316002)(53546011)(6506007)(4326008)(8936002)(66446008)(66476007)(66946007)(9686003)(76116006)(54906003)(8676002)(478600001)(81156014)(86362001)(26005)(2906002)(5660300002)(55016002)(33656002)(64756008)(110136005)(15650500001)(71200400001)(52536014)(66556008);
	DIR:OUT; SFP:1102;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: /l0nQWYdQwDYhv/TssYLjcTDsyqIGZA5raeKzDWUJh5iBDEYusNlX0F3fYGpMBcdoAbNsrnCMB+/NfO5UQRlCrWID3+khxA9rC9XSrzrg96FcFy2RP1rMU1OxQlRgjdllKktNZBZRyieT1XZM7AW9pb6xrhXqeR8DxgNX2md/StuoAzBBC/xZKHysMI0OJtm+b0UbX2/Pi0qw9DpFus32wxglKgt1A2ze51dZCbnYznqtBHPWVAiXdX1rDvSWElivXyzBFYqQyl0un0i88T/lf8oroY2+5RatjuWnxR+wSaTl30sHQ9cJc4v3sKCfIdBzMJ7DzAfTRxqSjONTI5zNcsoafi1kYRS5LWTofbi79j8HxDxsa4N+FrI8rR88WNzxjcNsVyO0qMsep2hmmepVVHb1H7k7hBEBjmHa/QDtatQ9QWCk8grkJkWvxqn+8wY
x-ms-exchange-antispam-messagedata: VDXjZDj2fkpsu5mYDO8eaL7OAPsf+oY1av7NvWBY7rwWeRohjJt/fUB2hbZX0LJLP2Ox9VdsDDVJ6M2N2p3J0bj6z46LBxDyU49DmqIYyjSFBkU6N3VkoPHKXADlHIRSH6jIEwrcqkKTQ8pngPLQESna4uH74xJyDFemNKBL25ytl6Dc0AIeE19toAnyk+4/fdEa4cPtl+4ksxzIV7QTqFLLM78xZJql54CtZ8j4zB6phcco1n1W9y3S6AVAn0LCtYlHTqew5qd1614ySGSx2cZXAd1+X+wW+O+ZYRNMEKvePnRNJFTxq2m8+wD7fHcD+fto4Fyz+F7iG+9Cgl5GrUfkGG79womxLnH4jFzuHrLIhs5Sv8zyozYK+b1hisopkasLpIBOBTKXkEzlRk3ZNgYaAyShU66kuSZAzmvpcGOEasZwcJb15IjIv9Rryrwfk+6Hx4TRTZN2RugZnj1MqcJNWBD/sqiSgfDt9HZRKo6WL5OPAsirRsZh9730m/AfsmWF+TOfvJXbjTf8BHsskU2RAkJVbA1cdvnH6k1xsyqZp7xhWibWaVhEE/u6hsYSFDPDGWhjkO8jHYeEyojcZ8U4vEP/wjmjP0sjQETxIR51XMgLmDEMx82r5uJIYP+huwSaXEKOJJwm3+PFQD0/e9Mlme3rM07CBdWN2d5WxPdvDswJ72tpnjZWxfF0bYAH4la21Vyd9d3ex1oANX0mjwnpzaafoKOqCNCAFBEYuJ7QR4c/1CN3vus4vuRwO5bFkYcdXbbAjaj/Hlz5KrTcpWKGBfEeOFXGRCe82iYEev0=
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1d78ea82-8faf-4bbc-4b8e-08d7eb555124
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Apr 2020 09:19:56.1000 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: QRP2vo8WsGCkRZ/G2LE9alS1TdEEY0ClakEyBlyy7JZ083JK2gT46Kucq+y18pQ80xPTay3MgQaGqp7lTIv9RQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR04MB6310
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 03S9K4lR021202
X-loop: dm-devel@redhat.com
Cc: Bob Liu <bob.liu@oracle.com>, "dm-devel@redhat.com" <dm-devel@redhat.com>
Subject: Re: [dm-devel] [PATCH 01/13] dm-zoned: add 'status' and 'message'
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
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On 2020/04/20 19:09, Hannes Reinecke wrote:
> Add callbacks to supply information for 'dmsetup status'
> and 'dmsetup info', and implement the message 'reclaim'
> to start the reclaim worker.
> 
> Signed-off-by: Hannes Reinecke <hare@suse.de>
> Reviewed-by: Bob Liu <bob.liu@oracle.com>
> ---
>  drivers/md/dm-zoned-metadata.c | 15 +++++++++++++++
>  drivers/md/dm-zoned-target.c   | 43 ++++++++++++++++++++++++++++++++++++++++++
>  drivers/md/dm-zoned.h          |  3 +++
>  3 files changed, 61 insertions(+)
> 
> diff --git a/drivers/md/dm-zoned-metadata.c b/drivers/md/dm-zoned-metadata.c
> index 369de15c4e80..c8787560fa9f 100644
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

Reviewed-by: Damien Le Moal <damien.lemoal@wdc.com>

-- 
Damien Le Moal
Western Digital Research



--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

