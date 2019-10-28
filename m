Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com [207.211.31.120])
	by mail.lfdr.de (Postfix) with ESMTP id 021FEE8338
	for <lists+dm-devel@lfdr.de>; Tue, 29 Oct 2019 09:32:00 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1572337919;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 references:references:list-id:list-help:list-unsubscribe:
	 list-subscribe:list-post; bh=+AtaTZAZIE2DijSU62xmTglDRzfISfe2g3y5zIOgGbc=;
	b=dBUqe750Ri5OSiAhvhCf79xdCPfAVncMrkgt5b68tnbFTm3+rKer17hO16h+u3kqpLbynG
	qlG931LRvTgOfYxaRhn/YVl0t/n7OSmQRVYIwYcUGRcW9VvXoixXKWcV1GsQsTPVBRxn1r
	v4qLslLaDA65sLlMpgWELutFig7Yntg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-399-CdAEQLYiOVmjxCEdKmYU2w-1; Tue, 29 Oct 2019 04:31:57 -0400
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E28CC180496F;
	Tue, 29 Oct 2019 08:31:51 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 5A4F35D6C5;
	Tue, 29 Oct 2019 08:31:51 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id B3823206CD;
	Tue, 29 Oct 2019 08:31:39 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
	[10.5.11.15])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x9S7pYVo004220 for <dm-devel@listman.util.phx.redhat.com>;
	Mon, 28 Oct 2019 03:51:34 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id D3CB65D6B0; Mon, 28 Oct 2019 07:51:34 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mx1.redhat.com (ext-mx09.extmail.prod.ext.phx2.redhat.com
	[10.5.110.38])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 4F1375D6A0;
	Mon, 28 Oct 2019 07:51:30 +0000 (UTC)
Received: from esa5.hgst.iphmx.com (esa5.hgst.iphmx.com [216.71.153.144])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 9C40D4E4E6;
	Mon, 28 Oct 2019 07:51:08 +0000 (UTC)
IronPort-SDR: Uyu+79IypycjKlc6IAtjpWu3+drtS+4i63gWFqCejMcShpwqP6mqxlsVDsrnM7Cfih/TB8meov
	hA9uSBCU3wpqZEMj4RPCHl6PtPSRwJ+eT47WL/ngJylgAbzhoPHujVVh68+IB+OhBL40pfOr9G
	uNin7kzqqHex2IEMw1GW/UMf+k7DuMVvfgMM5RvMIxA4GpIA8vUwxWaUKxWfXAoZrT4ZaxXvlA
	L2yVZ1As+GGPOJIjTi3mAMh3T8+hNIjhtscA94btjY2yIz+xKMkRra/eOSkwsllBCFAPiwmFvo
	BJM=
X-IronPort-AV: E=Sophos;i="5.68,239,1569254400"; d="scan'208";a="122235739"
Received: from mail-bl2nam02lp2059.outbound.protection.outlook.com (HELO
	NAM02-BL2-obe.outbound.protection.outlook.com) ([104.47.38.59])
	by ob1.hgst.iphmx.com with ESMTP; 28 Oct 2019 15:50:59 +0800
Received: from BYAPR04MB5749.namprd04.prod.outlook.com (20.179.57.21) by
	BYAPR04MB4728.namprd04.prod.outlook.com (52.135.239.222) with Microsoft
	SMTP
	Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	15.20.2387.23; Mon, 28 Oct 2019 07:50:58 +0000
Received: from BYAPR04MB5749.namprd04.prod.outlook.com
	([fe80::34a1:afd2:e5c1:77c7]) by
	BYAPR04MB5749.namprd04.prod.outlook.com
	([fe80::34a1:afd2:e5c1:77c7%6]) with mapi id 15.20.2387.023;
	Mon, 28 Oct 2019 07:50:58 +0000
From: Chaitanya Kulkarni <Chaitanya.Kulkarni@wdc.com>
To: Damien Le Moal <Damien.LeMoal@wdc.com>, "linux-block@vger.kernel.org"
	<linux-block@vger.kernel.org>, Jens Axboe <axboe@kernel.dk>,
	"linux-scsi@vger.kernel.org" <linux-scsi@vger.kernel.org>, "Martin K .
	Petersen" <martin.petersen@oracle.com>, "dm-devel@redhat.com"
	<dm-devel@redhat.com>, Mike Snitzer <snitzer@redhat.com>
Thread-Topic: [PATCH 1/8] block: Remove REQ_OP_ZONE_RESET plugging
Thread-Index: AQHVjM+qK1sykgq+9kCK6kQl06F7sA==
Date: Mon, 28 Oct 2019 07:50:57 +0000
Message-ID: <BYAPR04MB57491FE7167788107DD1BE0086660@BYAPR04MB5749.namprd04.prod.outlook.com>
References: <20191027140549.26272-1-damien.lemoal@wdc.com>
	<20191027140549.26272-2-damien.lemoal@wdc.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [199.255.44.172]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 36011605-2eb5-41a7-6b20-08d75b7b91c5
x-ms-traffictypediagnostic: BYAPR04MB4728:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <BYAPR04MB4728070D41301BFB059E95D286660@BYAPR04MB4728.namprd04.prod.outlook.com>
wdcipoutbound: EOP-TRUE
x-ms-oob-tlc-oobclassifiers: OLM:2512;
x-forefront-prvs: 0204F0BDE2
x-forefront-antispam-report: SFV:NSPM;
	SFS:(10019020)(4636009)(376002)(39860400002)(396003)(346002)(366004)(136003)(199004)(189003)(71190400001)(71200400001)(99286004)(186003)(7696005)(53546011)(2906002)(74316002)(256004)(476003)(5660300002)(86362001)(6506007)(486006)(8936002)(66066001)(76176011)(8676002)(52536014)(81166006)(76116006)(81156014)(102836004)(9686003)(4326008)(66946007)(446003)(6436002)(6246003)(2501003)(66556008)(66476007)(55016002)(26005)(64756008)(316002)(54906003)(229853002)(110136005)(305945005)(7736002)(14454004)(25786009)(66446008)(3846002)(6116002)(478600001)(33656002);
	DIR:OUT; SFP:1102; SCL:1; SRVR:BYAPR04MB4728;
	H:BYAPR04MB5749.namprd04.prod.outlook.com; FPR:; SPF:None;
	LANG:en; PTR:InfoNoRecords; A:1; MX:1;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: CZuxqfKzL2er1LBeF4X8JS04riAnSQejaRMbTykJBXp43pNAUG0Y8GrFIGeYNaz0jFQ8TbTSGWkjw4xdA5vSUYWN9h/2idOkuHkmX1V0+Y5aDFrLbl9Uknt46fsZ/cJXQop5PDrr616vRJwf3BLI4Tt1CN3rvRSbeTS7s0ANW368Ooqx59XdPLvazmnM8KsNNAt8Ay2CEEcu+8JEUoFF9p6UYnd89xQwx47XU4dF0jJPksw/Rs59ZrKih5VyLoUKW7GvDkERfT0mttj7jX0xVj3jUKrOG3J4Q6nV6Sh4+wISVjG2XTR8Ye4vXuXOmDhywgg72skmT9cG7buXxWoBP7KAjt1RmWItGYdzoBJfwd1GTrbUAS/9Pi6EODCjirvbxW8mKYRH56qXRU4amLf/ofyH5o9gyvgA6CpLnwZrUfPCF1vXx9I2p8K84Fam9j9h
MIME-Version: 1.0
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 36011605-2eb5-41a7-6b20-08d75b7b91c5
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Oct 2019 07:50:57.9044 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ZTOJosqz9xZavaA3hBCDRM4UInqX8BeYnHg4TkPW26vF/d4VstQnQu2nn0Oa3xH7cfjnQpl3QY9LqaLH+vNsZOYGaB4plDu3lHWTHvYOtoc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR04MB4728
X-Greylist: Sender passed SPF test, Sender IP whitelisted by DNSRBL, ACL 238
	matched, not delayed by milter-greylist-4.5.16 (mx1.redhat.com
	[10.5.110.38]); Mon, 28 Oct 2019 07:51:21 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.38]);
	Mon, 28 Oct 2019 07:51:21 +0000 (UTC) for IP:'216.71.153.144'
	DOMAIN:'esa5.hgst.iphmx.com' HELO:'esa5.hgst.iphmx.com'
	FROM:'Chaitanya.Kulkarni@wdc.com' RCPT:''
X-RedHat-Spam-Score: -2.299  (DKIM_SIGNED, DKIM_VALID, RCVD_IN_DNSWL_MED,
	SPF_HELO_NONE) 216.71.153.144 esa5.hgst.iphmx.com
	216.71.153.144 esa5.hgst.iphmx.com
	<prvs=197297270=Chaitanya.Kulkarni@wdc.com>
X-Scanned-By: MIMEDefang 2.78 on 10.5.110.38
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id x9S7pYVo004220
X-loop: dm-devel@redhat.com
X-Mailman-Approved-At: Tue, 29 Oct 2019 04:31:28 -0400
Cc: Ajay Joshi <Ajay.Joshi@wdc.com>, Fomichev <Dmitry.Fomichev@wdc.com>,
	Hans Holmberg <Hans.Holmberg@wdc.com>,
	Keith Busch <kbusch@kernel.org>, Dmitry,
	Matias Bjorling <Matias.Bjorling@wdc.com>
Subject: Re: [dm-devel] [PATCH 1/8] block: Remove REQ_OP_ZONE_RESET plugging
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-MC-Unique: CdAEQLYiOVmjxCEdKmYU2w-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Looks good,

Reviewed-by: Chaitanya Kulkarni <chaitanya.kulkarni@wdc.com>

On 10/27/19 7:06 AM, Damien Le Moal wrote:
> REQ_OP_ZONE_RESET operations cannot be merged as these bios and requests
> do not have a size and are never sequential due to the zone start sector
> position required for their execution. As a result, there is no point in
> using a plug around blkdev_reset_zones() bio issuing loop. This patch
> removes this unnecessary plugging.
> 
> Signed-off-by: Damien Le Moal <damien.lemoal@wdc.com>
> ---
>   block/blk-zoned.c | 4 ----
>   1 file changed, 4 deletions(-)
> 
> diff --git a/block/blk-zoned.c b/block/blk-zoned.c
> index 4bc5f260248a..7fe376eede86 100644
> --- a/block/blk-zoned.c
> +++ b/block/blk-zoned.c
> @@ -258,7 +258,6 @@ int blkdev_reset_zones(struct block_device *bdev,
>   	sector_t zone_sectors;
>   	sector_t end_sector = sector + nr_sectors;
>   	struct bio *bio = NULL;
> -	struct blk_plug plug;
>   	int ret;
>   
>   	if (!blk_queue_is_zoned(q))
> @@ -283,7 +282,6 @@ int blkdev_reset_zones(struct block_device *bdev,
>   	    end_sector != bdev->bd_part->nr_sects)
>   		return -EINVAL;
>   
> -	blk_start_plug(&plug);
>   	while (sector < end_sector) {
>   
>   		bio = blk_next_bio(bio, 0, gfp_mask);
> @@ -301,8 +299,6 @@ int blkdev_reset_zones(struct block_device *bdev,
>   	ret = submit_bio_wait(bio);
>   	bio_put(bio);
>   
> -	blk_finish_plug(&plug);
> -
>   	return ret;
>   }
>   EXPORT_SYMBOL_GPL(blkdev_reset_zones);
> 


--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

