Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C28E69B194
	for <lists+dm-devel@lfdr.de>; Fri, 17 Feb 2023 18:04:31 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1676653470;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=xEhB90NWENFAayAeOjsgeFk3c0q5XPgFcjD4ZodjEDg=;
	b=d6Z87LZp2G34nY8W2lCI64BmStmadALj20T+xTLG84XlWi3AOMmPKtBR6L8qpd8zpGru8k
	j3EiNnI+7inyh6V93Nb0W9JFagQPgKJQ0gUEpkNYJ2RpXITwG2ocnICims2da6GKXGrB/t
	6LsBX1X83lV5f6DMbaauEg4OJehl8Vg=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-459-gcoFMMqdM0GVuoT1lQeVnw-1; Fri, 17 Feb 2023 12:04:28 -0500
X-MC-Unique: gcoFMMqdM0GVuoT1lQeVnw-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com [10.11.54.2])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 9C217101A52E;
	Fri, 17 Feb 2023 17:04:24 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 4CEA74014CF7;
	Fri, 17 Feb 2023 17:04:07 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id A95BB19465A4;
	Fri, 17 Feb 2023 17:04:06 +0000 (UTC)
X-Original-To: dm-devel@listman.corp.redhat.com
Delivered-To: dm-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
 [10.11.54.6])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id A65E71946588
 for <dm-devel@listman.corp.redhat.com>; Fri, 17 Feb 2023 17:04:05 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 4CBBA2166B31; Fri, 17 Feb 2023 17:04:05 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast03.extmail.prod.ext.rdu2.redhat.com [10.11.55.19])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 460912166B30
 for <dm-devel@redhat.com>; Fri, 17 Feb 2023 17:04:05 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 2523A85CBCB
 for <dm-devel@redhat.com>; Fri, 17 Feb 2023 17:04:05 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org
 [198.137.202.133]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-50-rX4paOTfOgCC74LsQfDGwA-1; Fri, 17 Feb 2023 12:04:03 -0500
X-MC-Unique: rX4paOTfOgCC74LsQfDGwA-1
Received: from hch by bombadil.infradead.org with local (Exim 4.94.2 #2 (Red
 Hat Linux)) id 1pT3PD-00F0il-Ve; Fri, 17 Feb 2023 16:16:15 +0000
Date: Fri, 17 Feb 2023 08:16:15 -0800
From: Christoph Hellwig <hch@infradead.org>
To: Uday Shankar <ushankar@purestorage.com>
Message-ID: <Y++oTz0ck9OGE4Se@infradead.org>
References: <20230215201507.494152-1-ushankar@purestorage.com>
 <Y+3IoOd02iFGNLnC@infradead.org>
 <20230216192702.GA801590@dev-ushankar.dev.purestorage.com>
MIME-Version: 1.0
In-Reply-To: <20230216192702.GA801590@dev-ushankar.dev.purestorage.com>
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
 bombadil.infradead.org. See http://www.infradead.org/rpr.html
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.6
Subject: Re: [dm-devel] [PATCH] blk-mq: enforce op-specific segment limits
 in blk_insert_cloned_request
X-BeenThere: dm-devel@redhat.com
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: device-mapper development <dm-devel.redhat.com>
List-Unsubscribe: <https://listman.redhat.com/mailman/options/dm-devel>,
 <mailto:dm-devel-request@redhat.com?subject=unsubscribe>
List-Archive: <http://listman.redhat.com/archives/dm-devel/>
List-Post: <mailto:dm-devel@redhat.com>
List-Help: <mailto:dm-devel-request@redhat.com?subject=help>
List-Subscribe: <https://listman.redhat.com/mailman/listinfo/dm-devel>,
 <mailto:dm-devel-request@redhat.com?subject=subscribe>
Cc: Jens Axboe <axboe@kernel.dk>, linux-block@vger.kernel.org,
 Mike Snitzer <snitzer@kernel.org>, Christoph Hellwig <hch@infradead.org>,
 dm-devel@redhat.com, Alasdair Kergon <agk@redhat.com>
Errors-To: dm-devel-bounces@redhat.com
Sender: "dm-devel" <dm-devel-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.2
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Thu, Feb 16, 2023 at 12:27:02PM -0700, Uday Shankar wrote:
>  * Description:
>  *    @rq may have been made based on weaker limitations of upper-level queues
>  *    in request stacking drivers, and it may violate the limitation of @q.
>  *    Since the block layer and the underlying device driver trust @rq
>  *    after it is inserted to @q, it should be checked against @q before
>  *    the insertion using this generic function.
>  *
>  *    Request stacking drivers like request-based dm may change the queue
>  *    limits when retrying requests on other queues. Those requests need
>  *    to be checked against the new queue limits again during dispatch.
>  */.
> 
> Is this concern no longer relevant?

The concern is still valid, but it does not refer to the debug check.
It refers to recalculating nr_phys_segments using
blk_recalc_rq_segments, and the fact that any driver using this
interface needs to stack its limits properly.

--
dm-devel mailing list
dm-devel@redhat.com
https://listman.redhat.com/mailman/listinfo/dm-devel

