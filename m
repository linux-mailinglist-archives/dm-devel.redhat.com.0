Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
	by mail.lfdr.de (Postfix) with ESMTP id 922FF200302
	for <lists+dm-devel@lfdr.de>; Fri, 19 Jun 2020 09:53:47 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1592553226;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 references:references:list-id:list-help:list-unsubscribe:
	 list-subscribe:list-post; bh=1jP6v/T8I5dgKfcvukKJp5fAsHjC0PCXK+z8AvgPp/k=;
	b=NO3KfOkMckhJN61kD6kxYGx6vHth/CXX9nVG2F5qFvEJ4yaZ+hKF3n/KVu6TYnPi8xavKa
	LmZt/vatcUKnppSZzi3xMf1opHP78+nz/Gl3zOTo50eBW/Iteb1ZIvwE1kdqWcxYcMwIOm
	BcS9Omktft/2IU9XIW6yVu5/UtyU0Tc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-258-7bsLE1aBMAuFyG3VoT9eBA-1; Fri, 19 Jun 2020 03:53:44 -0400
X-MC-Unique: 7bsLE1aBMAuFyG3VoT9eBA-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id F16E8102;
	Fri, 19 Jun 2020 07:53:38 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id D05707CADC;
	Fri, 19 Jun 2020 07:53:38 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 30C3F1809547;
	Fri, 19 Jun 2020 07:53:38 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 05J7rYBo022619 for <dm-devel@listman.util.phx.redhat.com>;
	Fri, 19 Jun 2020 03:53:34 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 590D71000D90; Fri, 19 Jun 2020 07:53:34 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast03.extmail.prod.ext.rdu2.redhat.com [10.11.55.19])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 527A010F26E6
	for <dm-devel@redhat.com>; Fri, 19 Jun 2020 07:53:31 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 21076811E77
	for <dm-devel@redhat.com>; Fri, 19 Jun 2020 07:53:31 +0000 (UTC)
Received: from esa6.hgst.iphmx.com (esa6.hgst.iphmx.com [216.71.154.45])
	(Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-199-sm3ztbxQNF234N4hoV0gOQ-1; Fri, 19 Jun 2020 03:53:28 -0400
X-MC-Unique: sm3ztbxQNF234N4hoV0gOQ-1
IronPort-SDR: jUzS1eR7Faww8VODRf9cfqU1MZ5R0ZQrsgTHEyhf2wvMwAFVxkjRU5f01HiHQpzj0iRp2Bot8f
	T1UqM6jdXwdyVjipRDUQeVG7uuewIEKS5ssv/Oc7skaD7seF3D1OjQU9wvRUTjPYXPtw1ROL5y
	YdY6vLfG6nB5aT0gYU08gzjfJ6pymHKg5sgaSEXWfYdY6z/sy0kH/xcNuRFk5IWOHQuvXzu3K+
	MBneKEayI0R8HyGD7c5w4LKrD+1UiS7qyh49NBtR9ZsR7k0H0sDq61zyr9/9Au8MHiNUB08KeT
	Tt4=
X-IronPort-AV: E=Sophos;i="5.75,254,1589212800"; d="scan'208";a="141787129"
Received: from mail-mw2nam12lp2048.outbound.protection.outlook.com (HELO
	NAM12-MW2-obe.outbound.protection.outlook.com) ([104.47.66.48])
	by ob1.hgst.iphmx.com with ESMTP; 19 Jun 2020 15:52:25 +0800
Received: from CY4PR04MB3751.namprd04.prod.outlook.com (2603:10b6:903:ec::14)
	by CY4PR0401MB3636.namprd04.prod.outlook.com (2603:10b6:910:91::20)
	with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3088.23;
	Fri, 19 Jun 2020 07:52:22 +0000
Received: from CY4PR04MB3751.namprd04.prod.outlook.com
	([fe80::c593:f271:eebe:ac7]) by CY4PR04MB3751.namprd04.prod.outlook.com
	([fe80::c593:f271:eebe:ac7%9]) with mapi id 15.20.3109.023;
	Fri, 19 Jun 2020 07:52:22 +0000
From: Damien Le Moal <Damien.LeMoal@wdc.com>
To: Johannes Thumshirn <Johannes.Thumshirn@wdc.com>, Mike Snitzer
	<snitzer@redhat.com>
Thread-Topic: [PATCH 1/2] dm: update original bio sector on Zone Append
Thread-Index: AQHWRgcxVdsmSghuh0qfelwKmrP/0Q==
Date: Fri, 19 Jun 2020 07:52:22 +0000
Message-ID: <CY4PR04MB37511B64E85A60344AB2473AE7980@CY4PR04MB3751.namprd04.prod.outlook.com>
References: <20200619065905.22228-1-johannes.thumshirn@wdc.com>
	<20200619065905.22228-2-johannes.thumshirn@wdc.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [129.253.182.57]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 50bf53a5-c24b-40c6-9b8c-08d81425b339
x-ms-traffictypediagnostic: CY4PR0401MB3636:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <CY4PR0401MB3636C1CDB70682C7CBE72B78E7980@CY4PR0401MB3636.namprd04.prod.outlook.com>
wdcipoutbound: EOP-TRUE
x-ms-oob-tlc-oobclassifiers: OLM:8273;
x-forefront-prvs: 0439571D1D
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 06rfhiTSpE9uOP5X6xDJBLmSPpZGpKFiyngtEodatMX3QN7MeOyuwxqbDS4VgeAmzHEiUgNqU8CLVKOUb7/UhYDEmaZgpcqxckqcFk+zuSbWBB2wp5E5WP2opy6hv4t0YEjhjdeoMhvglJgvd6vHrONhKrvI8EA1Q1cFJL5ZzKUynHurD1pcTEK3p7D2JI0J1Yq1pc9sV4LCg7o/GZxn8M+/uon+oJcmvvVdGFDi4Lyd++rsqPNInS02nNpsDTF1cr0fmTpPWupJzzFKjDzqYFy3Q8TiGLruX3aWQ3vq7ka09aMlm3ULYw+o1u/M8xSZ
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
	IPV:NLI; SFV:NSPM; H:CY4PR04MB3751.namprd04.prod.outlook.com;
	PTR:; CAT:NONE; SFTY:;
	SFS:(4636009)(396003)(39860400002)(376002)(136003)(346002)(366004)(186003)(316002)(33656002)(8936002)(91956017)(66476007)(66946007)(110136005)(76116006)(52536014)(66446008)(6506007)(53546011)(4326008)(26005)(478600001)(54906003)(7696005)(66556008)(83380400001)(8676002)(64756008)(86362001)(2906002)(71200400001)(5660300002)(55016002)(9686003);
	DIR:OUT; SFP:1102;
x-ms-exchange-antispam-messagedata: /mGqkykclANK+MxVvfjgQS2t9BbS7IcdbQ+U/HU/1p5A5eGNC9N64PEmbH7g/SlIzxq+DJAiXlnNkb4B7CPSwOdYalGyQ+Nw/5MbzpCNvA5w18MvM4LC/+KNyJ/RHv60UINY7TeJZaqRrvosScieeO07tBIGncKmARp7KkJ2Af4nSP/Wkv31C8ooQsrHxA8KwRvNSvtVl8mbcXuov1It380JjYovFPSFItVEMYFTLlJvf19Oi1Wp+f2ztYCcszDIV/w0rVFVgOnNVLINkk1LD9xdLjVNSEq5psoMnHScupVJdpLFxW2ToADQ1cdqKlfWf40N3cQgkXkAeH5D6Wg7km9ABcPy+tWYRCgbY1g64GLZEDv/9pDltpZcVoHuYgAUYLd5mQ0t4FUltfgq5m7daPXPSMxhhSzbATKyoO1Br/QLRxmmMFroTPgyfGKJ7C6yFfhx/7yEA6M06qzc3tbFk0jSuyKzpG5Qhmcz8j3DEkFmB/RRX7ckcasBNOOczwL0
MIME-Version: 1.0
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 50bf53a5-c24b-40c6-9b8c-08d81425b339
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Jun 2020 07:52:22.4418 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: v3Lbak4z2QgPAcraJ1UP+69DsbqoR7XsOfO9xJTfEDyJ1k+QsMND+vDc96ssNisi+EasgmJ81vySmqgUz1690g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR0401MB3636
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 05J7rYBo022619
X-loop: dm-devel@redhat.com
Cc: "linux-block@vger.kernel.org" <linux-block@vger.kernel.org>,
	Naohiro Aota <Naohiro.Aota@wdc.com>,
	"dm-devel@redhat.com" <dm-devel@redhat.com>
Subject: Re: [dm-devel] [PATCH 1/2] dm: update original bio sector on Zone
	Append
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

On 2020/06/19 15:59, Johannes Thumshirn wrote:
> Naohiro reported that issuing zone-append bios to a zoned block device
> underneath a dm-linear device does not work as expected.
> 
> This because we forgot to reverse-map the sector the device wrote to the
> original bio.
> 
> For zone-append bios, get the offset in the zone of the written sector
> from the clone bio and add that to the original bio's sector position.
> 
> Reported-by: Naohiro Aota <Naohiro.Aota@wdc.com>
> Fixes: 0512a75b98f8 ("block: Introduce REQ_OP_ZONE_APPEND")
> Signed-off-by: Johannes Thumshirn <johannes.thumshirn@wdc.com>
> ---
>  drivers/md/dm.c | 13 +++++++++++++
>  1 file changed, 13 insertions(+)
> 
> diff --git a/drivers/md/dm.c b/drivers/md/dm.c
> index 109e81f33edb..058c34abe9d1 100644
> --- a/drivers/md/dm.c
> +++ b/drivers/md/dm.c
> @@ -1009,6 +1009,7 @@ static void clone_endio(struct bio *bio)
>  	struct dm_io *io = tio->io;
>  	struct mapped_device *md = tio->io->md;
>  	dm_endio_fn endio = tio->ti->type->end_io;
> +	struct bio *orig_bio = io->orig_bio;
>  
>  	if (unlikely(error == BLK_STS_TARGET) && md->type != DM_TYPE_NVME_BIO_BASED) {
>  		if (bio_op(bio) == REQ_OP_DISCARD &&
> @@ -1022,6 +1023,18 @@ static void clone_endio(struct bio *bio)
>  			disable_write_zeroes(md);
>  	}
>  
> +	/*
> +	 * for zone-append bios get offset in zone of the written sector and add
> +	 * that to the original bio sector pos.
> +	 */
> +	if (bio_op(orig_bio) == REQ_OP_ZONE_APPEND) {
> +		sector_t written_sector = bio->bi_iter.bi_sector;
> +		struct request_queue *q = orig_bio->bi_disk->queue;
> +		u64 mask = (u64)blk_queue_zone_sectors(q) - 1;
> +
> +		orig_bio->bi_iter.bi_sector += written_sector & mask;
> +	}
> +
>  	if (endio) {
>  		int r = endio(tio->ti, bio, &error);
>  		switch (r) {
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

