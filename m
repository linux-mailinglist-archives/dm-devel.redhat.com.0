Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
	by mail.lfdr.de (Postfix) with ESMTP id 66DF51DA492
	for <lists+dm-devel@lfdr.de>; Wed, 20 May 2020 00:29:54 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1589927393;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 references:references:list-id:list-help:list-unsubscribe:
	 list-subscribe:list-post; bh=2B1Szcnzta61SI8lsqosAu/bwh8KeDQT2UCpuMjr9P8=;
	b=c5JEp127HBDR9M2Bk4A27OtkXC4OEeqOoHoNgsnTs7WhBHgm3EvZyDKKENiGoDef9Ecmr0
	U5vdnIxg3ETtH3nR0VAGEYJDTI3hstqnJn6lonLHTWUYRSQwcjuUxyOHzMS3YY2qR5ZpFG
	21V0ek7n6CFlB7GoRYqj1/mmVBii210=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-164-MB-zXTC-PFyH4S41h6etmQ-1; Tue, 19 May 2020 18:29:50 -0400
X-MC-Unique: MB-zXTC-PFyH4S41h6etmQ-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 6617B107ACCD;
	Tue, 19 May 2020 22:29:45 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 05D782E03C;
	Tue, 19 May 2020 22:29:44 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 0BB9E1809543;
	Tue, 19 May 2020 22:29:42 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 04JMTaGg003095 for <dm-devel@listman.util.phx.redhat.com>;
	Tue, 19 May 2020 18:29:36 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 83C252029F6F; Tue, 19 May 2020 22:29:36 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast05.extmail.prod.ext.rdu2.redhat.com [10.11.55.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 7DCB22014E15
	for <dm-devel@redhat.com>; Tue, 19 May 2020 22:29:32 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 2B0CA80CDB1
	for <dm-devel@redhat.com>; Tue, 19 May 2020 22:29:32 +0000 (UTC)
Received: from esa6.hgst.iphmx.com (esa6.hgst.iphmx.com [216.71.154.45])
	(Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-69-ZdVGHFGDNHuPeXcVLD_XNQ-1; Tue, 19 May 2020 18:29:29 -0400
X-MC-Unique: ZdVGHFGDNHuPeXcVLD_XNQ-1
IronPort-SDR: ZpuI0Zdu+uZVTcBUEfs5ZhI+q3nDtHg0YgvuduUTRAcEQuemj4jwa4T74H4XdndrSoBO2TTYBF
	IUbosQAil48JI7gJBI1XhuGzExSBS3TCkckm06A0jeSvqo9hjShBvrXvuml3XIyO/9tDEXkFpa
	umfbglGDe0NSALozsLE8aH2gS8r/SzcKDjc3OZGgeksAZDf8c1UH2+zgVs3DzgwP/0vLzYQbmD
	8FEw0dFG+eaUpH/zuq3cvZV38EwD4f8gX5KyaxbHKBDy6ubauwNQQVxGwIorzn0bb7eBW8kQUv
	fFQ=
X-IronPort-AV: E=Sophos;i="5.73,411,1583164800"; d="scan'208";a="139511664"
Received: from mail-co1nam11lp2171.outbound.protection.outlook.com (HELO
	NAM11-CO1-obe.outbound.protection.outlook.com) ([104.47.56.171])
	by ob1.hgst.iphmx.com with ESMTP; 20 May 2020 06:29:28 +0800
Received: from BY5PR04MB6900.namprd04.prod.outlook.com (2603:10b6:a03:229::20)
	by BY5PR04MB6616.namprd04.prod.outlook.com (2603:10b6:a03:1de::22)
	with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3000.26;
	Tue, 19 May 2020 22:29:27 +0000
Received: from BY5PR04MB6900.namprd04.prod.outlook.com
	([fe80::b574:3071:da2f:7606]) by
	BY5PR04MB6900.namprd04.prod.outlook.com
	([fe80::b574:3071:da2f:7606%5]) with mapi id 15.20.3021.020;
	Tue, 19 May 2020 22:29:27 +0000
From: Damien Le Moal <Damien.LeMoal@wdc.com>
To: Hannes Reinecke <hare@suse.de>, Mike Snitzer <snitzer@redhat.com>
Thread-Topic: [PATCH 5/6] dm-zoned: terminate reclaim on congestion
Thread-Index: AQHWLbWPujoroCsuK06TWAPnnrOkbw==
Date: Tue, 19 May 2020 22:29:27 +0000
Message-ID: <BY5PR04MB69003CE101DCD6D994A62196E7B90@BY5PR04MB6900.namprd04.prod.outlook.com>
References: <20200519081424.103318-1-hare@suse.de>
	<20200519081424.103318-6-hare@suse.de>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [129.253.182.57]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 7295514a-b068-4a98-d7f0-08d7fc44173a
x-ms-traffictypediagnostic: BY5PR04MB6616:
x-microsoft-antispam-prvs: <BY5PR04MB66168B8C2102300B5D2C58C5E7B90@BY5PR04MB6616.namprd04.prod.outlook.com>
wdcipoutbound: EOP-TRUE
x-ms-oob-tlc-oobclassifiers: OLM:2150;
x-forefront-prvs: 040866B734
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: FFhYyAjokGM53yW12sXx1CjURpfqqOqaCJwcflNA/nXbPX/IMD/jgCp5Te6vEppO2PH0ymAvBAtYpazWzPL7YDdi8LPnl6iEZB627iayVvXvm5fJ3PArdnWptKi5nMdg9zM8XFLccjGX1+uQfqJUKSP3kt1POp4j4oUiCBcHpo90wcvS+RSThU+rtIJFxBWD8w0FwHvfsdBcZTZAh96AGzWjncVW8pFKCRI+SRzVIvXRIY2ohrCLAgbbzz/xWXdGShyP3JUhUJ5QSUeicdyGE40+mMYxt37+ArLc58MVM65teoVmvKPnQxB8WDxgnaEI2n/jqce163v6xK+mzjlU4TVjz5aCKL0k4DQ0RvDl2GrmtHPfD4nNN0jBmEGUJtk3rYqApInoPdwPHGa+ibJkZDIwDw82fJ7WYx1eNrsqkYm0NqGoZWy3ZxzRpOVIQFF+
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
	IPV:NLI; SFV:NSPM; H:BY5PR04MB6900.namprd04.prod.outlook.com;
	PTR:; CAT:NONE; SFTY:;
	SFS:(4636009)(346002)(366004)(396003)(376002)(39860400002)(136003)(66556008)(64756008)(66446008)(66476007)(66946007)(76116006)(478600001)(110136005)(8676002)(52536014)(4326008)(6506007)(8936002)(316002)(5660300002)(53546011)(26005)(55016002)(2906002)(7696005)(33656002)(86362001)(9686003)(186003)(71200400001);
	DIR:OUT; SFP:1102;
x-ms-exchange-antispam-messagedata: cxpUcu1mKpjr7EmHwBwB13GdUjeVKSfs4fS95m/DEZJYHgLtae8qiP7vVbJJgoQsjI7puqajEJIs5MDCo8hAYzaI1JbtbaKHaS/1zO35Ms3+8EP9KVswyBNnucRpPubHQ5ivwE6/K3Cx8LjLdX8GLEEm9VkrrIqcJ0kvvDfXjv7VLeZ/psQB3zCtf8VyaKaL0YVHCtXkER0hibJpJ+sonZREMAjmqshYMR4wMXCUeDRvdSpauCujOIr+1vw35aCE8U+Xn5+bRY0vib5aletZviCKcmzYbbMHl1dCHk9B3h+78pDO/4qtZvmsSOhjQEN41pJiPUWP2P1gjaGjklppwFMGoVZqN9ZquO0Pdc8fb0kNUoi0QTCf8/JOyjTEl+3xnSAhViLh4WTuKvMIOIo1WL+OIFi828uyKt5j0wHCDOKh2VKQi1UVUWblzt40npUypI0cvvnfws4tDsyvL7ThkhZ+W012QYZpBo4ZO/M3mYaHMN91BsxdD2mFHtajw8FX
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7295514a-b068-4a98-d7f0-08d7fc44173a
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 May 2020 22:29:27.1602 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: fEvjjeBcf6t/lqQ8Tjk1RGyWgY6YEQYb7VRWPbc5Qwo/Qrwun8xx5AmFLH5+hC/LskJ2sZJ1g4atm5fTn0GfjA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR04MB6616
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 04JMTaGg003095
X-loop: dm-devel@redhat.com
Cc: "dm-devel@redhat.com" <dm-devel@redhat.com>
Subject: Re: [dm-devel] [PATCH 5/6] dm-zoned: terminate reclaim on congestion
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

On 2020/05/19 17:14, Hannes Reinecke wrote:
> When dmz_get_chunk_mapping() selects a zone which is under reclaim
> we should terminating the reclaim copy process; as we're changing
> the zone itself reclaim needs to run afterwards again anyway.
> 
> Signed-off-by: Hannes Reinecke <hare@suse.de>
> ---
>  drivers/md/dm-zoned-metadata.c | 2 ++
>  drivers/md/dm-zoned-reclaim.c  | 6 ++++--
>  drivers/md/dm-zoned.h          | 3 +++
>  3 files changed, 9 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/md/dm-zoned-metadata.c b/drivers/md/dm-zoned-metadata.c
> index ee613ba2e8aa..857390030cac 100644
> --- a/drivers/md/dm-zoned-metadata.c
> +++ b/drivers/md/dm-zoned-metadata.c
> @@ -1851,7 +1851,9 @@ static void dmz_wait_for_reclaim(struct dmz_metadata *zmd, struct dm_zone *zone)
>  {
>  	dmz_unlock_map(zmd);
>  	dmz_unlock_metadata(zmd);
> +	set_bit(DMZ_RECLAIM_TERMINATE, &zone->flags);
>  	wait_on_bit_timeout(&zone->flags, DMZ_RECLAIM, TASK_UNINTERRUPTIBLE, HZ);
> +	clear_bit(DMZ_RECLAIM_TERMINATE, &zone->flags);
>  	dmz_lock_metadata(zmd);
>  	dmz_lock_map(zmd);
>  }
> diff --git a/drivers/md/dm-zoned-reclaim.c b/drivers/md/dm-zoned-reclaim.c
> index 1283405bec29..3ed88581dc48 100644
> --- a/drivers/md/dm-zoned-reclaim.c
> +++ b/drivers/md/dm-zoned-reclaim.c
> @@ -143,6 +143,9 @@ static int dmz_reclaim_copy(struct dmz_reclaim *zrc,
>  		if (dst_dev->flags & DMZ_BDEV_DYING)
>  			return -EIO;
>  
> +		if (dmz_reclaim_should_terminate(src_zone))
> +			return -EINTR;
> +
>  		/* Get a valid region from the source zone */
>  		ret = dmz_first_valid_block(zmd, src_zone, &block);
>  		if (ret <= 0)
> @@ -517,7 +520,7 @@ static void dmz_reclaim_work(struct work_struct *work)
>  		dmz_nr_rnd_zones(zmd));
>  
>  	ret = dmz_do_reclaim(zrc);
> -	if (ret) {
> +	if (ret && ret != -EINTR) {
>  		DMDEBUG("(%s): Reclaim error %d",
>  			dmz_metadata_label(zmd), ret);
>  		if (!dmz_check_dev(zmd))
> @@ -617,4 +620,3 @@ void dmz_schedule_reclaim(struct dmz_reclaim *zrc)
>  	if (dmz_should_reclaim(zrc, p_unmap))
>  		mod_delayed_work(zrc->wq, &zrc->work, 0);
>  }
> -
> diff --git a/drivers/md/dm-zoned.h b/drivers/md/dm-zoned.h
> index 288054dd7cf4..8083607b9535 100644
> --- a/drivers/md/dm-zoned.h
> +++ b/drivers/md/dm-zoned.h
> @@ -127,6 +127,7 @@ enum {
>  	/* Zone internal state */
>  	DMZ_RECLAIM,
>  	DMZ_SEQ_WRITE_ERR,
> +	DMZ_RECLAIM_TERMINATE,
>  };
>  
>  /*
> @@ -140,6 +141,8 @@ enum {
>  #define dmz_is_readonly(z)	test_bit(DMZ_READ_ONLY, &(z)->flags)
>  #define dmz_in_reclaim(z)	test_bit(DMZ_RECLAIM, &(z)->flags)
>  #define dmz_seq_write_err(z)	test_bit(DMZ_SEQ_WRITE_ERR, &(z)->flags)
> +#define dmz_reclaim_should_terminate(z) \
> +				test_bit(DMZ_RECLAIM_TERMINATE, &(z)->flags)
>  
>  #define dmz_is_meta(z)		test_bit(DMZ_META, &(z)->flags)
>  #define dmz_is_buf(z)		test_bit(DMZ_BUF, &(z)->flags)
> 

Reviewed-by: Damien Le Moal <damien.lemoal@wdc.com>

-- 
Damien Le Moal
Western Digital Research



--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

