Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [63.128.21.124])
	by mail.lfdr.de (Postfix) with ESMTP id 309F12CD1E1
	for <lists+dm-devel@lfdr.de>; Thu,  3 Dec 2020 09:56:55 +0100 (CET)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-414-RPiQlUlSMTa5YtRwCEwVmg-1; Thu, 03 Dec 2020 03:56:51 -0500
X-MC-Unique: RPiQlUlSMTa5YtRwCEwVmg-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C507C1005E5F;
	Thu,  3 Dec 2020 08:56:45 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 6A09010023B1;
	Thu,  3 Dec 2020 08:56:45 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 049B9180954D;
	Thu,  3 Dec 2020 08:56:44 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 0B38udpF011504 for <dm-devel@listman.util.phx.redhat.com>;
	Thu, 3 Dec 2020 03:56:40 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id ADC432027EAD; Thu,  3 Dec 2020 08:56:39 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast04.extmail.prod.ext.rdu2.redhat.com [10.11.55.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id A81552027EAC
	for <dm-devel@redhat.com>; Thu,  3 Dec 2020 08:56:37 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 4616D103B800
	for <dm-devel@redhat.com>; Thu,  3 Dec 2020 08:56:37 +0000 (UTC)
Received: from esa3.hgst.iphmx.com (esa3.hgst.iphmx.com [216.71.153.141])
	(Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-159-N25xviIkMeqhvs52U6ANkg-1; Thu, 03 Dec 2020 03:56:34 -0500
X-MC-Unique: N25xviIkMeqhvs52U6ANkg-1
IronPort-SDR: p1RO2tQol/vd/+1qkqLBRjdDbAC9/xDPJdaOFDCtkZDKFVZaBlaOA7VD7FKkYQOagDW6LvMs6K
	UfjwMNEFVUJHgFrfkm76AzKDDLtw5NvRZYNe41AgqvHLNtgYpb/6Ld0PaFuy1H6FZ0b4r/2JVW
	f+qu5hFB96EC2YqzE7J5+bH2tZfn1kUBBUXyMr144RYvTTj0Lu2HdjMyd1QSJDrj5F5J+wj/ho
	lrePQzIUcd6SzBp/2kocPxNenCXN2+KaIUPJEiAKavNcGrSK2taiLVYCd8mbypI88NeyFCu8jX
	md4=
X-IronPort-AV: E=Sophos;i="5.78,389,1599494400"; d="scan'208";a="158712084"
Received: from mail-cys01nam02lp2052.outbound.protection.outlook.com (HELO
	NAM02-CY1-obe.outbound.protection.outlook.com) ([104.47.37.52])
	by ob1.hgst.iphmx.com with ESMTP; 03 Dec 2020 16:56:33 +0800
Received: from CH2PR04MB6522.namprd04.prod.outlook.com (2603:10b6:610:34::19)
	by CH2PR04MB6540.namprd04.prod.outlook.com (2603:10b6:610:64::23)
	with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3632.19;
	Thu, 3 Dec 2020 08:56:29 +0000
Received: from CH2PR04MB6522.namprd04.prod.outlook.com
	([fe80::897c:a04b:4eb0:640a]) by
	CH2PR04MB6522.namprd04.prod.outlook.com
	([fe80::897c:a04b:4eb0:640a%7]) with mapi id 15.20.3589.022;
	Thu, 3 Dec 2020 08:56:29 +0000
From: Damien Le Moal <Damien.LeMoal@wdc.com>
To: Christoph Hellwig <hch@lst.de>, Jens Axboe <axboe@kernel.dk>
Thread-Topic: [dm-devel] [PATCH 2/5] block: simplify and extended the
	block_bio_merge tracepoint class
Thread-Index: AQHWyVIw3FSIo2anh0qVPOhlB5mpfQ==
Date: Thu, 3 Dec 2020 08:56:29 +0000
Message-ID: <CH2PR04MB652293C0177F0CDFE68F44EDE7F20@CH2PR04MB6522.namprd04.prod.outlook.com>
References: <20201130175854.982460-1-hch@lst.de>
	<20201130175854.982460-3-hch@lst.de>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [129.253.182.59]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: ae48d95e-6bc1-4c2c-f0e1-08d897695352
x-ms-traffictypediagnostic: CH2PR04MB6540:
x-microsoft-antispam-prvs: <CH2PR04MB65407177C571E7F20CB1245CE7F20@CH2PR04MB6540.namprd04.prod.outlook.com>
wdcipoutbound: EOP-TRUE
x-ms-oob-tlc-oobclassifiers: OLM:125
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0
x-microsoft-antispam-message-info: NWPVIq+UClThYNiO8fke9JFHnCWgnJbxpPKL9bA0zZygYUdXEUvQosggRDhzMHEQbzoQBbJnrJ4rza501fJHX2sxyScIDlR7ioAB7QHoy2ztMNHt3LlRbsnFo9WBr9cxT3CgCanNAuZxUb43vxvACdJgB+gnK7anh65AsAWpGKwVq/jEMYVA/0ew0ZOGaoZF9HqY/5PxJXKUBZH32qBoE8AqtL1+SpySzn/LTe6135UwKBDnpNvuZqpFRsmMJVsUKTYwTVB5qMSgDK611oRxITRWxo7667CgJbMLVnPPny0+6z7l1zL4/YxqgJQZ5/Wk
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
	IPV:NLI; SFV:NSPM; H:CH2PR04MB6522.namprd04.prod.outlook.com;
	PTR:; CAT:NONE;
	SFS:(4636009)(396003)(346002)(136003)(39860400002)(366004)(376002)(8676002)(33656002)(6506007)(9686003)(53546011)(52536014)(83380400001)(64756008)(55016002)(66946007)(66446008)(66476007)(5660300002)(66556008)(478600001)(91956017)(30864003)(8936002)(186003)(7696005)(76116006)(86362001)(316002)(4326008)(26005)(71200400001)(54906003)(2906002)(110136005);
	DIR:OUT; SFP:1102
x-ms-exchange-antispam-messagedata: =?us-ascii?Q?xh3xZZMT6f1/5trqxENgoi3wVW386S3Bq3QMyJLUAUfHljYClzGjc8bhIRmB?=
	=?us-ascii?Q?wDybuF8LlviKHQhmltzKp0L1yovoYdAgLeHpDeBYPBm2lGTf34SYLtlZKAI1?=
	=?us-ascii?Q?qxG6DlXJfKo+TIuiTiJoOjMEV3waHbr4AOw9/qVBFK44Rv2Pf4H8TDMRkC1S?=
	=?us-ascii?Q?hcNRFa7iBVmtcvt8XHKzM7fPL/oCUlzOPU+LHqjif/ugUi/HVvkVe4cz8caH?=
	=?us-ascii?Q?6XiZ0FYRcGfN0pdqWAOwpJZo0zHdxpRbFpjxCE1NcSESFV/bhoB7OeDl855O?=
	=?us-ascii?Q?3B/MokMpZAGNjjgJkZch86WSGFSvKR1utwW+c0ZoVYGSm90RZKrWaDe/zWLK?=
	=?us-ascii?Q?TyimzJSU6CxXZg7GBXlAQIzcQVL3DZp5JyUO31SG3M0j5+oEZDqhQwvwx6pN?=
	=?us-ascii?Q?jac3b4FTZ+OsezPJnxS+lFA7G6f1CeN7sc2Kz1JyS2CJdyhPBUE7eBWT+5tm?=
	=?us-ascii?Q?GNV+RW1KeqaMpGyDPVsFCcVZV3cdB3jhADdOrltI+JQ2JhoJMfXW1D5gdznc?=
	=?us-ascii?Q?Z46dXcCmWmtsUs7TQWdMHkkExxP1xWvJZofhidlgwTm9kxGmz7xvqz7SyMRa?=
	=?us-ascii?Q?gzGdpjioQ9UDHRJhgY33ueN9+T9cHgYLxpcUQ6bkaJ5dpev6ho4scipGJ/5m?=
	=?us-ascii?Q?xzSTv1bILbf1BDNnssn1VBuoRBsnBAOl05HKPitJ3QaUDa/VcLI/2ym2RN8S?=
	=?us-ascii?Q?Qj5NiFylCMw1aY5ja6vIlTCuPMqlXm2GpMeUBTRdRrMGsxOB9PE6tIfgDR6K?=
	=?us-ascii?Q?EDq3liMKmrmgg3fEPmm9HMmifjzMkg/EqCXNG3nK/NWiVlTu5nd0k4xssfil?=
	=?us-ascii?Q?lUPu4z3maLUUMUW2AobekTQ10HYnAf+JMN0TCUHiKwMQ+8uowWVM/CEx/jjg?=
	=?us-ascii?Q?iHUjkz091HF4f7heD+RiDk1hpU1nWvW94G9H+zmvra3RX2eJ8eCG4ulqdCAY?=
	=?us-ascii?Q?KkuOAwTvhd9gaTm+C6X+KlTY/p4UUQuCqJujlyzkmBSOOQ4xGnl+Fc0HpGpe?=
	=?us-ascii?Q?FBoD?=
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH2PR04MB6522.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ae48d95e-6bc1-4c2c-f0e1-08d897695352
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Dec 2020 08:56:29.7234 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Ix7NPJ5xbpAcY2PhEec9Dx9hseilRxhdwMOXYgy+8XbVO887YCL91ONcdwqQXPh/NikJGe7h2MldK0LmqpVnXw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR04MB6540
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 0B38udpF011504
X-loop: dm-devel@redhat.com
Cc: "linux-block@vger.kernel.org" <linux-block@vger.kernel.org>,
	"linux-raid@vger.kernel.org" <linux-raid@vger.kernel.org>,
	"dm-devel@redhat.com" <dm-devel@redhat.com>,
	"linux-s390@vger.kernel.org" <linux-s390@vger.kernel.org>
Subject: Re: [dm-devel] [PATCH 2/5] block: simplify and extended the
 block_bio_merge tracepoint class
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
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

In the patch title:

s/extended/extend

On 2020/12/01 3:06, Christoph Hellwig wrote:
> The block_bio_merge tracepoint class can be reused for most bio-based
> tracepoints.  For that is just needs to lose the superflous and rq

s/is/it
s/superflous/superfluous

> parameters.
> 
> Signed-off-by: Christoph Hellwig <hch@lst.de>
> ---
>  block/blk-core.c             |   2 +-
>  block/blk-merge.c            |   4 +-
>  block/blk-mq.c               |   2 +-
>  block/bounce.c               |   2 +-
>  include/trace/events/block.h | 158 ++++++++---------------------------
>  kernel/trace/blktrace.c      |  41 +++------
>  6 files changed, 48 insertions(+), 161 deletions(-)
> 
> diff --git a/block/blk-core.c b/block/blk-core.c
> index cee568389b7e11..cb24654983e1e4 100644
> --- a/block/blk-core.c
> +++ b/block/blk-core.c
> @@ -907,7 +907,7 @@ static noinline_for_stack bool submit_bio_checks(struct bio *bio)
>  	blkcg_bio_issue_init(bio);
>  
>  	if (!bio_flagged(bio, BIO_TRACE_COMPLETION)) {
> -		trace_block_bio_queue(q, bio);
> +		trace_block_bio_queue(bio);
>  		/* Now that enqueuing has been traced, we need to trace
>  		 * completion as well.
>  		 */
> diff --git a/block/blk-merge.c b/block/blk-merge.c
> index cb351ab9b77dbd..1a46d5bbd399e3 100644
> --- a/block/blk-merge.c
> +++ b/block/blk-merge.c
> @@ -922,7 +922,7 @@ static enum bio_merge_status bio_attempt_back_merge(struct request *req,
>  	if (!ll_back_merge_fn(req, bio, nr_segs))
>  		return BIO_MERGE_FAILED;
>  
> -	trace_block_bio_backmerge(req->q, req, bio);
> +	trace_block_bio_backmerge(bio);
>  	rq_qos_merge(req->q, req, bio);
>  
>  	if ((req->cmd_flags & REQ_FAILFAST_MASK) != ff)
> @@ -946,7 +946,7 @@ static enum bio_merge_status bio_attempt_front_merge(struct request *req,
>  	if (!ll_front_merge_fn(req, bio, nr_segs))
>  		return BIO_MERGE_FAILED;
>  
> -	trace_block_bio_frontmerge(req->q, req, bio);
> +	trace_block_bio_frontmerge(bio);
>  	rq_qos_merge(req->q, req, bio);
>  
>  	if ((req->cmd_flags & REQ_FAILFAST_MASK) != ff)
> diff --git a/block/blk-mq.c b/block/blk-mq.c
> index a2593748fa5342..13636458f32f1c 100644
> --- a/block/blk-mq.c
> +++ b/block/blk-mq.c
> @@ -2183,7 +2183,7 @@ blk_qc_t blk_mq_submit_bio(struct bio *bio)
>  		goto queue_exit;
>  	}
>  
> -	trace_block_getrq(q, bio, bio->bi_opf);
> +	trace_block_getrq(bio);
>  
>  	rq_qos_track(q, rq, bio);
>  
> diff --git a/block/bounce.c b/block/bounce.c
> index 162a6eee89996a..d3f51acd6e3b51 100644
> --- a/block/bounce.c
> +++ b/block/bounce.c
> @@ -340,7 +340,7 @@ static void __blk_queue_bounce(struct request_queue *q, struct bio **bio_orig,
>  		}
>  	}
>  
> -	trace_block_bio_bounce(q, *bio_orig);
> +	trace_block_bio_bounce(*bio_orig);
>  
>  	bio->bi_flags |= (1 << BIO_BOUNCED);
>  
> diff --git a/include/trace/events/block.h b/include/trace/events/block.h
> index 76459cf750e14d..506c29dc7c76fd 100644
> --- a/include/trace/events/block.h
> +++ b/include/trace/events/block.h
> @@ -226,45 +226,6 @@ DEFINE_EVENT(block_rq, block_rq_merge,
>  	TP_ARGS(q, rq)
>  );
>  
> -/**
> - * block_bio_bounce - used bounce buffer when processing block operation
> - * @q: queue holding the block operation
> - * @bio: block operation
> - *
> - * A bounce buffer was used to handle the block operation @bio in @q.
> - * This occurs when hardware limitations prevent a direct transfer of
> - * data between the @bio data memory area and the IO device.  Use of a
> - * bounce buffer requires extra copying of data and decreases
> - * performance.
> - */
> -TRACE_EVENT(block_bio_bounce,
> -
> -	TP_PROTO(struct request_queue *q, struct bio *bio),
> -
> -	TP_ARGS(q, bio),
> -
> -	TP_STRUCT__entry(
> -		__field( dev_t,		dev			)
> -		__field( sector_t,	sector			)
> -		__field( unsigned int,	nr_sector		)
> -		__array( char,		rwbs,	RWBS_LEN	)
> -		__array( char,		comm,	TASK_COMM_LEN	)
> -	),
> -
> -	TP_fast_assign(
> -		__entry->dev		= bio_dev(bio);
> -		__entry->sector		= bio->bi_iter.bi_sector;
> -		__entry->nr_sector	= bio_sectors(bio);
> -		blk_fill_rwbs(__entry->rwbs, bio->bi_opf, bio->bi_iter.bi_size);
> -		memcpy(__entry->comm, current->comm, TASK_COMM_LEN);
> -	),
> -
> -	TP_printk("%d,%d %s %llu + %u [%s]",
> -		  MAJOR(__entry->dev), MINOR(__entry->dev), __entry->rwbs,
> -		  (unsigned long long)__entry->sector,
> -		  __entry->nr_sector, __entry->comm)
> -);
> -
>  /**
>   * block_bio_complete - completed all work on the block operation
>   * @q: queue holding the block operation
> @@ -301,11 +262,11 @@ TRACE_EVENT(block_bio_complete,
>  		  __entry->nr_sector, __entry->error)
>  );
>  
> -DECLARE_EVENT_CLASS(block_bio_merge,
> +DECLARE_EVENT_CLASS(block_bio,
>  
> -	TP_PROTO(struct request_queue *q, struct request *rq, struct bio *bio),
> +	TP_PROTO(struct bio *bio),
>  
> -	TP_ARGS(q, rq, bio),
> +	TP_ARGS(bio),
>  
>  	TP_STRUCT__entry(
>  		__field( dev_t,		dev			)
> @@ -329,116 +290,63 @@ DECLARE_EVENT_CLASS(block_bio_merge,
>  		  __entry->nr_sector, __entry->comm)
>  );
>  
> +/**
> + * block_bio_bounce - used bounce buffer when processing block operation
> + * @bio: block operation
> + *
> + * A bounce buffer was used to handle the block operation @bio in @q.
> + * This occurs when hardware limitations prevent a direct transfer of
> + * data between the @bio data memory area and the IO device.  Use of a
> + * bounce buffer requires extra copying of data and decreases
> + * performance.
> + */
> +DEFINE_EVENT(block_bio, block_bio_bounce,
> +	TP_PROTO(struct bio *bio),
> +	TP_ARGS(bio)
> +);
> +
>  /**
>   * block_bio_backmerge - merging block operation to the end of an existing operation
> - * @q: queue holding operation
> - * @rq: request bio is being merged into
>   * @bio: new block operation to merge
>   *
> - * Merging block request @bio to the end of an existing block request
> - * in queue @q.
> + * Merging block request @bio to the end of an existing block request.
>   */
> -DEFINE_EVENT(block_bio_merge, block_bio_backmerge,
> -
> -	TP_PROTO(struct request_queue *q, struct request *rq, struct bio *bio),
> -
> -	TP_ARGS(q, rq, bio)
> +DEFINE_EVENT(block_bio, block_bio_backmerge,
> +	TP_PROTO(struct bio *bio),
> +	TP_ARGS(bio)
>  );
>  
>  /**
>   * block_bio_frontmerge - merging block operation to the beginning of an existing operation
> - * @q: queue holding operation
> - * @rq: request bio is being merged into
>   * @bio: new block operation to merge
>   *
> - * Merging block IO operation @bio to the beginning of an existing block
> - * operation in queue @q.
> + * Merging block IO operation @bio to the beginning of an existing block request.
>   */
> -DEFINE_EVENT(block_bio_merge, block_bio_frontmerge,
> -
> -	TP_PROTO(struct request_queue *q, struct request *rq, struct bio *bio),
> -
> -	TP_ARGS(q, rq, bio)
> +DEFINE_EVENT(block_bio, block_bio_frontmerge,
> +	TP_PROTO(struct bio *bio),
> +	TP_ARGS(bio)
>  );
>  
>  /**
>   * block_bio_queue - putting new block IO operation in queue
> - * @q: queue holding operation
>   * @bio: new block operation
>   *
>   * About to place the block IO operation @bio into queue @q.
>   */
> -TRACE_EVENT(block_bio_queue,
> -
> -	TP_PROTO(struct request_queue *q, struct bio *bio),
> -
> -	TP_ARGS(q, bio),
> -
> -	TP_STRUCT__entry(
> -		__field( dev_t,		dev			)
> -		__field( sector_t,	sector			)
> -		__field( unsigned int,	nr_sector		)
> -		__array( char,		rwbs,	RWBS_LEN	)
> -		__array( char,		comm,	TASK_COMM_LEN	)
> -	),
> -
> -	TP_fast_assign(
> -		__entry->dev		= bio_dev(bio);
> -		__entry->sector		= bio->bi_iter.bi_sector;
> -		__entry->nr_sector	= bio_sectors(bio);
> -		blk_fill_rwbs(__entry->rwbs, bio->bi_opf, bio->bi_iter.bi_size);
> -		memcpy(__entry->comm, current->comm, TASK_COMM_LEN);
> -	),
> -
> -	TP_printk("%d,%d %s %llu + %u [%s]",
> -		  MAJOR(__entry->dev), MINOR(__entry->dev), __entry->rwbs,
> -		  (unsigned long long)__entry->sector,
> -		  __entry->nr_sector, __entry->comm)
> -);
> -
> -DECLARE_EVENT_CLASS(block_get_rq,
> -
> -	TP_PROTO(struct request_queue *q, struct bio *bio, int rw),
> -
> -	TP_ARGS(q, bio, rw),
> -
> -	TP_STRUCT__entry(
> -		__field( dev_t,		dev			)
> -		__field( sector_t,	sector			)
> -		__field( unsigned int,	nr_sector		)
> -		__array( char,		rwbs,	RWBS_LEN	)
> -		__array( char,		comm,	TASK_COMM_LEN	)
> -        ),
> -
> -	TP_fast_assign(
> -		__entry->dev		= bio ? bio_dev(bio) : 0;
> -		__entry->sector		= bio ? bio->bi_iter.bi_sector : 0;
> -		__entry->nr_sector	= bio ? bio_sectors(bio) : 0;
> -		blk_fill_rwbs(__entry->rwbs,
> -			      bio ? bio->bi_opf : 0, __entry->nr_sector);
> -		memcpy(__entry->comm, current->comm, TASK_COMM_LEN);
> -        ),
> -
> -	TP_printk("%d,%d %s %llu + %u [%s]",
> -		  MAJOR(__entry->dev), MINOR(__entry->dev), __entry->rwbs,
> -		  (unsigned long long)__entry->sector,
> -		  __entry->nr_sector, __entry->comm)
> +DEFINE_EVENT(block_bio, block_bio_queue,
> +	TP_PROTO(struct bio *bio),
> +	TP_ARGS(bio)
>  );
>  
>  /**
>   * block_getrq - get a free request entry in queue for block IO operations
> - * @q: queue for operations
>   * @bio: pending block IO operation (can be %NULL)
> - * @rw: low bit indicates a read (%0) or a write (%1)
>   *
> - * A request struct for queue @q has been allocated to handle the
> - * block IO operation @bio.
> + * A request struct has been allocated to handle the block IO operation @bio.
>   */
> -DEFINE_EVENT(block_get_rq, block_getrq,
> -
> -	TP_PROTO(struct request_queue *q, struct bio *bio, int rw),
> -
> -	TP_ARGS(q, bio, rw)
> +DEFINE_EVENT(block_bio, block_getrq,
> +	TP_PROTO(struct bio *bio),
> +	TP_ARGS(bio)
>  );
>  
>  /**
> diff --git a/kernel/trace/blktrace.c b/kernel/trace/blktrace.c
> index ced589df304b57..7ab88e00c15765 100644
> --- a/kernel/trace/blktrace.c
> +++ b/kernel/trace/blktrace.c
> @@ -906,10 +906,9 @@ static void blk_add_trace_bio(struct request_queue *q, struct bio *bio,
>  	rcu_read_unlock();
>  }
>  
> -static void blk_add_trace_bio_bounce(void *ignore,
> -				     struct request_queue *q, struct bio *bio)
> +static void blk_add_trace_bio_bounce(void *ignore, struct bio *bio)
>  {
> -	blk_add_trace_bio(q, bio, BLK_TA_BOUNCE, 0);
> +	blk_add_trace_bio(bio->bi_disk->queue, bio, BLK_TA_BOUNCE, 0);
>  }
>  
>  static void blk_add_trace_bio_complete(void *ignore,
> @@ -919,44 +918,24 @@ static void blk_add_trace_bio_complete(void *ignore,
>  			  blk_status_to_errno(bio->bi_status));
>  }
>  
> -static void blk_add_trace_bio_backmerge(void *ignore,
> -					struct request_queue *q,
> -					struct request *rq,
> -					struct bio *bio)
> +static void blk_add_trace_bio_backmerge(void *ignore, struct bio *bio)
>  {
> -	blk_add_trace_bio(q, bio, BLK_TA_BACKMERGE, 0);
> +	blk_add_trace_bio(bio->bi_disk->queue, bio, BLK_TA_BACKMERGE, 0);
>  }
>  
> -static void blk_add_trace_bio_frontmerge(void *ignore,
> -					 struct request_queue *q,
> -					 struct request *rq,
> -					 struct bio *bio)
> +static void blk_add_trace_bio_frontmerge(void *ignore, struct bio *bio)
>  {
> -	blk_add_trace_bio(q, bio, BLK_TA_FRONTMERGE, 0);
> +	blk_add_trace_bio(bio->bi_disk->queue, bio, BLK_TA_FRONTMERGE, 0);
>  }
>  
> -static void blk_add_trace_bio_queue(void *ignore,
> -				    struct request_queue *q, struct bio *bio)
> +static void blk_add_trace_bio_queue(void *ignore, struct bio *bio)
>  {
> -	blk_add_trace_bio(q, bio, BLK_TA_QUEUE, 0);
> +	blk_add_trace_bio(bio->bi_disk->queue, bio, BLK_TA_QUEUE, 0);
>  }
>  
> -static void blk_add_trace_getrq(void *ignore,
> -				struct request_queue *q,
> -				struct bio *bio, int rw)
> +static void blk_add_trace_getrq(void *ignore, struct bio *bio)
>  {
> -	if (bio)
> -		blk_add_trace_bio(q, bio, BLK_TA_GETRQ, 0);
> -	else {
> -		struct blk_trace *bt;
> -
> -		rcu_read_lock();
> -		bt = rcu_dereference(q->blk_trace);
> -		if (bt)
> -			__blk_add_trace(bt, 0, 0, rw, 0, BLK_TA_GETRQ, 0, 0,
> -					NULL, 0);
> -		rcu_read_unlock();
> -	}
> +	blk_add_trace_bio(bio->bi_disk->queue, bio, BLK_TA_GETRQ, 0);
>  }
>  
>  static void blk_add_trace_plug(void *ignore, struct request_queue *q)
> 

With the commit message fixed, looks good to me.

Reviewed-by: Damien Le Moal <damien.lemoal@wdc.com>

-- 
Damien Le Moal
Western Digital Research



--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

