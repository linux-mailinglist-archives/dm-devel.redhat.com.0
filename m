Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id A74B235C1BA
	for <lists+dm-devel@lfdr.de>; Mon, 12 Apr 2021 11:44:11 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-357-Estow8eCNNe99Wr5pwqb0g-1; Mon, 12 Apr 2021 05:44:08 -0400
X-MC-Unique: Estow8eCNNe99Wr5pwqb0g-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 4D7C318397A3;
	Mon, 12 Apr 2021 09:44:02 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 50DF960DCC;
	Mon, 12 Apr 2021 09:43:58 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id DB1AA44A59;
	Mon, 12 Apr 2021 09:43:54 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 13C9hmjI027516 for <dm-devel@listman.util.phx.redhat.com>;
	Mon, 12 Apr 2021 05:43:48 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 2C3902182DF2; Mon, 12 Apr 2021 09:43:48 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast05.extmail.prod.ext.rdu2.redhat.com [10.11.55.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 265842182DF3
	for <dm-devel@redhat.com>; Mon, 12 Apr 2021 09:43:45 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
	bits)) (No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id AB16E805F48
	for <dm-devel@redhat.com>; Mon, 12 Apr 2021 09:43:45 +0000 (UTC)
Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-225-LccXPtJbMCa407dtlehD3g-1; Mon, 12 Apr 2021 05:43:41 -0400
X-MC-Unique: LccXPtJbMCa407dtlehD3g-1
Received: from hch by casper.infradead.org with local (Exim 4.94 #2 (Red Hat
	Linux)) id 1lVsqL-0045x5-8H; Mon, 12 Apr 2021 09:26:54 +0000
Date: Mon, 12 Apr 2021 10:26:53 +0100
From: Christoph Hellwig <hch@infradead.org>
To: Ming Lei <ming.lei@redhat.com>
Message-ID: <20210412092653.GA972763@infradead.org>
References: <20210401021927.343727-1-ming.lei@redhat.com>
	<20210401021927.343727-6-ming.lei@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210401021927.343727-6-ming.lei@redhat.com>
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
	casper.infradead.org. See http://www.infradead.org/rpr.html
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-loop: dm-devel@redhat.com
Cc: Jens Axboe <axboe@kernel.dk>, Mike Snitzer <snitzer@redhat.com>,
	linux-block@vger.kernel.org, dm-devel@redhat.com,
	Jeffle Xu <jefflexu@linux.alibaba.com>
Subject: Re: [dm-devel] [PATCH V5 05/12] block: add new field into 'struct
	bvec_iter'
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

I don't like where this is going.

I think the model of storing the polling cookie in the bio is useful,
but:

 (1) I think having this in the iter is a mess.  Can you measure if
     just marking bvec_iter __packed will generate much worse code
     at all anymore?  If not we can just move this into the bio
     If it really generates much worse code I think you need to pick
     a different name as  as that i really confusing vs the bio field
     of the same name that is used entirely differenly.  Similarly
     the bio_get_private_data and bio_set_private_data helpers are
     entirely misnamed, as the names suggest they deal with the
     bi_private field in struct bio.  I actually suspect not having
     these helpers would be much preferable
 (2) once we do have the cookie in the bio we need to take advantage
     of that properly.  That is stop returning the cookie up the stack
     as we do right now but just rely on the bio, which will clean up
     tons of crap.

--
dm-devel mailing list
dm-devel@redhat.com
https://listman.redhat.com/mailman/listinfo/dm-devel

