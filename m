Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-delivery-1.mimecast.com [205.139.110.120])
	by mail.lfdr.de (Postfix) with ESMTP id E4D7F20ED2F
	for <lists+dm-devel@lfdr.de>; Tue, 30 Jun 2020 07:10:52 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-204-mO_vlFvzOJah20qQDDJFYQ-1; Tue, 30 Jun 2020 01:10:49 -0400
X-MC-Unique: mO_vlFvzOJah20qQDDJFYQ-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id CA4BA8031F8;
	Tue, 30 Jun 2020 05:10:42 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id A4A8F1001268;
	Tue, 30 Jun 2020 05:10:37 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 30E491809542;
	Tue, 30 Jun 2020 05:10:25 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 05U5AB6i026004 for <dm-devel@listman.util.phx.redhat.com>;
	Tue, 30 Jun 2020 01:10:11 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id ECDBB115DA7; Tue, 30 Jun 2020 05:10:10 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast02.extmail.prod.ext.rdu2.redhat.com [10.11.55.18])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id E8B63115DB2
	for <dm-devel@redhat.com>; Tue, 30 Jun 2020 05:10:08 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id D6DAB8007C9
	for <dm-devel@redhat.com>; Tue, 30 Jun 2020 05:10:08 +0000 (UTC)
Received: from verein.lst.de (verein.lst.de [213.95.11.211]) (Using TLS) by
	relay.mimecast.com with ESMTP id us-mta-53-H8aKVVgXN2ioVA7AOQQgGw-1;
	Tue, 30 Jun 2020 01:10:06 -0400
X-MC-Unique: H8aKVVgXN2ioVA7AOQQgGw-1
Received: by verein.lst.de (Postfix, from userid 2407)
	id 880A56736F; Tue, 30 Jun 2020 07:10:01 +0200 (CEST)
Date: Tue, 30 Jun 2020 07:10:01 +0200
From: Christoph Hellwig <hch@lst.de>
To: Chaitanya Kulkarni <chaitanya.kulkarni@wdc.com>
Message-ID: <20200630051001.GA27033@lst.de>
References: <20200629234314.10509-1-chaitanya.kulkarni@wdc.com>
	<20200629234314.10509-2-chaitanya.kulkarni@wdc.com>
MIME-Version: 1.0
In-Reply-To: <20200629234314.10509-2-chaitanya.kulkarni@wdc.com>
User-Agent: Mutt/1.5.17 (2007-11-01)
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 05U5AB6i026004
X-loop: dm-devel@redhat.com
Cc: axboe@kernel.dk, paolo.valente@linaro.org, sagi@grimberg.me,
	snitzer@redhat.com, fangguoju@gmail.com, rdunlap@infradead.org,
	rostedt@goodmis.org, ming.lei@redhat.com,
	linux-block@vger.kernel.org, dm-devel@redhat.com,
	mingo@redhat.com, colyli@suse.de, jack@suse.czi, hch@lst.de,
	agk@redhat.com, bvanassche@acm.org
Subject: Re: [dm-devel] [PATCH 01/11] block: blktrace framework cleanup
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
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

On Mon, Jun 29, 2020 at 04:43:04PM -0700, Chaitanya Kulkarni wrote:
> This patch removes the extra variables from the trace events and
> overall kernel blktrace framework. The removed members can easily be
> extracted from the remaining argument which reduces the code
> significantly and allows us to optimize the several tracepoints like
> the next patch in the series. =A0 =A0 =A0

The subject sounds a litle strange, I'd rather say:

"block: remove superflous arguments from tracepoints"

The actual changes look good to me.

> +=09=09trace_block_rq_insert(rq);
>  =09}
> =20
>  =09spin_lock(&ctx->lock);
> @@ -2111,7 +2111,7 @@ blk_qc_t blk_mq_make_request(struct request_queue *=
q, struct bio *bio)
>  =09=09goto queue_exit;
>  =09}
> =20
> -=09trace_block_getrq(q, bio, bio->bi_opf);
> +=09trace_block_getrq(bio, bio->bi_opf);

But now that you remove more than the q argument in some spots you
might remove the op one here as well.  Or limit the first patch to
just the queue argument..


--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

