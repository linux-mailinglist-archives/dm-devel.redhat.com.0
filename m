Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
	by mail.lfdr.de (Postfix) with ESMTP id EAD72268234
	for <lists+dm-devel@lfdr.de>; Mon, 14 Sep 2020 02:47:29 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-59-1SEsSBbiPl2dojHggExxfA-1; Sun, 13 Sep 2020 20:47:26 -0400
X-MC-Unique: 1SEsSBbiPl2dojHggExxfA-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 69DAB8015A4;
	Mon, 14 Sep 2020 00:47:21 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 6A91727BCC;
	Mon, 14 Sep 2020 00:47:20 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 477B91832FD3;
	Mon, 14 Sep 2020 00:47:17 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 08E0lCfk016531 for <dm-devel@listman.util.phx.redhat.com>;
	Sun, 13 Sep 2020 20:47:12 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 63B8A111142A; Mon, 14 Sep 2020 00:47:12 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast03.extmail.prod.ext.rdu2.redhat.com [10.11.55.19])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 5E98F1111429
	for <dm-devel@redhat.com>; Mon, 14 Sep 2020 00:47:10 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 1CACC811E81
	for <dm-devel@redhat.com>; Mon, 14 Sep 2020 00:47:10 +0000 (UTC)
Received: from esa6.hgst.iphmx.com (esa6.hgst.iphmx.com [216.71.154.45])
	(Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-188-Gxshowb4OwmoMU8k9XgdPg-1; Sun, 13 Sep 2020 20:47:07 -0400
X-MC-Unique: Gxshowb4OwmoMU8k9XgdPg-1
IronPort-SDR: ONTi9Lixtx+tlFgDUtXHvJu1o72jAVCn8IvzCb6bE0aMPuRKr3xSUABA09u3ziCmDGLOwRRs2D
	jsoTdl40qF++nzRoJ5QxztNd0xbimGCyQBaGhhePTloOfq6gVFbu9B8trAppDog4L8P1Kjvhgv
	pjSmYcATAusD4lri6f5HQOYelJHEbbWV0r8cgSoPaCWTNwBQIo7znAtVq4F2JvZRtCDMGqW4bZ
	Uwh0ssyyS3nq8xRn0piHND/ogArPLzodAMN6rQ+TuColLuEfkUb+yRMTZj/7TgyS6998XuOPQ7
	Obs=
X-IronPort-AV: E=Sophos;i="5.76,424,1592841600"; d="scan'208";a="148497085"
Received: from mail-dm6nam11lp2171.outbound.protection.outlook.com (HELO
	NAM11-DM6-obe.outbound.protection.outlook.com) ([104.47.57.171])
	by ob1.hgst.iphmx.com with ESMTP; 14 Sep 2020 08:46:53 +0800
Received: from CY4PR04MB3751.namprd04.prod.outlook.com (2603:10b6:903:ec::14)
	by CY4PR04MB0374.namprd04.prod.outlook.com (2603:10b6:903:bb::10)
	with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3370.16;
	Mon, 14 Sep 2020 00:46:52 +0000
Received: from CY4PR04MB3751.namprd04.prod.outlook.com
	([fe80::9124:2453:fe9c:9a7]) by CY4PR04MB3751.namprd04.prod.outlook.com
	([fe80::9124:2453:fe9c:9a7%12]) with mapi id 15.20.3370.019;
	Mon, 14 Sep 2020 00:46:52 +0000
From: Damien Le Moal <Damien.LeMoal@wdc.com>
To: Mike Snitzer <snitzer@redhat.com>, Ming Lei <ming.lei@redhat.com>
Thread-Topic: [PATCH 1/3] block: fix blk_rq_get_max_sectors() to flow more
	carefully
Thread-Index: AQHWiIYMLoBPwOGRnUWZi2d6qpID+A==
Date: Mon, 14 Sep 2020 00:46:51 +0000
Message-ID: <CY4PR04MB375160D4EFBA9BE0957AC7EDE7230@CY4PR04MB3751.namprd04.prod.outlook.com>
References: <20200911215338.44805-1-snitzer@redhat.com>
	<20200911215338.44805-2-snitzer@redhat.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [2400:2411:43c0:6000:f58c:fb44:b59e:e65e]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 1c44dae3-0696-453a-8dbc-08d85847abc6
x-ms-traffictypediagnostic: CY4PR04MB0374:
x-microsoft-antispam-prvs: <CY4PR04MB0374E4A67F41516160EEF284E7230@CY4PR04MB0374.namprd04.prod.outlook.com>
wdcipoutbound: EOP-TRUE
x-ms-oob-tlc-oobclassifiers: OLM:4714;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: maLa/ZSvDcg97tL0qoMOHYNf3QpO+TAOmjqu+Pz6nDYcfZ3k782PYP+l9U+kQ+55zYdG3QffeU2mPcwRZ9R+v2vwJIfSLJcP/XE+xEE3W3mi8OC9zYdqbzZY447yNX/5Y6p6Tq6WK/S/roMJdDc0brprlOFkzUHuIBryLmTcnsofUCmKszLArs7f27fJYyGZiAAOrrIBJOludSONz1EaNBFnc+s71xIbnLhcAtuZk8BanCfBtyWpfADbeltDoqajuDuO1iPEegqwvrKfNfrBPh6RRTfmJ2/kKVmo3ILCOZySW5qeuj3MQWldoAV8UlbpM9Dk2siZK4VJiHStmdh6RQ==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
	IPV:NLI; SFV:NSPM; H:CY4PR04MB3751.namprd04.prod.outlook.com;
	PTR:; CAT:NONE;
	SFS:(4636009)(376002)(136003)(396003)(366004)(346002)(39860400002)(66476007)(66556008)(53546011)(64756008)(66946007)(52536014)(6506007)(66446008)(76116006)(91956017)(4326008)(2906002)(8676002)(8936002)(86362001)(316002)(71200400001)(83380400001)(33656002)(7696005)(5660300002)(110136005)(478600001)(55016002)(54906003)(9686003)(186003);
	DIR:OUT; SFP:1102;
x-ms-exchange-antispam-messagedata: GftqgE90Mr5vzHZ8MclaoYURkPPNBTNWGmSarrXpDv+PrLpCMzUSkfTUABVtNOtfYxVMRpUK/B6pekdN/Kr6lz41MO2yn96xKdOTbKetPxI/8qPXp6xozKTH8FvOfwWD6XiU+3Dvd2Ax/Z9xUZHbTot9ssb5EVy5SK+CrgVtZMLNhVSBOR1PS7cyr5mnMY+snzWkghHbImMgvCIN7TMhmctrfRAUQdFixEHaziDtn7Hj+tItKVM2cwUUbOFg5IB9rEGsW7tXOjbLiJVboA0OqltmB9ZkicAeIzw872V0XFh14lVNx7xjV98nLVJh+VK9YIqQWBktIfdccFoyY641QShEyf5H/5WkWjvCMfZueaTqXBrZz4JurZeodSPE3KcDsaTKmULnqEpWw/e5kBnsv17JWc/cJX7WxKGEJdeude61bx43B/YxnkntaItSeF/6zswNmorhEK+i5FE0s2gCZbubSMM9/2tCxTSlF3LKoycx72Ehzmnqrs3YxaA46ThYGG12MPPhT5bLdScfplJvhvLoHjQWYklZnH4PsgmHPqzzFLi7EtEv7mvYHgHgimRDyMy9kaLthOWR2/BY1XIAdJuX9LlPS5FOn4uM8HGnO6ZguJi5PtjQA3KT6Y3S15Fh1ZitR/dvYewBlJZpWNcDoAaVKSSROVTPditDucF7ekQUDxvo2VzMWUMLYkCgAiWCpGWLkCZ98MYbLw/SWdebiA==
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CY4PR04MB3751.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1c44dae3-0696-453a-8dbc-08d85847abc6
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Sep 2020 00:46:51.9074 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: eWp6OACGupZ0MBCKenOvTJzGELWPF4QB5Amg4ewBOQK9TYdpGcY0/8C4GQLBta7ZGT8Do4ipSY0D+HjlgP7mdQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR04MB0374
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false;
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 08E0lCfk016531
X-loop: dm-devel@redhat.com
Cc: "linux-block@vger.kernel.org" <linux-block@vger.kernel.org>,
	"dm-devel@redhat.com" <dm-devel@redhat.com>,
	Vijayendra Suman <vijayendra.suman@oracle.com>
Subject: Re: [dm-devel] [PATCH 1/3] block: fix blk_rq_get_max_sectors() to
 flow more carefully
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
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0.003
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Content-Language: en-US

On 2020/09/12 6:53, Mike Snitzer wrote:
> blk_queue_get_max_sectors() has been trained for REQ_OP_WRITE_SAME and
> REQ_OP_WRITE_ZEROES yet blk_rq_get_max_sectors() didn't call it for
> those operations.
> 
> Also, there is no need to avoid blk_max_size_offset() if
> 'chunk_sectors' isn't set because it falls back to 'max_sectors'.
> 
> Signed-off-by: Mike Snitzer <snitzer@redhat.com>
> ---
>  include/linux/blkdev.h | 19 +++++++++++++------
>  1 file changed, 13 insertions(+), 6 deletions(-)
> 
> diff --git a/include/linux/blkdev.h b/include/linux/blkdev.h
> index bb5636cc17b9..453a3d735d66 100644
> --- a/include/linux/blkdev.h
> +++ b/include/linux/blkdev.h
> @@ -1070,17 +1070,24 @@ static inline unsigned int blk_rq_get_max_sectors(struct request *rq,
>  						  sector_t offset)
>  {
>  	struct request_queue *q = rq->q;
> +	int op;
> +	unsigned int max_sectors;
>  
>  	if (blk_rq_is_passthrough(rq))
>  		return q->limits.max_hw_sectors;
>  
> -	if (!q->limits.chunk_sectors ||
> -	    req_op(rq) == REQ_OP_DISCARD ||
> -	    req_op(rq) == REQ_OP_SECURE_ERASE)
> -		return blk_queue_get_max_sectors(q, req_op(rq));
> +	op = req_op(rq);
> +	max_sectors = blk_queue_get_max_sectors(q, op);
>  
> -	return min(blk_max_size_offset(q, offset),
> -			blk_queue_get_max_sectors(q, req_op(rq)));
> +	switch (op) {
> +	case REQ_OP_DISCARD:
> +	case REQ_OP_SECURE_ERASE:
> +	case REQ_OP_WRITE_SAME:
> +	case REQ_OP_WRITE_ZEROES:
> +		return max_sectors;
> +	}

Doesn't this break md devices ? (I think does use chunk_sectors for stride size,
no ?)

As mentioned in my reply to Ming's email, this will allow these commands to
potentially cross over zone boundaries on zoned block devices, which would be an
immediate command failure.

> +
> +	return min(blk_max_size_offset(q, offset), max_sectors);
>  }
>  
>  static inline unsigned int blk_rq_count_bios(struct request *rq)
> 


-- 
Damien Le Moal
Western Digital Research



--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

