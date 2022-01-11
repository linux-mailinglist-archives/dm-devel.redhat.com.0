Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CDBA48A9A3
	for <lists+dm-devel@lfdr.de>; Tue, 11 Jan 2022 09:37:40 +0100 (CET)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-380-tBhlQzKVPaekHBWpo1L_AA-1; Tue, 11 Jan 2022 03:37:37 -0500
X-MC-Unique: tBhlQzKVPaekHBWpo1L_AA-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 7DBD41015DA0;
	Tue, 11 Jan 2022 08:37:30 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id CBADA6E1E8;
	Tue, 11 Jan 2022 08:37:25 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 258231809CB8;
	Tue, 11 Jan 2022 08:37:11 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
	[10.11.54.1])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 20B8aSTh026605 for <dm-devel@listman.util.phx.redhat.com>;
	Tue, 11 Jan 2022 03:36:30 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id C9FE840CFD1C; Tue, 11 Jan 2022 08:36:28 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast02.extmail.prod.ext.rdu2.redhat.com [10.11.55.18])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id C522240CFD0B
	for <dm-devel@redhat.com>; Tue, 11 Jan 2022 08:36:28 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
	bits)) (No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id ABBD2800B36
	for <dm-devel@redhat.com>; Tue, 11 Jan 2022 08:36:28 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org
	[198.137.202.133]) by relay.mimecast.com with ESMTP with STARTTLS
	(version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	us-mta-167-ugXIgFUiPY67zWGyHZvqJA-1; Tue, 11 Jan 2022 03:36:25 -0500
X-MC-Unique: ugXIgFUiPY67zWGyHZvqJA-1
Received: from hch by bombadil.infradead.org with local (Exim 4.94.2 #2 (Red
	Hat Linux)) id 1n7CdY-00FLJc-Ty; Tue, 11 Jan 2022 08:36:12 +0000
Date: Tue, 11 Jan 2022 00:36:12 -0800
From: Christoph Hellwig <hch@infradead.org>
To: Mike Snitzer <snitzer@redhat.com>
Message-ID: <Yd1BfGXzmnXr1+Js@infradead.org>
References: <20220110075141.389532-1-ming.lei@redhat.com>
	<20220110075141.389532-2-ming.lei@redhat.com>
	<YdxuWlZAPJkPyr3h@infradead.org> <YdyC9KpQ7yC3l7RZ@redhat.com>
MIME-Version: 1.0
In-Reply-To: <YdyC9KpQ7yC3l7RZ@redhat.com>
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
	bombadil.infradead.org. See http://www.infradead.org/rpr.html
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.1
X-loop: dm-devel@redhat.com
Cc: Jens Axboe <axboe@kernel.dk>, linux-block@vger.kernel.org,
	Ming Lei <ming.lei@redhat.com>,
	Christoph Hellwig <hch@infradead.org>, dm-devel@redhat.com,
	lining <lining2020x@163.com>, Tejun Heo <tj@kernel.org>,
	Chunguang Xu <brookxu@tencent.com>
Subject: Re: [dm-devel] [PATCH 1/2] block: add resubmit_bio_noacct()
X-BeenThere: dm-devel@redhat.com
X-Mailman-Version: 2.1.12
Precedence: junk
List-Id: device-mapper development <dm-devel.redhat.com>
List-Unsubscribe: <https://listman.redhat.com/mailman/options/dm-devel>,
	<mailto:dm-devel-request@redhat.com?subject=unsubscribe>
List-Archive: <https://listman.redhat.com/archives/dm-devel>
List-Post: <mailto:dm-devel@redhat.com>
List-Help: <mailto:dm-devel-request@redhat.com?subject=help>
List-Subscribe: <https://listman.redhat.com/mailman/listinfo/dm-devel>,
	<mailto:dm-devel-request@redhat.com?subject=subscribe>
Sender: dm-devel-bounces@redhat.com
Errors-To: dm-devel-bounces@redhat.com
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Mon, Jan 10, 2022 at 02:03:16PM -0500, Mike Snitzer wrote:
> Ming is lifting code out of __blk_queue_split() for reuse (by DM in
> this instance, because it has its own bio_split+bio_chain).
> 
> Are you saying submit_bio_noacct() should be made to call
> blk_throtl_charge_bio_split() and blk_throtl_charge_bio_split() simply
> return if not a split bio? (not sure bio has enough context to know,
> other than looking at some side-effect change from bio_chain)

Yes.

--
dm-devel mailing list
dm-devel@redhat.com
https://listman.redhat.com/mailman/listinfo/dm-devel

